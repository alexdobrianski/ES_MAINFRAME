/******************************************************************
*
* void CLOSE_CONNECTION(int unit);
* char far* OPEN_CONNECTION(int UNIT);
* int RUN_EDIT_NET(int unit);
*
******************************************************************/
#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <alloc.h>
#include <mem.h>
#include "xmsif.h"

#include "ds360psw.h"

#include "ds360dfn.h"

extern char EBCDIC_ASCII[256];
extern char ASCII_EBCDIC[256];

#define KEYLEFT 'K'
#define KEYRIGHT 'M'
#define KEYUP 'H'

#define KEYDOWN 'P'
#define KEYINS  'R'
#define KEYDEL  'S'
#define KEYHOME 'G'
#define KEYEND  'O'
#define KEYF1 0x3b
#define KEYF2 0x3c
#define KEYF3 0x3d
#define KEYF4 0x3e
#define KEYF5 0x3f
#define KEYF6 0x40
#define KEYF7 0x41
#define KEYF8 0x42
#define KEYF9 0x43
#define KEYF10 0x44
#define KEYF11 0x54
#define KEYF12 0x55
#define KEYCLS 0xf
#define KEYPD1 0x5e
#define KEYPD2 0x5f
#define KEYPD3 0x60

extern int INTERRUPT;
int FLAG_OPEN_CONNECTION;
static unsigned long addr;
static char far*PT_MAIN_POINTER;
static char far*PT_ADDR;


void CLOSE_CONNECTION(int unit)
{
 PT_MAIN_POINTER=MK_FP(0,INTERRUPT*4);
 *((unsigned long far*)PT_MAIN_POINTER)=0;

 FLAG_OPEN_CONNECTION--;
}
char far* OPEN_CONNECTION(int unit)
{
 PT_MAIN_POINTER=MK_FP(0,INTERRUPT*4);
 if (FLAG_OPEN_CONNECTION==0)
   {
    int iFile;
    FILE *fINI;
    char szTemp[100];

    iFile=open("$NETDSPL",O_BINARY|O_RDONLY);
    if (iFile)
      {
       szTemp[0]=5;
       read(iFile,szTemp,20);
       addr = *(unsigned long*)szTemp;
       close(iFile);

       *((unsigned long far*)PT_MAIN_POINTER)=addr;
       fINI=fopen("C:\NETDSPL.INI","w");
       if (fINI)
         {
          fprintf(fINI,"%ld",addr);
          fclose(fINI);
         }

      }
    else return(NULL);
   }
 addr= *((unsigned long far*)PT_MAIN_POINTER);
 PT_ADDR = (char far*)(addr+2000l*((unsigned long)FLAG_OPEN_CONNECTION));
 FLAG_OPEN_CONNECTION++;
 return(PT_ADDR);
}
int RUN_EDIT_NET(int unit)
{
 static int OLD_ADRESS=0;
 static int UNIT_POINT;
 static int LINE,COLUMN,LINE80;
 static int C0,C1,COUT;
 static int CURSOR;
 static int OLD_SA;
 static int POINT_SA;
 static int i,j;

 for(UNIT_POINT=0;UNIT_POINT<NUMBER_IO;UNIT_POINT++)
  if (TYPE_IO_DEVICE[UNIT_POINT]=='N' && AREA_7920[UNIT_POINT][1925])
	 {
    POINT_SA=SET_POINT_SA(AREA_7920[UNIT_POINT],CURSOR);
		C0=AREA_7920[UNIT_POINT][1925];
    AREA_7920[UNIT_POINT][1925]=0;
		switch(C0)
			{
			 case KEYF1: COUT=0xf1;goto PF;
			 case KEYF2: COUT=0xf2;goto PF;
			 case KEYF3: COUT=0xf3;goto PF;
			 case KEYF4: COUT=0xf4;goto PF;
			 case KEYF5: COUT=0xf5;goto PF;
			 case KEYF6: COUT=0xf6;goto PF;
			 case KEYF7: COUT=0xf7;goto PF;
			 case KEYF8: COUT=0xf8;goto PF;
			 case KEYF9: COUT=0xf9;goto PF;
			 case KEYF10:COUT=0x7a;goto PF;
			 case KEYF11:COUT=0x7b;goto PF;
			 case KEYF12:COUT=0x7c;goto PF;
			 case KEYCLS:COUT=0x6d;goto PF;
			 case KEYPD1:COUT=0x6c;goto PF;
			 case KEYPD2:COUT=0x6e;goto PF;
			 case KEYPD3:COUT=0x6b;goto PF;

			 case 13:COUT=0x7d;
PF:
							//if (FLAG_IO_DEVICE[UNIT_POINT] & RQ_WORK)
							//	{//putchar(7);
							//	 return(1);
							//	}
							IO_STATUS[UNIT_POINT][6]=COUT;
							FLAG_IO_DEVICE[UNIT_POINT]=RQ_INT;
							IO_STATUS[UNIT_POINT][1]=U0/*|U5*/;
							CSW_COUNT[UNIT_POINT]=0;
							CSW_CAW[UNIT_POINT]=0;
							return 1;


			}
   }
  return(0);
}