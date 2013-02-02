#define FOR386 1
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>
#include <mem.h>

#include <string.h>
#include <conio.h>
#include "ds360dfn.h"
//#include "xmsif.h"
#include <signal.h>
#include <process.h>
#include <alloc.h>
#include "ncb.h"
#include "ncbcmds.h"
#include "codetbl.h"
#include "neterror.h"

//typedef unsigned char  BYTE;
typedef unsigned short WORD;
typedef char far *     ADDRESS;

#include "funcdef.h"
#include "ds360trn.h"

#define KEYLEFT 'K'
#define KEYRIGHT 'M'
#define KEYUP 'H'

#define KEYDOWN 'P'
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

#define ADRESS_EGA 0xb8000000
static int X_EGA,Y_EGA;
static char ATR_EGA;
static char far*POSITION;
char far *AREA_7920;
char MESSAGE[3000];
int LENGTH;
NCB Ncb;
NCB NcbQR;
int LsnWORK;
int LsnRQ;

BYTE Lana;
BYTE LclName[80]={"NETWARE_LOCAL_01"};
BYTE NetName[80]={"MAIN_FRM_IBM_360"};
#define  NET_LSN	 6	/* maximum number of local sessions   */
#define  NET_NUM	12	/* maximum number of outstanding NCBs */

void  main(argc,argv)
 char **argv;
 int argc;

{static int i,FIL_7920;
 AREA_7920=farmalloc(2000);
 if (AREA_7920==NULL) return;

 FIL_7920=open("7920.LCL",O_RDONLY|O_BINARY|O_CREAT,S_IREAD|S_IWRITE);
 if (FIL_7920>0)
	 {
		read(FIL_7920,AREA_7920,1924);
		close(FIL_7920);
		FIL_7920=0;
	 }
RESET:
 Lana=0;
 NetReset(Lana,NET_LSN,NET_NUM);
 if (Ncb.retcode)
	 {printf("\nNETBIOS …‡€“™…. ‡€“‘’’… …ƒ  ‚‰„’… ‚ NET7920 ‚’");
		return;
	 }
 NetAddName(Lana,LclName);
 if (Ncb.retcode)
	 {
		return;
	 }

LISTEN:
 NetListen(Lana,LclName,NetName);
 if (Ncb.retcode)
	 {printf("\n…’ ‘…„… ‘ MAIN_IBM_360 (ESC-Άλε®¤) ‚’…’‘ ›’€ ‘…„…");
		if (kbhit())
			{
			 if (getch()==27) goto END;
			}
		goto LISTEN;
	 }
 LsnWORK=Ncb.lsn;
 NetCall(Lana,LclName,NetName);
 if (Ncb.retcode)
	 {printf("\n…’ ‘…„… RQ ‘ MAIN_IBM_360 (ESC-Άλε®¤) ‚’…’‘ ›’€ ‘…„…");
		NetHungup(Lana,LsnWORK);
		if (kbhit())
			{
			 if (getch()==27) goto END;
			}
		goto LISTEN;
	 }
 LsnRQ=Ncb.lsn;

RECIVE:
 LENGTH=3000;
 NetReceiveNW(Lana,LsnWORK,MESSAGE,LENGTH,&Ncb);
RECIVENCB:
 i=Ncb.retcode;
 switch(i)
	 {
		case 0x00:/*RECEIVE MESSAGE*/
					 switch(MESSAGE[0])
							{
							 case 01:
											 LENGTH=3000;
											 NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,&Ncb);
											 if (Ncb.retcode) {printf("ERROR 01");goto RECIVE;}
											 LENGTH=Ncb.length;
											 RUN_7920_WR(1,LENGTH,0);
											 goto RECIVE;
							 case 02:
											 LENGTH=3000;
											 NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,&Ncb);
											 if (Ncb.retcode) {printf("ERROR 04");goto RECIVE;}
											 LENGTH=Ncb.length;
											 RUN_7920_CLWR(1,LENGTH,0);
											 goto RECIVE;
							 case 03:
											 LENGTH=((MESSAGE[1])<<8)+MESSAGE[2];
											 if (RUN_7920_RD(1,LENGTH,0,MESSAGE[3]))
												 {printf("ERRROR OR DISCONNECT RD");//!!!!!!!!!
													goto RESET;
												 }
											 goto RECIVE;
							 case 04:
											 LENGTH=((MESSAGE[1])<<8)+MESSAGE[2];
											 if (RUN_7920_RDMD(MESSAGE,LENGTH,0,MESSAGE[3]))
												 {printf("ERRROR OR DISCONNECT RDMD");//!!!!!!!!!
													goto RESET;
												 }


							}
					 break;
		case 0x05:/* TIME OUT      */
					 goto RECIVE;
					 break;
		case 0xff:/*process        */
					 if (RUN_EDIT(1)) goto RECIVENCB;
					 break:
		case 0x0a:/*SESSION CLOSED */
					 printf("\n‘…„…… €‡‚€‹‘");
					 goto RESET;
					 break:
		default:  /*ERROR          */
					 printf("ERROR 00");
					 goto RECIVE;
					 break;

	 }






END:
 NetHungup(Lana,LsnWORK);
 NetHungup(Lana,LsnRQ);
 NetReset(Lana,NET_LSN,NET_NUM);
 FIL_7920=open("7920.LCL",O_WRONLY|O_BINARY|O_CREAT|O_TRUNC,S_IREAD|S_IWRITE);
 if (FIL_7920>0)
	 {
		write(FIL_7920,AREA_7920,1924);
		close(FIL_7920);
		FIL_7920=0;
	 }
 farfree(AREA_7920[i]);
}

/*************************************************************/
void Gotoxy(int X,int Y)
 {
#ifdef FOR386
X_EGA=X;Y_EGA=Y;
POSITION=ADRESS_EGA+((X_EGA-1)+(Y_EGA-1)*80)*2;
#else
	printf("\033[%d;%dH",Y,X);
#endif
 }
/*************************************************************/
void Putchar(int CH)
{
#ifdef FOR386
*POSITION++=CH;*POSITION++=ATR_EGA;
#else
 putchar(CH);
#endif
}
/*************************************************************/
void Printf(char far*STRING)
{static int i;
i=0;
while(STRING[i]!=0x00) {Putchar(STRING[i]);i++;}
}
/*************************************************************/
void Normal(void)
{
#ifdef FOR386
ATR_EGA=0x07;
#else
 //printf("\033[32m");
 printf("\033[0m");
#endif
}
/*************************************************************/
void Blink(void)
{
#ifdef FOR386
ATR_EGA=0x70;
#else
 //printf("\033[41m");
 printf("\033[7m");
#endif
}
/*************************************************************/
void End_edit(void)
{printf("\033[0m");
}
/*************************************************************/
int ADRESS_BUFER(char A1,char A2)
 {return(( ((int)(A1&0x3f)) <<6)+(int)(A2&0x3f));
 }
/*************************************************************/
int MAKE_ADRESS_BUFER(int adr)
 {
	return(((adr&0xffc0)<<2)+(adr&0x3f));
 }
/*************************************************************/
void RUN_7920_WR(unsigned long BUFER,int count,int unit)
{static int i,j;
 static unsigned long ar;
 static char COUT;
 static int POINT_BUFER;
 static int NEXT_POINT_BUFER;
 static char FILLING_CHAR;
 POINT_BUFER=((AREA_7920[1922])<<8)+AREA_7920[1923];
	 if (POINT_BUFER<0 || POINT_BUFER>1919) POINT_BUFER=0;
	i=1;ar=1;
BEGWR:
 for(;i<CSW_COUNT[unit];i++,ar++)
	 {
		COUT=MESSAGE[ar];
		switch(COUT)
			{
			 case 0x1d:       /*  €—€‹ ‹ */
								COUT=MESSAGE[ar+1];
								COUT=0x10|((0x20&COUT)>>2)|((0x0c&COUT)>>1)|(COUT&0x01);
								AREA_7920[POINT_BUFER]=COUT;
								//printf("p=%d ATR=%x",POINT_BUFER,COUT);getch();
								i++;ar++;
								POINT_BUFER++;
								if (POINT_BUFER>1919) POINT_BUFER=0;
								break;
			 case 0x11:       /*  “‘’€‚’ €„…‘ “”…‰ €’ */
								POINT_BUFER=ADRESS_BUFER(MESSAGE[ar+1],MESSAGE[ar+2]);
								//printf("POINT BUFER=%d",POINT_BUFER);getch();
								i+=2;ar+=2;
								break;
			 case 0x13:       /*  “‘’€‚’ “‘                */
								AREA_7920[1920]=POINT_BUFER>>8;
								AREA_7920[1921]=POINT_BUFER&0x00ff;

								break;
			 case 0x3c:       /*  ‚’’ „ €„…‘€              */
								NEXT_POINT_BUFER=ADRESS_BUFER(MESSAGE[ar+1],MESSAGE[ar+2]);
								FILLING_CHAR=MESSAGE[ar+3];
								ar+=3;i+=3;
								//printf("from=%d(%x) to=%d(%x)",POINT_BUFER,POINT_BUFER,
								//NEXT_POINT_BUFER,NEXT_POINT_BUFER);getch();
								if (NEXT_POINT_BUFER>=0 && NEXT_POINT_BUFER<1920)
									{
FILL:              if (POINT_BUFER==NEXT_POINT_BUFER) break;
									 AREA_7920[POINT_BUFER]=EBCDIC_ASCII[FILLING_CHAR];
									 POINT_BUFER++;if (POINT_BUFER>1919) POINT_BUFER=0;
									 goto FILL;
									}
								break;
			 case 0x12:       /*  ‘’……’ …‡€™™……             */
								 printf("steret nezaschischennoe");getch();
								break;
			 case 0x05:       /* ƒ€€ ’€“‹–             */
								printf("programmnaia tabuliacia");getch();
								break;
			 default  :
								AREA_7920[POINT_BUFER]=EBCDIC_ASCII[MESSAGE[ar]];
								POINT_BUFER++;
								if (POINT_BUFER>1919) POINT_BUFER=0;
								break;
			}
	 }

 LINGTH=3000;
 NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,Ncb);
 if (Ncb.retcode) {printf("ERROR 02");goto END;}
 LENGTH=Ncb.length;
 if (MESSAGE[0])     /* ζ¥―®ηª  ¤ ­­λε */
	{
	 LINGTH=3000;
	 NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,Ncb);
	 if (Ncb.retcode) {printf("ERROR 03");goto END;}
	 LENGTH=Ncb.length;
	 i=0;ar=0;
	 goto BEGWR;
	}
END:
 AREA_7920[1922]=POINT_BUFER>>8;
 AREA_7920[1923]=POINT_BUFER&0x00ff;


}
/*************************************************************/
void RUN_7920_CLWR(unsigned long BUFER,int count,int unit)
{static int i;
 for(i=0;i<1924;i++) AREA_7920[i]=0;
 RUN_7920_WR(BUFER,count,unit);
}
/*************************************************************/
int  RUN_7920_RD(unsigned long BUFER,int count,int unit,int CSW_MOD)
{static unsigned long ar;
 static unsigned int ADC;
 static int i,flag_write;
 static char COUT;
 static int p_buffer,CURSOR;
 ar=0;
 p_buffer=((AREA_7920[1922])<<8)+AREA_7920[1923];
 if (p_buffer<0 || p_buffer>1919) p_buffer=0;

 COUT=IO_STATUS_unit_6;
 if (COUT==0) COUT=0x60;
 //if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,COUT);
 MESSAGE[ar]=COUT;
 ar++;
 if (count<=1)
	 {if(CSW_MOD & 0x80)      /* ζ¥―®ηª  ¤ ­­λε */
		 {
			NetSend( lana, LsnWORK, MESSAGE, count ,Ncb);
			if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			LINGTH=3000;
			NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,Ncb);
			if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			LENGTH=Ncb.length;
			count=((MESSAGE[1])<<8)+MESSAGE[2];
			CSW_MOD=MESSAGE[3];
			//CH_DATA(unit);
			ar=0;//CSW_ADRESS[unit];
			i=0;
			//goto BEGRD;
		 }
		else  goto RET;
	 }
 ADC=MAKE_ADRESS_BUFER((AREA_7920[1920])<<8+AREA_7920[1921]);
 //if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC>>8);
 MESSAGE[ar]=ADC>>8;
 ar++;
 if (count<=2)
	 {if(CSW_MOD & 0x80)      /* ζ¥―®ηª  ¤ ­­λε */
			{
			 NetSend( lana, LsnWORK, MESSAGE, count ,Ncb);
			 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			 LINGTH=3000;
			 NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,Ncb);
			 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			 LENGTH=Ncb.length;
			 count=((MESSAGE[1])<<8)+MESSAGE[2];
			 CSW_MOD=MESSAGE[3];
			 //CH_DATA(unit);
			 ar=0;//CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else  goto RET;
	 }
 //if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC&0x00ff);
 MESSAGE[ar]=ADC&0x00ff;
 ar++;i=3;
 if (count<=3)
	 {if(CSW_MOD & 0x80)      /* ζ¥―®ηª  ¤ ­­λε */
			{
			 NetSend( lana, LsnWORK, MESSAGE, count ,Ncb);
			 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			 LINGTH=3000;
			 NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,Ncb);
			 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			 LENGTH=Ncb.length;
			 count=((MESSAGE[1])<<8)+MESSAGE[2];
			 CSW_MOD=MESSAGE[3];
			 //CH_DATA(unit);
			 ar=0;//CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else goto RET;
	 }
BEGRD:
 //if ((CSW_MOD &0x10) == 0) flag_write=1;
 //else flag_write=0;
 for(;i<count;i++,ar++,p_buffer++)
	 {if (p_buffer>1919) goto WRRD;
		COUT=AREA_7920[p_buffer];
		if (COUT>0 && COUT<0x20)
			{
			 MESSAGE[ar]=0x1d;
			 MESSAGE[ar+1]=((COUT&0x08)<<2)|((COUT&0x06)<<1)|(COUT&0x01));
			 ar++;i++;
			}
		else
			{MESSAGE[ar]=ASCII_EBCDIC[COUT];
			}
	 }
 if(CSW_MOD & 0x80)      /* ζ¥―®ηª  ¤ ­­λε */
	 {
		NetSend( lana, LsnWORK, MESSAGE, count ,Ncb);
		if (Ncb.retcode)
				{return(Ncb.retcode);
				}
		LINGTH=3000;
		NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,Ncb);
		if (Ncb.retcode)
				{return(Ncb.retcode);
				}
		LENGTH=Ncb.length;
		count=((MESSAGE[1])<<8)+MESSAGE[2];
		CSW_MOD=MESSAGE[3];
		//CH_DATA(unit);
		ar=0;//CSW_ADRESS[unit];
		i=0;
		goto BEGRD;
	 }
 else goto RET;
RET:
	 NetSend( lana, LsnWORK, MESSAGE, count ,Ncb);
	 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
	 //CSW_COUNT[unit]=0;
	 return(0);
WRRD:
	 NetSend( lana, LsnWORK, MESSAGE, i ,Ncb);
	 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
	 //CSW_COUNT[unit]-=i;
	 return(0);

}
/***********************************************************/
int RUN_7920_RDMD(unsigned long BUFER,int count,int unit,int CSW_MOD)
{static unsigned long ar;
 static unsigned int ADC;
 static int i,flag_write,k;
 static char COUT;
 static int p_buffer,CURSOR;
 ar=CSW_ADRESS[unit];
 p_buffer=((AREA_7920[1922])<<8)+AREA_7920[1923];
 if (p_buffer<0 || p_buffer>1919) p_buffer=0;
 p_buffer=0;
 COUT=IO_STATUS_unit_6;
 if (COUT==0) COUT=0x60;
 //if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,COUT);
 MESSAGE[ar]=COUT;
 ar++;
 if (count<=1)
	 {if(CSW_MOD & 0x80)      /* ζ¥―®ηª  ¤ ­­λε */
		 {
			NetSend( lana, LsnWORK, MESSAGE, count ,Ncb);
			if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			LINGTH=3000;
			NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,Ncb);
			if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			LENGTH=Ncb.length;
			count=((MESSAGE[1])<<8)+MESSAGE[2];
			CSW_MOD=MESSAGE[3];
			//CH_DATA(unit);
			ar=0;//CSW_ADRESS[unit];
			i=0;
			//goto BEGRD;
		 }
		else  goto RET;
	 }
 if (COUT==0x6d || COUT==0x6c || COUT==0x6e || COUT==0x6b)
		{i=1;
		 goto WRRD;
		}
 ADC=MAKE_ADRESS_BUFER( (( (int) AREA_7920[1920])<<8) +(int)AREA_7920[1921]);
 //if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC>>8);
 MESSAGE[ar]=ADC>>8;
 ar++;
 if (count<=2)
	 {if(CSW_MOD & 0x80)      /* ζ¥―®ηª  ¤ ­­λε */
			{
			 NetSend( lana, LsnWORK, MESSAGE, count ,Ncb);
			 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			 LINGTH=3000;
			 NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,Ncb);
			 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			 LENGTH=Ncb.length;
			 count=((MESSAGE[1])<<8)+MESSAGE[2];
			 CSW_MOD=MESSAGE[3];
			 //CH_DATA(unit);
			 ar=0;//CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else  goto RET;
	 }
 //if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC&0x00ff);
 MESSAGE[ar]=ADC&0x00ff;
 ar++;i=3;k=0;
 if (count<=3)
	 {if(CSW_MOD & 0x80)      /* ζ¥―®ηª  ¤ ­­λε */
			{
			 NetSend( lana, LsnWORK, MESSAGE, count ,Ncb);
			 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			 LINGTH=3000;
			 NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,Ncb);
			 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
			 LENGTH=Ncb.length;
			 count=((MESSAGE[1])<<8)+MESSAGE[2];
			 CSW_MOD=MESSAGE[3];
			 //CH_DATA(unit);
			 ar=0;//CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else goto RET;
	 }
BEGRD:
 //	if ((CSW_MOD[unit]&0x10) == 0) flag_write=1;
 //else flag_write=0;

 for(;i<count;i++,ar++,p_buffer++)
	 {
NEXTB:
		if (p_buffer>1919) goto WRRD;
		COUT=AREA_7920[p_buffer];
		switch(k)
			{
			 case 0:if (COUT>0 && COUT<0x20 && COUT&0x01)
								{
								 MESSAGE[ar]=0x11;
								 ADC=MAKE_ADRESS_BUFER(p_buffer+1);
								 ar++;i++;
								 MESSAGE[ar]=ADC>>8);
								 ar++;i++;
								 MESSAGE[ar]=ADC&0x00ff);
								 k=1;
								}
							 else
								{p_buffer++;
								 goto NEXTB;
								}
							 break;
			 case 1:if (COUT>0 && COUT<0x20) {k=0;p_buffer++;goto NEXTB;}
							if (COUT==0)
								 {p_buffer++;
									goto NEXTB;
								 }
							MESSAGE[ar]=ASCII_EBCDIC[COUT]);
							break;
			}
	 }
 if(CSW_MOD & 0x80)      /* ζ¥―®ηª  ¤ ­­λε */
	 {
		NetSend( lana, LsnWORK, MESSAGE, count ,Ncb);
		if (Ncb.retcode)
				{return(Ncb.retcode);
				}
		LINGTH=3000;
		NetReceive(Lana,LsnWORK,MESSAGE,LENGTH,Ncb);
		if (Ncb.retcode)
				{return(Ncb.retcode);
				}
		LENGTH=Ncb.length;
		count=((MESSAGE[1])<<8)+MESSAGE[2];
		CSW_MOD=MESSAGE[3];
		//CH_DATA(unit);
		ar=0;CSW_ADRESS[unit];
		i=0;
		goto BEGRD;
	 }
 else goto RET;
RET:
	 NetSend( lana, LsnWORK, MESSAGE, count ,Ncb);
	 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
	 //CSW_COUNT[unit]=0;
	 return;
WRRD:
	 NetSend( lana, LsnWORK, MESSAGE, i ,Ncb);
	 if (Ncb.retcode)
				{return(Ncb.retcode);
				}
	 //CSW_COUNT[unit]-=i;
	 return;


}
/***************************************************************/
void RUN_7920_CLNZ(unsigned long BUFER,int count,int unit)
{
}
/***************************************************************/
int WRITE_BUFER(unit)
	{static int LINE,COLUMN,LINE80;
	 static int C0,C1,COUT;
	 static int CURSOR;
	 static int OLD_SA;

	 Normal();
	 for(LINE=0,LINE80=0;LINE<24;LINE++,LINE80+=80)
		 {for(COLUMN=0;COLUMN<80;COLUMN++)
				{COUT=AREA_7920[LINE80+COLUMN];

				 if (COUT>=0x20 || COUT==0x00)
					 {Gotoxy(COLUMN+1,LINE+1);if (COUT) Putchar(COUT);else Putchar(' ');
					 }
				 else
					 {if (COUT&0x06 == 0x04) {Gotoxy(COLUMN+1,LINE+1);Blink();}
						else {Gotoxy(COLUMN+1,LINE+1);Normal();}
						Putchar(223);
						OLD_SA=LINE80+COLUMN;
					 }
				}
		 }
	 Blink();
	 Gotoxy(1,25);Printf("PRESS ESC-for EXIT emulation 7920 mode");
	 CURSOR=0;
	 Normal();
	 CURSOR=((AREA_7920[1920])<<8)+AREA_7920[1921];
	 if (CURSOR<0 || CURSOR>1919) CURSOR=0;
	 Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef FOR386
	 gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
	 Normal();

	 //IO_STATUS[unit][5]=0;
	 IO_STATUS_unit_6=0;
	 return(CURSOR);
	}
/**************************************************************/
int SET_POINT_SA(char far*area,int position)
{
 static int old_position,i;
 old_position=position;
 if (area[old_position]>0 && area[old_position]<0x20) return(old_position);
 i=position;
NEXT:
 i--;
 if (i<0) i=1919;
 if (i==old_position) return(0);
 if (area[i]>0 && area[i]<0x20) return(i);
 goto NEXT;

}
/**************************************************************/
int RUN_EDIT(int UNIT)
{
 static int OLD_ADRESS=0;
 static int UNIT_POINT;
 static int LINE,COLUMN,LINE80;
 static int C0,C1,COUT;
 static int CURSOR;
 static int OLD_SA;
 static int POINT_SA;
 static int FIRST_IN=0;
 if (FIRST_IN==0)
	 {
		CURSOR=WRITE_BUFER(0);
		FIRST_IN=1;
	 }

 if (kbhit())
	 {POINT_SA=SET_POINT_SA(AREA_7920,CURSOR);
		C0=getch();
		switch(C0)
			{case 0:C1=getch();
							switch(C1)
								 {
									case KEYRIGHT:CURSOR++;if (CURSOR>=1920) CURSOR=0;
															 Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef FOR386
															 gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
															 break;
									case KEYLEFT:CURSOR--;if (CURSOR<0) CURSOR=1919;
															 Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef FOR386
															 gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
															 break;
									case KEYUP:   CURSOR-=80;if (CURSOR<0) CURSOR=0;
															 Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef FOR386
															 gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
															 break;
									case KEYDOWN:CURSOR+=80;if (CURSOR>=1920) CURSOR=1919;
															 Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef FOR386
															 gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
															 break;
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
								 }
							break;
			 case 13:COUT=0x7d;
PF:
							//if (FLAG_IO_DEVICE[UNIT_POINT] & RQ_WORK)
								{putchar(7);
								 break;
								}
							AREA_7920[1920]=CURSOR>>8;
							AREA_7920[1921]=CURSOR&0x00ff;
							IO_STATUS_unit_6=COUT;
							NetSend( lana, LsnWORK, MESSAGE, i ,Ncb2);
							if (Ncb2.retcode)
								{return(1);
								}
							//FLAG_IO_DEVICE[UNIT_POINT]=RQ_INT;
							//IO_STATUS[UNIT_POINT][1]=U0/*|U5*/;
							//CSW_COUNT[UNIT_POINT]=0;
							//CSW_CAW[UNIT_POINT]=0;
							break;

			 case 27:OLD_ADRESS=0;
							AREA_7920[1920]=CURSOR>>8;
							AREA_7920[1921]=CURSOR&0x00ff;
							End_edit();
#ifdef FOR386
							gotoxy(1,25);
#endif
							Gotoxy(1,25);printf("END OF 7920 EMULATION MODE                       ");
							printf("\n“‘’€‚‹… …† “‹’€ ‚ (‚›•„ ‡ ƒ€›: ESC)");
							return(0);
							break;
			 default:
							if (C0<' ') C0=' ';
							if (C0>='a' && C0<='z') C0-=0x20;
							if (C0>=' ' && C0<='―') C0-=0x20;
							if (C0>='ΰ' && C0<='ο') C0-=0x50;
							COUT=AREA_7920[CURSOR];
							if (COUT>0 && COUT<0x20) {putchar(7);break;}
							if (POINT_SA)
								{
								 if (0x08&AREA_7920[POINT_SA])
										 {putchar(7);break;}
								 AREA_7920[POINT_SA]|=0x01;
								}
							AREA_7920[CURSOR]=C0;
							Gotoxy(CURSOR%80+1,CURSOR/80+1);Putchar(C0);
							CURSOR++;
							if (CURSOR>1919) CURSOR=0;
#ifdef FOR386
							gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
							AREA_7920[1920]=CURSOR>>8;
							AREA_7920[1921]=CURSOR&0x00ff;

							break;

			}
	 }
 return (1);
}
