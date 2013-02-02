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

//#include "ds360psw.h"

//#include "ds360dfn.h"
#include "ds360trn.h"

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

extern char far *AREA_7920[10];

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
 if (CH!=7) putchar(CH);
#endif
}
/*************************************************************/

void PutShowCh(int Unit_p,int Curs,char C0)
{
	AREA_7920[   Unit_p][Curs]=C0;
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
   AREA_7920[unit][1926]=0;
	 //IO_STATUS[unit][5]=0;
	 //IO_STATUS[unit][6]=0;
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
int RUN_EDIT(int UNIT_POINT)
{
 static int OLD_ADRESS=0;
 static int LINE,COLUMN,LINE80;
 static int C0,C1,COUT;
 static int CURSOR;
 static int OLD_SA;
 static int POINT_SA;
 static int i,j;

 if (AREA_7920[UNIT_POINT][1926]) CURSOR=WRITE_BUFER(UNIT_POINT);

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
							AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
							AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
              AREA_7920[UNIT_POINT][1925]=13;
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
 return (1);
}
