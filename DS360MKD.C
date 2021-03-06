#include <stdio.h>
#include <conio.h>
#include <io.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <\sys\stat.h>
#include "ds360trn.h"
/************************************************************************
																											 ����:
 ��⪠ ��砫� �����                          #####
									 <<<<>>>>
 ᮡ�⢥��� ���� 0   - ���� �ਧ�����                0  - ���� ���������
									 1-2 - ����� 樫����                1-2 -�������
									 3-4 - ����� �������                 3-4 -�������
									 5-6 - 横���᪠� �஢�ઠ  #####
									 <<<<>>>>
 R0
		���� ���稪�  0   - �ਧ����                      5    -R0 ��������
									 1-2 樫����                         6-7  -R0 �������
									 3-4 �������                         8-9  -R0 �������
									 5   - ����� �����                  10   -R0 RN
									 6   - ����� ����  ==0              11   -R0 ����� �����
									 7-8 -����� ������  ==8 ����         12-13-R0 ����� ������
									 9-10-横������ �஢�ઠ   #####
		���� ������    0-7
									 <<<<>>>>
 ����� ��થ�                                       XXXX -LEN RX
									 0-ᯥ樠��� ����          #####
									 1-2 横���᪠� �஢�ઠ    #####
 R1
		���� ���稪�  0   - �ਧ����                      0    -RX
									 1-2 樫����                         1-2  -RX
									 3-4 �������                         3-4  -RX
									 5   - ����� �����                  5    -RX
									 6   - ����� ����                   6    -RX
									 7-8 -����� ������                   7-8  -RX
									 9-10-横������ �஢�ઠ   #####


		���� ����
									 X...X-ᮤ�ন���
									 CC-横���᪠� �஢�ઠ     #####


		���� ������
									 X...X-ᮤ������
									 CC-横���᪠� �஢�ઠ     #####




*************************************************************************/


int main(argc,argv)

char **argv;
int argc;
{
 static char FILE_IN[80];
 static char FILE_OUT[80];
 static int IN;
 static int OUT;
 static int OPIS;
 static int CYL,TRK,cyl,trk,i,j;
 static long OFF_PREV;
 static long OFF_NEXT;
 static long LEN_BLOCK;
 static long OFF_NOW;
 static char PR=0x11;
 static int BLOCK_SIZE;
 static char BUFER[20000];
 static char BUFER_OPIS[16000];
 static int RET;
 static int BYTE;
 static int MAX_BYTE;
 static char VOLNAME[80];
 if (argc!=7) {printf("\n arguments:\n ds360MKD <FILE-OUT> <CYL> <TRK> <BYTE> <MAX_BYTE> <VOL-NAME 6 digits>");return;}
 strcpy(FILE_OUT,argv[1]);
 CYL=atoi(argv[2]);
 printf("\nCYL=%d ",CYL);
 TRK=atoi(argv[3]);
 printf("\nTRK=%d ",TRK);
 BYTE=atoi(argv[4]);
 printf("\nBYTE=%d ",BYTE);
 MAX_BYTE=atoi(argv[5]);
 printf("\nMAX_BYTE=%d ",MAX_BYTE);
 strcpy(VOLNAME,argv[6]);
 printf("\nNAME=%s ",VOLNAME);
 if (strlen(VOLNAME)!=6) {printf("\nerror VOL NAME (mast be 6 digits) ");return;}
 for(i=0;i<6;i++)
	 VOLNAME[i]=ASCII_EBCDIC[VOLNAME[i]];
 OPIS=open("ds360mkd.dsk",O_RDONLY|O_BINARY);
 if (OPIS<=0) {printf("\n FILE IMAGE ds360mkd.dsk IS ABSEND");return;}
 read(OPIS,BUFER_OPIS,16000);
 close(OPIS);
 OUT=open(FILE_OUT,O_WRONLY|O_BINARY|O_TRUNC|O_CREAT,S_IREAD|S_IWRITE);
 for(cyl=0;cyl<CYL;cyl++)
	 {
		for(trk=0;trk<TRK;trk++)
			 {
				BUFER[0]=0;
				BUFER[1]=cyl>>8;
				BUFER[2]=cyl&0xff;
				BUFER[3]=trk>>8;
				BUFER[4]=trk&0xff;

				/*R0*/
				BUFER[5]=0x11;

				BUFER[6]=0x11;
				BUFER[7]=cyl>>8;
				BUFER[8]=cyl&0xff;
				BUFER[9]=trk>>8;
				BUFER[10]=trk&0xff;
				BUFER[11]=0;
				BUFER[12]=0;
				BUFER[13]=0;
				BUFER[14]=8;
				for(i=15;i<23;i++) BUFER[i]=0;

				/*R1*/
				BUFER[23]=0x11;

				BUFER[24]=0x11;
				BUFER[25]=cyl>>8;
				BUFER[26]=cyl&0xff;
				BUFER[27]=trk>>8;
				BUFER[28]=trk&0xff;
				BUFER[29]=1;
				BUFER[30]=0;
				BUFER[31]=BYTE>>8;
				BUFER[32]=BYTE&0xff;
				for(i=33,j=0;j<BYTE;i++,j++) BUFER[i]=0x40;

				/*R2 */
				BUFER[i]=0xff;
				if (trk==0 && cyl==0)
					{
					 for(i=0;i<MAX_BYTE;i++) BUFER[i]=BUFER_OPIS[i];
					 for(i=0xed,j=0;j<6;i++,j++)
							BUFER[i]=VOLNAME[j];

					}
				if (trk==1 && cyl==0)
					{
					 for(i=0;i<MAX_BYTE;i++) BUFER[i]=BUFER_OPIS[i+8000];

					}
				write(OUT,BUFER,MAX_BYTE);
			 }
	 }

 close(OUT);

}