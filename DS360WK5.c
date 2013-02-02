/***************************************************************
*
* void RUN_CONSOLE(int UNIT)
* void RUN_CONSOLE_RD(unsigned long BUFER,int count,int unit)
* int RUN_EDIT_CONSOLE(int UNIT)
*
***************************************************************/
#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>
#include <conio.h>

#include "ds360psw.h"

#include "ds360dfn.h"
extern char EBCDIC_ASCII[256];
extern char ASCII_EBCDIC[256];
extern FILE *CONSO;
extern char DEFAULT_RDR_STRING[80];

void RUN_CONSOLE(int UNIT)
{
 static int flag_console_open=0;
 static int FLFILE;
 static int RE;
 static unsigned long CAW;
 static char BUFER[400];
 static unsigned long ar;
 static int i;
 static char CHAR;

 /*******************************************************************
 ���� ��������� ����������
 0 �������� ����㦤����� �᫨ ����� ������ ������
	 �᫨ ����஫��� ���ன�⢠ ����� ᨣ��� �������� �� �뤠���� ����
	 �� ��������� �믮��塞�� ������
 1 2 �� �ᯮ�������
 3 �����
 4 ����� ���稫
 5 ���ன�⢮ ���稫�
 6 �訡�� � ���ன�⢥
 7 ������ ��砩 � ���ன�⢥ (�᫨ ����� ��㫨஢����)
 ���� ����������� ���������
 0 ������� �⢥࣭��
 1 �ॡ���� ����⥫��⢮
 2 �訡�� � ��室��� ���ଠ樮���� 設�
 3 �訡�� � ����㤮�����
 4-7 �� �ᯮ�������
 *******************************************************************
 ������
		 READY
		 REQWEST
		 NOT READY
		 CANSEL
		 EOB
 ********************************************************************/
 if (flag_console_open==0)
	 {CONSO=fopen(&NAME_FILE_IO_DEVICE[UNIT][0],"a");
		if (CONSO!=NULL) FLFILE=1;
		else FLFILE=0;
		flag_console_open=1;
	 }
 switch(CSW_COD[UNIT])
	 {
		case 0x0A:   /* ������ ��� ����� ���������� � ���������� */
				if (kbhit()) getchar();
				if (RQ_7920)
					{RQ_7920=0;
					 if (FLFILE)
						 {fclose(CONSO);CONSO=NULL;
							CONSO=fopen(NAME_FILE_IO_DEVICE[UNIT],"r");
							if (CONSO!=NULL)
								{
								 #ifdef EN_INTER
								 printf("\033[47m\033[30m");
								 #endif
								 while(fgets(BUFER,80,CONSO)!=NULL)
									 {printf("%s",BUFER);
									 }
								 printf("\n");
								 fclose(CONSO);CONSO=NULL;
								}
							HELPHELP("##�������� �/� ��� ESC");
							CONSO=fopen(NAME_FILE_IO_DEVICE[UNIT],"a");
						 }
					 else
						 {CONSO=fopen(NAME_FILE_IO_DEVICE[UNIT],"r");
							if (CONSO!=NULL)
								{
								 #ifdef EN_INTER
								 printf("\033[47m\033[30m");
								 #endif
								 while(fgets(BUFER,80,CONSO)!=NULL)
									 {printf("%s",BUFER);
									 }
								 printf("\n");
								 fclose(CONSO);CONSO=NULL;
								}
							CONSO=NULL;
							HELPHELP("##�������� �/� ��� ESC");
						 }
					}

				#ifdef EN_INTER


				printf("\033[37m\033[41m\033[K");
				#endif

				//putchar('�');putchar(8);
        if (DEFAULT_RDR_STRING[0])
          {strcpy(BUFER,DEFAULT_RDR_STRING);
           DEFAULT_RDR_STRING[0]=0;
           printf(BUFER);
          }
        else gets(BUFER);

				#ifdef EN_INTER
				if (RQ_CONSOLE) printf("\033[47m\033[30m");
				else printf("\033[34m\033[47m");

				if (RQ_CONSOLE)
					 HELPHELP("##�������� �/� ��� ESC");
				else
					 HELPHELP("## ����� ������ ��������� (����� �� ���������: ESC)");
				#endif

				for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
						{if (BUFER[i]==0)  break;
						 if (BUFER[i]==13) break;
						 PUT_BYTE(ar,ASCII_EBCDIC[BUFER[i]]);
						}
				BUFER[i]=0;
				if (FLFILE) fprintf(CONSO,"\n%s",BUFER);
				CSW_COUNT[UNIT]-=i;
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		case 0x09:   /* ������ � ��������� �������  */
				//printf("\n");
				#ifdef EN_INTER
				printf("\033[34m\033[47m");
				#endif

				for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
						{
						 CHAR=GET_BYTE(ar);BUFER[i]=EBCDIC_ASCII[CHAR];
						}
				if (RQ_7920==0)
					{
					 for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++) putchar(BUFER[i]);
					 if (CSW_COUNT[UNIT]==80) putchar(8); printf("\n");
					}

				#ifdef EN_INTER
				if (RQ_CONSOLE)
					HELPHELP("##�������� �/� ��� ESC");
				else
					HELPHELP("## ����� ������ ��������� (����� �� ���������: ESC)");
				#endif

				BUFER[CSW_COUNT[UNIT]]=0;
				if (FLFILE) fprintf(CONSO,"\n%s",BUFER);

				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		case 0x01:   /* ������ ��� �������� ������� */
				#ifdef EN_INTER
				printf("\033[34m\033[47m");
				#endif
				for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
						{
						 CHAR=GET_BYTE(ar);BUFER[i]=EBCDIC_ASCII[CHAR];
						}
				if (RQ_7920==0)
					{
					 for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++) putchar(BUFER[i]);
					}
				BUFER[CSW_COUNT[UNIT]]=0;
				if (FLFILE) fprintf(CONSO,"\n%s",BUFER);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		case 0x03:   /*  ��� ��������  */
				//CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;

		case 0x0b:   /* �������� ������������ */
				putchar(7);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;
		case 0x04:   /* �������� ���������   */
				for(i=0,ar=CSW_ADRESS[UNIT];i<1;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][2]);

						}
				IO_STATUS[UNIT][2]=0;
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		default:
				IO_STATUS[UNIT][1]=U4|U5;
				IO_STATUS[UNIT][1]|=U6;
				IO_STATUS[UNIT][2]=0x80; /* ������� ���������� */
				//tt(UNIT);
				break;
		}

}


/*************************************************************/
void RUN_CONSOLE_RD(unsigned long BUFER,int count,int unit)
{
}

/**************************************************************/
int RUN_EDIT_CONSOLE(int UNIT)
{
 static int i;
 if (kbhit())
	 {i=getch();
		switch(i)
			{
			 case 27:RQ_CONSOLE=0;
              HELPHELP("##CLS");
							HELPHELP("## ����� ������ ��������� (����� �� ���������: ESC)");
							break;
			 case 9:FLAG_IO_DEVICE[0]=RQ_INT;
							IO_STATUS[0][1]=U0/*|U5*/;
							CSW_COUNT[0]=0;
							CSW_CAW[0]=0;
							break;
			 default:
							putchar(7);
							break;

			}

	 }
 return (RQ_CONSOLE);
}
