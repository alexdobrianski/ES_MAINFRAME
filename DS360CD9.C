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
#endif
void CODE90(char far *COM)
{
 static char RR;
 static char RX;
 static unsigned int is;
 static unsigned int iis;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static long RREZ;
 static unsigned long ADRESS;
 static int i,j;
#define B1 B2
#define I2 RX
#define X2 R2

 static unsigned long ADR;
 GET_OPERAND_SI;
 FORWARD_PSW;
 switch(COM[0])
	 {
		case 0x90:            /* STM r1,r2,AREA
													запись в память групповая
													*/

							i=R1;
#ifdef DTA_370
							DtaEnd(ADRESS,0);
							DtaEnd(ADRESS,63);
#endif

PUT_STORE:
							PUT_WORD(ADRESS,R[i]);
							if (RETURN) return;
							ADRESS+=4;
							if (i==R2) goto END_STORE;
							if (++i>=16) i=0;
							goto PUT_STORE;
END_STORE:    ;
							//T();
							break;
		case 0x91:            /*  TM MASK,AREA
//													проверить по маске
//													*/
//							is=GET_BYTE(ADRESS);
//							is&=I2;
//							if (is==0) PSW_CC=0;
//							else
//								if (is==I2) PSW_CC=3;
//								else PSW_CC=1;
							break;
		case 0x92:                                /* MVI */
							PUT_BYTE(ADRESS,I2);
							//T();
							break;
		case 0x93:            /*   TS MASK,AREA
													проверить и установить
													*/
							is=GET_BYTE(ADRESS);
							Dtaret;
							if (is&0x80) PSW_CC=1;
							else PSW_CC=0;
							PUT_BYTE(ADRESS,0xff);
							//T();
							break;
		case 0x94:PSW_CC=0;                         /*NI*/
							//is=GET_BYTE(ADRESS);
							//is&=I2;
							//PUT_BYTE(ADRESS,is);
							if ((is=(I2&GET_BYTE(ADRESS)))!=0) PSW_CC=1;
							Dtaret;
							PUT_BYTE(ADRESS,is);
							//T();
							break;
		case 0x95:PSW_CC=0;                         /*CLI*/
							is=GET_BYTE(ADRESS);
							Dtaret;
							iis=I2;
							if (is<iis) PSW_CC=1;
							if (is>iis)  PSW_CC=2;
							//T();
							break;
		case 0x96:PSW_CC=0;                          /*OI*/
							//is=GET_BYTE(ADRESS);
							//is|=I2;
							//PUT_BYTE(ADRESS,is);
							if ((is=(I2|GET_BYTE(ADRESS)))!=0) PSW_CC=1;
							Dtaret;
							PUT_BYTE(ADRESS,is);
							//T();
							break;
		case 0x97:PSW_CC=0;                           /*XI*/
							is=GET_BYTE(ADRESS);
							Dtaret;
							is^=I2;
							PUT_BYTE(ADRESS,is);
							if (is!=0) PSW_CC=1;
							//T();
							break;
		case 0x98:                  /*  LM r1,r2,AREA
																загрузка групповая
																*/

							i=R1;
#ifdef DTA_370
							DtaEnd(ADRESS,0);
							DtaEnd(ADRESS,63);
#endif

GET_LM:
							R[i]=GET_WORD(ADRESS);
							if (RETURN) return;
							if (i==R2) goto END_LM;
							//i++;
							ADRESS+=4;
							if (++i>=16) i=0;
							goto GET_LM;
END_LM:
							//T();
							break;
		case 0x99:                  /*  HPR
																остановить и продолжить
																*/
							T00(COM[0]);
							break;
		case 0x9a:                  /*  TIOB
																TEST I/O and BRANCH
																*/
							T00(COM[0]);
							break;
		case 0x9b:                  /* CIO Control I/O
																*/
							T00(COM[0]);
							break;
		case 0x9c:                                  /*SIO*/
							/* в режиме работы процессора PROGRAM SIO запрещено*/
							//if (PSW_AMWP&0x01) {RQ_PRG=2;RETURN=1;break;}
							Chk_priv;
							PSW_CC=SIO_DEVICE(ADRESS);
							RETURN=1;
							//T();
							break;
		case 0x9d:                                 /*TIO*/

							/* в режиме работы процессора PROGRAM TIO запрещено*/
							//if (PSW_AMWP&0x01) {RQ_PRG=2;RETURN=1;break;}
							Chk_priv;
							PSW_CC=TIO_DEVICE(ADRESS);
							RETURN=1;
							//if (RQ_TRACE&0x02) printf("\TIO =%04lx",ADRESS);
							//T();
							break;
		case 0x9e:                    /* HIO */
							//if (PSW_AMWP&0x1)
							//{RETURN=1;
							// RQ_PRG=0x0002;
							// break;
							//}
							Chk_priv
							PSW_CC=HIO_DEVICE(ADRESS);
							RETURN=1;
							T();
							break;
		case 0x9f:                    /* TCH */
							//if (PSW_AMWP&0x1)
							//{RETURN=1;
							// RQ_PRG=0x0002;
							// break;
							//}
							Chk_priv;
							PSW_CC=TCH_DEVICE(ADRESS);
							//T();
							break;
	 }
}
void CODE91(char far *COM)
{
 static char RR;
 static char RX;
 static unsigned int is;
 static unsigned int iis;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static long RREZ;
 static unsigned long ADRESS;
 static int i,j;
#define B1 B2
#define I2 RX
#define X2 R2

 static unsigned long ADR;
#ifdef OPT001
 _AL=COM[1];_AH=0;RX=_AL;
 _AX=*(unsigned int*)(&COM[2]);
 if (_AL & 0xf0)
	 {_BL=_AL;asm xchg ah,al;
		_BH=0;asm shr bx,4;
		ADRESS=(unsigned long)(_AX&0x0fff)+R[_BX];
	 }
 else
	 {
		asm xchg ah,al;
		ADRESS=(unsigned long)_AX;
	 }

#else
 RX=COM[1];
 BD=COM[2];
 B2=BD>>4;
 if (B2) ADRESS=R[B2];else ADRESS=0;
 ADRESS+=(unsigned long)(((BD&0x0f)<<8)+COM[3]);
#endif
 FORWARD_PSW;
 /*  TM MASK,AREA
		проверить по маске
											*/
 if ((is=(I2&GET_BYTE(ADRESS)))==0) PSW_CC=0;
 else
		if (is==I2) PSW_CC=3;
		else PSW_CC=1;
}
void CODE95(char far *COM)
{
 static char RR;
 static char RX;
 static unsigned int is;
 static unsigned int iis;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static long RREZ;
 static unsigned long ADRESS;
 static int i,j;
 static unsigned int FLA;
#define B1 B2
#define I2 RX
#define X2 R2

 static unsigned long ADR;
// RX=COM[1];
#ifdef OPT001
 _AX=*(unsigned int*)(&COM[2]);
 if (_AL & 0xf0)
	 {_BL=_AL;asm xchg ah,al;
		_BH=0;asm shr bx,4;
		ADRESS=(unsigned long)(_AX&0x0fff)+R[_BX];
	 }
 else
	 {
		asm xchg ah,al;
		ADRESS=(unsigned long)_AX;
	 }

#else
 BD=COM[2];
 B2=BD>>4;
 if (B2) ADRESS=R[B2];else ADRESS=0;
 ADRESS+=(unsigned long)(((BD&0x0f)<<8)+COM[3]);
#endif
 FORWARD_PSW;
 //is=GET_BYTE(ADRESS)-COM[1];
 if (GET_BYTE(ADRESS)==COM[1]) {PSW_CC=0;return;}
 FLA=_FLAGS;
 if (FLA&0x0080) /*<0*/   PSW_CC=1;
 else            /*>0*/   PSW_CC=2;
 //if (FLA&0x0040)  /*==0*/   PSW_CC=0;
 //				else
 //				 {if (FLA&0x0080) /*<0*/   PSW_CC=1;
 //					else            /*>0*/   PSW_CC=2;
 //				 }
}
#undef B1
#undef I2
#undef X2
