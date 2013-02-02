#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <math.h>

#include "ds360psw.h"
#include "ds360dfn.h"

void CODE20(char far *COM)
{static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static signed long *RR1;
 static signed long *RR2;
 static long *REZ;
 static long RREZ;
 static unsigned long URREZ;
 static unsigned long *URR1;
 static unsigned long *URR2;
 static unsigned long ADRESS;
 static int i,j;
#define B1 B2
#define I2 RX
#define X2 R2

 GET_OPERAND_RR;
 FORWARD_PSW;
 switch(COM[0])
	 {
		case 0x20:          		           /* LPDR */
																			 /* Плавающая точка
																			 загрузка положительная
																			 удвоенная точность
																			 */
				///T();
				PSW_CC=2;
				R_FLOAT[R1]=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else  ((char *)R_FLOAT[R1])[9]|=0x80;
				///T();
				break;

		case 0x21:                         /* LNDR */
																			 /*
																			 Загрузка отрицательная
																			 удвоенная точнасть
																			 */

				///T();
				PSW_CC=1;
				R_FLOAT[R1]=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else ((char *)R_FLOAT[R1])[9]|=0x80;
				///T();
				break;

		case 0x22:                         /* LTDR */
																			 /*
																			 Загрузка и проверка удвоенной
																			 точности
																			 */
				R_FLOAT[R1]=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;
				//T();
				break;

		case 0x23:                         /* LCDR */
																			 /*
																			 Загрузка дополненная удвоенной
																			 точности
																			 */

				///T();
				R_FLOAT[R1]=-R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;

				///T();
				break;

		case 0x24:                         /* HDR  */
																			 /*
																			 ПОПОЛАМ второй операнд делится
																			 пополам и помещается
																			 на место второго
																			 */
				///T();
				R_FLOAT[R1]=R_FLOAT[R2]/2.0;
				///T();
				break;

		case 0x25:                         /*  Неопределенный код операции */
				T();
				break;

		case 0x26:                         /* НКО */
				T();
				break;

		case 0x27:                         /* НКО */
				T();
				break;

		case 0x28:                         /* LDR */
																			 /*Загрузка удвоенная точность
																			 */
				R_FLOAT[R1]=R_FLOAT[R2];
				//T();
				break;

		case 0x29:                         /* CDR */
																			 /*
																			 сравнение удвоенная точность
																			 */
				///T();
				if (R_FLOAT[R1]==R_FLOAT[R2]) PSW_CC=0;
				else if (R_FLOAT[R1]<R_FLOAT[R2]) PSW_CC=1;
						else PSW_CC=2;
				///T();
				break;

		case 0x2a:                         /* ADR */
																			 /* сложение с нормализацией
																			 удвоенная точнасть
																			 */
				R_FLOAT[R1]+=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;
				//T();
				break;

		case 0x2b:                         /* SDR */
																			 /*
																			 вычитание с нормализацией
																			 удвоенная точность
																			 */
				R_FLOAT[R1]-=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;
				//T();
				break;

		case 0x2c:                         /* MDR  */
																			 /*
																			 умножение удвоенная точность
																			 */
				///T();
				R_FLOAT[R1]*=R_FLOAT[R2];
				///T();
				break;
		case 0x2d:                         /* DDR  */
																			 /*
																			 деление удвоенная точность
																			 */
				///T();
				if (R_FLOAT[R2]==0.0)
					{RQ_PRG=0x000f;RETURN=1;return;
					}
				else R_FLOAT[R1]/=R_FLOAT[R2];
				///T();
				break;
		case 0x2e:                         /*  AWR */
																			 /*
																			 сложение без нормализации
																			 удвоенная точность
																			 */
				///T();
				R_FLOAT[R1]+=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;
				///T();
				break;
		case 0x2f:                         /*  SWR */
																			 /*
																			 вычитание без нормализации
																			 удвоенная точность
																			 */
				R_FLOAT[R1]-=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;
				//T();
				break;
	 }
}
#undef B1
#undef I2
#undef X2
