/*************************************************************************
*
* DS360CD0.C - ���� 00-0f
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
		case 0x00:            /* ����।������ ��� ����樨*/
							T00(COM[0]);
							break;

		case 0x01:            /* ��� */
							T00(COM[0]);
							break;


		case 0x02:            /* ���  */
							T00(COM[0]);
							break;


		case 0x03:            /* ���  */

							T00(COM[0]);
							break;


		case 0x04:            /* ��⠭����� ���� �ணࠬ�� SPM
														 ���� 2-7 R1 ������� �ਧ��� १����
														 � ���� �ணࠬ�� � PSW
														 R2 ����������
														 ��⠫쭠� ���� PSW �����������
														 ���� 2-3 -> �ਧ��� १����
														 ���� 4-7 -> ���� �ணࠬ��
														 */
							PSW_CC=(R[R1]>>28)&0x3;
							PSW_PRG_MASK=(R[R1]>>24)&0xf;
							RETURN=1;
							//T();
							break;


		case 0x05:
//													 /* ���室 � �����⮬        BALR
//														 �ࠢ� 32 ��� PSW (��� ����� ������� ==1
//														 �ਧ��� १����, ��᪠ �ணࠬ�� �
//													 ���� �������, ᫥���騩 �� BALR
//														 ����㦠���� � ��騩 ॣ���� R1
//														 �᫨ R2==0 � ���室 �� �ந�室��
//														 � �롨ࠥ��� ᫥����� �������
//														 �᫨ R2!=0 � �ந�室�� ���室 ��
//														 ����� ��।��塞�� �ࠢ묨 24
//														 ��⠬� R2
//													*/
//						UREZ= (((unsigned long)PSW_ILC)<<29)|
//									 (((unsigned long)PSW_CC)<<28)|
//									 (((unsigned long)PSW_PRG_MASK)<<24)|
//									 (PSW_ADRESS);
//						if (R2) PSW_ADRESS=0xffffff & R[R2];
//						R[R1]=UREZ;
						T();
						break;


							case 0x06:            /* ���室 �� ���稪�        BCTR
//                                     �� ᮤ�ন���� R1 ��⮬���᪨ ���⠥���
//                                     1 �᫨ १���� ==0 �롨ࠥ��� ᫥�����
//                                     �� ���浪� �������
//                                     �᫨ १���� �� ࠢ�� 0 � �ந�室��
//                                     ���室 �� ����� R2
//                                     ���� ���।������ �� ���⠭��
//                                  */
//                              UREZ=0xffffff & R[R2];
//                              if (--((signed long)R[R1]))
//                                       if (R2) PSW_ADRESS=UREZ;
//                              //T();
															break;


							case 0x07:            /* �᫮��� ���室           BCR
//                                   �������� ������� �롨ࠥ��� �� R2
//                                   �᫨ �᫮��� 㪠�뢠��� � M1 㤮���⢮७�
//                                  */
//                              if (R2) if ((0x08>>PSW_CC) & R1) PSW_ADRESS=0xffffff & R[R2];
//                              //T();
															break;


								case 0x08:            /* ��⠭����� ���� �����     SSK
																	 R2 ᮤ�ন� ���� 2048-���⮢��� �����
																		 ����� ���� 8-20 ������ ����
																		 ���� 0-7 � 21-27 ������������
																		 ���� 28-31 ������ ���� �㫥��
																		 R1 � ���� 24-31 ᮤ�ন� ���� �����
																		 ������� SSK �������� ���� 0-23
																		 � ���� 29-31. ���� 24-27 ���������
																		 � ���� 0-3 ���� �����
																		 �᫨ � ��設� �।�ᬮ�७�
																		 ���� �� �롮ન � ��� 28
																		 ����頥��� � ��� 4 ���� ����� � ��⨢���
																		��砥 ��� 4 �ᥣ�� �㫥���
																		*/
									if (PSW_AMWP&0x01) {RQ_PRG=2;RETURN=1;break;}
                  if (R[R2]&0x0000000f) {RQ_PRG=6;RETURN=1;break;}
									C_SSK(R[R1],R[R2]);
									//T();
									break;


			case 0x09:            /* ������ ���� �����      ISK
															 R2 ᮤ�ন� ���� 2048-���⮢��� �����
															 ����� ���� 8-20 ������ ����
															 ���� 0-7 � 21-27 ������������
															 ���� 28-31 ������ ���� �㫥��
															 R1 � ���� 24-31 ᮤ�ন� ���� �����
															 ������� SSK �������� ���� 0-23
															 � ���� 29-31. ���� 24-27 ���������
															 � ���� 0-3 ���� �����
															 �᫨ � ��設� �।�ᬮ�७�
															 ���� �� �롮ન � ��� 28
															 ����頥��� � ��� 4 ���� ����� � ��⨢���
															 ��砥 ��� 4 �ᥣ�� �㫥���
														 */
								 if (PSW_AMWP&0x01) {RQ_PRG=2;RETURN=1;break;}
                 if (R[R2]&0x0000000f) {RQ_PRG=6;RETURN=1;break;}
								 R[R1]=R[R1]|C_ISK(R[R2]);
								 //T();
								 break;


			case 0x0a:            /* ���饭�� � �㯥ࢨ����    SVC
															 ��뢥� ���뢠��� SVC
															 ���� I1 ����頥��� � ���� 24-31 ��ண�
															 PSW � ���� 16-23 ����������� 000
															 OLD PSW-> 32(10) 96(10)-> NEW PSW
														*/
								 RQ_SVC=RR;
								 if (RQ_SVC==0) RQ_SVC=0x100;
								 RETURN=1;
								 //if (/*RQ_SVC==0x12 ||*/ RQ_SVC==0x2a) {printf("\nA=%06lx SVC %02x",PSW_ADRESS,RR);T();}
								 //T();
								 break;


			case 0x0b:            /* ��� */
								T00(COM[0]);
								break;


			case 0x0c:            /* ��� */
								T00(COM[0]);
								break;


			case 0x0d:            /* ���室 � ������� � ������ BASR
																																																			*/
								T00(COM[0]);
								break;


			case 0x0e:            /* MVCL
															R1,R2 -���  ᮤ�ঠ� ���� 00 �� �� ��
															R1+1,R2+1 - ����� ����뫪�   00 �� �� ��
															�᫨ R1+1 ,����� R2+1 � ���⮪
															� ��ࢮ� ���࠭�� ���������� ᨬ����� ��
															R2+1                          �� 00 00 00
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
															R1,R2 -���  ᮤ�ঠ� ���� 00 �� �� ��
														R1+1,R2+1 - ����� ����뫪�   00 �� �� ��
														�᫨ R1+1 ,����� R2+1 � ���⮪
														� ��ࢮ� ���࠭�� ���������� ᨬ����� ��
														R2+1                          �� 00 00 00
														0-���࠭�� ࠢ��
														1-���� �����
														2-���� �����
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


													 /* ���室 � �����⮬        BALR
														 �ࠢ� 32 ��� PSW (��� ����� ������� ==1
														 �ਧ��� १����, ��᪠ �ணࠬ�� �
													 ���� �������, ᫥���騩 �� BALR
														 ����㦠���� � ��騩 ॣ���� R1
														 �᫨ R2==0 � ���室 �� �ந�室��
														 � �롨ࠥ��� ᫥����� �������
														 �᫨ R2!=0 � �ந�室�� ���室 ��
														 ����� ��।��塞�� �ࠢ묨 24
														 ��⠬� R2
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
