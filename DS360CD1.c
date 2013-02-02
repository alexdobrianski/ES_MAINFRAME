//#ifdef INCLUDE
//#else
#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <math.h>

#include "ds360psw.h"
#include "ds360dfn.h"
//#endif

void SR(unsigned long *RR1,unsigned long *RR1_PLUS_1,
				unsigned long *RR2,unsigned long *RR2_PLUS_1)
 {

	static int FLA;
	(*RR1_PLUS_1)-=(*RR2_PLUS_1);
	FLA=_FLAGS;
	(*RR1)-=(*RR2);
	if (FLA&0x0001) (*RR1)-=1;


 }
void MR(unsigned long *RR1,unsigned long *RR1_PLUS_1,unsigned long *MN_MN)
 {
	static unsigned long rr1;
	static unsigned long rr1_plus_1;
	static unsigned long mn_mn;
	static unsigned long URREZ;
	static unsigned long URREZ2;
	static unsigned long URREZ3;
	static unsigned long URREZ4;
	static int SIGN1,SIGN2;
	SIGN1=0;SIGN2=0;
	if (((signed long)*MN_MN)<0)
		 {SIGN2=1;
			mn_mn=-(*MN_MN);
		 }
	else mn_mn=*MN_MN;
	if (((signed long)*RR1_PLUS_1)<0)
		 {SIGN1=1;
			rr1_plus_1=-(*RR1_PLUS_1);
		 }
	else
		 {rr1_plus_1=*RR1_PLUS_1;
		 }
				URREZ4  = ((rr1_plus_1) >>16)  * (mn_mn>>16);

				URREZ   = ((rr1_plus_1) >>16)  * (mn_mn&0xffff);
				URREZ2  = ((rr1_plus_1)&0xffff)* (mn_mn>>16);
				URREZ4 += URREZ >>16;
				URREZ4 += URREZ2>>16;
				URREZ3  = (0xffff&(rr1_plus_1))* (0xffff&(mn_mn));
				URREZ   = (0xffff&URREZ)+(0xffff&URREZ2)+(URREZ3>>16);
				rr1     = URREZ4+(URREZ>>16);
				rr1_plus_1=(URREZ<<16)+(URREZ3&0xffff);
	if ( ((SIGN1==0) && (SIGN2==1)) ||
			 ((SIGN1==1) && (SIGN2==0))
		 )
		 {*RR1=0;*RR1_PLUS_1=0;
			SR(RR1,RR1_PLUS_1,&rr1,&rr1_plus_1);
		 }
	else
		 {*RR1=rr1;*RR1_PLUS_1=rr1_plus_1;
		 }
 }
void DR(unsigned long *RR1,unsigned long *RR1_PLUS_1,unsigned long *DEL_DEL)
	{
	 static unsigned long rr1;
	 static unsigned long rr1_plus_1;
	 static unsigned long del_del;
	 static int SIGN1,SIGN2;
	 static long double F_R1_R2;
	 static long double F_DEL_DEL;
	 static unsigned long r0;
	 static unsigned long r0_plus_1;
	 static unsigned long r2;
	 static unsigned long r2_plus_1;
	 static unsigned long r3;
	 static unsigned long r3_plus_1;
	 SIGN1=0;SIGN2=0;
	 if (((signed long)*DEL_DEL)<0)
		 {SIGN2=1;
			del_del=-(*DEL_DEL);
		 }
	 else del_del=*DEL_DEL;
	 if (del_del==0l)
		{RETURN=1;RQ_PRG=0x0009;return;
		}
	 if ((*RR1)&0x80000000)
		 {SIGN1=1;
			rr1=0;rr1_plus_1=0;
			SR(&rr1,&rr1_plus_1,RR1,RR1_PLUS_1);
		 }
	 else
		 {rr1=*RR1;rr1_plus_1=*RR1_PLUS_1;
		 }
	 if (rr1==0)
		{
		 rr1=rr1_plus_1%del_del;
		 rr1_plus_1/=del_del;
		}
	 else

		{
		 F_R1_R2=((long double)rr1)/(long double)del_del*4096.0*4096.0*256.0+
						 ((long double)rr1_plus_1)/(long double)del_del;
		 if (F_R1_R2>((long double)0x7fffffffl))
			 {
				RETURN=1;RQ_PRG=0x0009;return;
			 }
		 r0_plus_1=F_R1_R2;r0=0;
		 if (r0_plus_1>0) r0_plus_1--;
		 r2=r0;r2_plus_1=r0_plus_1;
		 MR(&r2,&r2_plus_1,&del_del);
		 SR(&r2,&r2_plus_1,&rr1,&rr1_plus_1);
		 if (r2&0x80000000)
			 {
				r3=0;r3_plus_1=0;
				SR(&r3,&r3_plus_1,&r2,&r2_plus_1);
			 }
		 else
			 {r3=r2;r3_plus_1=r2_plus_1;
			 }
		 rr1_plus_1=r0_plus_1+r3_plus_1/del_del;
		 rr1=r3_plus_1%del_del;
		}

	 if ( ((SIGN1==0) && (SIGN2==0)))
		 {*RR1=rr1;*RR1_PLUS_1=rr1_plus_1;
		 }
	 else if ( ((SIGN1==0) && (SIGN2==1)))
					{*RR1=rr1;*RR1_PLUS_1=-rr1_plus_1;
					}
				else if ( ((SIGN1==1) && (SIGN2==0)))
							 {*RR1=-rr1;*RR1_PLUS_1=rr1_plus_1;
							 }
						 else
							 {*RR1=-rr1;*RR1_PLUS_1=rr1_plus_1;
							 }

	}


void SET_CC_BY_SIGN(long OP)
{if(OP==0) PSW_CC=0;
 else if (OP<0) PSW_CC=1;
       else PSW_CC=2;
}
void SET_CC(void)
{

 asm sahf;
 asm jno NOPR;
 PSW_CC=3;goto EXIT;
NOPR:
 asm jnz NOZERRO;
 PSW_CC=0;goto EXIT;
NOZERRO:
 asm jl MINUS;
 PSW_CC=2;goto EXIT;
MINUS:
 PSW_CC=1;
EXIT:;

}
void CODE10(char far *COM)
{static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static signed long *RR1;
 static signed long *RR2;
 static unsigned long *URR1;
 static unsigned long *URR2;
 static unsigned int FLA;

 static long *REZ;
 static long RREZ;
 static unsigned long URREZ2;
 static unsigned long URREZ3;
 static unsigned long URREZ;
 static unsigned long URREZ_ALR;
 static unsigned long ADRESS;
 static long double F_W1;
 static long double F_W2;
 static long double F_W3;
 static long double F_W4;
 static int psw_cc;
 static char Op1[4];
 static char Op2[4];
 static int k;

#define B1 B2
#define I2 RX
#define X2 R2

 GET_OPERAND_RR;
 FORWARD_PSW;
 switch(COM[0])
	 {
		case 0x10:          		     /* LPR */
																			 /* Абсолютное значение второго
																			 операндапомещается по адресу первого
																			 признак результата 0  2  3
																			 0=равно 0 2=больше 0 3=?????
																			 */
				if (R[R2]==0x80000000l)
					{/*R[R1]=R[R2];*/PSW_CC=3;
					 T();
					 if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG!!!");}
					}
				else
					{
					 if (R[R2]&0x80000000l) R[R1]=-((signed long)R[R2]);
					 else R[R1]=R[R2];
					 if (R[R1]) PSW_CC=2;
					 else PSW_CC=0;
					}
				//T();
				break;
		case 0x11:                             /* LNR */
																			 /* Дополнение абсолютной величины
																			 второго операнда помещается по адресу
																			 первого операнда
																			 Признае результата устанавливается
																			 равным 0 или 1 в зависимости
																			 от того является ли результат
																			 0 или отрицательным числом
																			 */

				if (R[R2]&0x80000000) R[R1]=R[R2];
				else R[R1]=-((signed long)R[R2]);
				if (R[R1]) PSW_CC=1;
				else PSW_CC=0;
				//T();
				break;
		case 0x12:
																			 /* LTR */
																			 /*эта команда подобна команде загрузки
																			 однако в отличие от нее признак
																			 результата устанавливается 0 1 2
																			 если загружаемое число 0
																			 меньше 0 или больше 0
																			 */
				R[R1]=R[R2];
				SET_CC_BY_SIGN(R[R1]);

				//T();
				break;
		case 0x13:                         /* LCR */
																			 /*Дополнение второго операнда
																			 помещается на место первого
																			 операнда Признак результата
																			 устанавливается в зависимости от того
																			 является дополнение нулем
																			 отрицательным и положительным
																			 числом В том случаекогда в R2
																			 находилось максимальное по абсолютной
																			 величчине отричательное число
																			 признак результата устанавливается
																			 равным 3
																			 */
				if (R[R2]==0x80000000l)
					{PSW_CC=3;//R[R1]=R[R2];
					 T();
					 if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG!!!");}
					}
				else
					{
					 R[R1]=-((signed long)R[R2]);
					 SET_CC_BY_SIGN(R[R1]);
					}
				//T();
				break;
		case 0x14:
																			 /* NR  */
																			 /*Производтся поразрядное логическое
																			 умножение операндов
																			 Результат помещается на место
																			 первого операнда Признак результата
																			 устанавливается 0 если получится 0
																			 в противном случае признак результата
																			 устанавливается 1
																			 */

				if ((R[R1]&=R[R2])) PSW_CC=1;
				else PSW_CC=0;
				//T();
				break;
		case 0x15:                         /*  CLR */
																			 /* два операнда принимаемые как
																			 двоичные величины без знака
																			 поразрядно сравниваются операция
																			 сравнения прекращается как только
																			 встречаются несовпадающие разряды
																			 признак результата станавливается
																			 равным 0 если операнды равны,
																			 равным 1 если первый операнд
																			 меньше второго
																			 равным 2 если первый операнд
																			 больше второго
																			 */

        *((unsigned long *)&Op1[0])=R[R1];
        *((unsigned long *)&Op2[0])=R[R2];
        for(k=3;k>=0;k--)
        {
          if (Op1[k]!=Op2[k])
          {
            if (Op1[k]<Op2[k]) {PSW_CC=1; return;}
            else {PSW_CC=2; return;}
          }
        }
        PSW_CC=0;

//				if (R[R1]==R[R2]) PSW_CC=0;
//				else if (R[R1] < R[R2]) PSW_CC=1;
//						 else PSW_CC=2;
				//T();
				break;
		case 0x16:                         /* OR */
				if (R[R1]|=R[R2]) PSW_CC=1;
				else PSW_CC=0;
				//T();
				break;
		case 0x17:                         /* XR */
				if (R[R1]^=R[R2]) PSW_CC=1;
				else PSW_CC=0;
				//T();
				break;
		case 0x18:                         /* LR */
//				R[R1]=R[R2];
				T();
				break;


		case 0x19:
																			 /* CR */
																			 /*второй операнд вычитается из первого
																			 как в командах вычитание однако
																			 результат устанавливается так же
																			 как и в операции вычитание
																			 */
				if ((signed long)R[R1]==(signed long)R[R2]) PSW_CC=0;
				///else
				/// {
				///	FLA=_FLAGS;
				///	if (FLA&0x0080) /*<0*/   PSW_CC=1;
				///	else            /*>0*/   PSW_CC=2;
				/// }
				else if ((signed long)R[R1] < (signed long)R[R2]) PSW_CC=1;
						 else PSW_CC=2;
				//T();
				break;
		case 0x1a:                         /* AR */
//				RR1=&R[R1];
//				(*RR1)+=((signed long)R[R2]);
//#include "ds360sr.c"
//				//T();
				((signed long)R[R1])+=((signed long)R[R2]);

				FLA=_FLAGS;
				if (FLA&0x0040)  /*==0*/   PSW_CC=0;
				else
				 {if (FLA&0x0080) /*<0*/   PSW_CC=1;
					else            /*>0*/   PSW_CC=2;
				 }
				if (FLA&0x0800)   /* PEREPOLNENIE*/
					 {PSW_CC=3;
						//T();
						if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG!!!");}
					 }

				break;
		case 0x1b:
//				RR1=&R[R1];										 /* SR */
//				(*RR1)+= (-((signed long)R[R2]));
//#include "ds360sr.c"
//				//T();
				((signed long)R[R1])+= (-((signed long)R[R2]));

				FLA=_FLAGS;
				if (FLA&0x0040)  /*==0*/   PSW_CC=0;
				else
				 {if (FLA&0x0080) /*<0*/   PSW_CC=1;
					else            /*>0*/   PSW_CC=2;
				 }
				if (FLA&0x0800)   /* PEREPOLNENIE*/
					 {PSW_CC=3;
						//T();
						if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG!!!");}
					 }

				break;
		case 0x1c:                         /* MR  */
																			 /*
																			 R1+1 * R2 -> R1,R1+1
																			 */

        if (R1&0x01) {RQ_PRG=0x0006;RETURN=1;printf("SPEC!!!");break;}
				MR(&R[R1],&R[R1+1],&R[R2]);
				//T();
				break;
		case 0x1d:                         /* DR  */
																			 /*
																			 (R1,R1+1)/R2->частное->R1+1
																										 остаток->R1
																			 */

        if (R1&0x01) {RQ_PRG=0x0006;RETURN=1;printf("SPEC!!!");break;}
				DR(&R[R1],&R[R1+1],&R[R2]);
				//T();
				break;
		case 0x1e:                         /*  ALR */
																			 /*
																			 тоже что и AR но признак результата
																			 0 -сумма равна 0 и перенос из
																			 знакового бита отсутствует
																			 1 -сумма не равна 0 и перенос
																			 из знакового бита отсутствует
																			 2 -сумма равна 0 и произошел
																			 перенос из знакового бита
																			 3 - сумма не равна 0 и произошел
																			 перенос из знакового бита
																			 */
				((signed long)R[R1])+=((signed long)R[R2]);
				FLA=_FLAGS;
				if (FLA&0x0040)  /*==0*/
				 {if (FLA&0x0001) PSW_CC=2;  /*перенос*/
					else            PSW_CC=0;
				 }
				else
				 {if (FLA&0x0001) PSW_CC=3;
					else            PSW_CC=1;
				 }

			  //T();
				break;
		case 0x1f:                         /*  SLR */
																			 /*
																			 тоже что и SR но признак результата
																			 0 -сумма равна 0 и перенос из
																			 знакового бита отсутствует
																			 1 -сумма не равна 0 и перенос
																			 из знакового бита отсутствует
																			 2 -сумма равна 0 и произошел
																			 перенос из знакового бита
																			 3 - сумма не равна 0 и произошел
																			 перенос из знакового бита
																			 */
				((signed long)R[R1])+=(-((signed long)R[R2]));
				FLA=_FLAGS;
				if (FLA&0x0040)  /*==0*/
				 {if (FLA&0x0001) PSW_CC=2;  /*перенос*/
					else            PSW_CC=0;
				 }
				else
				 {if (FLA&0x0001) PSW_CC=3;
					else            PSW_CC=1;
				 }

				//T();
				break;
	 }
}
#undef B1
#undef I2
#undef X2


void CODE18(char far *COM)
{static char RR;
 static char RX;
 static int R1,R2,B2,IS;


#define B1 B2
#define I2 RX
#define X2 R2

 GET_OPERAND_RR;
 FORWARD_PSW;
 R[R1]=R[R2];         /* LR */
}
#undef B1
#undef I2
#undef X2


