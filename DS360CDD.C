#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>

#include "ds360psw.h"
#include "ds360dfn.h"
extern char bios_32[64];
extern void (*POINT[256])(char far*);
void CODEFFF(char far *COM)
 {
	printf("\nIEE456A PROTECTION ERROR RE-IPL SYSTEM");
 }
int IPL_adr;

void CODED0(char far *COM)
{
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
 static int i,k;
 static char REZ11, REZ12, REZ21, REZ22;
 static unsigned int BYT1, BYT2, BYTZ, CF1,CF2,SIG,FLAG_EDMK,NZNULL,First_Second;


 static char far *BIOS_AREA=0xf000fff0;
 static char offset_count[16]={2,7,4,8,3,9,4,5,9,12,8,6,5,14,8,1};
 static char offset_count_2[16]={8,9,4,2,5,3,3,11,6,7,3,9,12,1,8,6};
 static unsigned long all_count;
 static int i_count,i_count_2;
 static char bios_32_2[64];
 static unsigned long OLD_POINT;
 static unsigned long NEW_POINT;
 static time_t TIME_WRONG;
 static time_t TIME_NOW;
 static time_t TIME_TODAY;
 static unsigned long COUNT_TIME;
 static unsigned long TIME_LIMIT;
 static char c0;


 GET_OPERAND_SS;
 FORWARD_PSW;


 switch(COM[0])
	 {
		case 0xd0:                             /*  XIO */
					T00(COM[0]);
					break;


		case 0xd1:
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,LL);
					DtaEnd(ADRESS2,LL);
#endif
					for(i=0;i<=LL;i++)               /*MVN*/
					 {PUT_BYTE(ADRESS1+i,
										 (GET_BYTE(ADRESS1+i)&0xf0)|
										 (GET_BYTE(ADRESS2+i)&0x0f)
										);
					 }
					//T();
					break;


//		case 0xd2:
//					//for(i=0;i<=LL;i++)               /*MVC*/
//					//	{PUT_BYTE(ADRESS1+i,GET_BYTE(ADRESS2+i));
//					//	}
//					MOVE(ADRESS1,ADRESS2,LL+1);
//					//T();
//					break;


		case 0xd3:
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,LL);
					DtaEnd(ADRESS2,LL);
#endif

					for(i=0;i<=LL;i++)               /*MVZ*/
						{PUT_BYTE(ADRESS1+i,
											(GET_BYTE(ADRESS1+i)&0x0f)|
											(GET_BYTE(ADRESS2+i)&0xf0)
										 );
						}
					//T();
					break;


		case 0xd4:
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,LL);
					DtaEnd(ADRESS2,LL);
#endif

					PSW_CC=0;
					for(i=0;i<=LL;i++)              /* NC */
						{BYT1=GET_BYTE(ADRESS1+i)&GET_BYTE(ADRESS2+i);
						 PUT_BYTE(ADRESS1+i,BYT1);
						 if (BYT1) PSW_CC=1;
						}
					//XCNCOC(ADRESS1,ADRESS2,LL,NC_OPERATION);
					//T();
					break;


		case 0xd5://PSW_CC=0;
//					//for(i=0;i<=LL;i++)              /* CLC */
//					//	{BYT1=GET_BYTE(ADRESS1+i);
//					//	 BYT2=GET_BYTE(ADRESS2+i);
//					//	 if (BYT1==BYT2) continue;
//					//	 else
//					//		 {if (BYT1<BYT2) PSW_CC=1; else PSW_CC=2;
//					//			break;
//					//		 }
//					//	}
//					COMPE(ADRESS1,ADRESS2,LL+1);
//					//T();
					break;


		case 0xd6:
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,LL);
					DtaEnd(ADRESS2,LL);
#endif


					PSW_CC=0;
					for(i=0;i<=LL;i++)              /* OC */
						{BYT1=GET_BYTE(ADRESS1+i)|GET_BYTE(ADRESS2+i);
						 PUT_BYTE(ADRESS1+i,BYT1);
						 if (BYT1) PSW_CC=1;
						}
					//T();
					//XCNCOC(ADRESS1,ADRESS2,LL,OC_OPERATION);
					break;


		case 0xd7:

#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,LL);
					DtaEnd(ADRESS2,LL);
#endif

					PSW_CC=0;
					for(i=0;i<=LL;i++)              /* XC */
						{BYT1=GET_BYTE(ADRESS1+i)^GET_BYTE(ADRESS2+i);
						 PUT_BYTE(ADRESS1+i,BYT1);
						 if (BYT1) PSW_CC=1;
						}
					//XCNCOC(ADRESS1,ADRESS2,LL,XC_OPERATION);
					//T();
					break;


		case 0xd8:
					T00(COM[0]);
					break;
		case 0xd9:
					T00(COM[0]);
					break;
		case 0xda:
					T00(COM[0]);
					break;
		case 0xdb:
					T00(COM[0]);
					break;
		case 0xdc:                            /* TR */

#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,LL);
					DtaEnd(ADRESS2,255);
#endif

					for(i=0;i<=LL;i++)
						 {PUT_BYTE(ADRESS1+i,
											 GET_BYTE(ADRESS2+(unsigned long)GET_BYTE(ADRESS1+i))
											);
						 }
					//T();
					break;
		case 0xdd:                             /* TRT */
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,LL);
					DtaEnd(ADRESS2,255);
#endif

					PSW_CC=0;
					for(i=0;i<=LL;i++)
						 {if (GET_BYTE(ADRESS2+(unsigned long)GET_BYTE(ADRESS1+i)))
								{R[1]=(0xff000000&(R[1]))|(ADRESS1+i)&0xffffff;
								 R[2]=(0xffffff00&(R[2]))|GET_BYTE(ADRESS2+(unsigned long)GET_BYTE(ADRESS1+i));
								 if (i==LL) PSW_CC=2;
								 else PSW_CC=1;
								 break;
								}
						 }
					//T();
					break;
		case 0xde:                            /* ED */

					FLAG_EDMK=0;
EDED:
#ifdef DTA_370
					DtaEnd(ADRESS1,0);
					DtaEnd(ADRESS2,0);
					DtaEnd(ADRESS1,LL);
					DtaEnd(ADRESS2,LL);
#endif

					PSW_CC=0;
					for(First_Second=0,i=0,k=0,NZNULL=0,SIG=0,CF2=0;i<=LL;i++)
						{BYT1=GET_BYTE(ADRESS1+(unsigned long)i);
						 if (i==0) BYTZ=BYT1;
								switch(BYT1)
								 {
									case 0x20: /* выбор цифры*/
												 if (First_Second==0)
													 {
														BYT2=GET_BYTE(ADRESS2+(unsigned long)k);
														CF1=BYT2>>4;
														if (CF1>0x09)
															 {RQ_PRG=0x0007;RETURN=1;return;
															 }
														First_Second=1;k++;
														CF2=BYT2&0x000f;
														if (CF2>0x09)
															 {if ((CF2==0x0d) || (CF2==0x0b)) SIG=1;
																else SIG=2;
																First_Second=0;
															 }
													 }
												 else
													 {CF1=BYT2&0x000f;
														First_Second=0;
													 }
												 if (NZNULL==0)
													 {
														if (CF1==0) PUT_BYTE(ADRESS1+(unsigned long)i,
																								 (unsigned char)BYTZ);
														else
															{NZNULL=1;PSW_CC=2;
															 PUT_BYTE(ADRESS1+(unsigned long)i,
																				(unsigned char)(CF1+0xf0)
																			 );
															 if (FLAG_EDMK)
																 {
																	R[1]=(R[1]&0xff000000)|
																			 (0x00ffffff&(ADRESS1+(unsigned long)i));
																 }
															}
													 }
												 else
													 {PUT_BYTE(ADRESS1+(unsigned long)i,
																		 (unsigned char)(CF1+0xf0)
																		);
														if (CF1!=0) PSW_CC=2;

													 }
												 if (SIG)
													 {if (SIG==2) NZNULL=0;
														SIG=0;
													 }
												 break;
									case 0x21: /* начало значимости */
												 NZNULL=1;
												 if (First_Second==0)
													 {
														BYT2=GET_BYTE(ADRESS2+(unsigned long)k);
														CF1=BYT2>>4;
														if (CF1>0x09)
															 {RQ_PRG=0x0007;RETURN=1;return;
															 }
														First_Second=1;k++;
														CF2=BYT2&0x000f;
														if (CF2>0x09)
															 {if ((CF2==0x0d) || (CF2==0x0b)) SIG=1;
																else SIG=2;
																First_Second=0;
															 }
													 }
												 else
													 {CF1=BYT2&0x000f;
														First_Second=0;
													 }
												 PUT_BYTE(ADRESS1+(unsigned long)i,
																		 (unsigned char)(CF1+0xf0)
																		);
												 if (CF1!=0) PSW_CC=2;
												 if (SIG)
													 {if (SIG==2) NZNULL=0;
														SIG=0;
													 }
												 if (FLAG_EDMK)
																 {
																	R[1]=(R[1]&0xff000000)|
																			 (0x00ffffff&(ADRESS1+(unsigned long)i));
																 }
												 break;
									case 0x22: /* разделение полей */
												 NZNULL=0;PSW_CC=0;
												 PUT_BYTE(ADRESS1+(unsigned long)i,
																		 (unsigned char)(BYTZ)
																		);
												 break;
									default:   /* символ сообщения */
												 if (NZNULL==0)
													 PUT_BYTE(ADRESS1+(unsigned long)i,
																		 (unsigned char)(BYTZ)
																		);
												 else
													 PUT_BYTE(ADRESS1+(unsigned long)i,
																		 (unsigned char)(BYT1)
																		);
												 break;
								 }


						 if (i==LL)
							 {
								if (PSW_CC!=0)
									{
									 if ((CF2==0x0d) || (CF2==0x0b)) PSW_CC=1;
									}
							 }
						}
					//T();
					break;
		case 0xdf:                            /* EDMK */
					FLAG_EDMK=1;
//#include "ds360ch0.c"

					goto EDED;
					//T();
					break;
	 }
}
#undef LL
#undef L1
#undef L2
