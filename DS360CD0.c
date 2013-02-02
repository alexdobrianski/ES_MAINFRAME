/*************************************************************************
*
* DS360CD0.C - коды 00-0f
*
* Copyright (C) 1994 - 1997 Alex Dobrianski.  All Rights Reserved.
*
**************************************************************************/
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
void CODE00(char far *COM)
{
 static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static unsigned long ADRESS;
 static int NUMBER_BLOCK;
 static unsigned long UREZ;
 static unsigned long ADR1;
 static unsigned long ADR2;
 static unsigned long LEN1;
 static unsigned long LEN2;
 static unsigned char SIMBFILL;
 static unsigned long ADDR1;
 static unsigned long ADDR2;
 static unsigned long lenn;
 static unsigned int LENN;
#define B1 B2
#define I2 RX
#define X2 R2

 GET_OPERAND_RR;
 FORWARD_PSW;
 switch(COM[0])
	 {
		case 0x00:            /* неопределенный код операции*/
							T00(COM[0]);
							break;

		case 0x01:            /* НКО */
							T00(COM[0]);
							break;


		case 0x02:            /* НКО  */
							T00(COM[0]);
							break;


		case 0x03:            /* НКО  */

							T00(COM[0]);
							break;


		case 0x04:            /* Установить маску программы SPM
														 Биты 2-7 R1 замещают признак результата
														 и маску программы в PSW
														 R2 игнорируется
														 остальная часть PSW неизменяется
														 биты 2-3 -> признак результата
														 биты 4-7 -> маску программы
														 */
							PSW_CC=(R[R1]>>28)&0x3;
							PSW_PRG_MASK=(R[R1]>>24)&0xf;
							RETURN=1;
							//T();
							break;


		case 0x05:
//													 /* Переход с возвратом        BALR
//														 Правые 32 бита PSW (код длины команды ==1
//														 признак результата, маска программы и
//													 адрес команды, следующий за BALR
//														 загружаются в общий регистр R1
//														 если R2==0 то переход не происходит
//														 и выбирается следующая команда
//														 если R2!=0 то происходит переход по
//														 адресу определяемой правыми 24
//														 битами R2
//													*/
//						UREZ= (((unsigned long)PSW_ILC)<<29)|
//									 (((unsigned long)PSW_CC)<<28)|
//									 (((unsigned long)PSW_PRG_MASK)<<24)|
//									 (PSW_ADRESS);
//						if (R2) PSW_ADRESS=0xffffff & R[R2];
//						R[R1]=UREZ;
						T();
						break;


							case 0x06:            /* Переход по счетчику        BCTR
//                                     Из содержимого R1 автоматически вычитается
//                                     1 Если результат ==0 выбирается следующая
//                                     по порядку команда
//                                     Если результат не равен 0 то происходит
//                                     переход по адресу R2
//                                     адрес оапределяется до вычитания
//                                  */
//                              UREZ=0xffffff & R[R2];
//                              if (--((signed long)R[R1]))
//                                       if (R2) PSW_ADRESS=UREZ;
//                              //T();
															break;


							case 0x07:            /* условный переход           BCR
//                                   Следующая команда выбирается по R2
//                                   если условия указываемые в M1 удовлетворены
//                                  */
//                              if (R2) if ((0x08>>PSW_CC) & R1) PSW_ADRESS=0xffffff & R[R2];
//                              //T();
															break;


								case 0x08:            /* Установить ключ памяти     SSK
																	 R2 содержит адрес 2048-байтового блока
																		 памяти биты 8-20 задают адрес
																		 Биты 0-7 и 21-27 игнорирууются
																		 биты 28-31 должны быть нулевые
																		 R1 в битах 24-31 содержит ключ памяти
																		 Команда SSK игнорирует биты 0-23
																		 и биты 29-31. Биты 24-27 помещаются
																		 в биты 0-3 ключа памяти
																		 если в машине предусмотрена
																		 защита от выборки то бит 28
																		 помещается в бит 4 ключа памяти в противном
																		случае бит 4 всегда нулевой
																		*/
									if (PSW_AMWP&0x01) {RQ_PRG=2;RETURN=1;break;}
                  if (R[R2]&0x0000000f) {RQ_PRG=6;RETURN=1;break;}
									C_SSK(R[R1],R[R2]);
									//T();
									break;


			case 0x09:            /* Прочитать ключ памяти      ISK
															 R2 содержит адрес 2048-байтового блока
															 памяти биты 8-20 задают адрес
															 Биты 0-7 и 21-27 игнорирууются
															 биты 28-31 должны быть нулевые
															 R1 в битах 24-31 содержит ключ памяти
															 Команда SSK игнорирует биты 0-23
															 и биты 29-31. Биты 24-27 помещаются
															 в биты 0-3 ключа памяти
															 если в машине предусмотрена
															 защита от выборки то бит 28
															 помещается в бит 4 ключа памяти в противном
															 случае бит 4 всегда нулевой
														 */
								 if (PSW_AMWP&0x01) {RQ_PRG=2;RETURN=1;break;}
                 if (R[R2]&0x0000000f) {RQ_PRG=6;RETURN=1;break;}
								 R[R1]=R[R1]|C_ISK(R[R2]);
								 //T();
								 break;


			case 0x0a:            /* Обращение к супервизору    SVC
															 Вызывет прерывание SVC
															 байт I1 помещается в биты 24-31 старого
															 PSW а биты 16-23 заполняются 000
															 OLD PSW-> 32(10) 96(10)-> NEW PSW
														*/
								 RQ_SVC=RR;
								 if (RQ_SVC==0) RQ_SVC=0x100;
								 RETURN=1;
								 //if (/*RQ_SVC==0x12 ||*/ RQ_SVC==0x2a) {printf("\nA=%06lx SVC %02x",PSW_ADRESS,RR);T();}
								 //T();
								 break;


			case 0x0b:            /* НКО */
								T00(COM[0]);
								break;


			case 0x0c:            /* НКО */
								T00(COM[0]);
								break;


			case 0x0d:            /* Переход с записью в память BASR
																																																			*/
								T00(COM[0]);
								break;


			case 0x0e:            /* MVCL
															R1,R2 -четные  содержат адрес 00 ХХ ХХ ХХ
															R1+1,R2+1 - длина пересылки   00 ХХ ХХ ХХ
															если R1+1 ,больше R2+1 то остаток
															в первом операнде забивается символом из
															R2+1                          ХХ 00 00 00
														*/
//								if ((R1&0x1) || (R2&0x1))
//									{RQ_PRG=0x0006;RETURN=1;
//									 return;
//									}
//								ADR1=R[R1]&0x00ffffff;
//								ADR2=R[R2]&0x00ffffff;
//								LEN1=R[R1+1]&0x00ffffff;
//								LEN2=R[R2+1]&0x00ffffff;
//								SIMBFILL=R[R2+1]>>24;
//								for(ADDR1=ADR1,lenn=0,ADDR2=ADR2;lenn<LEN2;ADDR1+=128,ADDR2+=128,lenn+=128)
//									{
//									 if ((LEN2-lenn)<128) LENN=LEN2-lenn;
//									 else LENN=128;
//									 MOVE(ADDR1,ADDR2,LENN);
//									 if (RETURN)
//										 {R[R1]=ADDR1;
//											R[R2]=ADDR2;
//											R[R1+1]=(R[R1+1]&0xff000000)|(LEN1-lenn);
//											R[R2+1]=(R[R2+1]&0xff000000)|(LEN2-lenn);
//											return;
//										 }
//									}
//								R[R1]+=LEN2;
//								R[R2]+=LEN2;
//								R[R1+1]=LEN1-LEN2;
//								R[R2+1]=R[R2+1]&0xff000000;
//								if (((signed long)R[R1+1])>0l)
//									{ADR1=R[R1]&0x00ffffff;
//									 LEN1=R[R1+1]&0x00ffffff;
//									 for(ADDR1=ADR1,lenn=0;lenn<LENN;ADDR1++,lenn++)
//										 PUT_BYTE(ADDR1,SIMBFILL);
//									}

								T();
								break;


			case 0x0f:            /* CLCL
															R1,R2 -четные  содержат адрес 00 ХХ ХХ ХХ
														R1+1,R2+1 - длина пересылки   00 ХХ ХХ ХХ
														если R1+1 ,больше R2+1 то остаток
														в первом операнде забивается символом из
														R2+1                          ХХ 00 00 00
														0-операнды равны
														1-первый меньше
														2-первый больше
														*/
								T();
								break;
				 }
#undef B1
#undef I2
#undef X2


}
void CODE05(char far *COM)  /* BALR */
{
 static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static unsigned long ADRESS;
 static int NUMBER_BLOCK;
 static unsigned long UREZ;
#define B1 B2
#define I2 RX
#define X2 R2

 GET_OPERAND_RR;
 FORWARD_PSW;


													 /* Переход с возвратом        BALR
														 Правые 32 бита PSW (код длины команды ==1
														 признак результата, маска программы и
													 адрес команды, следующий за BALR
														 загружаются в общий регистр R1
														 если R2==0 то переход не происходит
														 и выбирается следующая команда
														 если R2!=0 то происходит переход по
														 адресу определяемой правыми 24
														 битами R2
													*/
 UREZ= (((unsigned long)PSW_ILC)<<29)|
			 (((unsigned long)PSW_CC)<<28)|
			 (((unsigned long)PSW_PRG_MASK)<<24)|
			 (PSW_ADRESS);
 if (R2) PSW_ADRESS=0xfffffe & R[R2];
 R[R1]=UREZ;
#undef B1
#undef I2
#undef X2

}
void CODE06(char far *COM)  /* BCTR */
{
 static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static unsigned long ADRESS;
 static int NUMBER_BLOCK;
 static unsigned long UREZ;
#define B1 B2
#define I2 RX
#define X2 R2

 GET_OPERAND_RR;
 UREZ=0xfffffe & R[R2];
 if (--((signed long)R[R1]) )
								if (R2) {PSW_ADRESS=UREZ;return;}
 FORWARD_PSW;
 //T();
#undef B1
#undef I2
#undef X2

}
void CODE07(char far *COM)  /* BCR */
{
 static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static unsigned long ADRESS;
 static int NUMBER_BLOCK;
 static unsigned long UREZ;
#define B1 B2
#define I2 RX
#define X2 R2

 if ((0x80 >> PSW_CC) & COM[1])
 {
    if ((R2=0x0f&COM[1])) {PSW_ADRESS=0xfffffe & R[R2];return;}
 }

FORWARD_PSW;
 //T();
#undef B1
#undef I2
#undef X2

}
