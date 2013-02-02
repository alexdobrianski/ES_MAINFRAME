#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>
#include <mem.h>
#include <string.h>
//#include "ds360dfn.h"
//#include "xmsif.h"
//#include <signal.h>
//#include <process.h>
#include <alloc.h>
#include <stdlib.h>
#include <conio.h>
int INTERRUPT;
int FLAG_OPEN_CONNECTION;
static unsigned long addr;
static char far*PT_MAIN_POINTER;
static char far*PT_ADDR;
static unsigned long addr;
char far *AREA_7920[10];

long ATOX(char *s)
{
 int i;
 unsigned long res;
 res = 0;
 for(i=0;i<strlen(s);i++)
	 {
		 if (s[i]>='0' && s[i]<='9')
		   {res*=16;
			  res+=s[i]-'0';
			 }
     else if (s[i]>='A' && s[i]<='F')
		   {res*=16;
				res+=s[i]-'A'+10;
			 }
		 else if (s[i]>='a' && s[i]<='f')
		   {res*=16;
				res+=s[i]-'a'+10;
			 }
     else break;
 }
 return res;
}

void HELPHELP(char far *STRIN)
{
 FILE *HELPH;
 static char stri[128];
 static int co;
 HELPH=fopen("DST360P.HLP","r");
 if (HELPH==NULL)
   {
    printf("HELP FILE ABSEND. CHECK DST360P.HLP FILE.");
    return;
   }
 co=0;
NEXTREAD:
 if (fgets(stri,127,HELPH)==NULL) goto ENDREAD;
 stri[strlen(stri)-1]=0;
 if (strcmp(STRIN,stri)!=0) goto NEXTREAD;
NEXTREAD2:
 if (fgets(stri,127,HELPH)==NULL) goto ENDREAD;
 stri[strlen(stri)-1]=0;
 if (strcmp(stri,"##")==0) goto ENDREAD;
 if (strchr(stri,'#'))
   {*strchr(stri,'#')=0;
    printf("%s",stri);
   }
 else
   printf("\n%s",stri);
 if (++co==23)
	 {
		co=0;
		printf("\n MORE HELP press any KEY");
		getch();
	 }
 goto NEXTREAD2;
ENDREAD:
 fclose(HELPH);

}

int INIT_CHANEL(int UNIT)
{
 FILE *FIL;
 static char STRING[100];


 FIL=fopen("DST360P.INI","r");
 if (FIL!=NULL)
	 {

NEXT:if (fgets(STRING,80,FIL)!=NULL)
			 {
        if (memicmp(STRING,"INTERRUPT=",10)==0)
					{

           int iFile;
           char szTemp[100];
           //INTERRUPT=ATOX(&STRING[10]);
           //PT_MAIN_POINTER=MK_FP(0,INTERRUPT*4);
           //addr= *((unsigned long far*)PT_MAIN_POINTER);
           //if (addr!=0)

           iFile=open("$NETDSPL",O_BINARY|O_RDONLY);
           if (iFile)
             {
              szTemp[0]=5;
              read(iFile,szTemp,20);
              addr = *(unsigned long*)szTemp;
              close(iFile);



              AREA_7920[UNIT] = ((char far*)addr)+((unsigned long)UNIT*200l);
              AREA_7920[UNIT][1926]=1;
					    goto NEXT;
             }
           else return(1);
					}

				goto NEXT;
			 }
		 fclose(FIL);
	 }
 return(0);

}

/***********************************************************************/
/*   программа завершает работу с устройствами в соответствии с
/*   протоколом этих устройств
/***********************************************************************/
/*   1. для дисплея 7920 записывается содержимое изображения экрана
/*   2. для ленты записывается адрес смещения относительно начала
/*      эмулируемой ленты
/*   3. для дисков выполняется закрытие последнего рабочего трека
/***********************************************************************/
void CLOSE_CHANEL(void)
 {
 }
int RUN_EDIT(int UNIT_POINT);


void  main(argc,argv)
 char **argv;
 int argc;

{
 int UNIT;

 //if (argc==1)
 //	 {
 //		HELPHELP("## 7920");
 //		return;
 //	 }
 //if ((argv[1][0]=='/' || argv[1][0]=='-')
 //     &&(argv[1][1]=='h' || argv[1][1]=='H' || argv[1][1]=='?'))
 //	 {
 //		HELPHELP("## 7920");
 //		return;
 //	 }
 UNIT=0;
 if (INIT_CHANEL(UNIT)!=0)
   {printf("\nMAINFRAME EMULATOR DID NOT STARTED");
    return;
   }
 printf("after init chanel");
 while (RUN_EDIT(UNIT)) ;
 CLOSE_CHANEL();

}
