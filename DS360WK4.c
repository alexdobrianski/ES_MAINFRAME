/*****************************************************
* DISPLAY 7920
*
*
******************************************************/
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

#define ADRESS_EGA 0xb8000000

#define DIRECT_VGA 1
static int X_EGA,Y_EGA;
static char ATR_EGA;
static char far*POSITION;
/*************************************************************
*  WORKING UTILITYS
**************************************************************/


/*************************************************************/
void Gotoxy(int X,int Y)
 {
#ifdef DIRECT_VGA
X_EGA=X;Y_EGA=Y;
POSITION=ADRESS_EGA+((X_EGA-1)+(Y_EGA-1)*80)*2;
#else
	printf("\033[%d;%dH",Y,X);
#endif
 }
/*************************************************************/
void Putchar(int CH)
{
#ifdef DIRECT_VGA
*POSITION++=CH;*POSITION++=ATR_EGA;
#else
 putchar(CH);
#endif
}
/*************************************************************/

void PutShowCh(int Unit_p,int Curs,char C0)
{
	AREA_7920[Unit_p][Curs]=C0;
	Gotoxy(Curs%80+1,Curs/80+1);Putchar(C0);
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
#ifdef DIRECT_VGA
//ATR_EGA=0x07;
		#ifdef EN_INTER
		ATR_EGA=0x02;
		#else
		ATR_EGA=0x07;
		#endif
#else
 //printf("\033[32m");
 printf("\033[0m");
#endif
}
/*************************************************************/
void Blink(void)
{
#ifdef DIRECT_VGA
//ATR_EGA=0x70;
	 #ifdef EN_INTER
	 ATR_EGA=0x20;
	 #else
	 ATR_EGA=0x70;
	 #endif
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
/*************************************************************
* 7920 COMMANDS
**************************************************************/

/*************************************************************/
void RUN_7920_WR(unsigned long BUFER,int count,int unit)
{static int i,j;
 static unsigned long ar;
 static char COUT;
 static int POINT_BUFER;
 static int NEXT_POINT_BUFER;
 static char FILLING_CHAR;

 POINT_BUFER=((AREA_7920[unit][1922])<<8)+AREA_7920[unit][1923];
	 if (POINT_BUFER<0 || POINT_BUFER>1919) POINT_BUFER=0;
	i=1;ar=CSW_ADRESS[unit]+1;
BEGWR:
 for(;i<CSW_COUNT[unit];i++,ar++)
	 {
		COUT=GET_BYTE(ar);
		switch(COUT)
			{
			 case 0x1d:       /*  €—€‹Ž Ž‹Ÿ */
								COUT=GET_BYTE(ar+1);
								COUT=0x10|((0x20&COUT)>>2)|((0x0c&COUT)>>1)|(COUT&0x01);
								AREA_7920[unit][POINT_BUFER]=COUT;
								//printf("p=%d ATR=%x",POINT_BUFER,COUT);getch();
								i++;ar++;
								POINT_BUFER++;
								if (POINT_BUFER>1919) POINT_BUFER=0;
								break;
			 case 0x11:       /*  “‘’€Ž‚ˆ’œ €„…‘ “”…Ž‰ €ŒŸ’ˆ */
								POINT_BUFER=ADRESS_BUFER(GET_BYTE(ar+1),GET_BYTE(ar+2));
								//printf("POINT BUFER=%d",POINT_BUFER);getch();
								i+=2;ar+=2;
								break;
			 case 0x13:       /*  “‘’€Ž‚ˆ’œ Š“‘Ž                */
								AREA_7920[unit][1920]=POINT_BUFER>>8;
								AREA_7920[unit][1921]=POINT_BUFER&0x00ff;

								break;
			 case 0x3c:       /*  Ž‚’Žˆ’œ „Ž €„…‘€              */
								NEXT_POINT_BUFER=ADRESS_BUFER(GET_BYTE(ar+1),GET_BYTE(ar+2));
								FILLING_CHAR=GET_BYTE(ar+3);
								ar+=3;i+=3;
								//printf("from=%d(%x) to=%d(%x)",POINT_BUFER,POINT_BUFER,
								//NEXT_POINT_BUFER,NEXT_POINT_BUFER);getch();
								if (NEXT_POINT_BUFER>=0 && NEXT_POINT_BUFER<1920)
									{
FILL:              if (POINT_BUFER==NEXT_POINT_BUFER) break;
									 AREA_7920[unit][POINT_BUFER]=EBCDIC_ASCII[FILLING_CHAR];
									 POINT_BUFER++;if (POINT_BUFER>1919) POINT_BUFER=0;
									 goto FILL;
									}
								break;
			 case 0x12:       /*  ‘’……’œ …‡€™ˆ™…Ž…             */
								 printf("steret nezaschischennoe");getch();
								break;
			 case 0x05:       /* Žƒ€ŒŒ€Ÿ ’€“‹Ÿ–ˆŸ             */
								printf("programmnaia tabuliacia");getch();
								break;
			 default  :
								AREA_7920[unit][POINT_BUFER]=EBCDIC_ASCII[GET_BYTE(ar)];
								POINT_BUFER++;
								if (POINT_BUFER>1919) POINT_BUFER=0;
								break;
			}
	 }
 if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
	{
	 CH_DATA(unit);
	 i=0;ar=CSW_ADRESS[unit];
	 goto BEGWR;
	}
 IO_STATUS[unit][5]=1;
 AREA_7920[unit][1922]=POINT_BUFER>>8;
 AREA_7920[unit][1923]=POINT_BUFER&0x00ff;
 AREA_7920[unit][1926]=1;

}
/*************************************************************/
void RUN_7920_CLWR(unsigned long BUFER,int count,int unit)
{static int i;

 for(i=0;i<1924;i++) AREA_7920[unit][i]=0;
 RUN_7920_WR(BUFER,count,unit);
}
/*************************************************************/
int  RUN_7920_RD(unsigned long BUFER,int count,int unit)
{static unsigned long ar;
 static unsigned int ADC;
 static int i,flag_write;
 static char COUT;
 static int p_buffer,CURSOR;
 ar=CSW_ADRESS[unit];
 p_buffer=((AREA_7920[unit][1922])<<8)+AREA_7920[unit][1923];
 if (p_buffer<0 || p_buffer>1919) p_buffer=0;
 if ((CSW_MOD[unit]&0x10) == 0) flag_write=1;
 else flag_write=0;
 COUT=IO_STATUS[unit][6];
 if (COUT==0) COUT=0x60;
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,COUT);
 ar++;
 if (count<=1)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
		 {
			CH_DATA(unit);
			ar=CSW_ADRESS[unit];
			i=0;
			//goto BEGRD;
		 }
		else  goto RET;
	 }
 ADC=MAKE_ADRESS_BUFER((AREA_7920[unit][1920])<<8+AREA_7920[unit][1921]);
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC>>8);
 ar++;
 if (count<=2)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
			{
			 CH_DATA(unit);
			 ar=CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else  goto RET;
	 }
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC&0x00ff);
 ar++;i=3;
 if (count<=3)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
			{
			 CH_DATA(unit);
			 ar=CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else goto RET;
	 }
BEGRD:
 if ((CSW_MOD[unit]&0x10) == 0) flag_write=1;
 else flag_write=0;
 for(;i<CSW_COUNT[unit];i++,ar++,p_buffer++)
	 {if (p_buffer>1919) goto WRRD;
		COUT=AREA_7920[unit][p_buffer];
		if (COUT>0 && COUT<0x20)
			{
			 if (flag_write)PUT_BYTE(ar,0x1d);
			 if (flag_write)PUT_BYTE(ar+1,((COUT&0x08)<<2)|((COUT&0x06)<<1)|(COUT&0x01));
			 ar++;i++;
			}
		else
			{if (flag_write)PUT_BYTE(ar,ASCII_EBCDIC[COUT]);
			}
	 }
 if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
	 {
		CH_DATA(unit);
		ar=CSW_ADRESS[unit];
		i=0;
		goto BEGRD;
	 }
 else goto RET;
RET:
	 CSW_COUNT[unit]=0;
	 return;
WRRD:
	 CSW_COUNT[unit]-=i;
	 return;

}
/***********************************************************/
int RUN_7920_RDMD(unsigned long BUFER,int count,int unit)
{static unsigned long ar;
 static unsigned int ADC;
 static int i,flag_write,k;
 static char COUT;
 static int p_buffer,CURSOR;
 ar=CSW_ADRESS[unit];
 p_buffer=((AREA_7920[unit][1922])<<8)+AREA_7920[unit][1923];
 if (p_buffer<0 || p_buffer>1919) p_buffer=0;
 p_buffer=0;
 COUT=IO_STATUS[unit][6];
 if (COUT==0) COUT=0x60;
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,COUT);
 ar++;
 if (count<=1)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
		 {
			CH_DATA(unit);
			ar=CSW_ADRESS[unit];
			i=0;
			//goto BEGRD;
		 }
		else  goto RET;
	 }
 if (COUT==0x6d || COUT==0x6c || COUT==0x6e || COUT==0x6b)
		{i=1;
		 goto WRRD;
		}
 ADC=MAKE_ADRESS_BUFER( (( (int) AREA_7920[unit][1920])<<8) +(int)AREA_7920[unit][1921]);
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC>>8);
 ar++;
 if (count<=2)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
			{
			 CH_DATA(unit);
			 ar=CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else  goto RET;
	 }
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC&0x00ff);
 ar++;i=3;k=0;
 if (count<=3)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
			{
			 CH_DATA(unit);
			 ar=CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else goto RET;
	 }
BEGRD:
	if ((CSW_MOD[unit]&0x10) == 0) flag_write=1;
 else flag_write=0;

 for(;i<CSW_COUNT[unit];i++,ar++,p_buffer++)
	 {
NEXTB:
		if (p_buffer>1919) goto WRRD;
		COUT=AREA_7920[unit][p_buffer];
		switch(k)
			{
			 case 0:if (COUT>0 && COUT<0x20 && COUT&0x01)
								{
								 PUT_BYTE(ar,0x11);
								 ADC=MAKE_ADRESS_BUFER(p_buffer+1);
								 ar++;i++;
								 PUT_BYTE(ar,ADC>>8);
								 ar++;i++;
								 PUT_BYTE(ar,ADC&0x00ff);
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
							PUT_BYTE(ar,ASCII_EBCDIC[COUT]);
							break;
			}
	 }
 if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
	 {
		CH_DATA(unit);
		ar=CSW_ADRESS[unit];
		i=0;
		goto BEGRD;
	 }
 else goto RET;
RET:
	 CSW_COUNT[unit]=0;
	 return;
WRRD:
	 CSW_COUNT[unit]-=i;
	 return;


}
/***************************************************************/
void RUN_7920_CLNZ(unsigned long BUFER,int count,int unit)
{
 AREA_7920[unit][1926]=1;
}
/***************************************************************
* INTERFACE FUNCTIONS
****************************************************************/
/***************************************************************/
int WRITE_BUFER(unit)
	{static int LINE,COLUMN,LINE80;
	 static int C0,C1,COUT;
	 static int CURSOR;
	 static int OLD_SA;

	 Normal();
	 for(LINE=0,LINE80=0;LINE<24;LINE++,LINE80+=80)
		 {for(COLUMN=0;COLUMN<80;COLUMN++)
				{COUT=AREA_7920[unit][LINE80+COLUMN];

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
	 Gotoxy(1,25);Printf("PRESS ESC-for EXIT emulation 7920 mode                                         ");
	 CURSOR=0;
	 Normal();
	 CURSOR=((AREA_7920[unit][1920])<<8)+AREA_7920[unit][1921];
	 if (CURSOR<0 || CURSOR>1919) CURSOR=0;
	 Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef DIRECT_VGA
	 gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
	 Normal();

	 IO_STATUS[unit][5]=0;
	 IO_STATUS[unit][6]=0;
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
 static int i,j;
 if (OLD_ADRESS!=UNIT)
	 {
		for(UNIT_POINT=0;UNIT_POINT<NUMBER_IO;UNIT_POINT++)
		 {
			if (ADRESS_IO_DEVICE[UNIT_POINT]==(int)(0x00000fff&UNIT) )
			goto OK_UNIT;
		 }
		return(0);
OK_UNIT: OLD_ADRESS=UNIT;
	 CURSOR=WRITE_BUFER(UNIT_POINT);
	 }
 if (IO_STATUS[UNIT_POINT][5]) CURSOR=WRITE_BUFER(UNIT_POINT);

 if (kbhit())
	 {POINT_SA=SET_POINT_SA(AREA_7920[UNIT_POINT],CURSOR);
		C0=getch();
		switch(C0)
			{case 0:C1=getch();
							switch(C1)
								 {
									case KEYRIGHT:CURSOR++;if (CURSOR>=1920) CURSOR=0;
															 Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef DIRECT_VGA
															 gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
															 break;
									case KEYLEFT:CURSOR--;if (CURSOR<0) CURSOR=1919;
															 Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef DIRECT_VGA
															 gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
															 break;
									case KEYUP:   CURSOR-=80;if (CURSOR<0) CURSOR=0;
															 Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef DIRECT_VGA
															 gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
															 break;
									case KEYDOWN:CURSOR+=80;if (CURSOR>=1920) CURSOR=1919;
															 Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef DIRECT_VGA
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
                  case KEYINS:
                              for(j=CURSOR;j<((CURSOR+80)/80)*80;j++)
                              {
                                 if (AREA_7920[UNIT_POINT][j]==0) break;
                              }

                              for(i=j;i>CURSOR;i--)
                              {
                                 PutShowCh(UNIT_POINT,i,AREA_7920[UNIT_POINT][i-1]);
                              }
                              PutShowCh(UNIT_POINT,CURSOR,' ');
                              break;
                  case KEYDEL:
                              for(j=CURSOR;j<((CURSOR+80)/80)*80;j++)
                              {
                                 if (AREA_7920[UNIT_POINT][j]==0) break;
                              }
                              for(i=CURSOR;i<j;i++)
                              {
                               PutShowCh(UNIT_POINT,i,AREA_7920[UNIT_POINT][i+1]);
                              }
                              break;
                  case KEYHOME:CURSOR=0;Gotoxy(CURSOR%80+1,CURSOR/80+1);
                              AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
							                AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
                              Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef DIRECT_VGA
															gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
                              break;
                  case KEYEND:CURSOR=((CURSOR+80)/80)*80;
                              if (CURSOR>=1920) CURSOR=0;
                              Gotoxy(CURSOR%80+1,CURSOR/80+1);
                              AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
							                AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
                              Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef DIRECT_VGA
															gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
                              break;
                  default: break;
								 }
							break;
			 case 13:COUT=0x7d;
PF:
							if (FLAG_IO_DEVICE[UNIT_POINT] & RQ_WORK)
								{putchar(7);
								 break;
								}
							AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
							AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
							IO_STATUS[UNIT_POINT][6]=COUT;
							FLAG_IO_DEVICE[UNIT_POINT]=RQ_INT;
							IO_STATUS[UNIT_POINT][1]=U0/*|U5*/;
							CSW_COUNT[UNIT_POINT]=0;
							CSW_CAW[UNIT_POINT]=0;
							break;

			 case 27:OLD_ADRESS=0;
							AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
							AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
							End_edit();
#ifdef DIRECT_VGA
							gotoxy(1,25);
#endif
							Gotoxy(1,25);
              printf("\033[2J");
							HELPHELP("## …†ˆŒ “‹œ’€ Ž…€’Ž€ (‚›•Ž„ ˆ‡ Žƒ€ŒŒ›: ESC)");
							End_edit();
							return(0);
							break;
			 case 8:
							COUT=AREA_7920[UNIT_POINT][CURSOR];
							if (COUT>0 && COUT<0x20) {putchar(7);break;}
							if (POINT_SA)
								{
								 if (0x08&AREA_7920[UNIT_POINT][POINT_SA])
										 {putchar(7);break;}
								 AREA_7920[UNIT_POINT][POINT_SA]|=0x01;
								}
							CURSOR--;if (CURSOR<0) CURSOR=1919;
							Gotoxy(CURSOR%80+1,CURSOR/80+1);
#ifdef DIRECT_VGA
							gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
              PutShowCh(UNIT_POINT,CURSOR,' ');
							//AREA_7920[UNIT_POINT][CURSOR]=' ';
							//Gotoxy(CURSOR%80+1,CURSOR/80+1);Putchar(' ');
#ifdef DIRECT_VGA
							gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
							AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
							AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;



							break;
			 default:
							if (C0<' ') C0=' ';
							if (C0>='a' && C0<='z') C0-=0x20;
							if (C0>=' ' && C0<='¯') C0-=0x20;
							if (C0>='à' && C0<='ï') C0-=0x50;
							COUT=AREA_7920[UNIT_POINT][CURSOR];
							if (COUT>0 && COUT<0x20) {putchar(7);break;}
							if (POINT_SA)
								{
								 if (0x08&AREA_7920[UNIT_POINT][POINT_SA])
										 {putchar(7);break;}
								 AREA_7920[UNIT_POINT][POINT_SA]|=0x01;
								}
              PutShowCh(UNIT_POINT,CURSOR,C0);
							//AREA_7920[UNIT_POINT][CURSOR]=C0;
							//Gotoxy(CURSOR%80+1,CURSOR/80+1);Putchar(C0);
							CURSOR++;
							if (CURSOR>1919) CURSOR=0;
#ifdef DIRECT_VGA
							gotoxy(CURSOR%80+1,CURSOR/80+1);
#endif
							AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
							AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;

							break;

			}
	 }
 return (RQ_7920);
}
