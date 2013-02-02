#ifdef INCLUDE
#else
#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>

#include "ds360psw.h"
#include "ds360dfn.h"
extern void (*POINT[256])(char far*);
#endif
void CODE40(char far *COM)
{
 static char RR;
 static char RX;
 static int R1,R2,B2,IS,i,j,k;
 static unsigned int HALF;
 static char MMM;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static long RREZ;
 static unsigned long ADRESS;
 static unsigned long WWWW;
 static signed long SWWWW;
 static char STRI[20];
 static long psw_adress;
 static int psw_ilc;
 static char command[8];
 static char old_byte;
 static unsigned long adress;
 static unsigned int FLA;
 static char c0;
#define B1 B2
#define I2 RX
#define X2 R2
#define ADRESs (unsigned int)ADRESS

 GET_OPERAND_RX;
 FORWARD_PSW;
 switch(COM[0])
	 {
		case 0x40:
															/* STH */
																/*
																запись в память полуслова
																*/

				 if (ADRESs&0x1)
					 {RQ_PRG=6;
						RETURN=1;
						break;
					 }
				 HALF=(unsigned int)(/*0x0000ffffl&*/R[R1]);
				 PUT_BYTE(ADRESS,HALF>>8);
				 Dtaret;
				 *(POINTER_T+1)=(unsigned char)HALF;
				 //PUT_BYTE(ADRESS+1,0x00ff&HALF);
				 //T();
				 break;


		case 0x41:                   /* LA */
//																 /*
//
//																 */
//				 R[R1]=0xffffff&ADRESS;
				 T();
				 break;


		case 0x42:
																 /* STC */

																 /*
																 */
				 PUT_BYTE(ADRESS,(unsigned char)R[R1]);
				 //T();
				 break;


		case 0x43:
																 /* IC */
																 /*
																 */


#ifdef DTA_370
				 c0=GET_BYTE(ADRESS);
				 Dtaret;
				 R[R1]=(0xffffff00&R[R1])|((unsigned long)c0);
#else
				 R[R1]=(0xffffff00&R[R1])|((unsigned long)GET_BYTE(ADRESS));
#endif
				 //T();
				 break;


		case 0x44:                   /* EX */
																 /*
																 */
//					MOVE_360_TO_MEM(ADRESS,command,6);
////					if (RETURN) return;
//					if (command[0]==0x44) {RQ_PRG=3;RETURN=1;return;}
//					if (R1) command[1]=(0xff&R[R1])|command[1];
////					if (RQ_TRACE)
////printf("\nEX %02x %02x %02x %02x %02x %02x ",
////															 command[0],command[1],
////															 command[2],command[3],
////															 command[4],command[5]);
//         psw_ilc=PSW_ILC;
//				 PSW_ILC=0;
//				 (*POINT[command[0]])(command);
//				 PSW_ILC=psw_ilc;
				 T();
				 break;


		case 0x45:                   /* BAL */
//				 R[R1]= (((unsigned long)PSW_ILC)<<29)|
//								(((unsigned long)PSW_CC)<<28)|
//								(((unsigned long)PSW_PRG_MASK)<<24)|
//							 (PSW_ADRESS&0xffffff);
//				 PSW_ADRESS=0xffffff & ADRESS;
				 T();
				 break;


		case 0x46:                   /* BCT */
																 /*
																 */
				 if ((--((signed long)R[R1])))
					 {PSW_ADRESS=(ADRESS&0xfffffe);
					 }
				 //T();
				 break;


		case 0x47:                   /* BC   */
//				 if ((0x08>>PSW_CC) & R1)
//						PSW_ADRESS=0xffffff & ADRESS;
				 T();
				 break;


		case 0x48:                   /* LH   */
//				 if (ADRESs&0x1)
//					 {RQ_PRG=6;
//						RETURN=1;
//						break;
//					 }
//				 WWWW=(((unsigned long)GET_BYTE(ADRESS))<<8) |
//							 ((unsigned long)GET_BYTE(ADRESS+1)  );
//				 if (WWWW&0x8000) R[R1]=0xffff0000|WWWW;
//				 else R[R1]=WWWW;
				 T();
				 break;


		case 0x49:                   /* CH   */
																 /*
																 Сравнение полуслов
																 */
				 if (ADRESs&0x1)
					 {RQ_PRG=6;
						RETURN=1;
						break;
					 }
				 WWWW=(((unsigned long)GET_BYTE(ADRESS))<<8) |
							 ((unsigned long)GET_BYTE(ADRESS+1) 	);
				 Dtaret;
				 if (WWWW&0x8000) WWWW=0xffff0000|WWWW;
				 if (WWWW==R[R1]) PSW_CC=0;
				 else
						if (((signed long)R[R1])<((signed long)WWWW)) PSW_CC=1;
						else PSW_CC=2;
				 //T();
				 break;


		case 0x4a:                   /* AH   */
																 /*
																 сложение полуслов
																 */
				 if (ADRESs&0x1)
					 {RQ_PRG=6;
						RETURN=1;
						break;
					 }
				 WWWW=(((unsigned long)GET_BYTE(ADRESS))<<8) |
							 ((unsigned long)GET_BYTE(ADRESS+1)  );
				 Dtaret;
				 if (WWWW&0x8000) WWWW=0xffff0000|WWWW;
				 RR1=&R[R1];
				 (*RR1)+=((signed long)WWWW);
#include "ds360sr.c"
				 //T();
				 break;


		case 0x4b:                   /* SH   */
																 /*
																 вычитание полуслов
																 */
				 if (ADRESs&0x1)
					 {RQ_PRG=6;
						RETURN=1;
						break;
					 }
				 WWWW=(((unsigned long)GET_BYTE(ADRESS))<<8) |
							 ((unsigned long)GET_BYTE(ADRESS+1)  );
				 Dtaret;
				 if (WWWW&0x8000) WWWW=0xffff0000|WWWW;
				 RR1=&R[R1];
				 (*RR1)+=(-((signed long)WWWW));
#include "ds360sr.c"
				 //T();
				 break;


		case 0x4c:                   /* MH   */
																 /*
																 умножение полуслова
																 */
				 if (ADRESs&0x1)
					 {RQ_PRG=6;
						RETURN=1;
						break;
					 }
				 WWWW=(((unsigned long)GET_BYTE(ADRESS))<<8) |
							 ((unsigned long)GET_BYTE(ADRESS+1)  );
				 Dtaret;
				 if (WWWW&0x8000) WWWW=0xffff0000|WWWW;
				 R[R1]=((signed long)R[R1])*((signed long)WWWW);
				 //T();
				 break;



		case 0x4d:                   /* BAS  */
																 /*
																 переход с записью в память
																 */

				 T00(COM[0]);
				 break;


		case 0x4e:                   /* CVD  */
																 /*
																 преобразование в десятичную
																 */
				 SWWWW=(signed long)R[R1];if (SWWWW>=0) {MMM=0x0c;} else {MMM=0x0d;SWWWW=-SWWWW;}

#ifdef DTA_370
				DtaEnd(ADRESS,0);
				DtaEnd(ADRESS,3);
#endif
				 sprintf(STRI,"%016ld",SWWWW);
				 for(i=15,ADRESS+=7,k=0;i>=0;i--)
					 {
						if (k==0)
							{
							 PUT_BYTE(ADRESS--,((STRI[i]-'0')<<4)|MMM);
							 k=1;
							}
						else
							{
							 MMM=STRI[i]-'0';k=0;
							}
					 }
				 //T();
				 break;


		case 0x4f:                   /* CVB  */
																 /*
																 преобразование в двоичное
																 */


				 for(WWWW=0,i=0;i<7;i++)
					{MMM=GET_BYTE(ADRESS++);
					 WWWW=WWWW*10l+ ((MMM&0xf0)>>4);
					 WWWW=WWWW*10l+ (MMM&0x0f);
					}
				 MMM=GET_BYTE(ADRESS);
				 WWWW=WWWW*10+((MMM&0xf0)>>4);
				 SWWWW=WWWW;
				 if ((MMM&0x0f==0x0d)||(MMM&0x0f==0x0b)) SWWWW=-SWWWW;
				 Dtaret;
				 R[R1]=SWWWW;
				 //T();
				 break;

	 }
}
void CODE44(char far *COM)                 /*** EX */
{
 static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static unsigned long ADRESS;
 static char command[8];
#define B1 B2
#define I2 RX
#define X2 R2

 GET_OPERAND_RX;
 FORWARD_PSW;
 MOVE_360_TO_MEM(ADRESS,command,6);
//					if (RETURN) return;
					if (command[0]==0x44) {RQ_PRG=3;RETURN=1;return;}
					if (R1) command[1]=(0xff&R[R1])|command[1];
//					if (RQ_TRACE)
//printf("\nEX %02x %02x %02x %02x %02x %02x ",
//															 command[0],command[1],
//															 command[2],command[3],
//															 command[4],command[5]);
//         psw_ilc=PSW_ILC;
         PSW_ADRESS-=PSW_ILC;
				 //PSW_ILC=0;
				 (*POINT[command[0]])(command);
				 //PSW_ILC=2;//psw_ilc;

//T();
}
void CODE41(char far *COM)                 /*** LA */
{
 static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static unsigned long ADRESS;
#define B1 B2
#define I2 RX
#define X2 R2

GET_OPERAND_RX;
FORWARD_PSW;
R[R1]=ADRESS&0xffffff;
//T();
}                                         /* BAL */
void CODE45(char far *COM)
{
 static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static unsigned long ADRESS;
#define B1 B2
#define I2 RX
#define X2 R2

	 GET_OPERAND_RX;
	 FORWARD_PSW;
	 R[R1]= (((unsigned long)PSW_ILC)<<29)|
								(((unsigned long)PSW_CC)<<28)|
								(((unsigned long)PSW_PRG_MASK)<<24)|
							 (PSW_ADRESS);
	 PSW_ADRESS=0xfffffe & ADRESS;
	 //T();
}
void CODE47(char far *COM)                  /* BC */
{
 static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static unsigned long ADRESS;
#define B1 B2
#define I2 RX
#define X2 R2

if ((0x80>>PSW_CC) & COM[1])
	{GET_OPERAND_RX;
	 PSW_ADRESS=0xfffffe & ADRESS;
	}
else PSW_ADRESS+=PSW_ILC;
}

void CODE48(char far *COM)               /* LH */
{
 static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static unsigned long ADRESS;
 static unsigned long WWWW;
 static signed long SWWWW;
#define B1 B2
#define I2 RX
#define X2 R2

	GET_OPERAND_RX;
	FORWARD_PSW;
	if (ADRESs&0x1)
					 {RQ_PRG=6;
						RETURN=1;
						return;
					 }
	WWWW=(((unsigned long)GET_BYTE(ADRESS))<<8) |
			 ((unsigned long)(*(POINTER_T+1))  );
//	WWWW=(((unsigned long)GET_BYTE(ADRESS))<<8) |
//			 ((unsigned long)GET_BYTE(ADRESS+1)  );
	Dtaret;
	if (WWWW&0x8000) R[R1]=0xffff0000|WWWW;
	else R[R1]=WWWW;
	//T();
}
#undef B1
#undef I2
#undef X2

