#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>

#include "ds360psw.h"
#include "ds360dfn.h"
void CODEB0(char far *COM)
{
 static char RR;
 static char RX;
 static char is;
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

 static unsigned long ADR;
 static int i,j,k,l,m,c;
 static unsigned long OPR1,OPR2;
 time_t TIME_TIME;
 static double F_TIME_TIME=0.0;
 static double F_TIME_TIME2;
 static unsigned int DtaAdress;
 static unsigned long Adress;
 GET_OPERAND_SI;
 FORWARD_PSW;
 switch(COM[0])
	 {
		case 0xb0:
							T00(COM[0]);
							break;
		case 0xb1:            /*  LRA
													§ £àã§ª  ¤¥©áâ¢¨â¥«ì­®£®  ¤à¥á 
													*/
#ifdef DTA_370
							GET_OPERAND_RX;
							if (PSW_AMWP&0x08) /*  EC */
								{if (PSW_EC_MASK&0x4)  /* DTA */
									{
										 {i=TLB_SET(ADRESS);
											switch (i)
												{case 0:Adress=(((unsigned long)TLB[DtaAdress])<<11)+((ADRESS)&0x000007ff);
																PSW_CC=0;
																break;
												 case 1:case 2:case 3: Adress=ADRESS_DTA;PSW_CC=i;
																break;
												 default: PSW_CC=3;Adress=ADRESS;
																break;
												}

										 }
									 R[R1]=Adress;
									}
								}
							T();

#else
							T00(COM[0]);
#endif
							T();
							break;
		case 0xb2:            /* LMC
													§ £àã§ª  £àã¯¯®¢ ï à¥£¨áâà®¢ ã¯à ¢«¥­¨ï
													*/
							switch(RX)
								 {
									case 0x02:PUT_WORD(ADRESS,  0xff100220);
														PUT_WORD(ADRESS+4,0x10520000);/*T();*/break; /*STIDP*/
									case 0x03:    /* STIDC*/
											switch(ADRESS&0xf00)
													{
													 case 0x000:PUT_WORD(0xa8l,0x10010000l);
																			PSW_CC=0;
																			break;
													 case 0x100:PUT_WORD(0xa8l,0x20020000l);
																			PSW_CC=0;
																			break;
													 case 0x200:PUT_WORD(0xa8l,0x20020000l);
																			PSW_CC=0;
																			break;
													 case 0x300:PUT_WORD(0xa8l,0x20020000l);
																			PSW_CC=0;
																			break;
													 default:PSW_CC=3;
																			break;
													}
										 //T();
										 break;

									case 0x04:PSW_CC=0; /*SCK 3*/ /*DTA ??????????*/
										 CLOCK1=GET_WORD(ADRESS);
										 CLOCK2=GET_WORD(ADRESS+4);
										 REAL_TIME=time(NULL);
										 //T();
										 break;
									case 0x05:
										 PSW_CC=0;  /*STCK  2*/     /*DTA ??????????*/

										 TIME_TIME=time(NULL);
										 CLOCK2+=0x00100000l;
										 PUT_WORD(ADRESS,(CLOCK1+(TIME_TIME-REAL_TIME)));
										 PUT_WORD(ADRESS+4,CLOCK2);
										 //T();
										 break;
									case 0x06:    /* SCKC  “‘’€Ž‚ˆ’œ ŠŽŒ€€’Ž */
										 CLOCK1_COMP=GET_WORD(ADRESS);
										 CLOCK2_COMP=GET_WORD(ADRESS+4);
										 REAL_TIME_COMP=time(NULL);
										 break;
									case 0x07:    /*  STCKC ‡€ˆ‘œ ‚ €ŒŸ’œ ŠŽŒ€€’Ž€ */
										 TIME_TIME=time(NULL);
										 PUT_WORD(ADRESS,(CLOCK1_COMP+(TIME_TIME-REAL_TIME_COMP)));
										 PUT_WORD(ADRESS+4,CLOCK2_COMP);
										 break;
									case 0x08:    /* SPT  “‘’€Ž‚ˆ’œ ’€‰Œ… CPU */
										 CLOCK1_CPU=GET_WORD(ADRESS);
										 CLOCK2_CPU=GET_WORD(ADRESS+4);

										 REAL_TIME_CPU=time(NULL);
										 break;
									case 0x09:    /* STPT ‡€ˆ‘€’œ ‚ €ŒŸ’œ ’€‰Œ… CPU */
										 TIME_TIME=time(NULL);
										 PUT_WORD(ADRESS,(CLOCK1_CPU+(TIME_TIME-REAL_TIME_CPU)));
										 PUT_WORD(ADRESS+4,CLOCK2_CPU);
										 break;
									case 0x0a:  /* SPKA */
										 PSW_KEY=(0x000000f0&ADRESS)>>4;
										 break;
									case 0x0b: /* IPK */
										 R[2]=(R[2]&0xffffff00)|(PSW_KEY<<4);
										 T();
										 break;
									case 0x0d: /* PTLB */
										 TLB_RESET();
										 T();
										 break;
									case 0x10: /* SPX  */
										 OPR1=GET_WORD(ADRESS);
										 Dtaret;
										 PREFIX_PR=OPR1;
										 T();
										 break;
									case 0x11: /* STPX */
										 PUT_WORD(ADRESS,PREFIX_PR);
										 T();
										 break;
									case 0x12: /* STAP */
										 T();
										 break;
									case 0x13: /* RRB */
										 PSW_CC=3;
										 T();
										 break;
									default:
										 //T();
										 T00(COM[0]);
										 RQ_PRG=1;
										 RETURN=1;
										 T();
									break;
								 }
							//T();
							break;
		case 0xb3:
							T00(COM[0]);
							break;
		case 0xb4:
							T00(COM[0]);
							break;
		case 0xb5:
							T00(COM[0]);
							break;
		case 0xb6:  /*STCTL*/
							i=R1;
#ifdef DTA_370
							DtaEnd(ADRESS,0);
							DtaEnd(ADRESS,63);
#endif

PUT_STORE:
							PUT_WORD(ADRESS,R370[i]);
							ADRESS+=4;
							if (i==R2) goto END_STORE;
							i++;
							if (i>=16) i=0;
							goto PUT_STORE;
END_STORE:    ;
							//T();
							break;
		case 0xb7:
							i=R1;
#ifdef DTA_370
							DtaEnd(ADRESS,0);
							DtaEnd(ADRESS,63);
#endif

GET_LM:
							R370[i]=GET_WORD(ADRESS);
							if (i==R2) goto END_LM;
							i++;
							ADRESS+=4;
							if (i>=16) i=0;
							goto GET_LM;
END_LM:
							//T();
							break;
		case 0xb8:
							T00(COM[0]);
							break;
		case 0xb9:
							T00(COM[0]);
							break;
		case 0xba:
							//RQ_PRG=1;
							//RETURN=1;
							T();
							break;
		case 0xbb:
							//RQ_PRG=1;
							//RETURN=1;
							T();
							break;
		case 0xbc:
							T00(COM[0]);
							break;
		case 0xbd:              /* CLM */
							if (X2==0) {PSW_CC=0;break;}
							OPR1=0l;OPR2=0l;
							for (l=0,k=24,m=0x8,i=0,j=0;i<4;i++,m>>=1,k-=8)
								{
								 if (X2&m)
									 {OPR1|=R[R1]&(0x000000ffl<<k);
										OPR2|=( ((unsigned long)GET_BYTE(ADRESS+(j++)) ) <<k);
									 }
								}
							Dtaret;
							if (OPR1==OPR2) PSW_CC=0;
							else if (OPR1<OPR2) PSW_CC=1;
									 else PSW_CC=2;
							//RQ_PRG=1;
							//RETURN=1;
							//T();
							break;
		case 0xbe:							/* STCM */
#ifdef DTA_370
							DtaEnd(ADRESS,0);
							DtaEnd(ADRESS,3);
#endif

							for (l=0,k=24,m=0x8,i=0,j=0;i<4;i++,m>>=1,k-=8)
								{
								 if (X2&m) PUT_BYTE(ADRESS+(j++),( (R[R1]>>k)&0xff ));
								}
							//RQ_PRG=1;
							//RETURN=1;
							//T();
							break;
		case 0xbf:
#ifdef DTA_370
							DtaEnd(ADRESS,0);
							DtaEnd(ADRESS,3);
#endif
							PSW_CC=0;       /* ICM */
							if (X2==0) break;
							for (l=0,k=24,m=0x8,i=0,j=0;i<4;i++,m>>=1,k-=8)
								{
								 if (X2&m)
									 {R[R1]&=0xffffffffl^(0x000000ffl<<k);
										c=GET_BYTE(ADRESS+j);
										R[R1]|=( ((unsigned long)c) <<k);
										if (l==0)
											{if (c&0x80) PSW_CC=1;
											 l=1;
											}
										if (PSW_CC==0)
											{if (c) PSW_CC=2;
											}
										j++;
									 }

								}
							//RQ_PRG=1;
							//RETURN=1;
							//T();
							break;
	 }
}
#undef B1
#undef I2
#undef X2
