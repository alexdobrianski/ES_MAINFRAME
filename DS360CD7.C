#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <math.h>

#include "ds360psw.h"
#include "ds360dfn.h"

void CODE70(char far *COM)
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
 static unsigned long ar;
 static int i;
 static BYTE arr360[8];
 static long double f_work;

#define B1 B2
#define I2 RX
#define X2 R2

 GET_OPERAND_RX;
 FORWARD_PSW;
 switch(COM[0])
	 {
		case 0x70:          		           /* STD */
																			 /* Плавающая точка
																			 запись в память
																			 удвоенная точность
																			 */
				floatPC_to_float360((BYTE far *)arr360, &R_FLOAT[R1], TRUE);
				MOVE_MEM_TO_360(arr360,ADRESS,4l);
				///T();
				break;

		case 0x71:
				T00(COM[0]);
				break;

		case 0x72:
				T00(COM[0]);
				break;

		case 0x73:
				T00(COM[0]);
				break;

		case 0x74:
				T00(COM[0]);
				break;

		case 0x75:
				T00(COM[0]);
				break;

		case 0x76:
				T00(COM[0]);
				break;

		case 0x77:
				T00(COM[0]);
				break;

		case 0x78:                         /* LD */
																			 /*Загрузка удвоенная точность
																			 */
				arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
				MOVE_360_TO_MEM(ADRESS,arr360,4l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &R_FLOAT[R1], TRUE);

				break;

		case 0x79:                         /* CD */
																			 /*
																			 сравнение удвоенная точность
																			 */

				///T();
				arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
				MOVE_360_TO_MEM(ADRESS,arr360,4l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				if(R_FLOAT[R1] == f_work) PSW_CC=0;
				else if(R_FLOAT[R1] < f_work) PSW_CC=1;
				else PSW_CC=2;
				///T();
				break;

		case 0x7a:                         /* AD */
																			 /* сложение с нормализацией
																			 удвоенная точнасть
																			 */
				///T();
				arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
				MOVE_360_TO_MEM(ADRESS,arr360,4l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				R_FLOAT[R1]+=f_work;
				if(R_FLOAT[R1] == 0.0) PSW_CC=0;
				else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
				else PSW_CC=2;

				///T();
				break;

		case 0x7b:                         /* SD */
																			 /*
																			 вычитание с нормализацией
																			 удвоенная точность
																			 */
				///T();
				arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
				MOVE_360_TO_MEM(ADRESS,arr360,4l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				R_FLOAT[R1]-=f_work;
				if(R_FLOAT[R1] == 0.0) PSW_CC=0;
				else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
				else PSW_CC=2;
				///T();
				break;

		case 0x7c:                         /* MD  */
																			 /*
																			 умножение удвоенная точность
																			 */
				///T();
				arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
				MOVE_360_TO_MEM(ADRESS,arr360,4l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				R_FLOAT[R1]*=f_work;
				///T();
				break;
		case 0x7d:                         /* DD  */
																			 /*
																			 деление удвоенная точность
																			 */
				///T();
				arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
				MOVE_360_TO_MEM(ADRESS,arr360,4l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				if (f_work==0.0)
					{RQ_PRG=0x000f;RETURN=1;return;
					}
				else R_FLOAT[R1]/=f_work;
				///T();
				break;
		case 0x7e:                         /*  AW */
																			 /*
																			 сложение без нормализации
																			 удвоенная точность
																			 */
				///T();
				arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
				MOVE_360_TO_MEM(ADRESS,arr360,4l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				R_FLOAT[R1]+=f_work;
				if(R_FLOAT[R1] == 0.0) PSW_CC=0;
				else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
				else PSW_CC=2;
				///T();
				break;
		case 0x7f:                         /*  SW */
																			 /*
																			 вычитание без нормализации
																			 удвоенная точность
																			 */
					 ///	T();
				arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
				MOVE_360_TO_MEM(ADRESS,arr360,4l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				R_FLOAT[R1]-=f_work;
				if(R_FLOAT[R1] == 0.0) PSW_CC=0;
				else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
				else PSW_CC=2;

				///T();
				break;
	 }
}



