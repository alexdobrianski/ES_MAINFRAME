#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <math.h>

#include "ds360psw.h"
#include "ds360dfn.h"
void CODE60(char far *COM)
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
		case 0x60:          		           /* STD */
																			 /* Плавающая точка
																			 запись в память
																			 удвоенная точность
																			 */

				floatPC_to_float360((BYTE far *)arr360, &R_FLOAT[R1], TRUE);
				MOVE_MEM_TO_360(arr360,ADRESS,8l);
				//T();
				break;

		case 0x61:

				T00(COM[0]);
				break;

		case 0x62:
				T00(COM[0]);
				break;

		case 0x63:
				T00(COM[0]);
				break;

		case 0x64:
				T00(COM[0]);
				break;

		case 0x65:
				T00(COM[0]);
				break;

		case 0x66:
				T00(COM[0]);
				break;

		case 0x67:
				T00(COM[0]);
				break;

		case 0x68:                         /* LD */
																			 /*Загрузка удвоенная точность
																			 */

				MOVE_360_TO_MEM(ADRESS,arr360,8l);
				Dtaret;
				//if (R1==6) for(i=0; i<8; i++) printf(" %x",arr360[i]);
				float360_to_floatPC((BYTE far *)arr360, &R_FLOAT[R1], TRUE);
				//if (R1==6) printf("Load float =%Lg \n",R_FLOAT[R1]);


				//T();
				break;

		case 0x69:                         /* CD */
																			 /*
																			 сравнение удвоенная точность
																			 */

				///T();
				MOVE_360_TO_MEM(ADRESS,arr360,8l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				if(R_FLOAT[R1] == f_work) PSW_CC=0;
				else if(R_FLOAT[R1] < f_work) PSW_CC=1;
				else PSW_CC=2;
				///T();
				break;

		case 0x6a:                         /* AD */
																			 /* сложение с нормализацией
																			 удвоенная точнасть
																			 */
				MOVE_360_TO_MEM(ADRESS,arr360,8l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				R_FLOAT[R1]+=f_work;
				if(R_FLOAT[R1] == 0.0) PSW_CC=0;
				else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
				else PSW_CC=2;

				//T();
				break;

		case 0x6b:                         /* SD */
																			 /*
																			 вычитание с нормализацией
																			 удвоенная точность
																			 */
				///T();
				MOVE_360_TO_MEM(ADRESS,arr360,8l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				R_FLOAT[R1]-=f_work;
				if(R_FLOAT[R1] == 0.0) PSW_CC=0;
				else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
				else PSW_CC=2;
				///T();
				break;

		case 0x6c:                         /* MD  */
																			 /*
																			 умножение удвоенная точность
																			 */
				MOVE_360_TO_MEM(ADRESS,arr360,8l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				R_FLOAT[R1]*=f_work;
				break;
		case 0x6d:                         /* DD  */
																			 /*
																			 деление удвоенная точность
																			 */
				MOVE_360_TO_MEM(ADRESS,arr360,8l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				if (f_work==0.0)
					{RQ_PRG=0x000f;RETURN=1;return;
					}
				else R_FLOAT[R1]/=f_work;
				break;
		case 0x6e:                         /*  AW */
																			 /*
																			 сложение без нормализации
																			 удвоенная точность
																			 */
				///T();
				MOVE_360_TO_MEM(ADRESS,arr360,8l);
				Dtaret;
				float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
				R_FLOAT[R1]+=f_work;
				if(R_FLOAT[R1] == 0.0) PSW_CC=0;
				else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
				else PSW_CC=2;
				///T();
				break;
		case 0x6f:                         /*  SW */
																			 /*
																			 вычитание без нормализации
																			 удвоенная точность
																			 */
				///T();
				MOVE_360_TO_MEM(ADRESS,arr360,8l);
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

//////////////////////////////////////////////
// if prec == TRUE  double precision    else ordinary precision
//////////////////////////////////////////////
void float360_to_floatPC( BYTE far *float360, long double far *fPC, BYTE prec)
{
 int   sign;
 int cnt;
 int har;
 int   i,j,k, l;
 BYTE far *floatPC =(BYTE far *)fPC;
 BYTE flag =0x80;
 int far *harPC =(int far *)(floatPC+8);


 sign   =float360[0]&0x80; //keep sign
 if(sign!=0) sign=1;

 har =float360[0]&0x7F;
 har -= 0x40;
 har *=4;

 if (prec) cnt=7;
 else      cnt=3;

 for(i=0; i<10; i++) floatPC[i]=0;

 for(i=0; i<cnt; i++)
	 floatPC[7-i]  = float360[1+i];


 //check for all bytes zero and normalize floatPC
  for(i=0; i<8; i++)
	 if(floatPC[7-i] != 0) break;
  if (i>7) return;    //all bytes is ZERO !!!


  if(i>0)
  {for(k=0; k<7-i; k++)
	 {floatPC[7-k] =floatPC[7-i-k];
	  floatPC[7-i-k]=0;
	 }
	 har -=8*i;
  }
 //define count of digits for shift
 for(k=0; k<8; k++)
 {
  if(floatPC[7]&flag) break;
  flag >>=1;
 }

 *harPC =0x8000*sign+0x3fff + har -k -1;

  //shift prec bytes to k digits
  //find number of higher zero bytes
  for(l=0; l<8; l++)
	 if(floatPC[l]!=0) break;

  //8-l bytes to k digits
  for(i=0; i<k; i++)
  {
	for(j=7; j>=l; j--)
	{floatPC[j] <<= 1;
	 if(j>0 && floatPC[j-1]&0x80)
			  floatPC[j] |=1;
	}
  }

}




//////////////////////////////////////////////
// if prec == TRUE  double precision    else ordinary precision
//////////////////////////////////////////////
void floatPC_to_float360( BYTE far *float360, long double far *fPC, BYTE prec)
{
 int   sign;
 int  cnt;
 int  har;
 int   i,j,k, l;
 int digit, low;
 BYTE floatPC[10];
 int far *harPC =(int far *)(floatPC+8);


 for(i=0; i<10; i++)
	floatPC[i] =((BYTE far *)fPC)[i];

 sign   =*harPC & 0x8000; //keep sign
 if(sign!=0) sign=1;
 har    =*harPC&0x7fff;
 har     += -0x3fff +1;
 //find nearest number which can divide to 4 whithout remainder
 if(har/4 *4 ==har) k=0;
 else
  {if(har>0)
	  l =(har/4 +1)*4;
	else
	  l =(har/4 )*4;
	 k =l-har;
	 har =l;
  }
  har /=4;
  har +=0x40;

  if(sign) har |=0x80;

 if (prec) cnt=7;
 else      cnt=3;

 //shift all bytes of mantissa to k digits left
  for(l=0; l<8; l++)
	 if(floatPC[l]!=0) break;

 if (l>=8)  //case of ZERO !!!
 { for(i=0; i<cnt+1; i++)
	  float360[i]=0;
  return;
 }
  //8-l bytes to k digits
  for(i=0; i<k; i++)
  {digit =0;
	for(j=7; j>=l; j--)
	{low =  floatPC[j]&0x1;
	 floatPC[j] >>= 1;
	 if(digit) floatPC[j] |=0x80;
	 digit=low;
	}
  }


 float360[0] =(char)har;
 for(i=0; i<cnt; i++)
	float360[i+1] =floatPC[7-i];

}



#undef B1
#undef I2
#undef X2
