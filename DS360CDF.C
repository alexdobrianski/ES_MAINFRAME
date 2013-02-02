#include "ds360opt.h"
#include <stdio.h>
#include <stdlib.h>
#include <mem.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>

#include "ds360psw.h"
#include "ds360dfn.h"

#define D_ADD          1
#define D_SUBTRACT     2
#define D_COMPARE      3
#define D_ZAP          4

int DecimalAdd(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2, int Operation );
int DecimalMultiply(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2 );
int DecimalDivide(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2 );
int CmpD(signed char *Src, signed char *Dest, int num);
void mem_set_value(char *mem, int c, int size);
#ifndef FOR386
#define memset   mem_set_value
#endif
void CODEFFF(char far *COM);
extern void (*POINT[256])(char far*);
void CODEF0(char far *COM)
{

 static unsigned long t0t0t0;
	 static char t0t0[2];
 static unsigned long t000=0x11725988;
 static unsigned long t0000;
 static unsigned long t001;
 static unsigned long t002=0;
 static char tt000[16]={3,7,1,2,5,6,9,5,8,9,8,0,1,4,5,1};
 static int ttt,tttn;
 static char tttname[12]={'d'-0x10,'s'-0x11,'t'-0x12,'3'-0x13,
												'6'-0x14,'0'-0x15,'p'-0x16,'.'-0x17,'e'-0x18,'x'-0x19,
												'e'-0x1a,0};
 static time_t TIME_NOW;

 static char RR;
 static char RX;
 static int R1,R2,B1,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static long RREZ;

 static unsigned long *URR1;
 static unsigned long *URR2;
 static unsigned long ADRESS;
#define LL RX
#define L1 R1
#define L2 R2
 static int LEN;
 static unsigned int DDD1,DDD2;

 static unsigned long ADR, ADRESS1,ADRESS2;
 static int i,j,k;
 static char REZ11, REZ12, REZ21, REZ22;
 static char BYT1, BYT2;
 static unsigned long AL1[8];
 static unsigned long AL2[8];
 static char far* P_AL1;
 static char far* P_AL2;
 static int L_AL1;
 static int L_AL2;
 static int SIGN_AL1;
 static int SIGN_AL2;


 GET_OPERAND_SS;
 FORWARD_PSW;
 switch(COM[0])
	 {
		case 0xf0:
							T();
							break;
		case 0xf1:  /*   MVO пересылка со сдвигом
								Второй операнд сдвигается на 4 разряда влево и к нему
								пристраивается в качестве младших раздядов знаковая позиция
								первого операнда. Результат помещается в поле первого
								операнда. Поля обрабатываются справа налево. Если необходимо,
								второй операнд дополняется нулями. Если поле первого операнда
								не вмещает результат операции, левые (старшие) разряды второго
								операнда теряются. Поля первого и второго операндов могут
								перекрываться. С помощью этой команды легко произвести сдвиг
								десятичного числа на нечетное числоцифр вправо.




								*/
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,L1);
					DtaEnd(ADRESS2,L2);
#endif

							L1++;L2++;
							for(i=L2-1,j=L1-1,k=0; i>=0 && j>=0 ;i--)
								{BYT1=GET_BYTE(ADRESS2+i);
								 switch(k)
									 {
										case 0:BYT2=GET_BYTE(ADRESS1+j);
													 BYT2=((BYT1&0x0f)<<4) | (BYT2&0x0f);
													 PUT_BYTE(ADRESS1+j,BYT2);
													 BYT2=(BYT1>>4);
													 j--;k=1;
													 break;
										case 1:BYT2|=((BYT1&0x0f)<<4);
													 PUT_BYTE(ADRESS1+j,BYT2);
													 BYT2=(BYT1>>4);
													 j--;
													 break;
									 }
								}
							if (j>=0)
							 {
								PUT_BYTE(ADRESS1+j,BYT2);
								j--;
								if (j>=0)
								 {
									for(;j>=0;j--) PUT_BYTE(ADRESS1+j,0x00);
								 }
							 }
							//T();
							break;

		case 0xf2:
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,L1);
					DtaEnd(ADRESS2,L2);
#endif

							/*   PACK Упаковать
								Второй операнд преобразуется из зонного формата в упакованный
								формат и помещается на место первого операнда. Если поле поле
								первого операнда не вмещает весь результат операции, левые
								(старшие) значащие цифры теряются,правые(младшие) значащие
								цифры остаются.Если поле первого операнда имеет большую длину,
								чем это требуется для хранения результата,оно дополняется
								слева нулями.

								*/

							L1++;L2++;
							for(i=L2-1,j=L1-1,k=0; i>=0 && j>=0 ;i--)
								{BYT1=GET_BYTE(ADRESS2+i);
								 switch(k)
									 {
										case 0:BYT2=(BYT1>>4)| ((BYT1&0x0f)<<4);
													 PUT_BYTE(ADRESS1+j,BYT2);
													 j--;k=1;
													 break;
										case 1:BYT2=BYT1&0x0f;
													 k=2;
													 break;
										case 2:BYT2|=((BYT1&0x0f)<<4);
													 PUT_BYTE(ADRESS1+j,BYT2);
													 j--;k=1;
													 break;
									 }
								}
							if (j>=0)
							 {
								if (k==2)
									{
									 PUT_BYTE(ADRESS1+j,BYT2);
									 j--;
									}
								if (j>=0)
								 {
									for(;j>=0;j--) PUT_BYTE(ADRESS1+j,0x00);
								 }
							 }
							//T();
							break;

		case 0xf3:
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,L1);
					DtaEnd(ADRESS2,L2);
#endif

						 /*   UNPK Распаковать
								Эта команда преобразует второй операнд из упакованного
								формата в зонный формат; результат помещается на место
								первого операнда. Знак упакованного поля помещается в зоне
								младшей цифры; всем остальным зонам присваивается
								шестнадцатеричное значение F - cтандартное обозначение зоны
								цифровых символов в коде EBCDIC. Если поле первого операнда
								не вмещает результат операции, старшие значащие цифры теряются:
								если оно длиннее результата операции, свободные левые байты
								заполняются нулями. Если вычислительная машина переключена на
								работу в коде ASCII, то зонам будет присваиваться значение 5,
								а не F.
								*/
							L1++;L2++;
							for(i=L2-1,j=L1-1,k=0; i>=0 && j>=0 ;i--)
								{BYT1=GET_BYTE(ADRESS2+i);
								 BYT2=(BYT1&0xf0)>>4;
								 BYT1&=0x0f;
								 switch(k)
									 {
										case 0:BYT2=(BYT1<<4)| (BYT2);
													 PUT_BYTE(ADRESS1+j,BYT2);
													 j--;k=1;
													 break;
										case 1:PUT_BYTE(ADRESS1+j  ,0xf0|BYT1);
													 j--;k=2;
													 if (j<0) goto MEND;

										case 2:PUT_BYTE(ADRESS1+j,0xf0|BYT2);
													 j--;k=1;
													 if (j<0) goto MEND;
													 break;
									 }
								}
MEND:
							if (j>=0)
							 {
								for(;j>=0;j--) PUT_BYTE(ADRESS1+j,0xf0);
							 }
							//T();
							break;
		case 0xf4:
							T00(COM[0]);
							break;
		case 0xf5:
							T00(COM[0]);
							break;
		case 0xf6:
							T00(COM[0]);
							break;
		case 0xf7:
							T00(COM[0]);
							break;
		case 0xf8:  /*   ZAP  Сложение с очисткой
								Второй операнд помещается на место первого операнда. Признак
								результата устанавливается по правилам команды сложения. Если
								длина поля первого операнда превышает длину поля второго
								операнда, слева добавляются нули; если длина поля первого
								операнда короче длины поля второго операнда, старшие левые
								цифры теряются. Если теряются ненулевые цифры, признак
								результата устанавливается равным 3, что указывает на
								переполнение.Поля первого и второго операндамогут
								перекрываться, но так, чтобы их правые байты совпадали.
								Фактически эта команда засылает нули в поле первого операнда
								а затем добавляет туда второй операнд.
								*/
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,L1);
					DtaEnd(ADRESS2,L2);
#endif

							DecimalAdd(ADRESS1, L1, ADRESS2, L2, D_ZAP);
							//T();
							break;
		case 0xf9:    /* CP   Сравнение десятичное
								Эта команда аналогична команде вычитания. Отличие заключается в том,
								что результат не сохраняется.Оба операнда остаются без изменения.
								Признак результата устанавливается равным 0, если операнды равны;
								равным 1,если первый операнд меньше;равным 2,если первый операнд
								больше второго.Переполнения не возникает.Разницы между
								положительным и отрицательным 0 нет.
								*/

#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,L1);
					DtaEnd(ADRESS2,L2);
#endif

							 DecimalAdd(ADRESS1, L1, ADRESS2, L2, D_COMPARE);
							//T();
							break;

		case 0xfa:  /*   AP   Сложение десятичное
								Второй операнд складывается с первым и сумма помещается на место первого
								операнда.Поля операндов могут перекрываться но так, чтобы
								их правый и младший байты совпадали. Знак результата определяется
								по правилам алгебры, но 0 результат всегда имеет знак плюс.
								Признак результата устанавливается равным 0,1 или 2,если
								сумма равна 0, меньше 0,или больше 0 соответственно.Если сумма
								слишком длинна и не укладывается в отведенное для результата
								поле признак результата устанавливается равным 3,что указывает
								на переполнение.В этом случае теряются старшие значащие цифры.

								*/
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,L1);
					DtaEnd(ADRESS2,L2);
#endif

							DecimalAdd(ADRESS1, L1, ADRESS2, L2, D_ADD);
							//T();
							/******************************************
							if ((GET_BYTE(ADRESS1+L1) & 0x0f)==0x0c) SIGN_AL1=1;
							else SIGN_AL1=-1;
							if ((GET_BYTE(ADRESS2+L2) & 0x0f)==0x0c) SIGN_AL2=1;
							else SIGN_AL2=-1;

							P_AL1=(char far*)AL1;
							if (SIGN_AL1==1) for(i=L1,L_AL1=0;i>=0;i--)
																 {BYT1=GET_BYTE(ADRESS1+i);
																	*(P_AL1++)=0x20+(0x0f&BYT1);
																	*(P_AL1++)=0x20+(BYT1>>4);
																 }
							else for(i=L1,L_AL1=0;i>=0;i--)
																 {BYT1=GET_BYTE(ADRESS1+i);
																	*(P_AL1++)=0x20-(0x0f&BYT1);
																	*(P_AL1++)=0x20-(BYT1>>4);
																 }

							P_AL2=(char far*)AL2;
							if (SIGN_AL2==1) for(j=L2,L_AL2=0;j>=0;j--)
																 {BYT1=GET_BYTE(ADRESS2+j);
																	*(P_AL2++)=0x20+(0x0f&BYT1);
																	*(P_AL2++)=0x20+(BYT1>>4);
																 }
							else for(j=L2,L_AL2=0;j>=0;j--)
																 {BYT1=GET_BYTE(ADRESS2+j);
																	*(P_AL2++)=0x20-(0x0f&BYT1);
																	*(P_AL2++)=0x20-(BYT1>>4);
																 }

							if (L1&0x01) {*(P_AL1++)=0;*(P_AL1++)=0;L_AL1=(L1+2)/2;}
							else L_AL1=L1/2;

							if (L2&0x01) {*(P_AL2++)=0;*(P_AL2++)=0;L_AL2=(L2+2)/2;}
							else L_AL2=L2/2;
							if (L_AL1==L_AL2) for(i=0;i<L_AL2;i++) AL1[i]+=(AL2[i]-0x20202020l);
							else if (L_AL1<L_AL2)
										 {for(i=L_AL1;i<L_AL2;i++) AL1[i]=0;
											for(i=0;i<L_AL2;i++) AL1[i]+=(AL2[i]-0x20202020l);
										 }
									 else
										 {for(i=L_AL2;i<L_AL1;i++) AL2[i]=0;
											for(i=0;i<L_AL1;i++) AL1[i]+=(AL2[i]-0x20202020l);
										 }
							P_AL1=(char far*)AL1;
							for(i=L1;i>=0;i--)
								 {
									if (*P_AL1>0x29)
										 {*P_AL1-=0x0a;
											(*(P_AL1+1))++;
										 }
									else
										if (*P_AL1<0x17)
											{
											}
									BYT1=(*(P_AL1++))&0x0f;
									if (*P_AL1>0x29)
										 {*P_AL1-=0x0a;
											(*(P_AL1+1))++;
										 }
									else
										if (*P_AL1<0x17)
											{
											}
									BYT1|=((*(P_AL1++))&0x0f)<<4;
									PUT_BYTE(ADRESS1+i,BYT1);
								 }

								T();
							 ************************************/
							break;
		case 0xfb:  /*   SP   Вычитание десятичное
								Второй операнд вычитается из первого операнда, разница помещается
								на место первого операнда.Команда аналогична команде сложения.
								Отличие состоит в том,что машина при выполнении операции
								автоматически изменяет знак второго операнда на обратный.
								Совместив правые байты обоих операндов,команду SP можно
								использовать для очистки всего поля или его части.
								*/
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,L1);
					DtaEnd(ADRESS2,L2);
#endif

							DecimalAdd(ADRESS1, L1, ADRESS2, L2, D_SUBTRACT);
							//T();
							break;
		case 0xfc:    /* MP   Умножение десятичное
								Второй операнд(множитель) умножается на первый операнд
								(множимое).Результат помещается в поле первого операнда.
								Длина второго операнда не может превышать восьми байтов и
								должна быть всегда меньше длины первого операнда.Кроме того,
								в первом операнде должно быть столько нулевых старших
								цифр,каков размер поля второго операнда. В этих условиях
								переполнения результата произойти не может.Поля могут
								перекрываться,но так,чтобы совпадали их правые (младшие) байты
								Признак результата остается без изменения.Заметим,что для расширения
								поля первого операнда может использоваться команда сложения с
								очисткой.
									*/
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,L1);
					DtaEnd(ADRESS2,L2);
#endif

							DecimalMultiply(ADRESS1, L1, ADRESS2, L2);
//#include "ds360ch0.cc"
							//T();
							break;
		case 0xfd:    /* DP   Деление десятичное
								Первый операнд(делимое)делится на второй операнд (делитель).
								Частное помещается в поле первого операнда и его длина в байтах
								равна L1-L2.Остаток помещается после частного по адресу
								E1+L1-L2, и его длина в байтах равна L2.Длина поля делителя не
								может быть больше восьми байтов, и во всех случаях его длина
								должна быть меньше длины поля делимого.Делимое,делитель,частное
								и остаток рассматриваются как целые числа.Знак остатка тот же
								что и у делимого,даже если остаток равен 0.Поля операндов
								могут перекрываться,но так,чтобы совпадали их младшие байты.
								Признак результата остается без изменения.Максимальный размер
								делимого равен 31 десятичной цифре; максимальный размер
								частного равен 29 десятичным цифрам.
									*/
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,L1);
					DtaEnd(ADRESS2,L2);
#endif

							DecimalDivide(ADRESS1, L1, ADRESS2, L2);
							//T();
							break;
		case 0xfe:
							T00(COM[0]);
							break;
		case 0xff:
							T00(COM[0]);
							break;
	 }
}

/////////////////////////////////////////////////////////////
//  process decimal add, subtract, ZAP, compare
//  in connection of value Operation
////////////////////////////////////////////////////////////
int DecimalAdd(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2, int Operation )
{int  SIGN_AL1=1, SIGN_AL2=1;
 signed char  work1[32], work2[32];
 int  i,k;
 int  num1, num2, number;
 char byte, last1, last2;
 int fReverse, fZero=TRUE;

	 last1 =GET_BYTE(ADRESS1+L1) & 0x0f;
	 last2 =GET_BYTE(ADRESS2+L2) & 0x0f;

	 //--check data format
	 if (Operation!=D_ZAP)
			{if(last1!=0x0c && last1!=0x0d && last1 !=0x0f)
				 {RQ_PRG=7; RETURN=1; return(-1);}  //illagal data
			}
	 if(last2!=0x0c && last2!=0x0d && last2 !=0x0f)
		 {RQ_PRG=7; RETURN=1; return(-1);}  //illagal data
	 //----check operand's sign
				if   (last1==0x0d)
						SIGN_AL1=-1;
				else
						SIGN_AL1=1;
				if   (last2==0x0d)
						 SIGN_AL2=-1;
				else
						 SIGN_AL2=1;

		 memset(work1, 0, 32);

		 if(Operation==D_SUBTRACT || Operation==D_COMPARE)
					  SIGN_AL2*=-1;
	 //copy operands to work arrays
		 if(Operation==D_ZAP)
			 {SIGN_AL1=1;
			 }
			else
			 {
			  work1[0]=(GET_BYTE(ADRESS1+L1)>>4)&0xf;
			  for(k=1,i=L1-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS1+i);
				  work1[k++]  =byte&0xf;
				  work1[k++]  =(byte>>4)&0xf;
				}
			 }
			  work2[0]=(GET_BYTE(ADRESS2+L2)>>4)&0xf;
			  for(k=1,i=L2-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS2+i);
				  work2[k++]  =byte&0xf;
				  work2[k++]  =(byte>>4)&0xf;
				}
				num1=2*L1+1;   //numbers of bytes in work[]
				num2=2*L2+1;
				if(SIGN_AL1==-1)
				  for(i=0; i<num1; i++) work1[i] *= -1;
				if(SIGN_AL2==-1)
				  for(i=0; i<num2; i++) work2[i] *= -1;

							  //add work arrays
				for(i=0; i<num2; i++)
				 { work1[i] +=work2[i];
				 }

			 //calculate and correct rezults
			 number=max(num1,num2);
			 for(i=0; i<number;i++)               //check for 0
				 if(work1[i]!=0) fZero=FALSE;

			 if(SIGN_AL1 == SIGN_AL2)  //correct as addition
			 {
				if(SIGN_AL1<0)
				  for(i=0; i<number; i++) work1[i] *=-1;  //positiv
				for(i=0; i<number; i++)
				 {if(work1[i]>=10)
					 {work1[i]-=10;
					  work1[i+1]+=1;
					  if(i+1==number) number++;
					 }
				  }
			 }
			 else               //correct as SUBTRACTion
			 { fReverse =FALSE;
				for(i=number-1; i>=0; i--)
				 {if(work1[i]<0){fReverse =TRUE; break;}
				  if(work1[i]>0){ break;}
				 }
				if(fReverse)
				 for(i=0; i<number; i++)
					work1[i] *=(-1);

				 for(i=0; i<number; i++)
				  if(work1[i]<0)
					{work1[i]+=10;
					 work1[i+1]-=1;
					}

				if(fReverse) SIGN_AL1=-1;
				else         SIGN_AL1=1;
			 }

		//make PSW_SS    check overflow !!!
		if(Operation !=D_COMPARE && number>num1) PSW_CC=3;  //overflow
		else
		 {if(fZero) {PSW_CC=0; SIGN_AL1=1;}
		  else{ if( SIGN_AL1>0) PSW_CC=2;
				  else            PSW_CC=1;
				}
		 }

		//Write results to 360
		if(Operation !=D_COMPARE)
		{ byte=(work1[0]&0x0f)<<4;
		  if(SIGN_AL1==1) byte|=0xc;
		  else            byte|=0xd;
			PUT_BYTE(ADRESS1+L1,byte);
		  for(k=1,i=L1-1; i>=0; i--, k+=2)
			 {
			  byte=((work1[k+1]&0x0f)<<4)| (work1[k]&0x0f);
			  PUT_BYTE(ADRESS1+i,byte);

			 }
		}
		return(0);
}


int DecimalDivide(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2 )
{int  SIGN_AL1=1, SIGN_AL2=1;
 signed char  work1[32], work2[32];
 int  i,k, nz1, nz2, nRem, nRes;
 int  num1, num2;
 char byte, tens, last1, last2;
 signed char remainder[32],  differ[32], result[32], multi[32];
 int  rrr, rem, div;
 int  nzDiff;
 int  currRem=0;


	 last1 =GET_BYTE(ADRESS1+L1) & 0x0f;
	 last2 =GET_BYTE(ADRESS2+L2) & 0x0f;

	 //--check data format
	num1=2*L1+1;   //numbers of bytes in work[]
	num2=2*L2+1;
	if(num1<num2) {RQ_PRG=6; RETURN=1; return(-1);}  //!!!! illegal data


	if(L2>8) {RQ_PRG=6; RETURN=1; return(-1);}                //length of operand should be less then 8

	 if(last1!=0x0c && last1!=0x0d && last1 !=0x0f)
		  {RQ_PRG=7; RETURN=1; return(-1);}  //illegal data
	 if(last2!=0x0c && last2!=0x0d && last2 !=0x0f)
		  {RQ_PRG=7; RETURN=1; return(-1);}  //illegal data
	 //----check operand's sign
				if   (last1==0x0d)
						SIGN_AL1=-1;
				else
						SIGN_AL1=1;
				if   (last2==0x0d)
						 SIGN_AL2=-1;
				else
						 SIGN_AL2=1;


	 //copy operands to work arrays
			  work1[0]=(GET_BYTE(ADRESS1+L1)>>4)&0xf;
			  for(k=1,i=L1-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS1+i);
				  work1[k++]  =byte&0xf;
				  work1[k++]  =(byte>>4)&0xf;
				}

			  work2[0]=(GET_BYTE(ADRESS2+L2)>>4)&0xf;
			  for(k=1,i=L2-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS2+i);
				  work2[k++]  =byte&0xf;
				  work2[k++]  =(byte>>4)&0xf;
				}


			  //check length of first operand (it should be enough for result)
			  for(i=num1-1,nz1=0; i>=0; i--)
				 if(work1[i]==0) nz1++;
				 else  break;

			  for(i=num2-1,nz2=0; i>=0; i--)
				 if(work2[i]==0) nz2++;
				 else  break;

			  memset(result,0,32);
			  nRes=0;
				nRem=0;

			  num1 -=nz1; num2 -=nz2;  //don't forgot recalculate num1, num2
			  if(num2==0)   //divide to ZERO !!!
						{RQ_PRG=0x000b; RETURN=1; return(-1);}    //append  PSW_ and RETURN !!!
			  if(num1==0) goto WRITE_RESULT;

				nRem=num2;
				for(i=0; i<num2; i++)
					  remainder[i] =work1[num1-nRem+i];


				if(num1>num2 && CmpD(remainder,work2,num2)<0)
				 {nRem++;
				  for(i=0; i<num2+1; i++)
					  remainder[i] =work1[num1-nRem+i];
				 }
			  currRem =nRem;


			  while(TRUE)
			  {
				  //find necessary length of remainder for operation
				 if(nRem<num2 || (nRem==num2 && CmpD(remainder,work2,num2)<0)) break;
				 if(num2>1)
				  {div =work2[num2-1]*10+work2[num2-2];
					if(nRem==num2)
					  rem=remainder[nRem-1]*10 +remainder[nRem-2];
					else
					  rem=remainder[nRem-1]*100 +remainder[nRem-2]*10 +remainder[nRem-3];
				  }
				 else
				 { div=work2[num2-1];
					if(nRem==num2)
					  rem=remainder[nRem-1];
					else
					  rem=remainder[nRem-1]*10 +remainder[nRem-2];
				 }

				 rrr=rem/div;  //approximately count digit for result -high limit
				 //multiply rrr to divider
				 for(i=0; i<num2+1; i++)
					 multi[i]=0;

				 for(i=0; i<num2; i++)
					 { multi[i] +=work2[i]*rrr;
						if(multi[i]>=10)
						  {tens =multi[i]/10;
							multi[i+1] +=tens;
							multi[i] -=tens*10;
						  }
					 }
				  //find koefficient
				  while (CmpD(remainder,multi,nRem)<0 && rrr>0)
				  {rrr--;
					for(i=0; i<num2; i++)
					{multi[i] -=work2[i];
					 if(multi[i]<0)
						 {multi[i]  +=10;
						  multi[i+1]-=1;
						 }
					}
				  }
				 result[nRes++] =rrr;

				 //find differ

				 for(i=0; i<nRem; i++)
				  differ[i] =remainder[i]-multi[i];

				 for(i=0; i<nRem; i++)
				  if(differ[i]<0)
					 { differ[i]+=10;
						differ[i+1] -=1;
					 }
				 for(nzDiff=0,i=nRem-1; i>=0; i--)  //count number of zero digits
					if(differ[i]!=0) break;
					else nzDiff++;

				 //build new remainder from differ and work1:  case if differ == 0 ?


				for(i=0; i<nRem -nzDiff; i++)
				  remainder[i] = differ[i];   //store differ in remainder
				nRem = nRem-nzDiff;

				while(TRUE)
				{
				 if(currRem<num1)
				 {currRem++;
				  for(i=nRem-1; i>=0; i--)
					 remainder[i+1]=remainder[i];

				  remainder[0]=work1[num1-currRem];
				  nRem++;
				 }
				 else
					 break;
				 if(nRem<num2 || nRem==num2 && CmpD(remainder, work2, num2)<0)
				 {				 //append zero to result
				  result[nRes++]=0;
				 }
				 else break;
				}
				if(currRem>num1)
					 break;

			}

WRITE_RESULT:
		//Write results to 360
		  if(L2+(nRes+1)/2 > L1)
				{RQ_PRG=0x000b; RETURN=1; return(-1);} //incorrect decima divide !!!
		  //fill necessary 0 to remainder
		  for(i=nRem; i<2*L2+1; i++)
			 remainder[i]=0;

			 //write remainder
		  byte=(remainder[0]&0x0f)<<4;
		  if(SIGN_AL1==1) byte|=0xc;
		  else            byte|=0xd;
		  PUT_BYTE(ADRESS1+L1,byte);
			  for(k=1,i=L1-1; i>=L1-L2; i--, k+=2)
			 {
			  byte=((remainder[k+1]&0x0f)<<4)| (remainder[k]&0x0f);
			  PUT_BYTE(ADRESS1+i,byte);
			 }


		  memset(work1, 0, 32);
		  for(i=0; i<nRes; i++)
					 work1[i]=result[nRes-1-i];  //reverse of significat digits

		  byte=(work1[0]&0x0f)<<4;
		  SIGN_AL1 *=SIGN_AL2;
		  if(SIGN_AL1==1) byte|=0xc;
		  else            byte|=0xd;
		  PUT_BYTE(ADRESS1+L1-L2-1,byte);
		  for(k=1,i=L1-L2-2; i>=0; i--, k+=2)
			 {
			  byte=((work1[k+1]&0x0f)<<4)| (work1[k]&0x0f);
			  PUT_BYTE(ADRESS1+i,byte);
			 }




 return(0);

}

int CmpD(signed char *Src, signed char *Dest, int num)
{
 int i;
 for(i=num-1; i>=0; i--)
	{ if(Src[i]>Dest[i]) return(1);
	  if(Src[i]<Dest[i]) return(-1);
	}
  return 0;
}
void mem_set_value(char *mem, int c, int size)
{int i;
 for(i=0; i<size; i++)
		mem[i]=c;

}

int DecimalMultiply(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2 )
{int  SIGN_AL1=1, SIGN_AL2=1;
 signed char  work1[32], work2[32];
 int  i,k, nz1, nz2;
 int  num1, num2;
 char byte, tens, last1, last2;
 signed char buff[512];     //32*16


	 last1 =GET_BYTE(ADRESS1+L1) & 0x0f;
	 last2 =GET_BYTE(ADRESS2+L2) & 0x0f;

	 //--check data format
	 if(L2>8)
		{RQ_PRG=6; RETURN=1; return(-1);}    //length of operand should be less then 8
	 if(last1!=0x0c && last1!=0x0d && last1 !=0x0f)
		 {RQ_PRG=7; RETURN=1; return(-1);}  //illegal data
	 if(last2!=0x0c && last2!=0x0d && last2 !=0x0f)
		 {RQ_PRG=7; RETURN=1; return(-1);}  //illegal data
	 //----check operand's sign
				if   (last1==0x0d)
						SIGN_AL1=-1;
				else
						SIGN_AL1=1;
				if   (last2==0x0d)
						 SIGN_AL2=-1;
				else
						 SIGN_AL2=1;


	 //copy operands to work arrays
				work1[0]=(GET_BYTE(ADRESS1+L1)>>4)&0xf;
			  for(k=1,i=L1-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS1+i);
				  work1[k++]  =byte&0xf;
				  work1[k++]  =(byte>>4)&0xf;
				}

			  work2[0]=(GET_BYTE(ADRESS2+L2)>>4)&0xf;
			  for(k=1,i=L2-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS2+i);
				  work2[k++]  =byte&0xf;
				  work2[k++]  =(byte>>4)&0xf;
				}
				num1=2*L1+1;   //numbers of bytes in work[]
				num2=2*L2+1;

			  //check length of first operand (it should be enough for result)
			  for(i=num1-1,nz1=0; i>=0; i--)
				 if(work1[i]==0) nz1++;
				 else  break;

			  for(i=num2-1,nz2=0; i>=0; i--)
				 if(work2[i]==0) nz2++;
				 else  break;

			  if(nz1<num2-nz2)
					{RQ_PRG=7; RETURN=1; return(-1);}  //!!!! not enough space for operation

			  memset(buff, 0, 512);    //work array for multiply
			  for(i=0; i<num2-nz2; i++)
			  for(k=0; k<num1-nz1; k++)
			  {byte =work1[k]*work2[i];
				if(byte>=10)
				{tens=byte/10;
				 byte -=tens*10;
				 buff[33*i+k+1] +=tens;
				}
				buff[33*i+k] +=byte;
				if(buff[33*i+k]>=10)
				 {tens =buff[33*i+k]/10;
				  buff[33*i+k] -=tens*10;
				  buff[33*i+k+1] +=tens;
				 }
			  }
			  //count result
			  memset(work1, 0, 32);

			  for(k=0; k<num1-nz1+num2-nz2; k++)
			  {for(i=0; i<num2-nz2; i++)
				{
				 work1[k] +=buff[32*i+k];
				}
				if(work1[k]>=10)
				 {tens=work1[k]/10;
				  work1[k+1]+=tens;
				  work1[k] -=tens*10;
				  if(work1[k+1]>=10 )
				  {tens=work1[k+1]/10;
					work1[k+2]+=tens;
					work1[k+1] -=tens*10;
				  }
				 }
			  }

			SIGN_AL1 *=SIGN_AL2;
					//Write results to 360

		  byte=(work1[0]&0x0f)<<4;
		  if(SIGN_AL1==1) byte|=0xc;
		  else            byte|=0xd;
			PUT_BYTE(ADRESS1+L1,byte);
		  for(k=1,i=L1-1; i>=0; i--, k+=2)
			 {
			  byte=((work1[k+1]&0x0f)<<4)| (work1[k]&0x0f);
			  PUT_BYTE(ADRESS1+i,byte);

			 }

 return(0);

}


#undef LL
#undef L1
#undef L2
