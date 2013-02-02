#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <stat.h>
#include <fcntl.h>

#include "ds360psw.h"

#include "ds360dfn.h"

void CODE80(char COM)
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
#define B1 B2
#define I2 RX
#define X2 R2
static int r2,r3,is;

 GET_OPERAND_SI;
 PSW_ADRESS+=PSW_ILC;
 /*FORW_PSW();*/
 switch(COM)
	 {
	case 0x80:      /* SSM
									установить маску системы
									*/
						PSW_MASK=GET_BYTE(ADRESS);
						break;
	case 0x81:      /* SPSW
									установить PSW
									*/
						T();
						break;
	case 0x82:      /* LPSW
									загрузить PSW
									*/
						LOAD_PSW(ADRESS);
						break;
	case 0x83:      /*  ДИАГНОСТИКА
									*/
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
						r2=R2;r2&=0xfe;r3=r2+1;
						R[R1]+=R[r2];
						if (R[R1]>R[r3]) PSW_ADRESS=0xffffff&ADRESS;
						break;
	case 0x87:      /* BXLE
									переход по индексу меньше или равно
									*/
						r2=R2;r2&=0xfe;r3=r2+1;
						R[R1]+=R[r2];
						if (R[R1]<=R[r3]) PSW_ADRESS=0xffffff&ADRESS;
						break;
	case 0x88:      /* SRL
									сдвиг вправо кода
									*/
						ADRESS&=0x3f;
						R[R1]>>=(int)ADRESS;
						/* NO PSW_CC*/
						break;
	case 0x89:      /* SLL
									сдвиг влево кода
									*/
						ADRESS&=0x3f;
						R[R1]<<=(int)ADRESS;
						/* NO PSW_CC*/
						break;
	case 0x8a:      /* SRA
									сдвиг вправо арифметический
									*/
						ADRESS&=0x3f;
						RREZ=(R[R1]>>(int)ADRESS);
						if (
						break;
	case 0x8b:      /* SLA
									сдвиг влево арифметический
									*/
						R[R1]=(R[R1]&0x80000000)|((R[R1]&0x7fffffff)<<(int)ADRESS);

						break;
	case 0x8c:      /* SRDL
									сдвиг вправо двойной кода
									*/
						R1&=0xfe;
						R[R1+1]>>=(int)ADRESS;
						R[R1+1]|=(R[R1]<<(32-(int)ADRESS));
						R[R1]>>=(int)ADRESS;
						T();
						break;
	case 0x8d:      /* SLDL
									сдвиг влево двойной кода
									*/

						R1&=0xfe;
						R[R1]<<=(int)ADRESS;
						R[R1]|=(R[R1+1]>>(32-(int)ADRESS));
						R[R1+1]<<=(int)ADRESS;
						T();
						break;
	case 0x8e:      /* SRDA
									*/
						R1&=0xfe;
						ADRESS&=0x3f;
						R[R1+1]>>=(int)ADRESS;
						R[R1+1]|=(R[R1]<<(32-(int)ADRESS));
						R[R1]=((signed long)R[R1])>>(int)ADRESS;

						T();
						break;
	case 0x8f:      /* SLDA
									*/
						R1&=0xfe;
						ADRESS&=0x3f;
						R[R1]=(R[R1]&0x80000000)| (R[R1]<< ((int)ADRESS) );
						R[R1]|=(R[R1+1]>>(32-(int)ADRESS));
						R[R1+1]<<=(int)ADRESS;
						T();
						break;
	 }
}