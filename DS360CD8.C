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
void CODE80(char far *COM)
{static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static long RREZ;
 static unsigned long ADRESS;
 static unsigned long URREZ;
 static signed long SRREZ;
 static int SIGN_SIGN;
 static int i;
#define B1 B2
#define I2 RX
#define X2 R2

static int r2,r3,is;
static unsigned int FLA;
static char c0;

 GET_OPERAND_SI;
 FORWARD_PSW;
 switch(COM[0])
	 {
	case 0x80:      /* SSM
									установить маску системы
									*/
						if (PSW_AMWP&0x8) /*EC */
							{
							 if (R370[0]&0x40000000)
								 {RETURN=1;
									RQ_PRG=0x0002;
									break;
								 }
							}
						else
						if (PSW_AMWP&0x1)
							{RETURN=1;
							 RQ_PRG=0x0002;
							 break;
							}
#ifdef DTA_370
						c0=GET_BYTE(ADRESS);
						Dtaret;
						PSW_MASK=c0;
#else
						PSW_MASK=GET_BYTE(ADRESS);
#endif
						//T();
						break;
	case 0x81:      /* SPSW
									установить PSW
									*/
						T00(COM[0]);
						break;
	case 0x82:      /* LPSW
									загрузить PSW
									*/
						if (PSW_AMWP&0x1)
							{RETURN=1;
							 RQ_PRG=0x0002;
							 break;
							}
						LOAD_PSW(ADRESS);
						//T();
						break;
	case 0x83:      /*  ДИАГНОСТИКА
									*/
						Chk_priv;
						T();
						break;
	case 0x84:      /* WRD
									прямая запись
									*/
						T();
						break;
	case 0x85:      /* RDD
									прямое чтение
									*/
						T();
						break;
	case 0x86:      /* BXH
									переход по индексу больше
									*/
						r2=R2;r3=r2;if ((r3&0x01)==0) r3++;
						SRREZ=(signed long)R[R1]+(signed long)R[r2];
						if ( (SRREZ) > ((signed long)R[r3]) )
							 PSW_ADRESS=0xffffff&ADRESS;
						R[R1]=SRREZ;
						//T();
						break;
	case 0x87:      /* BXLE
									переход по индексу меньше или равно
									*/
						r2=R2;r3=r2;if ((r3&0x01)==0) r3++;
						SRREZ=(signed long)R[R1]+(signed long)R[r2];
						if ( (SRREZ) <= ((signed long)R[r3]) )
							 PSW_ADRESS=0xffffff&ADRESS;
						R[R1]=SRREZ;
						//T();
						break;
	case 0x88:      /* SRL
									сдвиг вправо кода
									*/
						ADRESS&=0x3f;
						if (ADRESS<32) R[R1]>>=ADRESS;
						else R[R1]=0;
						/* NO PSW_CC*/
						//T();
						break;
	case 0x89:      /* SLL
									сдвиг влево кода
									*/
						ADRESS&=0x3f;
						if (ADRESS<32) R[R1]<<=ADRESS;
						else R[R1]=0;
						/* NO PSW_CC*/
						//T();
						break;
	case 0x8a:      /* SRA
									сдвиг вправо арифметический
									*/
						ADRESS&=0x3f;
						if (ADRESS<32) URREZ=((0x7fffffff&R[R1])>>ADRESS);
						else URREZ=0;
						if (R[R1]&0x80000000)
							{
							 if (ADRESS<32) R[R1]=URREZ|(0xffffffff<<(31-ADRESS));
							 else R[R1]=-1;
							}
						else R[R1]=URREZ;
						SET_CC_BY_SIGN(R[R1]);
						//T();
						break;
	case 0x8b:      /* SLA
									сдвиг влево арифметический
									*/
						ADRESS&=0x3f;
						URREZ=0x7fffffff&R[R1];
						if (R[R1]&0x80000000) SIGN_SIGN=1;
						else SIGN_SIGN=0;
						PSW_CC=0;
						for (i=0;i<ADRESS;i++)
						 {
							URREZ<<=1;
							if (SIGN_SIGN)
								{
								 if ((URREZ&0x80000000)==0) PSW_CC=3;
								}
							else
								{
								 if (URREZ&0x80000000) PSW_CC=3;
								}
						 }
						if (SIGN_SIGN) R[R1]=0x80000000l&(URREZ&0x7fffffffl);
						else R[R1]=URREZ&0x7fffffffl;
						if (PSW_CC!=3) SET_CC_BY_SIGN(R[R1]);
						else
							{
							 //T();
							 if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG SLA!!!");}
							}
						//T();
						break;
	case 0x8c:      /* SRDL
									сдвиг вправо двойной кода
									*/
						if (R1&0x01)
							{
							 RQ_PRG=6;
							 RETURN=1;
							 break;
							}
						ADRESS&=0x3f;
						if (ADRESS==0) break;
						if (ADRESS<32)
							{
							 R[R1+1]>>=(int)ADRESS;
							 R[R1+1]|=(R[R1]<<(32-(int)ADRESS));
							 R[R1]>>=(int)ADRESS;
							}
						else
							{
							 R[R1+1]=R[R1]>>(int)(ADRESS-32);
							 R[R1]=0;
							}
						/* NO PSW_CC*/
						//T();
						break;
	case 0x8d:      /* SLDL
									сдвиг влево двойной кода
									*/

						if (R1&0x1)
							{
							 RQ_PRG=6;
							 RETURN=1;
							 break;
							}
						ADRESS&=0x3f;
						if (ADRESS==0) break;
						if (ADRESS<32)
							{
							 R[R1]<<=(int)ADRESS;
							 R[R1]|=(R[R1+1]>>(32-(int)ADRESS));
							 R[R1+1]<<=(int)ADRESS;
							}
						else
							{
							 R[R1]=R[R1+1]<<(int)(ADRESS-32);
							 R[R1+1]=0;
							}
						/*   NO PSW_CC*/
						//T();
						break;
	case 0x8e:      /* SRDA
									*/
						if (R1&0x1)
							{
							 RQ_PRG=6;
							 RETURN=1;
							 break;
							}
						ADRESS&=0x3f;
						if (ADRESS==0) goto NOSD1;
						URREZ=R[R1];
						if (ADRESS<32)
							{URREZ=R[R1];
							 R[R1+1]>>=ADRESS;
							 R[R1+1]|=(0x7fffffffl&R[R1]<<(32-ADRESS));
							 R[R1]=((unsigned long)(0x7fffffff&R[R1]))>>ADRESS;
							 if (URREZ&0x80000000l)
								 {R[R1]|=(0xffffffffl << (31-(int)ADRESS));
								 }
							}
						else
							{
							 if (ADRESS==32)
								 {
									R[R1+1]=R[R1];
									if (URREZ&0x80000000) R[R1]=0xffffffff;
									else R[R1]=0;
								 }
							 else if (URREZ&0x80000000)
											{R[R1+1]=(0x7fffffff&R[R1])>>(ADRESS-32);
											 R[R1]=0xffffffff;
											 R[R1+1]|=(0xffffffff<<(63-(int)ADRESS));
											}
										else
											{R[R1+1]=R[R1]>>(ADRESS-32);
											 R[R1]=0;
											}
							}
NOSD1:      if (R[R1]==0 && R[R1+1]==0) PSW_CC=0;
						else if (R[R1]&0x80000000) PSW_CC=1;
								 else PSW_CC=2;
						//T();
						break;
	case 0x8f:      /* SLDA
									*/
						if (R1&0x1)
							{
							 RQ_PRG=6;
							 RETURN=1;
							 break;
							}
						ADRESS&=0x3f;
						URREZ=0x7fffffff&R[R1];
						if (R[R1]&0x80000000) SIGN_SIGN=1;
							else SIGN_SIGN=0;
						PSW_CC=0;
						for (i=0;i<ADRESS;i++)
						 {URREZ<<=1;URREZ|=(R[R1+1]>>31);
							R[R1+1]<<=1;
							if (SIGN_SIGN)
								{
								 if ((URREZ&0x80000000)==0) PSW_CC=3;
								}
							else
								{
								 if (URREZ&0x80000000) PSW_CC=3;
								}
						 }
						if (SIGN_SIGN) R[R1]=0x80000000l&(URREZ&0x7fffffffl);
						else R[R1]=URREZ&0x7fffffffl;
						if (PSW_CC!=3)
							{SET_CC_BY_SIGN(R[R1]);
							 if (PSW_CC==0)
								{ if (R[R1+1]) PSW_CC=2;
								}
							}
						else
							{
							 //T();
							 if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG SLDA!!!");}
							}
						//T();
						break;
	 }
}
#undef B1
#undef I2
#undef X2
