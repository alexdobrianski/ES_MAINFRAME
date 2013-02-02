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
extern FILE *TraceOutCmd;
void CODE50(char far *COM)
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
 static unsigned long URREZ;
 static unsigned long URREZ_AL;
 static unsigned long URREZ_WORK;
 static unsigned long URREZ2;
 static unsigned long URREZ3;
 static unsigned int FLA;
 static unsigned long uRREZ;

 static unsigned long *URR1;
 static unsigned long *URR2;
 static unsigned long ADRESS;
	static long double F_W1;
 static long double F_W2;
 static long double F_W3;
 static long double F_W4;
 static unsigned long R_1;
 static unsigned long R_2;
 static unsigned long DEL_DEL;
 static int psw_cc;
#define B1 B2
#define I2 RX
#define X2 R2


 GET_OPERAND_RX;
 FORWARD_PSW;
 /*FORW_PSW();*/
 switch(COM[0])
	 {
		case 0x50:
//							if (ADRESs&0x3)
//							 {RQ_PRG=6;
//								RETURN=1;
//								break;
//							 }
//              Chk_adrw;
//							PUT_WORD(ADRESS,R[R1]);                  /* ST */
				T();
				break;
		case 0x51:
				T00(COM[0]);
				break;
		case 0x52:
				T00(COM[0]);
				break;
		case 0x53:
				T00(COM[0]);
				break;
		case 0x54:
				// if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }
				Chk_adrw;
				//URR1=&R[R1];URREZ=GET_WORD(ADRESS);       /* N  */
				//*(URR1)=*(URR1)&URREZ;
				//R[R1]&=GET_WORD(ADRESS);
#ifdef DTA_370
				URREZ=GET_WORD(ADRESS);
				Dtaret;
				if ((R[R1]&=URREZ)==0) PSW_CC=0;
				else PSW_CC=1;
#else
				if ((R[R1]&=GET_WORD(ADRESS))==0) PSW_CC=0;
				else PSW_CC=1;
#endif
				//T();
				break;
		case 0x55:
				//if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }
				Chk_adrw;
				URR1=&R[R1];URREZ=GET_WORD(ADRESS);        /*  CL */
				Dtaret;
				URR2=&URREZ;
				if (*(URR1)==*(URR2)) PSW_CC=0;
				else if (*(URR1) < *(URR2)) PSW_CC=1;
						 else PSW_CC=2;
				//T();
				break;
		case 0x56:
				//if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }
				Chk_adrw;
				URREZ=GET_WORD(ADRESS);       /* O */
				Dtaret;
				if ((R[R1]|=URREZ)==0) PSW_CC=0;
				else PSW_CC=1;
				//T();
				break;
		case 0x57:
				//if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }
				Chk_adrw;
				URREZ=GET_WORD(ADRESS);       /* X */
				Dtaret;
				if ((R[R1]^=URREZ)==0) PSW_CC=0;
				else PSW_CC=1;
				//T();
				break;
		case 0x58:
				if (ADRESs&0x3)
//							 {RQ_PRG=6;
//								RETURN=1;
//								break;
//							 }
//
//        Chk_adrw;
//#ifdef DTA_370
//				URREZ=GET_WORD(ADRESS);
//				Dtaret;
//				R[R1]=URREZ;
//				break;            /* L */
//#else
//				R[R1]=GET_WORD(ADRESS);break;            /* L */
//#endif
				T();
		case 0x59:
				//if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }
				Chk_adrw;
				RREZ=GET_WORD(ADRESS);        /* C */
				Dtaret;
				if (((signed long)(R[R1]))==RREZ) PSW_CC=0;
				///else
				///	{FLA=_FLAGS;
				///	 if (FLA&0x0080) /*<0*/   PSW_CC=1;
				///	 else            /*>0*/   PSW_CC=2;
				///	}
				else if (((signed long)(R[R1]))<RREZ) PSW_CC=1;
						 else PSW_CC=2;
				break;
		case 0x5a:
				//if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }
				Chk_adrw;
				RR1=&R[R1];

        RREZ=GET_WORD(ADRESS);        /* A */
        if (TraceOutCmd)
        {
         fprintf(TraceOutCmd,"REG =%lx ADR=%lx VAl =%lx ",*RR1,ADRESS,RREZ);
        }
				Dtaret;
				*(RR1)+=RREZ;
#include "ds360sr.c"
				//T();
				break;
		case 0x5b:
				//if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }
				Chk_adrw;
				RR1=&R[R1];RREZ=GET_WORD(ADRESS);        /* S */
				Dtaret;
				*(RR1)+= -RREZ;
#include "ds360sr.c"
				//T();
				break;
		case 0x5c:
				//if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }																							 /* M */
				Chk_adrw;
				R1&=0xfe;
				uRREZ=GET_WORD(ADRESS);
				Dtaret;
				MR(&R[R1],&R[R1+1],&uRREZ);
				//T();
				break;
		case 0x5d:                                           /* D */
				//if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }
				Chk_adrw;
				R1&=0xfe;
				DEL_DEL=GET_WORD(ADRESS);
				Dtaret;
				DR(&R[R1],&R[R1+1],&DEL_DEL);
				//T();


				break;
		case 0x5e:
				//if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }
				Chk_adrw;																	/* AL */
#ifdef DTA_370
				RREZ=(signed long)GET_WORD(ADRESS);
				Dtaret;
				((signed long)R[R1])+=RREZ;
#else
				((signed long)R[R1])+=(signed long)GET_WORD(ADRESS);
#endif
#include "DS360ALR.C"
				//T();
				break;
		case 0x5f:
				//if (ADRESs&0x3)
				//			 {RQ_PRG=6;
				//				RETURN=1;
				//				break;
				//			 }
																				/* SL */
			 Chk_adrw;
#ifdef DTA_370
				RREZ=(signed long)GET_WORD(ADRESS);
				Dtaret;
				((signed long)R[R1])+=(-RREZ);
#else

				((signed long)R[R1])+=(-(signed long)GET_WORD(ADRESS));
#endif

#include "DS360ALR.C"
				//T();
				break;

	 }
}
void CODE5G(char far *COM)
{static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static unsigned long ADRESS;
#define B1 B2
#define I2 RX
#define X2 R2


 GET_OPERAND_RX;
 FORWARD_PSW;
 if (ADRESs&0x3)
	 {RQ_PRG=6;
		RETURN=1;
		return;
	 }
 PUT_WORD(ADRESS,R[R1]);
									 /* ST */
}
#undef B1
#undef I2
#undef X2

void CODE58(char far *COM)
{static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static unsigned long ADRESS;
 static unsigned long URREZ;
#define B1 B2
#define I2 RX
#define X2 R2


 GET_OPERAND_RX;
 FORWARD_PSW;

	 if (ADRESs&0x3)
	 {RQ_PRG=6;
		RETURN=1;
		return;
	 }
#ifdef DTA_370
	 URREZ=GET_WORD(ADRESS);
	 Dtaret;
	 R[R1]=URREZ;

#else
	 R[R1]=GET_WORD(ADRESS);            /* L */
#endif
}
#undef B1
#undef I2
#undef X2

