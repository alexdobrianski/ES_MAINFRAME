#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>
#include <conio.h>
#include <string.h>
#include <alloc.h>

#include "ds360psw.h"

#include "ds360dfn.h"
extern char EBCDIC_ASCII[256];
extern char ASCII_EBCDIC[256];
extern FILE *CONSO;
extern int IPL_adr;
extern int SHOW_SHOW;
static char OPER[256][5]=
{
"????","????","????","????","SPM ","BALR","BCTR","BCR ", /*  00  */
"SSK ","ISK ","SVC ","????","????","BASR","????","????",

"LPR ","LNR ","LTR ","LCR ","NR  ","CLR ","OR  ","XR  ", /*  10  */
"LR  ","CR  ","AR  ","SR  ","MR  ","DR  ","ALR ","SLR ",

"LPDR","LNDR","LTDR","LCDR","HDR ","????","????","????", /*  20  */
"LDR ","CDR ","ADR ","SDR ","MDR ","DDR ","AWR ","SWR ",

"LPER","LNER","LTER","LCER","HER ","????","????","????", /*  30  */
"LER ","CER ","AER ","SER ","MER ","DER ","AUR ","SUR ",

"STH ","LA  ","STC ","IC  ","EX  ","BAL ","BCT ","BC  ", /*  40  */
"LH  ","CH  ","AH  ","SH  ","MH  ","BAS ","CVD ","CVB ",

"ST  ","????","????","????","N   ","CL  ","O   ","X   ", /*  50  */
"L   ","C   ","A   ","S   ","M   ","D   ","AL  ","SL  ",

"STD ","????","????","????","????","????","????","????", /*  60  */
"LD  ","CD  ","AD  ","SD  ","MD  ","DD  ","AW  ","SW  ",

"STE ","????","????","????","????","????","????","????", /*  70  */
"LE  ","CE  ","AE  ","SE  ","ME  ","DE  ","AU  ","SU  ",

"SSM ","SPSW","LPSW","DIAG","WRD ","RDD ","BHX ","BXLE", /*  80  */
"SRL ","SLL ","SRA ","SLA ","SRDL","SLDL","SRDA","SLDA",

"STM ","TM  ","MVI ","TS  ","NI  ","CLI ","OI  ","XI  ", /*  90  */
"LM  ","HPR ","TIOB","CIO ","SIO ","TIO ","HIO ","TCH ",

"????","????","????","????","????","????","????","????", /*  a0  */
"????","????","????","????","????","????","????","????",

"STMC","LRA ","????","????","????","????","????","????", /*  b0  */
"LMC ","????","????","????","????","????","????","????",

"????","????","????","????","????","????","????","????", /*  c0  */
"????","????","????","????","????","????","????","????",

"XIO ","MVN ","MVC ","MVZ ","NC  ","CLC ","OC  ","XC  ", /*  d0  */
"????","????","????","????","TR  ","TRT ","ED  ","EDMK",

"????","????","????","????","????","????","????","????", /*  e0  */
"????","????","????","????","????","????","????","????",

"????","MVO ","PACK","UNPK","????","????","????","????", /*  f0  */
"ZAP ","CP  ","AP  ","SP  ","MP  ","DP  ","????","????"


};

static char far*psw_mask;
static char far*psw_key;
static char far* psw_amwp;
static unsigned int far* psw_cod_int;
static int far* psw_ilc;
static char far* psw_cc;
static char far* psw_prg_mask;
static unsigned long far* psw_adress;
static unsigned long far* register_r;
static long double far* register_r_float;
static char far*debug_command;
static int first_debug=0;
static int point_debug;
static int point_debug_beg;
extern FILE *TraceOut;
extern FILE *TraceOutCmd;
extern unsigned long DEBUG_PSW_ADRESS;
void print_regs(void)
{
 int i;
 unsigned long wd;
 unsigned long adr;
 if (TraceOutCmd)
 {
     if (PSW_AMWP&0x02) return;

     fprintf(TraceOutCmd,"\n\n   ");
 		 for (i=0;i<8;i++)
				 {wd=R[i];
					fprintf(TraceOutCmd," %08lx",wd);
				 }
			 fprintf(TraceOutCmd,"   ≥");
			 fprintf(TraceOutCmd,"\n≥  ");
			 for (i=8;i<16;i++)
				 {wd=R[i];
					fprintf(TraceOutCmd," %08lx",wd);
				 }
			 fprintf(TraceOutCmd,"   ≥");
			 fprintf(TraceOutCmd,"\n≥");
			 if (PSW_AMWP&0x08)
				fprintf(TraceOutCmd,"MASK=%02x KEY=%02x AMWP=%02x COD=%04x ILC=%1x CC=%1x ADRESS=%06lx ",
				PSW_EC_MASK,PSW_KEY,PSW_AMWP,PSW_COD_INT,
				PSW_ILC/2,PSW_CC,0xffffff&PSW_ADRESS);
			 else
				fprintf(TraceOutCmd,"MASK=%02x KEY=%02x AMWP=%02x COD=%04x ILC=%1x CC=%1x ADRESS=%06lx ",
				PSW_MASK,PSW_KEY,PSW_AMWP,PSW_COD_INT,
				PSW_ILC/2,PSW_CC,0xffffff&PSW_ADRESS);
			 fprintf(TraceOutCmd,"%4s",OPER[GET_BYTE(PSW_ADRESS)]);
			 for (i=0,adr=PSW_ADRESS;i<2;i++,adr++)
				 {fprintf(TraceOutCmd," %02x",GET_BYTE(adr));}
			 for (i=0,adr=PSW_ADRESS+2;i<2;i++,adr+=2)
				 {fprintf(TraceOutCmd," %02x%02x",GET_BYTE(adr),GET_BYTE(adr+1));}

 }
 else
 {
			 printf("\n⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø");
			 printf("\n≥  ");

			 for (i=0;i<8;i++)
				 {wd=R[i];
					printf(" %08lx",wd);
				 }
			 printf("   ≥");
			 printf("\n≥  ");
			 for (i=8;i<16;i++)
				 {wd=R[i];
					printf(" %08lx",wd);
				 }
			 printf("   ≥");
			 printf("\n≥");
			 if (PSW_AMWP&0x08)
				printf("MASK=%02x KEY=%02x AMWP=%02x COD=%04x ILC=%1x CC=%1x ADRESS=%06lx ",
				PSW_EC_MASK,PSW_KEY,PSW_AMWP,PSW_COD_INT,
				PSW_ILC/2,PSW_CC,0xffffff&PSW_ADRESS);
			 else
				printf("MASK=%02x KEY=%02x AMWP=%02x COD=%04x ILC=%1x CC=%1x ADRESS=%06lx ",
				PSW_MASK,PSW_KEY,PSW_AMWP,PSW_COD_INT,
				PSW_ILC/2,PSW_CC,0xffffff&PSW_ADRESS);
			 printf("%4s",OPER[GET_BYTE(PSW_ADRESS)]);
			 for (i=0,adr=PSW_ADRESS;i<2;i++,adr++)
				 {printf(" %02x",GET_BYTE(adr));}
			 for (i=0,adr=PSW_ADRESS+2;i<2;i++,adr+=2)
				 {printf(" %02x%02x",GET_BYTE(adr),GET_BYTE(adr+1));}
			 printf("≥");
			 printf("\n¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ");
 }

}

long ATOX(char *s)
{
 int i;
 unsigned long res;
 res = 0;
 for(i=0;i<strlen(s);i++)
	 {
		 if (s[i]>='0' && s[i]<='9')
		   {res*=16;
			  res+=s[i]-'0';
			 }
     else if (s[i]>='A' && s[i]<='F')
		   {res*=16;
				res+=s[i]-'A'+10;
			 }
		 else if (s[i]>='a' && s[i]<='f')
		   {res*=16;
				res+=s[i]-'a'+10;
			 }
     else break;
 }
 return res;
}

void HELPHELP(char far *STRIN)
{
 FILE *HELPH;
 static char stri[128];
 static int co;
 HELPH=fopen("DST360P.HLP","r");
 if (HELPH==NULL)
   {
    printf("HELP FILE ABSEND. CHECK DST360P.HLP FILE.");
    return;
   }
 co=0;
NEXTREAD:
 if (fgets(stri,127,HELPH)==NULL) goto ENDREAD;
 stri[strlen(stri)-1]=0;
 if (strcmp(STRIN,stri)!=0) goto NEXTREAD;
NEXTREAD2:
 if (fgets(stri,127,HELPH)==NULL) goto ENDREAD;
 stri[strlen(stri)-1]=0;
 if (strcmp(stri,"##")==0) goto ENDREAD;
 if (strchr(stri,'#'))
   {*strchr(stri,'#')=0;
    printf("%s",stri);
   }
 else
   printf("\n%s",stri);
 if (++co==23)
	 {
		co=0;
		printf("\n MORE HELP press any KEY");
		getch();
	 }
 goto NEXTREAD2;
ENDREAD:
 fclose(HELPH);

}
void Cpu(void)
{
		 HELPHELP("## êÖÜàå èìãúíÄ éèÖêÄíéêÄ (ÇõïéÑ àá èêéÉêÄååõ: ESC)");
}
void Co(void)
{
	HELPHELP("##ùåìãüñàü è/å íÄÅ ESC");
}
int RUN_OPERATOR(void)
{
 static char SIMBOL;
 static char STRING[400];
 static int i,j,k;
 static unsigned long adr;
 static unsigned long wd;
 static FILE *TTRR;
 static char oldpress;
 static int FFF[32];
 static int FL_RUN_REG=0;
 // if (RQ_TRACE==0) printf("\n√ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒoperator mode (to stop-`n` to help -`?`ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¥");

 //if ((RQ_TRACE&0x05) && oldpress==13) ungetch('r');
 if (RQ_TRACE&0x04)
	 {if (TRACE_COMMAND[GET_BYTE(PSW_ADRESS)])
		 {ungetch('r');
		 }
		else return(0);
	 }

NEXTS:
 if (kbhit())
	 {
	 }
 else
	 {
    if (TraceOutCmd)
    {
      SIMBOL=0;
      ungetch(0x42);
      goto DO_COMM;
    }
    if ((RQ_TRACE&0x02) && (RQ_PRTR==1) && (RQ_TRACE&0x01)) ungetch('f');
		if ((RQ_TRACE==0x11) && (RQ_PRTR==1))
			{if (FL_RUN_REG)
				 {FL_RUN_REG=0;ungetch(13);
				 }
			 else
				 {
					FL_RUN_REG=1;ungetch('r');
				 }
			}


	 }
 SIMBOL=getch();
 //if (RQ_TRACE==0) printf("\n=>%c",SIMBOL);
DO_COMM:
 oldpress=SIMBOL;
 switch(SIMBOL)
	 {
		case 27:
            HELPHELP("##Pressed-ESC: EXIT request");

						SIMBOL=getch();
						putchar(SIMBOL);
						if (SIMBOL=='y' || SIMBOL=='Y')
							{
							 HELPHELP("##Wait Please");
							 RQ_EXIT=1;;return(0);
							}
						else
              {Cpu();
               return(0);
              }
		case 'q':case 'Q':
						HELPHELP("##Pressed-Q: EXIT without SAVE request");

						SIMBOL=getch();
						putchar(SIMBOL);
						if (SIMBOL=='y' || SIMBOL=='Y')
							{
							 return(1);
							}
						else
              {Cpu();
               return(0);
              }

		case '?':
HELP:
			 HELPHELP("##HELP1");
			 Cpu();
			 return(0);
			 break;
		case 'i':case 'I':
			 HELPHELP("##IPL");
			 gets(STRING);
			 HELPHELP("##IPL_");
			 if (STRING[0]==0 || STRING[0]==13 || STRING[0]==27)
				 {Cpu();
					return(0);
				 }
			 adr=ATOX(STRING);
			 PUT_WORD(0x48l,0x0l);
			 PUT_WORD(0x0l,0x02000000l);
			 PUT_WORD(0x4l,0x60000018l);
			 TIO_DEVICE(adr);
			 SIO_DEVICE(adr);
			 IPL_adr=adr;
			 RQ_IPL=1;
			 RQ_TIMER=0;
			 RQ_TIMER_CPU=0;
			 RQ_COMP=0;
			 RQ_PRG=0;
			 PSW_AMWP=0x02;
			 PSW_ADRESS=0l;
			 PSW_MASK=0xfe;
			 PSW_KEY=0;
			 PSW_CC=0;

			 R370[0]=0x00000007;
			 R370[1]=0;
			 R370[2]=0xe0000000;
			 R370[4]=0;
			 R370[5]=0;
			 R370[6]=0;
			 R370[7]=0;
			 R370[8]=0;
			 R370[9]=0;
			 R370[10]=0;
			 R370[11]=0;
			 R370[12]=0;
			 R370[13]=0;
			 R370[14]=0xc2000000;
			 R370[15]=0x00000100;
			 DINTRADR=0;
			 TLB_RESET();
			 PREFIX_PR=0;
			 //getch();
			 Cpu();
			 return(0);
			 break;
		case 'x':case 'X':if (kbhit()) getch();
			 printf("\n√ƒƒƒƒƒƒƒoutput adress>");

			 gets(STRING);
			 if (STRING[0]==0) goto NOADR;
			 adr=ATOX(STRING);

NOADR: printf(" %08lx|",adr);
			 for (i=0;i<4;i++,adr+=4l)
				 {wd=GET_WORD(adr);
					printf("%08lx ",wd);
				 }
			 adr-=16l;
			 for(i=0;i<32;i++,adr++)
				 {printf("%c",EBCDIC_ASCII[GET_BYTE(adr)]);
				 }
			 printf("\n         |");
			 adr-=16l;
			 for (i=0;i<4;i++,adr+=4l)
				 {wd=GET_WORD(adr);
					printf("%08lx ",wd);
				 }
			 Cpu();
			 break;
		case 'd':case 'D':if (kbhit()) getch();
			 printf("\nD ->");
       HELPHELP("##EDIT1");

			 gets(STRING);
       if (STRING[0]) adr=ATOX(STRING);
			 for (j=0; j<4; j++)
			 	 {char Temp[16];
          printf("\n%08lx *",adr);
			    for (i=0;i<4;i++,adr+=4l)
				    {
             wd=GET_WORD(adr);
					   printf(" %08lx",wd);
             Temp[i*4+0] = wd >> 24;
             Temp[i*4+1] = (wd >> 16)&0xff;
             Temp[i*4+2] = (wd >> 8)&0xff;
             Temp[i*4+3] = wd&0xff;
				    }
          printf("  *");
          for (i=0;i<16;i++)
            printf("%c",EBCDIC_ASCII[Temp[i]]);
          printf("*             ");

         }
       printf("\n");
			 Cpu();
			 break;
		case 'e':case 'E':
			 printf("\nE ->");
       HELPHELP("##EDIT1");

			 gets(STRING);
			 adr=ATOX(STRING);
       if (STRING[0] && STRING[0]!=27)
         {
          wd=GET_WORD(adr);
			    printf("\n%08lx* %08lx:->",adr,wd);
          HELPHELP("##EDIT2");

			    gets(STRING);
          if (STRING[0] && STRING[0]!=27)
            {
			       wd=ATOX(STRING);
			       PUT_WORD(adr,wd);
             printf("\n");
			       Cpu();
            }
         }
			 break;
		case 13:
			 return(0);
		case 't':case 'T':
			 HELPHELP("##TRACE");
			 //printf("\n√ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒtrace started    ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¥");
			 //printf("\náÄÑÄâíÖ íàè íêÄëëõ: c-command,i-i/o,u-unit,n-next com,ESC-exit\n");
			 i=getch();
			 putchar(i);
			 switch(i)
				 {case 27:
						 break;
          case '1':
             if (TraceOutCmd) TraceOut=TraceOutCmd;
             else
                if (TraceOut==NULL) TraceOut=fopen("TraceIO.out","a");
             break;
          case '2':
             printf("\nSTOP ADRESS ?:");
						 gets(STRING);
             DEBUG_PSW_ADRESS = ATOX(STRING);
             break;
					case 'c':case 'C':RQ_TRACE=0x11;TRACE_UNIT=0;
						 printf("\nTRACE COMMAND\n");
						 break;

					case 'i':case 'I':RQ_TRACE=2;TRACE_UNIT=0;
						 printf("\nTRACE I/O\n");

						 break;

					case 'u':case 'U':printf("\nUNIT ? (XXX):");
						 gets(STRING);

						 adr=ATOX(STRING);
							TRACE_UNIT=adr;RQ_TRACE=2;
							printf("\nTRACE UNIT=%x \n",TRACE_UNIT);
							break;
					 case 'n':case 'N':RQ_TRACE=4;
							for(i=0;i<256;i++) TRACE_COMMAND[i]=1;
							break;
					 case 'p': case 'P':
              RQ_TRACE=0x11;
							TraceOutCmd=fopen("TraceCmd.out","a");
							break;
					 case 'b': case 'B':
							RQ_DEBUG=1;
							printf("\nBEGIN DEBUG");
							break;
					 case 'e': case 'E':
							RQ_DEBUG=1;
							printf("\nEND DEBUG");
							break;
					 case 'k': case 'K':
					 printf("\nPRINTING. WAIT PLEASE");
							debug_print;
							break;

				 }
			 //RQ_TRACE=1;
			 return(0);
		case 's':case 'S': printf("\nSTOP TRACE\n");
			 RQ_TRACE=0;
			 Cpu();
       if (TraceOut) fclose(TraceOut);
       TraceOut=NULL;
       if (TraceOutCmd) fclose(TraceOutCmd);
       TraceOutCmd=NULL;
			 return(0);
		case 'f':case 'F':
			 printf("\n√ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒtrace ended      ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¥");

			 if (RQ_TRACE==4)
				 {
					printf("\n REMOVE COMMAND");
					gets(STRING);
					adr=ATOX(STRING);
					TRACE_COMMAND[adr]=0;
				 }
			 else if (RQ_TRACE==0x11)
				 {RQ_TRACE=0;
				 }
			 else if (RQ_TRACE&0x02)
				 {

					RQ_TRACE&=0xfffe;
				 }
			 Cpu();
			 return(0);
		case 'r':case 'R':
       print_regs();
			 //if (TTRR==NULL) TTRR=fopen("TTRR","w");
			 //fprintf(TTRR,"\n%06lx %4s   ",PSW_ADRESS,OPER[GET_BYTE(PSW_ADRESS)]);
			 //for (i=0,adr=PSW_ADRESS;i<6;i++,adr++)
			 //	 {fprintf(TTRR,"%02x",GET_BYTE(adr));}

			 Cpu();
			 break;
		case 'b': case 'B':
			 printf("\n floating point registers:\n");
			 for(i=0;i<=6;i+=2)
				 {printf("RF%d=%Lg ",i,R_FLOAT[i]);
				 }
			 Cpu();
			 break;
		case '~':
NNGET: HELPHELP("##èéÑäãûóàíÖëú ä íÖêåàçÄãì");
			 for(i=0,k=0;i<NUMBER_IO;i++)
				 {
					if (TYPE_IO_DEVICE[i]=='C' || TYPE_IO_DEVICE[i]=='7')
					 {
						printf ("\n==> F%d %03x %1c %02x %15s",
										 k+1,ADRESS_IO_DEVICE[i],
														TYPE_IO_DEVICE[i],
																 FLAG_IO_DEVICE[i],
																		 NAME_FILE_IO_DEVICE[i]);
						FFF[k++]=i;
					 }
				 }
			 HELPHELP("##FN - èéÑäãûóàíëü ä ìëíê");
NGET:
			 i=getch();
			 switch(i)
				 {
					case 0:i=getch();
								 i-=0x3b;
								 i=FFF[i];
								 if (TYPE_IO_DEVICE[i]=='7')
									 {RQ_7920=ADRESS_IO_DEVICE[i];
										//printf("\n\n\nèéÑäãûóàãàëú ä ìëíêéâëíÇì UNIT=%x\n",RQ_7920);
										return(0);
									 }
								 else if (TYPE_IO_DEVICE[i]=='C')
									 {
										RQ_7920=0;
										RQ_CONSOLE=1;
										Co();//HELPHELP("##ùåìãüñàü è/å íÄÅ ESC");
										#ifdef EN_INTER
										printf("\033[47m\033[30m");
										#endif

										if (CONSO!=NULL)
											{fclose(CONSO);
											 CONSO=fopen(NAME_FILE_IO_DEVICE[i],"r");
											 if (CONSO!=NULL)
												 {
													while(fgets(STRING,80,CONSO)!=NULL)
														{printf("%s",STRING);
														}
													printf("\n");
													fclose(CONSO);
												 }
											 CONSO=fopen(NAME_FILE_IO_DEVICE[i],"a");
											}
										else
											{CONSO=fopen(NAME_FILE_IO_DEVICE[i],"r");
											 if (CONSO!=NULL)
												 {
													while(fgets(STRING,80,CONSO)!=NULL)
														{printf("%s",STRING);
														}
													printf("\n");
													fclose(CONSO);
												 }
											 CONSO=NULL;

											}
										Co();//HELPHELP("##ùåìãüñàü è/å íÄÅ ESC");
									 }
									 else
											 {
												HELPHELP ("##çÖÇÖêçé áÄÑÄçé ìëíêéâëíÇé");
												goto NNGET;
											 }
								 RQ_7920=0;
								 break;
					case 27:RQ_7920=0;RQ_CONSOLE=0;
                 printf("\033[2J");
								 Cpu();
								 return(0);
								 break;
					case 9:RQ_7920=0;RQ_CONSOLE=0;
								 Cpu();
								 return(0);
								 break;
					default:goto NNGET;
								 break;
				 }
			 RQ_7920=0;
			 return(0);
			 break;
		case 'l':
REQU:
			 HELPHELP("##REQUEST or READY option:");
			 for(i=0;i<NUMBER_IO;i++)
				 {
					printf ("\n ==>F%d %03x %1c %02x %15s  %d",
										 i+1,ADRESS_IO_DEVICE[i],
														TYPE_IO_DEVICE[i],
																 FLAG_IO_DEVICE[i],
																		 NAME_FILE_IO_DEVICE[i],
																				IO_STATUS[i][5]);





				 }
B_OK:
			 HELPHELP("##press ESC - to exit REQUEST");
			 i=getch();
			 switch(i)
				 {
					case 0:i=getch();
								 i-=0x3b;
								 //printf("\n PRESSED F%d  - UNIT=%03x \n",i+'0',
								 //				ADRESS_IO_DEVICE[i]);
                 printf("\033[2J");
								 Cpu();
								 break;

					case 27://printf("\n PRESSED ESC - EXIT REQUEST option\n");
                 printf("\033[2J");
								 Cpu();
                 return(0);
					default: goto B_OK;

				 }

			 FLAG_IO_DEVICE[i]=RQ_INT;
			 IO_STATUS[i][1]=U0/*|U5*/;
			 if (TYPE_IO_DEVICE[i]=='T')
				 {IO_STATUS[i][1]=0x04;
				 }
			 CSW_COUNT[i]=0;
			 CSW_CAW[i]=0;
			 return(0);
			 break;
		case 9:
			 FLAG_IO_DEVICE[0]=RQ_INT;
			 IO_STATUS[0][1]=U0/*|U5*/;
			 CSW_COUNT[0]=0;
			 CSW_CAW[0]=0;
			 return(0);
			 break;
		case 0:SIMBOL=getch();
			 switch(SIMBOL)
				 {
					case 0x3b: /* F1 */
							 goto HELP;
					case 0x3c: /* F2 */
							 break;
					case 0x3d: /* F3 */
							 break;
					case 0x3e: /* F4 */
							 SHOW_SHOW=0;
							 return(0);
							 break;
					case 0x3f: /* F5 */
							 SHOW_SHOW=1;
							 return(0);
							 break;
					case 0x40: /* F6 */
							 break;
					case 0x41: /* F7 */
							 return(0);
							 break;
					case 0x42: /* F8 */
               print_regs();
							 oldpress=13;
							 return(0);
							 break;
					case 0x43: /* F9 */
							 goto REQU;
							 break;
					case 0x44: /* F10 */
							 goto NNGET;
							 break;
				 }
			 break;
	 }
 goto NEXTS;
}
#undef DEBUG_COM
#define DEBUG_COM 200
#ifdef DEBUG_COM
	void Debug_com(void)
		{
		 if (first_debug==0)
				{point_debug=0;point_debug_beg=0;
				 first_debug=1;
				 if ((psw_mask=farmalloc(DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				 if ((psw_key=farmalloc(DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				 if ((psw_amwp=farmalloc(DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				 if ((psw_cod_int=farmalloc(2*DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				 if ((psw_ilc=farmalloc(2*DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				 if ((psw_cc=farmalloc(DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				 if ((psw_prg_mask=farmalloc(DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				 if ((psw_adress=farmalloc(4*DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				 if ((register_r=farmalloc(4*16*DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				 if ((register_r_float=farmalloc(10*8*DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				 if ((debug_command=farmalloc(6*DEBUG_COM))==NULL) printf("\nDEBUG:ERROR (memory)");
				}
		 else
				{
				 psw_mask[point_debug]=PSW_MASK;
				 psw_key[point_debug]=PSW_KEY;
				 psw_amwp[point_debug]=PSW_AMWP;
				 psw_cod_int[point_debug]=PSW_COD_INT;
				 psw_ilc[point_debug]=PSW_ILC;
				 psw_cc[point_debug]=PSW_CC;
				 psw_prg_mask[point_debug]=PSW_MASK;
				 psw_adress[point_debug]=PSW_ADRESS;
				 memcpy(&register_r[16*point_debug],&R[0],64);
				 memcpy(&register_r_float[8*point_debug],&R_FLOAT[0],80);
				 MOVE_360_TO_MEM(PSW_ADRESS,&debug_command[6*point_debug],6);
				 point_debug++;
				 if (point_debug>(DEBUG_COM-1))
					 {
						if (point_debug_beg==0) point_debug_beg=1;
						point_debug=0;
					 }

				}
		}
	 void Debug_print(void)
		{
		 FILE *DEBUG;
		 static int i,j,k;
		 static unsigned long wd;
		 DEBUG=fopen("debg.dbg","a");
		 fprintf(DEBUG,"\n=====");
		 if ((point_debug==0) && (point_debug_beg==0))
			 goto ENDR;
		 if (point_debug_beg==0) {i=0;j=point_debug;}
		 else
			 {
				i=point_debug+1;j=point_debug;
				if (i>(DEBUG_COM-1)) i=0;
			 }
		 for(;i!=j;i++)
			 {
				if (i>(DEBUG_COM-1)) i=0;
				fprintf(DEBUG,"\n≥  ");

				for (k=0;k<8;k++)
					{wd=register_r[i*16+k];
					 fprintf(DEBUG," %08lx",wd);
					}
				fprintf(DEBUG,"   ≥");
				fprintf(DEBUG,"\n≥  ");
				for (k=8;k<16;k++)
					{wd=register_r[i*16+k];
					 fprintf(DEBUG," %08lx",wd);
					}
				fprintf(DEBUG,"   ≥");
				fprintf(DEBUG,"\n≥");
				fprintf(DEBUG,"MASK=%02x KEY=%02x AMWP=%02x COD=%04x ILC=%1x CC=%1x ADRESS=%06lx ",
								psw_mask[i],psw_key[i],psw_amwp[i],psw_cod_int[i],
								psw_ilc[i]/2,psw_cc[i],psw_adress[i]);
				fprintf(DEBUG,"%4s",OPER[debug_command[6*i]]);
				for (k=0;k<6;k++)
					{fprintf(DEBUG,"%02x",debug_command[6*i+k]);}
			 fprintf(DEBUG,"≥");
			 fprintf(DEBUG,"\nƒƒƒƒƒƒƒ");

			 }
ENDR:
		 fprintf(DEBUG,"++++++++");
		 fclose(DEBUG);
		 point_debug=0;point_debug_beg=0;
		}
	 void Debug_close(void)
		{
		 if (first_debug)
			 {
				farfree(psw_mask);
				farfree(psw_key);
				farfree(psw_amwp);
				farfree(psw_cod_int);
				farfree(psw_ilc);
				farfree(psw_cc);
				farfree(psw_prg_mask);
				farfree(psw_adress);
				farfree(register_r);
				farfree(register_r_float);
				farfree(debug_command);
			 }
		}
#endif