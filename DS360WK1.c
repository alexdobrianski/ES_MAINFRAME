#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>
#include <mem.h>
#include <string.h>
#include "ds360dfn.h"
#include "xmsif.h"
#include <signal.h>
#include <process.h>
#include <alloc.h>
#include <stdlib.h>

#define max_block_memory 512
#define max_block_buf 50
#define max_device 20



static int COMMAND_STAT[256];
unsigned long DEBUG_PSW_ADRESS;

static char far *MEMORY[max_block_memory];
static int MEMORY_TO_BLOCK[max_block_memory];
static char MEMORY_KEY[max_block_memory];
static int MAX_BLOCK_MEMORY=max_block_memory;
static int MEMORY_BLOCK[max_block_buf];
static int MEMORY_USE[max_block_buf];
static int MAX_BLOCK_BUF=max_block_buf;
//static char MEM[22600];
static char far *MEM;
static int MEMORY_FILE;
static int STATUS_FILE;
static int NEXT_BLOCK_BUF=0;

static char far*POINTER;
char far *POINTER_T;
static int OFFSET_ADRESS,NUMBER_BLOCK;
static unsigned long NUMBER_BLOCK_LONG=0;

int RETURN;
int RQ_SVC;
int RQ_PRG;
int RQ_IPL;
int RQ_TRACE;
int RQ_TIMER;
int RQ_TIMER_CPU;
int RQ_COMP;
unsigned long CLOCK1_CPU;
unsigned long CLOCK2_CPU;
unsigned long REAL_TIME_CPU;
unsigned long COUNT_CPU;

unsigned long CLOCK1_COMP;
unsigned long CLOCK2_COMP;
unsigned long REAL_TIME_COMP;
unsigned long COUNT_COMP;


int COUNT_1000;
unsigned long CLOCK1;
unsigned long CLOCK2;
unsigned long REAL_TIME;
int RQ_EXIT;
int RQ_7920;
int RQ_CONSOLE;
/******************* 370 REGISTER GROUP *******************/
unsigned long R370[16];

/******************* REGISTER GROUP ***********************/
unsigned long R[16];
long double R_FLOAT[8];

/******************* PSW GROUP ****************************/
char far *PSW_BEGIN;
char PSW_MASK;
char PSW_KEY;
char PSW_AMWP;
unsigned int PSW_COD_INT;
int  PSW_ILC;
char PSW_CC;
char PSW_PRG_MASK;
unsigned long PSW_ADRESS;
char PSW_EC_MASK;
unsigned int TLB[4096];
int DINTRADR;
unsigned long ADRESS_DTA;
unsigned long PREFIX_PR;

/*************************** CSW GROUP ********************/
int ADRESS_IO_DEVICE[max_device];
char TYPE_IO_DEVICE[max_device];
char FLAG_IO_DEVICE[max_device];
char NAME_FILE_IO_DEVICE[max_device][40];
char IO_STATUS[max_device][16];
unsigned char CSW_COD[max_device];
unsigned long CSW_ADRESS[max_device];
unsigned char CSW_MOD[max_device];
unsigned char CSW_TP[max_device];
unsigned long CSW_COUNT[max_device];
unsigned long CSW_CAW[max_device];
unsigned long OFFSET_IO_DEVICE[max_device];
unsigned long OLD_OFFSET_IO_DEVICE[max_device];
int OLD_OPERATION[max_device];
int FILE_IO_DEVICE[max_device];
int NUMBER_IO;
int NUMBER_IO_CUR;
unsigned int DASD[max_device][10];
char DASD_MASK[max_device];
char far*AREA_7920[max_device];
char far*AREA_DASD[max_device];
int DASD_MEM_CYL[max_device][20];
int DASD_MEM_TRK[max_device][20];
int DASD_MEM_WRITE[max_device][20];
int DASD_MEM_POINT[max_device];
int DASD_MEM_XMS[max_device];
int DASD_MEM_C[max_device];
int DASD_MEM_T[max_device];
struct SOBSTV_ADRESS{
										char PP;
										char CYL_HH;
										char CYL_LL;
										char TRK_HH;
										char TRK_LL;
						 };
struct RECORD{
							char MY_F;
							char F;
							char CC_H;
							char CC_L;
							char HH_H;
							char HH_L;
							char R;
							char KL;
							char DL_H;
							char DL_L;
						 };
char far*RR_ADRESS[max_device];
char COUNT_MARK[max_device];
char DASD_WRITE[max_device];
char DASD_HEADER[max_device];
int TRACE_UNIT;
char TRACE_COMMAND[256];
char far*TR_CYL[max_device];
int RQ_PRTR;
extern SHOW_SHOW;
int RQ_DEBUG;
char DEFAULT_RDR_STRING[80];
extern int FLAG_OPEN_CONNECTION;

#define DASD_CYL 0
#define DASD_TRK 1
#define DASD_MAX_BYTE 2
#define DASD_LEN 3
#define DASD_CUR_CYL 4
#define DASD_CUR_TRK 5
#define DASD_CUR_RR 6

#define RQ_INT  0x01
#define RQ_WORK 0x02
#define RQ_PCI  0x04
#define S0 0x80
#define S1 0x40
#define S2 0x20
#define S3 0x10
#define S4 0x08
#define S5 0x04
#define S6 0x02
#define S7 0x01

#define U0 0x80
#define U1 0x40
#define U2 0x20
#define U3 0x10
#define U4 0x08
#define U5 0x04
#define U6 0x02
#define U7 0x01

#define BYTE_CHANEL 0
#define BYTE_IO 1
#define BYTE_IO_U_0 2
#define BYTE_IO_U_1 3
#define BYTE_IO_U_2 4
#define BYTE_IO_U_3 5
#define BYTE_IO_U_4 6
#define BYTE_IO_U_5 7

#include "ds360dfn.h"

/*************************** ICL **************************/
static char ILC[256]=
{
 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,

 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
};

 void (*POINT[256])(char far*)=
 {
	CODE00,CODE00,CODE00,CODE00,CODE00,CODE05,CODE06,CODE07,
	CODE00,CODE00,CODE00,CODE00,CODE00,CODE00,CODE00,CODE00,
	CODE10,CODE10,CODE10,CODE10,CODE10,CODE10,CODE10,CODE10,
	CODE18,CODE10,CODE10,CODE10,CODE10,CODE10,CODE10,CODE10,
	CODE20,CODE20,CODE20,CODE20,CODE20,CODE20,CODE20,CODE20,
	CODE20,CODE20,CODE20,CODE20,CODE20,CODE20,CODE20,CODE20,
	CODE30,CODE30,CODE30,CODE30,CODE30,CODE30,CODE30,CODE30,
	CODE30,CODE30,CODE30,CODE30,CODE30,CODE30,CODE30,CODE30,
	CODE40,CODE41,CODE40,CODE40,CODE44,CODE45,CODE40,CODE47,
	CODE48,CODE40,CODE40,CODE40,CODE40,CODE40,CODE40,CODE40,
	CODE5G,CODE50,CODE50,CODE50,CODE50,CODE50,CODE50,CODE50,
	CODE58,CODE50,CODE50,CODE50,CODE50,CODE50,CODE50,CODE50,
	CODE60,CODE60,CODE60,CODE60,CODE60,CODE60,CODE60,CODE60,
	CODE60,CODE60,CODE60,CODE60,CODE60,CODE60,CODE60,CODE60,
	CODE70,CODE70,CODE70,CODE70,CODE70,CODE70,CODE70,CODE70,
	CODE70,CODE70,CODE70,CODE70,CODE70,CODE70,CODE70,CODE70,
	CODE80,CODE80,CODE80,CODE80,CODE80,CODE80,CODE80,CODE80,
	CODE80,CODE80,CODE80,CODE80,CODE80,CODE80,CODE80,CODE80,
	CODE90,CODE91,CODE90,CODE90,CODE90,CODE90,CODE90,CODE90,
	CODE90,CODE90,CODE90,CODE90,CODE90,CODE90,CODE90,CODE90,
	CODEA0,CODEA0,CODEA0,CODEA0,CODEA0,CODEA0,CODEA0,CODEA0,
	CODEA0,CODEA0,CODEA0,CODEA0,CODEA0,CODEA0,CODEA0,CODEA0,
	CODEB0,CODEB0,CODEB0,CODEB0,CODEB0,CODEB0,CODEB0,CODEB0,
	CODEB0,CODEB0,CODEB0,CODEB0,CODEB0,CODEB0,CODEB0,CODEB0,
	CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,
	CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,
	CODED0,CODED0,CODED2,CODED0,CODED7,CODED5,CODED7,CODED7,
	CODED0,CODED0,CODED0,CODED0,CODED0,CODED0,CODED0,CODED0,
	CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,
	CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,CODEGG,
	CODEF0,CODEF0,CODEF0,CODEF0,CODEF0,CODEF0,CODEF0,CODEF0,
	CODEF0,CODEF0,CODEF0,CODEF0,CODEF0,CODEF0,CODEF0,CODEF0
 };


/*****************************************************************/
/*    XMS                                                        */
/*****************************************************************/
static int           XMS_status;
static unsigned long XMS_BLOCK_SIZE;
static int           XMS_ALLOC_HANDLER;
static unsigned long XMS_OFFSET;
static char far     *XMS_POINTER_STR;
static unsigned long XMS_P_STR;


extern char bios_32[64];
extern char serial_number[64];
extern int IPL_adr;


extern FILE *TraceOut;
FILE *TraceOutCmd;


/******************************************************************/
typedef void (*fptr)(void);

void Catcher(void)
{
	signal(SIGFPE, (fptr)Catcher);  //  ******reinstall signal handler
	if (PSW_PRG_MASK&0x01)
	 {
	  RQ_PRG=0x000e;
		RETURN=1;
	 }

}



/*****************************************************************/
/*     SSK                                                       */
/*****************************************************************/
void C_SSK(unsigned long RR1,unsigned long RR2)
{

 if ( ((RR2&0x00ffffff) >>11) >= MAX_BLOCK_MEMORY)
		 {HELPHELP("#1MAX MEMORY BLOCK (command SSK)");
			PR();/*RQ_TRACE=1;*/RETURN=1;
			RQ_PRG=5;
			return;
		 }
 else MEMORY_KEY[((RR2&0x00ffffff)>>11)]=(0x000000f0&RR1) >> 4;
}
/*****************************************************************/
/*     ISK                                                       */
/*****************************************************************/
unsigned long C_ISK(unsigned long RR2)
{if (PSW_AMWP&0x08)  /* EC */
	 return( (((unsigned long)MEMORY_KEY[((RR2&0x00ffffff)>>11)])<<4)|0x6l );
 else
	 return( ((unsigned long)MEMORY_KEY[((RR2&0x00ffffff)>>11)])<<4 );
}

/*****************************************************************/
/*  инициализация памяти                                         */
/*****************************************************************
/* 1.выделение 102Кb
/* 2.чтение переменных используемых при работе процессора IBM-360
/* 3.проверка на наличие XMS и копирование памяти памяти IBM-360
/*   в XMS
/*****************************************************************/
int INIT_MEMORY(void)
{
 static int i;
 MEM=farmalloc(102400L);//printf(" %p ",MEM);
 if (MEM==NULL) {HELPHELP("##НЕДОСТАТОЧНО ПАМЯТИ");return(1);}
 for(i=0;i<MAX_BLOCK_MEMORY;i++) {MEMORY[i]=NULL;MEMORY_TO_BLOCK[i]=-1;}
 for(i=0;i<MAX_BLOCK_BUF;i++) {MEMORY_USE[i]=-1;MEMORY_BLOCK[i]=-1;}
 MEMORY_FILE=open("MEMORY",O_RDWR|O_BINARY|O_CREAT,S_IREAD|S_IWRITE);
 STATUS_FILE=open("STATUS",O_RDWR|O_BINARY|O_CREAT,S_IREAD|S_IWRITE);
 if (STATUS_FILE>0)
	{
	 read(STATUS_FILE,&R[0],16*4);
	 read(STATUS_FILE,&PSW_MASK,1);
	 read(STATUS_FILE,&PSW_KEY,1);
	 read(STATUS_FILE,&PSW_AMWP,1);
	 read(STATUS_FILE,&PSW_COD_INT,2);
	 PSW_ILC=0;
	 read(STATUS_FILE,&PSW_ILC,1);
	 read(STATUS_FILE,&PSW_CC,1);
	 read(STATUS_FILE,&PSW_PRG_MASK,1);
	 read(STATUS_FILE,&PSW_ADRESS,4);
	 read(STATUS_FILE,&RQ_TRACE,2);

	 read(STATUS_FILE,&RETURN,2);
	 read(STATUS_FILE,&RQ_SVC,2);
	 read(STATUS_FILE,&RQ_PRG,2);
	 read(STATUS_FILE,&RQ_IPL,2);
	 read(STATUS_FILE,&RQ_TIMER,2);
	 read(STATUS_FILE,R_FLOAT,8*10);
	 for(i=0;i<max_block_memory;i++)
		 {read(STATUS_FILE,&MEMORY_KEY[i],1);
		 }
	 read(STATUS_FILE,&R370[0],16*4);
	 read(STATUS_FILE,&CLOCK1,4);
	 read(STATUS_FILE,&CLOCK2,4);
	 read(STATUS_FILE,&REAL_TIME,4);
	 read(STATUS_FILE,&IPL_adr,2);
	 read(STATUS_FILE,&PSW_EC_MASK,1);
	 read(STATUS_FILE,TLB,8192);
	 read(STATUS_FILE,&CLOCK1_CPU,4);
	 read(STATUS_FILE,&CLOCK2_CPU,4);
	 read(STATUS_FILE,&REAL_TIME_CPU,4);
	 read(STATUS_FILE,&COUNT_CPU,4);
	 read(STATUS_FILE,&CLOCK1_COMP,4);
	 read(STATUS_FILE,&CLOCK2_COMP,4);
	 read(STATUS_FILE,&REAL_TIME_COMP,4);
	 read(STATUS_FILE,&COUNT_COMP,4);
	 read(STATUS_FILE,&PREFIX_PR,4);
	}
#ifdef FORXMS
XMS_status = XMMlibinit();
if (XMS_status==0)    /* YES XMS */
	{XMS_BLOCK_SIZE=XMMcoreleft();
	 if (XMS_BLOCK_SIZE<2048L*((unsigned long)max_block_memory))
		 {
			HELPHELP("## NOT ENOUGT MEMORY IN XMS");
			return(1);
		 }
	 XMS_ALLOC_HANDLER=XMMalloc(((unsigned long)max_block_memory)*2048L);
	 XMS_OFFSET=0;
	 HELPHELP("##INITIALISATION XMS:");
	 for(i=0;i<max_block_memory;i++)
		 {//printf("X");
			read(MEMORY_FILE,(char far*)MEM,2048);
			XMS_POINTER_STR=MEM;
			XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
			XMS_status=_XMMcopy(2048,0,XMS_P_STR,XMS_ALLOC_HANDLER,XMS_OFFSET);

			if (XMS_status!=0)
				 {
					HELPHELP("##ERROR in XMS INITIALISATION");
					return(1);
				 }
			XMS_OFFSET+=2048L;
		 }
	 HELPHELP("##END-OFF-INITIALISATION XMS.");
	}
else
	{HELPHELP("## NO XMS !!! check the XMS drive");
	 return(1);
	}
#endif

 NUMBER_BLOCK=0xffff;
 NUMBER_BLOCK_LONG=0xffffffff;
 return(0);
}


/*****************************************************************/
/*  закрыть оперативную память                                   */
/*****************************************************************
/*  1. проверяет, вносились ли изменения в страницы, находящиеся в
/*     данный момент в оперативной памяти 386/486 и записывает страницы
/*     в XMS
/*  2. записывает содержимое XMS на жесткий диск в файл MEMORY
/*  3. записывает значения переменных необходимых для работы процессора
/*     IBM 360 в файл STATUS
/*
/*****************************************************************/
void CLOSE_MEMORY(void)

{
 static int i;
 static unsigned long NUMBER_BLOCK_LONG;
 for(i=0;i<MAX_BLOCK_BUF;i++)
	 {
		if (MEMORY_USE[i]==-1)
			{
			}
		else
			{NUMBER_BLOCK_LONG=MEMORY_BLOCK[i];
			 NUMBER_BLOCK_LONG<<=11;
#ifdef FORXMS
			 XMS_POINTER_STR=(char huge*)(((char huge*)MEM)+(((unsigned long)i)<<11));
			 XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
			 XMS_status=_XMMcopy(2048,0,XMS_P_STR,XMS_ALLOC_HANDLER,NUMBER_BLOCK_LONG);
#else
			 lseek(MEMORY_FILE,NUMBER_BLOCK_LONG,SEEK_SET);
			 write(MEMORY_FILE,(char huge*)(((char huge*)MEM)+(((unsigned long)i)<<11)),2048);
#endif
			}
	 }

#ifdef FORXMS
 XMS_OFFSET=0;
 lseek(MEMORY_FILE,0l,SEEK_SET);
 HELPHELP("##STORING XMS:");
 for(i=0;i<max_block_memory;i++)
	 {//printf("X");
		XMS_POINTER_STR=MEM;
		XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
		XMS_status=_XMMcopy(2048,XMS_ALLOC_HANDLER,XMS_OFFSET,0,XMS_P_STR);
		write(MEMORY_FILE,MEM,2048);
		XMS_OFFSET+=2048l;
	 }
 HELPHELP("##END-OFF-STORING XMS.");
 XMMfree(XMS_ALLOC_HANDLER);
#endif
 close(MEMORY_FILE);
 lseek(STATUS_FILE,0l,SEEK_SET);
 write(STATUS_FILE,&R[0],16*4);
 write(STATUS_FILE,&PSW_MASK,1);
 write(STATUS_FILE,&PSW_KEY,1);
 write(STATUS_FILE,&PSW_AMWP,1);
 write(STATUS_FILE,&PSW_COD_INT,2);
 write(STATUS_FILE,&PSW_ILC,1);
 write(STATUS_FILE,&PSW_CC,1);
 write(STATUS_FILE,&PSW_PRG_MASK,1);
 write(STATUS_FILE,&PSW_ADRESS,4);
 write(STATUS_FILE,&RQ_TRACE,2);

 write(STATUS_FILE,&RETURN,2);
 write(STATUS_FILE,&RQ_SVC,2);
 write(STATUS_FILE,&RQ_PRG,2);
 write(STATUS_FILE,&RQ_IPL,2);
 write(STATUS_FILE,&RQ_TIMER,2);
 write(STATUS_FILE,R_FLOAT,8*10);

 for(i=0;i<max_block_memory;i++)
		 {write(STATUS_FILE,&MEMORY_KEY[i],1);
		 }
 write(STATUS_FILE,&R370[0],16*4);
 write(STATUS_FILE,&CLOCK1,4);
 write(STATUS_FILE,&CLOCK2,4);
 write(STATUS_FILE,&REAL_TIME,4);
 write(STATUS_FILE,&IPL_adr,2);
 write(STATUS_FILE,&PSW_EC_MASK,1);
 write(STATUS_FILE,TLB,8192);
 write(STATUS_FILE,&CLOCK1_CPU,4);
 write(STATUS_FILE,&CLOCK2_CPU,4);
 write(STATUS_FILE,&REAL_TIME_CPU,4);
 write(STATUS_FILE,&COUNT_CPU,4);
 write(STATUS_FILE,&CLOCK1_COMP,4);
 write(STATUS_FILE,&CLOCK2_COMP,4);
 write(STATUS_FILE,&REAL_TIME_COMP,4);
 write(STATUS_FILE,&COUNT_COMP,4);
 write(STATUS_FILE,&PREFIX_PR,4);
 close(STATUS_FILE);
}



/****************************************************************/
/*   прочитать байт памяти                                      */
/*   MEMORY[]-        адрес требуемой страницы или NULL если
/*                    страница не содержится в оперативной памяти;
/*   MEMORY_USE[]-    если больще нуля на данной странице
/*                    производилась операция записи;
/*   MEMORY_BLOCК[]-  содержатся номера блоков страниц в XMS;
/*   MEMORY_TO_BLOCK[]- cодержатся номера блоков страниц в
/*                    оперативной памяти;
/*    1. вычисляет номер блока требуемой страницы в Number_block
/*       и проверяет не происходит ли превышение максимального
/*       размера памяти
/*    2. если страница с номером Number_block не найдена:
/*        2.a в MIN вычисляется адрес блока куда будет подкачана
/*            страница
/*        2.б производится проверка содержимого MEMORY_USE и если
/*            содержимое страницы c номером MIN в оперативной памяти
/*            386/486 было изменено:
/*            2.б.1 производится запись страницы с номером MIN в XMS
/*        2.в требуемая страница с номером Number_block копируется
/*          из XMS в область оперативной памяти  386/486
/*   3.  Возвращается байт содержимого ОП 360
/*       устанавливается указатель на этот байт POINTER_T
/*       для дальнейшего использования
/****************************************************************
/*   При использовании Динамической трянсляции адреса (IBM 370)
/*   используется функция Dta(Adress) для проверки наличия доступной
/*   страници IBM 370 если страница недоступна то сразу
/*   происходит выход из модуля
/****************************************************************/
char GET_BYTE(unsigned long ADRESS)
{static int i,MIN;
#ifdef OPT003
 register int Number_block;
#else
 static int Number_block;
#endif
 static int DtaAdress;
 Dta(ADRESS);

 if ((Number_block=((ADRESS<<8)>>19))>= MAX_BLOCK_MEMORY)
		 {HELPHELP("#1MAX BLOCK MEMORY (GET BYTE)");printf("= %08lx %x ",ADRESS,i);
			PR();/*RQ_TRACE=1;*/RETURN=1;
			RQ_PRG=5;
			return(0);
		 }
 if (MEMORY[Number_block]==NULL)
	 {
		MIN=NEXT_BLOCK_BUF;
		if (++NEXT_BLOCK_BUF>=MAX_BLOCK_BUF) NEXT_BLOCK_BUF=1;
		if (MEMORY_USE[MIN]>0)
			{NUMBER_BLOCK_LONG=MEMORY_BLOCK[MIN];NUMBER_BLOCK_LONG<<=11;
#ifdef FORXMS
			 XMS_POINTER_STR=(char huge *)(((char huge*)MEM)+
											 (((unsigned long)MIN)<<11));
			 XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
			 XMS_status=_XMMcopy(2048,0,XMS_P_STR,XMS_ALLOC_HANDLER,NUMBER_BLOCK_LONG);
#else
			 lseek(MEMORY_FILE,NUMBER_BLOCK_LONG,SEEK_SET);
			 write(MEMORY_FILE,(char huge *)(((char huge*)MEM)+(((unsigned long)MIN)<<11)),2048);
#endif
			}
		if (MEMORY_BLOCK[MIN]>=0) MEMORY[MEMORY_BLOCK[MIN]]=NULL;
		MEMORY[Number_block]=(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11));
		MEMORY_TO_BLOCK[Number_block]=MIN;
		MEMORY_BLOCK[MIN]=Number_block;
		MEMORY_USE[MIN]=0;
		NUMBER_BLOCK_LONG=Number_block;NUMBER_BLOCK_LONG<<=11;
#ifdef FORXMS
		XMS_POINTER_STR=(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11));
		XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
		XMS_status=_XMMcopy(2048,XMS_ALLOC_HANDLER,NUMBER_BLOCK_LONG,0,XMS_P_STR);
#else
		lseek(MEMORY_FILE,NUMBER_BLOCK_LONG,SEEK_SET);
		read(MEMORY_FILE,(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11)),2048);
#endif
	 }
 return(*(POINTER_T=MEMORY[Number_block]+(((unsigned int)ADRESS)&0x07ff)));


}




/*****************************************************************/
/*   записать байт в память                                      */
/*****************************************************************
/*	1. вычисляет номер блока требуемой страницы в Number_block
/*       и проверяет не происходит ли превышение максимального
/*       размера памяти
/*    2. если страница с номером Number_block не найдена:
/*        2.a в MIN вычисляется адрес блока куда будет подкачана
/*            страница
/*        2.б производится проверка содержимого MEMORY_USE и если
/*            содержимое страницы c номером MIN в оперативной памяти
/*            386/486 было изменено:
/*            2.б.1 производится запись страницы с номером MIN в XMS
/*                  и производится установка MEMORY_USE[MIN]=0
/*        2.в требуемая страница с номером Number_block копируется
/*          из XMS в область оперативной памяти  386/486
/*   3.  производится запись байта содержимого ОП 360 по указанному
/*       адресу
/****************************************************************
/*   При использовании Динамической трянсляции адреса (IBM 370)
/*   используется функция Dta(Adress) для проверки наличия доступной
/*   страници IBM 370 если страница недоступна то сразу
/*   происходит выход из модуля
/*****************************************************************/
void PUT_BYTE(unsigned long ADRESS,char BYTE_PUT)
{static int i,MIN;
#ifdef OPT003
 register int Number_block;
#else
 static int Number_block;
#endif
 static int DtaAdress;
 Dta(ADRESS);


 if ((Number_block=((ADRESS<<8)>>19)) >= MAX_BLOCK_MEMORY)
		{i=Number_block;
		 HELPHELP("#1MAX BLOCK MEMORY (PUT BYTE)");printf("= %08lx %x value=%x",ADRESS,i,BYTE_PUT);
		 PR();/*RQ_TRACE=1;*/RETURN=1;
		 RQ_PRG=5;
		 return;}
 if (MEMORY[Number_block]==NULL)
	 {
		MIN=NEXT_BLOCK_BUF;
		if (++NEXT_BLOCK_BUF>=MAX_BLOCK_BUF) NEXT_BLOCK_BUF=1;

		if (MEMORY_USE[MIN]>0)
			{NUMBER_BLOCK_LONG=MEMORY_BLOCK[MIN];NUMBER_BLOCK_LONG<<=11;
#ifdef FORXMS
			 XMS_POINTER_STR=(char huge *)(((char huge*)MEM)+(((unsigned long)MIN)<<11));
			 XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
			 XMS_status=_XMMcopy(2048,0,XMS_P_STR,XMS_ALLOC_HANDLER,NUMBER_BLOCK_LONG);
#else
			 lseek(MEMORY_FILE,NUMBER_BLOCK_LONG,SEEK_SET);
			 write(MEMORY_FILE,(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11)),2048);
#endif
			}
		if (MEMORY_BLOCK[MIN]>=0) MEMORY[MEMORY_BLOCK[MIN]]=NULL;
		MEMORY[Number_block]=(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11));
		MEMORY_BLOCK[MIN]=Number_block;
		MEMORY_USE[MIN]=0;
		MEMORY_TO_BLOCK[Number_block]=MIN;
		NUMBER_BLOCK_LONG=Number_block;NUMBER_BLOCK_LONG<<=11;
#ifdef FORXMS
		XMS_POINTER_STR=(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11));
		XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
		XMS_status=_XMMcopy(2048,XMS_ALLOC_HANDLER,NUMBER_BLOCK_LONG,0,XMS_P_STR);
#else
		lseek(MEMORY_FILE,NUMBER_BLOCK_LONG,SEEK_SET);
		read(MEMORY_FILE,(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11)),2048);
#endif
	 }
 if (PSW_KEY)
 if (PSW_KEY!=MEMORY_KEY[Number_block])
	 {HELPHELP("#1KEY PUT_BYTE_2");RQ_PRG=0x0004;/*RQ_TRACE=1;*/RETURN=2;return;
	 }
 MEMORY_USE[MEMORY_TO_BLOCK[Number_block]]=10;
 *(POINTER_T=MEMORY[Number_block]+(((unsigned int)ADRESS)&0x07ff))=BYTE_PUT;
}



/*******************************************************************/
/*    прочитать второй байт (быстро) если первый был прочитан      */
/*    на полуслове                                                 */
/*******************************************************************
/*    после выполнения функций GET_BYTE и PUT_BYTE  используя
/*    указатель POINTER_T минуя все проверки можно получить значение
/*    следующего байта за POINTER_T
/*
/*******************************************************************/
char GET_SECOND_BYTE(void)
{return(*(POINTER_T+1));
}


/*******************************************************************/
/*    переслать содержимое памяти из 360 в memory                  */
/*******************************************************************/
void MOVE_360_TO_MEM(unsigned long FROM,char far* TO,int LEN)
{
 static unsigned long From;
 static char far *to_to;
 static char far *from_from;
 static int len_len;
 static int i;
 static int DtaAdress;

 to_to=TO;
 len_len=LEN;

#ifdef DTA_370
 From=FROM;
 DtaEnd(FROM,len_len);
 Dta(FROM);
#endif

#ifdef FOR386
 if (LEN==0) return;
 if ( ( ((len_len+(unsigned int)FROM)^(unsigned int)FROM)&0xf800)==0 )
	 {

#ifdef DTA_370
		FROM=From;
#endif

		*to_to=GET_BYTE(FROM);
		if (RQ_PRG==5) return;
		if (LEN<2) return;
		from_from=POINTER_T;
		asm push ds;
		asm mov cx,len_len;
		asm les di,to_to;
		asm lds si,from_from;
		asm cld;
		asm rep movsb;
		asm pop ds;
	 }
 else
#endif
	 {
#ifdef DTA_370
		FROM=From;
#endif

		for(i=0;i<len_len;i++) *to_to++=GET_BYTE(FROM+i);
	 }

}

/*******************************************************************/
/*    переслать из memory в оперативную память 360                 */
/*******************************************************************/
//void MOVE_360_TO_MEM(unsigned long FROM,char far* TO,int LEN)
//{
// static unsigned long from;
// static char far *to;
// static unsigned int len,poinT;
//
//
// if (LEN>0x100)
//	 {
//		if  ( ( ((LEN+(unsigned int)FROM)^(unsigned int)FROM) & 0xf800 )==0 )
//			 move_360_to_mem(FROM,TO,LEN);
//		else
//			{
//			 for(from=FROM,to=TO,poinT=0;poinT<LEN;from+=0x100,to+=0x100,poinT+=0x100)
//				 {if (LEN-poinT<0x100) len=LEN-poinT;
//					else len=0x100;
//					move_360_to_mem(from,to,len);
//				 }
//			}
//	 }
// else move_360_to_mem(FROM,TO,LEN);
//}



/*******************************************************************/
/*    переслать из memory в оперативную память 360                 */
/*******************************************************************/
void MOVE_MEM_TO_360(char far* FROM,unsigned long TO,int LEN)
{
 static unsigned long To;
 static char far *to_to;
 static char far *from_from;
 static unsigned int len_len;
 static int i;
 static int DtaAdress;

 from_from=FROM;
 len_len=LEN;

#ifdef DTA_370
 To=TO;
 DtaEnd(TO,len_len);
 Dta(TO);
#endif


#ifdef FOR386
 if (LEN==0) return;
 if  ( ( ((len_len+(unsigned int)TO)^(unsigned int)TO) & 0xf800 )==0 )
	 {

#ifdef DTA_370
		TO=To;
#endif

		PUT_BYTE(TO,*from_from);
		if (RQ_PRG==5) return;
		if (LEN<2) return;
		to_to=POINTER_T;
		asm push ds;
		asm mov cx,len_len;
		asm les di,to_to;
		asm lds si,from_from;
		asm cld;
		asm rep movsb;
		asm pop ds;
	 }
 else
#endif
	 {

#ifdef DTA_370
		TO=To;
#endif

		for(i=0;i<len_len;i++) PUT_BYTE(TO+i,*(from_from++));
	 }
}



/*******************************************************************/
/*    переслать из memory в оперативную память 360                 */
/*******************************************************************/
///void MOVE_MEM_TO_360(char far* FROM,unsigned long TO,int LEN)
///{
/// static char far *from;
/// static unsigned long to;
/// static unsigned int len,poinT;
///
///
/// if (LEN>0x100)
///	 {
///		if  ( ( ((LEN+(unsigned int)TO)^(unsigned int)TO) & 0xf800 )==0 )
///			 move_mem_to_360(FROM,TO,LEN);
///		else
///			{
///			 for(from=FROM,to=TO,poinT=0;poinT<LEN;from+=0x100,to+=0x100,poinT+=0x100)
///				 {if (LEN-poinT<0x100) len=LEN-poinT;
///					else len=0x100;
///					move_mem_to_360(from,to,len);
///				 }
///			}
///	 }
/// else move_mem_to_360(FROM,TO,LEN);
///}
///
void CODED2(char far *COM)     /*  MVC */
{
 static char RR;
 static char RX;
 static int R1,R2,B1,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

#define LL RX
#define L1 R1
#define L2 R2
 static int LEN;
 static unsigned int DDD1,DDD2;

 static unsigned long ADR, ADRESS1,ADRESS2;
 static unsigned long Adress1,Adress2;
 static int i,k;
 static int len_len;
 static int number_block_dest,number_block_src;
 static char cccc;
 static char far *to_to;
 static char far *from_from;
 static int DtaAdress;


 GET_OPERAND_SS;
 FORWARD_PSW;
 len_len=(int)LL+1;

#ifdef DTA_370
		Adress1=ADRESS1;
		Adress2=ADRESS2;
		DtaEnd(ADRESS1,len_len);
		DtaEnd(ADRESS2,len_len);
		Dta(ADRESS1);
		Dta(ADRESS2);
#endif


#ifdef FOR386
 //goto MOVE_B;
 if (len_len>2)
	 {
		if ( ( ((len_len+(unsigned int)ADRESS1)^(unsigned int)ADRESS1)&0xf800 )==0 )
			{if ( ( ((len_len+(unsigned int)ADRESS2)^(unsigned int)ADRESS2)&0xf800 )==0 )

				 {
					if ((number_block_dest=((ADRESS1<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
					if ((number_block_src=((ADRESS2<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
					if (MEMORY[number_block_dest]!=NULL &&
							MEMORY[number_block_src] !=NULL)
						{to_to=MEMORY[number_block_dest]+(((unsigned int)ADRESS1)&0x07ff);
						 from_from=MEMORY[number_block_src]+(((unsigned int)ADRESS2)&0x000007ff);
						 MEMORY_USE[MEMORY_TO_BLOCK[number_block_dest]]=10;
						 if (PSW_KEY)
							 if (PSW_KEY!=MEMORY_KEY[number_block_dest])
								 {printf("KEY PSW=%d KEY MEMORY=%d MVC PSW=%06x ADRESS=%06x",
												 PSW_KEY,
												 MEMORY_KEY[number_block_dest],PSW_ADRESS,ADRESS1);
									RQ_PRG=0x0004;RQ_TRACE=1;RETURN=1;return;
								 }
						 goto MOVE_M;
						}

#ifdef DTA_370
					ADRESS1=Adress1;
					ADRESS2=Adress2;
#endif

					cccc=GET_BYTE(ADRESS2);
					if (RETURN) return;
					PUT_BYTE(ADRESS1,cccc);
					if (RETURN) return;
					to_to=POINTER_T;
					cccc=GET_BYTE(ADRESS2);
					from_from=POINTER_T;

MOVE_M:

						{
						 asm push ds;
						 asm mov cx,len_len;
						 asm les di,to_to;
						 asm lds si,from_from;
						 asm cld;
						 asm rep movsb;
						 asm pop ds;
						 return;
						}
ERROR_B:

#ifdef DTA_370
					ADRESS1=Adress1;
					ADRESS2=Adress2;
#endif

					PUT_BYTE(ADRESS1,GET_BYTE(ADRESS2));
					return;


				 }

			}
	 }
#endif
MOVE_B:

#ifdef DTA_370
 ADRESS1=Adress1;
 ADRESS2=Adress2;
#endif

 for(i=0;i<len_len;i++) PUT_BYTE(ADRESS1++,GET_BYTE(ADRESS2++));

}

/*************************************************/
void MOVE(unsigned long ADRESS1,unsigned long ADRESS2,int LLL)     /*  MVC */
{
 static char RR;
 static char RX;
 static int R1,R2,B1,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

#define LL RX
#define L1 R1
#define L2 R2
 static int LEN;
 static unsigned int DDD1,DDD2;

 static unsigned long ADR;
 static unsigned long Adress1,Adress2;
 static int i,k;
 static int len_len;
 static int number_block_dest,number_block_src;
 static char cccc;
 static char far *to_to;
 static char far *from_from;
 static int DtaAdress;


 len_len=(int)LLL;

#ifdef DTA_370
		Adress1=ADRESS1;
		Adress2=ADRESS2;
		DtaEnd(ADRESS1,len_len);
		DtaEnd(ADRESS2,len_len);
		Dta(ADRESS1);
		Dta(ADRESS2);
#endif


#ifdef FOR386
 //goto MOVE_B;
 if (len_len>2)
	 {
		if ( ( ((len_len+(unsigned int)ADRESS1)^(unsigned int)ADRESS1)&0xf800 )==0 )
			{if ( ( ((len_len+(unsigned int)ADRESS2)^(unsigned int)ADRESS2)&0xf800 )==0 )

				 {
					if ((number_block_dest=((ADRESS1<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
					if ((number_block_src=((ADRESS2<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
					if (MEMORY[number_block_dest]!=NULL &&
							MEMORY[number_block_src] !=NULL)
						{to_to=MEMORY[number_block_dest]+(((unsigned int)ADRESS1)&0x07ff);
						 from_from=MEMORY[number_block_src]+(((unsigned int)ADRESS2)&0x000007ff);
						 MEMORY_USE[MEMORY_TO_BLOCK[number_block_dest]]=10;
						 if (PSW_KEY)
							 if (PSW_KEY!=MEMORY_KEY[number_block_dest])
								 {printf("KEY=%d KEY MEMORY=%d MVCL PSW=%06x ADRESS=%06x",
												 PSW_KEY,MEMORY_KEY[number_block_dest],
												 PSW_ADRESS,ADRESS1);
									RQ_PRG=0x0004;RQ_TRACE=1;RETURN=1;return;
								 }
						 goto MOVE_M;
						}

#ifdef DTA_370
					ADRESS1=Adress1;
					ADRESS2=Adress2;
#endif

					cccc=GET_BYTE(ADRESS2);
					if (RETURN) return;
					PUT_BYTE(ADRESS1,cccc);
					if (RETURN) return;
					to_to=POINTER_T;
					cccc=GET_BYTE(ADRESS2);
					from_from=POINTER_T;

MOVE_M:

						{
						 asm push ds;
						 asm mov cx,len_len;
						 asm les di,to_to;
						 asm lds si,from_from;
						 asm cld;
						 asm rep movsb;
						 asm pop ds;
						 return;
						}
ERROR_B:

#ifdef DTA_370
					ADRESS1=Adress1;
					ADRESS2=Adress2;
#endif

					PUT_BYTE(ADRESS1,GET_BYTE(ADRESS2));
					return;


				 }

			}
	 }
#endif
MOVE_B:

#ifdef DTA_370
 ADRESS1=Adress1;
 ADRESS2=Adress2;
#endif

 for(i=0;i<len_len;i++) PUT_BYTE(ADRESS1++,GET_BYTE(ADRESS2++));

}


/*******************************************************************/
/*    сравнить из 360 в 360 аналог CLC                            */
/*******************************************************************/
void CODED5(char far *COM)     /*  CLC */
{
 static char RR;
 static char RX;
 static int R1,R2,B1,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

#define LL RX
#define L1 R1
#define L2 R2
 static int LEN;
 static unsigned int DDD1,DDD2;

 static unsigned long ADR, ADRESS1,ADRESS2;
 static unsigned long Adress1,Adress2;
 static int i,k;
 static unsigned int len_len;
 static int number_block_dest,number_block_src;
 static unsigned long dest;
 static unsigned long src;
 static unsigned char cccc,cccc2;
 static char far *to_to;
 static char far *from_from;
 static int FLA;
 static unsigned char BYT1,BYT2;
 static int DtaAdress;
 GET_OPERAND_SS;
 FORWARD_PSW;
 len_len=(int)LL+1;

#ifdef DTA_370
		Adress1=ADRESS1;
		Adress2=ADRESS2;
		DtaEnd(ADRESS1,len_len);
		DtaEnd(ADRESS2,len_len);
		Dta(ADRESS1);
		Dta(ADRESS2);
#endif


#ifdef FOR386
 //goto MOVE_B;
 if (len_len>2)
	 {
		if ( ( ((len_len+(unsigned int)ADRESS1)^(unsigned int)ADRESS1)&0xf800 )==0 )
			{if ( ( ((len_len+(unsigned int)ADRESS2)^(unsigned int)ADRESS2)&0xf800 )==0 )

				 {
					if ((number_block_dest=((ADRESS1<<8)>>19))>= MAX_BLOCK_MEMORY)
						 {HELPHELP("#1MAX BLOCK MEMORY (CLC BYTE)");
							PR();RQ_TRACE=1;RETURN=1;
							RQ_PRG=5;
							return;
						 }
					if ((number_block_src=((ADRESS2<<8)>>19))>= MAX_BLOCK_MEMORY)
						 {HELPHELP("#1MAX BLOCK MEMORY (CLC BYTE)");
							PR();RQ_TRACE=1;RETURN=1;
							RQ_PRG=5;
							return;
						 }
					if (MEMORY[number_block_dest]!=NULL &&
							MEMORY[number_block_src] !=NULL)
						{to_to=MEMORY[number_block_dest]+(((unsigned int)ADRESS1)&0x000007ff);
						 from_from=MEMORY[number_block_src]+(((unsigned int)ADRESS2)&0x000007ff);
						 goto CLCM;
						}

#ifdef DTA_370
					ADRESS1=Adress1;
					ADRESS2=Adress2;
#endif



					BYT2=GET_BYTE(ADRESS2);
					if (RETURN) return;
					BYT1=GET_BYTE(ADRESS1);
					if (RETURN) return;
					if (BYT1!=BYT2)
						{if (BYT1<BYT2) PSW_CC=1;
						 else PSW_CC=2;
						 return;
						}
					to_to=POINTER_T;
					cccc=GET_BYTE(ADRESS2);
					from_from=POINTER_T;
CLCM:
						{
						 asm push ds;
						 asm mov cx,len_len;
						 asm les di,to_to;
						 asm lds si,from_from;
						 asm cld;
						 asm repe cmpsb;
						 asm je CLCZERO;
						 asm mov al,es:[di-1];
						 asm mov cl,ds:[si-1];
						 asm xor ch,ch;
						 asm xor ah,ah;
						 asm sub ax,cx;
						 asm js CLC_FS_LT_SD;
						 asm pop ds;
						 PSW_CC=2;
						 return;
CLCZERO:     asm pop ds;
						 PSW_CC=0;
						 return;
CLC_FS_LT_SD:asm pop ds;
						 PSW_CC=1;
						 return;

						}
				 }

			}
	 }
#endif
MOVE_B:

#ifdef DTA_370
	 ADRESS1=Adress1;
	 ADRESS2=Adress2;
#endif

	 PSW_CC=0;
	 for(i=0;i<len_len;i++)              /* CLC */
		 {BYT1=GET_BYTE(ADRESS1++);
			BYT2=GET_BYTE(ADRESS2++);
			if (BYT1==BYT2) continue;
			else
				{if (BYT1<BYT2) PSW_CC=1; else PSW_CC=2;
				 break;
				}
		 }

}


/*******************************************************************/
/*    XC NC OC                                                     */
/*******************************************************************/
void CODED7(char far *COM)     /*   */
{
 static char RR;
 static char RX;
 static int R1,R2,B1,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

#define LL RX
#define L1 R1
#define L2 R2
 static int LEN;
 static unsigned int DDD1,DDD2;

 static unsigned long ADR, ADRESS1,ADRESS2;
 static unsigned long Adress1,Adress2;
 static int i,k;
 static unsigned int len_len;
 static int number_block_dest,number_block_src;
 static unsigned long dest;
 static unsigned long src;
 static unsigned char cccc,cccc2;
 static char far *to_to;
 static char far *from_from;
 static int FLA;
 static unsigned char BYT1,BYT2;
 static int DtaAdress;
 GET_OPERAND_SS;
 FORWARD_PSW;
 len_len=(int)LL+1;

#ifdef DTA_370
 Adress1=ADRESS1;
 Adress2=ADRESS2;
 DtaEnd(ADRESS1,len_len);
 DtaEnd(ADRESS2,len_len);
 Dta(ADRESS1);
 Dta(ADRESS2);
#endif


 //goto MOVE_B;
#ifdef FOR386
 if (len_len>2)
	 {
		if ( ( ((len_len+(unsigned int)ADRESS1)^(unsigned int)ADRESS1)&0xf800 )==0 )
			{if ( ( ((len_len+(unsigned int)ADRESS2)^(unsigned int)ADRESS2)&0xf800 )==0 )

				 {
					if ((number_block_dest=((ADRESS1<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
					if ((number_block_src=((ADRESS2<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
					if (MEMORY[number_block_dest]!=NULL &&
							MEMORY[number_block_src] !=NULL)
						{to_to=MEMORY[number_block_dest]+(((unsigned int)ADRESS1)&0x07ff);
						 from_from=MEMORY[number_block_src]+(((unsigned int)ADRESS2)&0x000007ff);
						 MEMORY_USE[MEMORY_TO_BLOCK[number_block_dest]]=10;
						 if (PSW_KEY)
							 if (PSW_KEY!=MEMORY_KEY[number_block_dest])
								 {printf("KEY XC OC NC PSW=%06x ADRESS=%06x",PSW_ADRESS,ADRESS1);
									RQ_PRG=0x0004;RQ_TRACE=1;RETURN=1;return;
								 }
						 goto MOVE_M;
						}
#ifdef DTA_370
					ADRESS1=Adress1;
					ADRESS2=Adress2;
#endif

					GET_BYTE(ADRESS2);
					if (RETURN) return;
					PUT_BYTE(ADRESS1,GET_BYTE(ADRESS1));
					if (RETURN) return;
					to_to=POINTER_T;
					GET_BYTE(ADRESS2);
					from_from=POINTER_T;
MOVE_M:
 switch(COM[0])
	 {case 0xd7:
						{
						 asm push ds;
						 asm mov cx,len_len;
						 asm les di,to_to;
						 asm lds si,from_from;
						 asm cld;
						 asm xor ah,ah;
XOR:
						 asm lodsb;
						 asm xor al,es:[di];
						 asm or ah,al;
						 asm stosb;
						 asm loop XOR;
						 asm pop ds;
						 asm shr ax,8;
						 if (_AX)  /*!=0*/   PSW_CC=1;
						 else                PSW_CC=0;
						 return;
						}
						break;
		case 0xd6:
						{
						 asm push ds;
						 asm mov cx,len_len;
						 asm les di,to_to;
						 asm lds si,from_from;
						 asm cld;
						 asm xor ah,ah;
OR:
						 asm lodsb;
						 asm or al,es:[di];
						 asm or ah,al;
						 asm stosb;
						 asm loop OR;
						 asm pop ds;
						 asm shr ax,8;
						 if (_AX)  /*!=0*/   PSW_CC=1;
						 else                PSW_CC=0;
						 return;
						}
						break;
		case 0xd4:
						{
						 asm push ds;
						 asm mov cx,len_len;
						 asm les di,to_to;
						 asm lds si,from_from;
						 asm cld;
						 asm xor ah,ah;
AND:
						 asm lodsb;
						 asm and al,es:[di];
						 asm or ah,al;
						 asm stosb;
						 asm loop AND;
						 asm pop ds;
						 asm shr ax,8;
						 if (_AX)  /*!=0*/   PSW_CC=1;
						 else                PSW_CC=0;
						 return;
						}
						break;
					}
ERROR_B:

#ifdef DTA_370
					ADRESS1=Adress1;
					ADRESS2=Adress2;
#endif


					PUT_BYTE(ADRESS1,GET_BYTE(ADRESS1));
					return;

				 }

			}
	 }
#endif
MOVE_B:

#ifdef DTA_370
					ADRESS1=Adress1;
					ADRESS2=Adress2;
#endif


switch(COM[0])
 {case 0xd7:PSW_CC=0;
					for(i=0;i<len_len;i++)              /* XC */
						{BYT1=GET_BYTE(ADRESS1)^GET_BYTE(ADRESS2++);
						 PUT_BYTE(ADRESS1++,BYT1);
						 if (BYT1) PSW_CC=1;
						}

					break;
	case 0xd4:PSW_CC=0;
					for(i=0;i<len_len;i++)              /* NC */
						{BYT1=GET_BYTE(ADRESS1)&GET_BYTE(ADRESS2++);
						 PUT_BYTE(ADRESS1++,BYT1);
						 if (BYT1) PSW_CC=1;
						}
					break;
	case 0xd6:PSW_CC=0;
					for(i=0;i<len_len;i++)              /* OC */
						{BYT1=GET_BYTE(ADRESS1)|GET_BYTE(ADRESS2++);
						 PUT_BYTE(ADRESS1++,BYT1);
						 if (BYT1) PSW_CC=1;
						}
					break;

 }
}




/*******************************************************************/
/*   прочитать слово    (с адреса слова      )
/*******************************************************************
/*   возвращается слово по адресу ADRESS:
/*   1.вычисляет номер блока аналогично командам PUT_BYTE и GET_BYTE
/*     и если номар блока найден и страница находится в оперативной памяти
/*     386/486  то в переменную OPERAND заносится содержимое слова
/*   2.если страница не в ОП 386 то обращаемся к GET_BYTE для
/*     помещения страници в ОП 386 и установки POINTER_T на этот байт
/*     после чего в переменную OPERAND заносится содержимое слова
/*   3.происводится изменение порядка байт слова с 1234 на 4321
/*     в соответствии с типом модели 386/486
/*******************************************************************/
unsigned long GET_WORD(unsigned long ADRESS)
{
 static char BYTE0,BYTE1,BYTE2,BYTE3;
 static unsigned int HW1,HW2;
 static unsigned long OPERAND;
 static char far *POINTER_OPERAND;
#ifdef OPT003
 register int Number_block;
#else
 static int Number_block;
#endif
#ifdef DTA_370
 unsigned long Adress;
#endif
 static int DtaAdress;

#ifdef FOR386

#ifdef DTA_370
 Adress=ADRESS;
 Dta(ADRESS);
#endif

 if ((Number_block=((ADRESS<<8)>>19))>= MAX_BLOCK_MEMORY) goto GET_B;
 if (MEMORY[Number_block]!=NULL)
	 {
		OPERAND=*( (unsigned long*)(MEMORY[Number_block]+(((unsigned int)ADRESS)&0x07fc)) );
		goto END_GET_B;
	 }
GET_B:

#ifdef DTA_370
 ADRESS=Adress;
#endif

 GET_BYTE(ADRESS);
 Dtaret;
 OPERAND=*((unsigned long*)POINTER_T);
END_GET_B:
 #ifdef FOR486
	asm {
			 db 0x66    //
			 db 0x0f    //    BSWAP
			 db 0xc8    //
			 db 0x66
			 mov [OFFSET OPERAND],ax
			}
 #else
	asm {
			xchg ah,al
			mov [OFFSET OPERAND+2],ax
			db 0x66
			shr ax,16
			xchg ah,al
			mov [OFFSET OPERAND],ax
		 }
 #endif
#else
 OPERAND=GET_BYTE(ADRESS);
 POINTER_OPERAND=POINTER_T+1;
 OPERAND<<=8;
 OPERAND+=*POINTER_OPERAND++;
 OPERAND<<=8;
 OPERAND+=*POINTER_OPERAND++;
 OPERAND<<=8;
 OPERAND+=*POINTER_OPERAND;
#endif
 return(OPERAND);
}


/******************************************************************/
/*   ЗАПИСАТЬ СЛОВО                                               */
/*******************************************************************
/*   помещает слово OP по адресу ADRESS:
/*   1.происводится изменение порядка байт слова OP с 1234 на 4321
/*     в переменную OPERAND
/*     в соответствии с типом модели (386/486)
/*   2.вычисляет номер блока аналогично командам PUT_BYTE и GET_BYTE
/*     и если номар блока найден и страница находится в оперативной памяти
/*     386/486  то по адрксу заносится содержимое слова OPERAND
/*   3.если страница не в ОП 386 то обращаемся к GET_BYTE для
/*     помещения страници в ОП 386 и установки POINTER_T на этот байт
/*     после чего по адрксу заносится содержимое слова OPERAND
/******************************************************************/
void PUT_WORD(unsigned long ADRESS,unsigned long OP)
{

 static unsigned long OPERAND;
 static char far *POINTER_OPERAND;
#ifdef OPT003
 register int Number_block;
#else
 static int Number_block;
#endif
 static unsigned long Adress;
 static int DtaAdress;

#ifdef DTA_370
 Adress=ADRESS;
 Dta(ADRESS);
#endif



 OPERAND=OP;
#ifdef FOR386


 #ifdef FOR486
	asm {
			 db 0x66    //
			 db 0x0f    //    BSWAP
			 db 0xc8    //
			 db 0x66
			 mov [OFFSET OPERAND],ax
			}
 #else
 asm {
			xchg ah,al
			mov [OFFSET OPERAND+2],ax
			db 0x66
			shr ax,16
			xchg ah,al
			mov [OFFSET OPERAND],ax
		 }
 #endif
 if ((Number_block= ((ADRESS<<8)>>19) )>= MAX_BLOCK_MEMORY) goto PUT_B;
 if (MEMORY[Number_block]!=NULL)
	 {if (PSW_KEY)
		if (PSW_KEY!=MEMORY_KEY[Number_block])
					 {printf("KEY PUT_WORD PSW=%06x ADRESS=%06x",PSW_ADRESS,ADRESS);RQ_PRG=0x0004;/*RQ_TRACE=1;*/RETURN=1;return;
					 }
		*( (unsigned long*)(MEMORY[Number_block]+(((unsigned int)ADRESS)&0x07fc)) )=OPERAND;
		MEMORY_USE[MEMORY_TO_BLOCK[Number_block]]=10;
		goto END_PUT_B;
	 }
PUT_B:
#ifdef DTA_370
 ADRESS=Adress;
#endif

 GET_BYTE(ADRESS);
 if (RETURN) return;
 if (PSW_KEY)
		if (PSW_KEY!=MEMORY_KEY[Number_block])
			 {printf("KEY PUT_WORD PSW=%06x ADRESS=%06x",PSW_ADRESS,ADRESS);RQ_PRG=0x0004;/*RQ_TRACE=1;*/RETURN=1;return;
			 }
 MEMORY_USE[MEMORY_TO_BLOCK[Number_block]]=10;
 *((unsigned long*)POINTER_T)=OPERAND;
END_PUT_B:
#else
 GET_BYTE(ADRESS);
 if (RETURN) return;

 POINTER_OPERAND=(POINTER_T+3);
 *POINTER_OPERAND--=OPERAND&0x000000ff;
 OPERAND>>=8;
 *POINTER_OPERAND--=OPERAND&0x000000ff;
 OPERAND>>=8;
 *POINTER_OPERAND--=OPERAND&0x000000ff;
 OPERAND>>=8;
 *POINTER_OPERAND=OPERAND&0x000000ff;
 if (++MEMORY_USE[MEMORY_TO_BLOCK[NUMBER_BLOCK]]>6000)
								 MEMORY_USE[MEMORY_TO_BLOCK[NUMBER_BLOCK]]=10;
#endif
}



/**************************************************************/
/*  загрузить PSW  по адресу ADRESS                           */
/**************************************************************
/*  в случае если после загрузки в PSW признак WAIT
/*  указывает что у нас ожидание
/*  то после выполнения команды прерываемся чтобы уйти на WAIT
/*   (переменная RETURN)
/**************************************************************/
void LOAD_PSW(unsigned long ADRESS)
{
 static unsigned long WORD1,WORD2;
 WORD1=GET_WORD(ADRESS);
 Dtaret;
 WORD2=GET_WORD(ADRESS+4);
 Dtaret;
#ifdef DTA_370
	PSW_AMWP=(unsigned char)     ((WORD1&0x000f0000)>>16);
	if (PSW_AMWP&0x8)  /* EC PSW */
		{
		 PSW_EC_MASK=(unsigned char)  ((WORD1&0xff000000)>>24);
		 PSW_KEY= (unsigned char)     ((WORD1&0x00f00000)>>20);
		 PSW_AMWP=(unsigned char)     ((WORD1&0x000f0000)>>16);
		 PSW_CC = (unsigned char)     ((WORD1&0x00003000)>>12);
		 PSW_PRG_MASK=(unsigned char) ((WORD1&0x00000f00)>> 8);

		 PSW_ADRESS=                  ((WORD2&0x00ffffff));
		 if (PSW_EC_MASK&0x04)
			 {DINTRADR=1;
			 }
		}
	else
		{
#endif
		 PSW_MASK=(unsigned char)     ((WORD1&0xff000000)>>24);
		 PSW_KEY= (unsigned char)     ((WORD1&0x00f00000)>>20);
		 PSW_AMWP=(unsigned char)     ((WORD1&0x000f0000)>>16);
		 PSW_COD_INT=(unsigned int)   ((WORD1&0x0000ffff));

		 PSW_ILC= (unsigned char)     ((WORD2&0xc0000000)>>29);
		 PSW_CC = (unsigned char)     ((WORD2&0x30000000)>>28);
		 PSW_PRG_MASK=(unsigned char) ((WORD2&0x0f000000)>>24);
		 PSW_ADRESS=                  ((WORD2&0x00ffffff));
#ifdef DTA_370
		}
#endif

 if (PSW_AMWP&0x02) RETURN=1;
}


/**************************************************************/
/*   запомнить PSW по адресу                                  */
/**************************************************************/
void STORE_PSW(unsigned long ADRESS)
{
 static char OLD_PSW_KEY;
 static unsigned long WORD1,WORD2;
 OLD_PSW_KEY=PSW_KEY;
 PSW_KEY=0;
#ifdef DTA_370
 if (PSW_AMWP&0x8)  /* EC PSW */
		{
		 WORD1= (((unsigned long)PSW_EC_MASK)<<24)+
				(((unsigned long)OLD_PSW_KEY)<<20)+
				(((unsigned long)PSW_AMWP)<<16)+
				(((unsigned long)PSW_CC)<<12)+
				(((unsigned long)PSW_PRG_MASK)<<8);

		 WORD2=(PSW_ADRESS&0xffffff);
		 PUT_WORD(ADRESS,WORD1);
		 Dtaret;
		 PUT_WORD(ADRESS+4,WORD2);
		 Dtaret;
		}
 else               /* BC PSW */
		{
#endif
		 WORD1= (((unsigned long)PSW_MASK)<<24)+
				(((unsigned long)OLD_PSW_KEY)<<20)+
				(((unsigned long)PSW_AMWP)<<16)+
				((unsigned long)PSW_COD_INT);

		 WORD2= (((unsigned long)PSW_ILC)<<29)+
				(((unsigned long)PSW_CC)<<28)+
				(((unsigned long)PSW_PRG_MASK)<<24)+
								(PSW_ADRESS&0xffffff);
		 PUT_WORD(ADRESS,WORD1);
		 Dtaret;
		 PUT_WORD(ADRESS+4,WORD2);
		 Dtaret;
#ifdef DTA_370
		}
#endif
 PSW_KEY=OLD_PSW_KEY;

}



/***************************************************************/
/*   Продвинуть PSW на длину команды                           */
/***************************************************************/
void FORW_PSW(void)
{PSW_ADRESS+=PSW_ILC;
}


/***************************************************************/
/*    распечатать состояние при ошибке                         */
/***************************************************************/

void PR(void)
{
 static int i;
 static long adr;
 printf("%lx : ",PSW_ADRESS-PSW_ILC);
 adr=PSW_ADRESS-PSW_ILC;
 if (adr>0)
 for (i=0;i<6;i++,adr++)
				 {printf("%02x",GET_BYTE(adr));}

}


/***************************************************************/
/*    включить трассировку для неотлаженой команды             */
/***************************************************************/
void T(void)
{
 HELPHELP("##CHECK COD OPERATION=");
 PR();
 RQ_TRACE=1;
}
/**************************************************************/
void T00(char C)
{
 RQ_PRG=0x0001;
 printf("\nWRONG CODE %x ",C);
 printf(": %lx : ",PSW_ADRESS-PSW_ILC);
 RETURN=1;
}


/***************************************************************/
/*    выдать сообщение о неолаженной команде канала            */
/***************************************************************/
void tt(int cikl_unit)
{
 printf ("\nCHECK I/O COMMAND:");
 PR();
 printf("\nUNIT=%03x %06lx=> %02x %06lx %02x %02x %04x ",
						 ADRESS_IO_DEVICE[cikl_unit],
						 CSW_CAW[cikl_unit],
						 CSW_COD[cikl_unit],
						 CSW_ADRESS[cikl_unit],
						 CSW_MOD[cikl_unit],
						 CSW_TP[cikl_unit],
						 CSW_COUNT[cikl_unit]);
 RQ_TRACE=1;
}
/***************************************************************/
void SPECIAL_INT(unsigned long ADRESS)
{
 static int OLD_PSW_KEY;
 static int OLD_DINTRADR;
 OLD_PSW_KEY=PSW_KEY;
 PSW_KEY=0;
 OLD_DINTRADR=DINTRADR;
 DINTRADR=0;
 PUT_WORD(144l,0x00ffffff&ADRESS);
 DINTRADR=OLD_DINTRADR;
 PSW_KEY=OLD_PSW_KEY;
}
/***************************************************************/
int TLB_SET(unsigned long ADRESS)
{
 static unsigned long adress;
 static int LEN_T_SEG;
 static unsigned long ADRESS_SEG;
 static int LEN_T_PAGES;
 static unsigned int ADRESS_PAGE;
 static int L_PAGES,L_SEGS;
 static unsigned int OFF_IN_SEGS,OFF_IN_PAGES;
 static int OLD_DINTRADR;
 static int OLD_PSW_KEY;
 static int retu;
 //printf(" adres=%lx ",ADRESS);getch();
 adress=ADRESS;
 switch(R370[0]&0x00c00000)
	 {
		case 0x00400000:  /* LEN PAGE =2048K */
				 L_PAGES=LEN_PAGE_2048K;
				 break;
		case 0x00800000:  /* LEN PAGE =4096K */
				 L_PAGES=LEN_PAGE_4096K;
				 break;
		default:
				 SPECIAL_INT(adress);
				 RQ_PRG=0x0012;
				 return(4);
	 }
 switch(R370[0]&0x00180000)
	 {
		case 0x00000000:  /* LEN SEGS =64K */
				 L_SEGS=LEN_SEGS_64K;
				 break;
		case 0x00180000:  /* LEN SEGS =1M */
				 L_SEGS=LEN_SEGS_1M;
				 break;
		default:
				 SPECIAL_INT(adress);
				 RQ_PRG=0x0012;
				 return(4);
	 }
 LEN_T_SEG=(R370[1])>>24;
 LEN_T_SEG<<=16;
 //printf(" L_SEG=%d L_P=%d LEN=%d ",L_SEGS,L_PAGES,LEN_T_SEG);getch();
 switch(L_SEGS)
	{
	 case LEN_SEGS_64K:
				OFF_IN_SEGS=((adress<<8)>>24);
				break;
	 case LEN_SEGS_1M :
				OFF_IN_SEGS=((adress<<8)>>28);
				break;
	}
 if (OFF_IN_SEGS>LEN_T_SEG)
	{
	 SPECIAL_INT(adress);
	 RQ_PRG=0x0010;
	 ADRESS_DTA=(R370[1]&0x00ffffc0)+(OFF_IN_SEGS<<2);
	 return(3);
	}
 //printf(" OFF_IN_SEG =%d ",OFF_IN_SEGS);getch();
 OLD_DINTRADR=DINTRADR;
 DINTRADR=0;
 ADRESS_SEG=GET_WORD((R370[1]&0x00ffffc0)+(OFF_IN_SEGS<<2));
 //printf("A=%lx ",ADRESS_SEG);getch();
 DINTRADR=OLD_DINTRADR;
 if (RETURN)
	 {
		SPECIAL_INT(adress);
		RQ_PRG=0x0012;
		return(4);
	 }
 if (ADRESS_SEG&0x00000001)
	{
	 SPECIAL_INT(adress);
	 RQ_PRG=0x0010;
	 ADRESS_DTA=(R370[1]&0x00ffffc0)+(OFF_IN_SEGS<<2);
	 return(1);
	}
 LEN_T_PAGES=(ADRESS_SEG)>>28;
 ADRESS_SEG&=0x00fffff8;

 switch(L_PAGES)
	{
	 case LEN_PAGE_2048K:
				switch(L_SEGS)
					 {
						case LEN_SEGS_64K:
								 OFF_IN_PAGES=(adress&0x0000ffff)>>11;
								 if (LEN_T_PAGES<(OFF_IN_PAGES>>1))
										{
										 SPECIAL_INT(adress);
										 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
										 RQ_PRG=0x0011;
										 return(3);
										}
								 break;
						case LEN_SEGS_1M :
								 OFF_IN_PAGES=(adress&0x000fffff)>>11;
								 if (LEN_T_PAGES<(OFF_IN_PAGES>>5))
										{
										 SPECIAL_INT(adress);
										 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
										 RQ_PRG=0x0011;
										 return(3);
										}
								 break;
					 }
				break;
	 case LEN_PAGE_4096K:
				switch(L_SEGS)
					 {
						case LEN_SEGS_64K:
								 OFF_IN_PAGES=(adress&0x0000ffff)>>12;
								 if (LEN_T_PAGES<(OFF_IN_PAGES))
										{
										 SPECIAL_INT(adress);
										 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
										 RQ_PRG=0x0011;
										 return(3);
										}
								 break;
						case LEN_SEGS_1M :
								 OFF_IN_PAGES=(adress&0x000fffff)>>12;
								 if (LEN_T_PAGES<(OFF_IN_PAGES>>4))
										{
										 SPECIAL_INT(adress);
										 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
										 RQ_PRG=0x0011;
										 return(3);
										}
								 break;
					 }
				break;
	}

 //printf(" Ok =%x",OFF_IN_PAGES);getch();
 OLD_DINTRADR=DINTRADR;
 DINTRADR=0;
 ADRESS_PAGE=(((unsigned int)GET_BYTE((ADRESS_SEG)+(OFF_IN_PAGES<<1)))<<8)+
						 ((unsigned int)GET_BYTE((ADRESS_SEG)+1+(OFF_IN_PAGES<<1)))	;
 //printf("ADRESS_PAGE=%x ",ADRESS_PAGE);getch();
 DINTRADR=OLD_DINTRADR;
 if (RETURN)
	 {
		SPECIAL_INT(adress);
		RQ_PRG=0x0012;
		return(4);
	 }
 switch(L_PAGES)
	{
	 case LEN_PAGE_2048K:
				if (ADRESS_PAGE&0x0004)
					{
					 SPECIAL_INT(adress);
					 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
					 RQ_PRG=0x0011;
					 return(2);
					}
				ADRESS_PAGE>>=3;
				break;
	 case LEN_PAGE_4096K:
				if (ADRESS_PAGE&0x0008)
					{
					 SPECIAL_INT(adress);
					 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
					 RQ_PRG=0x0011;
					 return(2);
					}
				ADRESS_PAGE>>=4;
				break;
	}
 //	printf("ADRESS_PAGE=%x ",ADRESS_PAGE);getch();
 switch(L_SEGS)
	{
	 case LEN_SEGS_64K:
				switch(L_PAGES)
					{
					 case LEN_PAGE_2048K:
								TLB[(adress&0x00ffffff)>>11]=(OFF_IN_SEGS<<5)+ADRESS_PAGE;
								break;
					 case LEN_PAGE_4096K:
								TLB[(adress&0x00ffffff)>>11]=(OFF_IN_SEGS<<4)+ADRESS_PAGE;
								TLB[((adress&0x00ffffff)>>11)+1]=(OFF_IN_SEGS<<4)+ADRESS_PAGE+1;
								break;
					}
				break;
	 case LEN_SEGS_1M :
				switch(L_PAGES)
					{
					 case LEN_PAGE_2048K:
								TLB[(adress&0x00ffffff)>>11]=(OFF_IN_SEGS<<9)+ADRESS_PAGE;
								break;
					 case LEN_PAGE_4096K:
								TLB[(adress&0x00ffffff)>>11]=(OFF_IN_SEGS<<8)+ADRESS_PAGE;
								TLB[((adress&0x00ffffff)>>11)+1]=(OFF_IN_SEGS<<8)+ADRESS_PAGE+1;
								break;

					}
				break;
	}
 //printf(" [%x]=%x %x %x ",(unsigned int)((adress&0x00ffffff)>>11),
 //						 TLB[(adress&0x00ffffff)>>11],
 //						 ADRESS_PAGE,
 //						 (OFF_IN_SEGS<<9)+ADRESS_PAGE
 //						 );
 //getch();
 return(0);
}

void TLB_RESET(void)
{
 static int i;
 for(i=0;i<4096;i++) TLB[i]=0xffff;
}
/***************************************************************/
/*     гдавный цикл команд                                     */
/***************************************************************/
void RUN_COMMAND(void)

{static char COMMAND[8];
 static int COUNT,COUNT2;
 static time_t t1,t2;
 static char RR;
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
 static long SRREZ;
 static unsigned long ADRESS;
 static char far*Command;
 static unsigned long OLD_PSW_ADRESS;
 static unsigned long Psw_adress;
 static int DtaAdress;
 static signed long Const_timer;
 static char far *EEGGAA=0xb800009e;



#ifdef OPT003
 register int Number_block;
#else
 static int Number_block;
#endif


 static char OLD_PSW_KEY;
 static char OLD_DINTRADR;
#define B1 B2
#define I2 RX
#define X2 R2

 RETURN=0;
 //t1=time(NULL);
 if (PSW_AMWP&0x02)
	 {
		Const_timer=CONST_TIMER_WAIT;
		if (SHOW_SHOW) *EEGGAA='W';
    goto END_CIKL;
	 }
 if (SHOW_SHOW) *EEGGAA=' ';
 Const_timer=CONST_TIMER;
 if (RQ_TRACE)
	 {
		Const_timer=CONST_TIMER_WAIT;
		COUNT_1000=1;
	 }
//for (COUNT2=0;COUNT2<10000;COUNT2++)
for(COUNT=0;COUNT<COUNT_1000;COUNT++)
	{
#define DEBUG_BP 1
#ifdef DEBUG_BP
   if ((PSW_ADRESS&0xffffff) == DEBUG_PSW_ADRESS)
     {
      RQ_TRACE=0x11;TRACE_UNIT=0;
      COUNT_1000=1;
      printf("\n BP ");

     }
#endif
	 if (((unsigned int)PSW_ADRESS)&0x0001)
		 {
			RQ_TRACE=1;

			RQ_PRG=6;
			goto END_CIKL;
		 }

#ifdef DTA_370
	 OLD_PSW_ADRESS=PSW_ADRESS;
	 Psw_adress=PSW_ADRESS;
	 Dta(PSW_ADRESS);
#endif

	 if ( ( ((6+(unsigned int)PSW_ADRESS)^(unsigned int)PSW_ADRESS) & 0xf800 )==0 )
		 {
			if ((Number_block=(PSW_ADRESS>>11))>= MAX_BLOCK_MEMORY) goto MOVE_C;
			if (MEMORY[Number_block]!=NULL)
				{
				 Command=MEMORY[Number_block]+(((unsigned int)PSW_ADRESS)&0x07ff);
				 goto END_MOVE_C;
				}
		 }
MOVE_C:


#ifdef DTA_370
			PSW_ADRESS=Psw_adress;
#endif

    MOVE_360_TO_MEM(PSW_ADRESS,COMMAND,6);/* байт команды                  */
		Command=COMMAND;
	  if (RETURN) return;                   /* может быть ошибка             */
END_MOVE_C:

	  PSW_ILC=ILC[Command[0]];              /*  длина команды                */

		#ifdef DTA_370
				 PSW_ADRESS=Psw_adress;
		#endif

				 #ifdef COM_STAT
						 COMMAND_STAT[Command[0]]++;
				 #endif

		debug_com;     // включается в DFN: DEBUG_COM

	 (*POINT[Command[0]])(Command);
#ifdef DTA_370
	 if (RETURN)
		 {
			if (((RQ_PRG&0xff7f)==0x0010) ||
					((RQ_PRG&0xff7f)==0x0011)
				 )
				{
				 PSW_ADRESS=OLD_PSW_ADRESS;
				}
			goto END_CIKL;
		 }
#else
	 if (RETURN) goto END_CIKL;                   /* некоторые команды могут запросить*/
#endif
																				 /* прерывание                    */
	}

END_CIKL:
	//t2=time(NULL);
	//printf("\n time=%ld" ,t2-t1);
RET:
	OLD_PSW_KEY=PSW_KEY;
	PSW_KEY=0;

#ifdef DTA_370
	OLD_DINTRADR=DINTRADR;
	DINTRADR=0;
#endif

	SRREZ=GET_WORD(0x50l);
	if ((SRREZ>=0l)&&((SRREZ-Const_timer)<0l))
		{RQ_TIMER=1;
		}
	SRREZ=SRREZ-Const_timer;
	PUT_WORD(0x50l,SRREZ);

#ifdef DTA_370
	DINTRADR=OLD_DINTRADR;
#endif

	PSW_KEY=OLD_PSW_KEY;


#ifdef TIMER_CPU

#endif
}




/***************************************************************/
/*    главный цикл компьютера                                  */
/***************************************************************/
void DO_ALL_WORK(void)
{
 static int i;
 static char CCC;
 static long WW;
 static char MASK_TEST;
 static char OLD_PSW_KEY;
 static char OLD_DINTRADR;
RUN:
 if (RQ_7920)
	 {
		RUN_COMMAND();
		RQ_TRACE=0;
		RQ_7920=RUN_EDIT(RQ_7920);
	 }
 else if (RQ_CONSOLE)
				{
				 RUN_COMMAND();
				 RQ_TRACE=0;
				 RQ_CONSOLE=RUN_EDIT_CONSOLE(RQ_7920);
				}
			else if (RQ_TRACE&0x05)                       /*если есть трасса               */

						 {
							if (RUN_OPERATOR()) return;     /*     то выполнить работу пульта*/
							RUN_COMMAND();
						 }
					 else                                /*если нет трассы                */
						 {if (kbhit())                    /*     то проверить запрос на пульт*/
								{
								 if (RUN_OPERATOR()) return;  /*        выполнить работу пульта */
								}
							RUN_COMMAND();                  /*и затем команды                 */
						 }
 if (FLAG_OPEN_CONNECTION) RUN_EDIT_NET(FLAG_OPEN_CONNECTION);
 RETURN=0;
 if (RQ_PRG)                      /*    запрос на программное прерывание*/
		{
		 debug_print;
		 if (RQ_PRG==0x0007) T();
		 PSW_COD_INT=RQ_PRG;
		 STORE_PSW(0x28l);
		 printf("RQ PRG");
		 #ifdef DTA_370
		 if (PSW_AMWP&0x8)  /* EC */
			 {
				OLD_PSW_KEY=PSW_KEY;
				PSW_KEY=0;
				PUT_WORD(140l,(((unsigned long)PSW_ILC)<<16)+(unsigned long)PSW_COD_INT);
				PSW_KEY=OLD_PSW_KEY;
			 }
		 #endif
		 LOAD_PSW(0x68l);
		 RQ_PRG=0;
		 RQ_SVC=0;
		 COUNT_1000=1;
		 goto RUN;
		}
 if (RQ_SVC)                      /*   запрос на SVC      */
		{if (RQ_SVC==0x100) RQ_SVC=0;
		 PSW_COD_INT=RQ_SVC;
		 STORE_PSW(0x20l);
		 #ifdef DTA_370
		 if (PSW_AMWP&0x8)  /* EC */
			 {
				OLD_PSW_KEY=PSW_KEY;
				PSW_KEY=0;
				PUT_WORD(136l,(((unsigned long)PSW_ILC)<<16)+(unsigned long)PSW_COD_INT);
				PSW_KEY=OLD_PSW_KEY;
			 }
		 #endif
		 LOAD_PSW(0x60l);
		 RQ_SVC=0;
		 COUNT_1000=1;
		 goto RUN;
		}
 OLD_PSW_KEY=PSW_KEY;
 PSW_KEY=0;
 COUNT_1000=1000;

#ifdef DTA_370
 OLD_DINTRADR=DINTRADR;
 DINTRADR=0;
#endif

 RUN_CHANEL();

#ifdef DTA_370
 DINTRADR=OLD_DINTRADR;
#endif

 PSW_KEY=OLD_PSW_KEY;

 if (RQ_EXIT)          /* запрос на выход */
	 {RQ_EXIT=1;
		HELPHELP("##НАЖАТА КЛАВИША ESC - ЗАПРОС НА ВЫХОД");
		for(i=0;i<NUMBER_IO;i++)             /* проверить по всем устройствам*/
		 {if ( (FLAG_IO_DEVICE[i]&(RQ_INT|RQ_PCI)) ||
					 (FLAG_IO_DEVICE[i]&RQ_WORK)
				 )     /* запрос на прерывание или работу устройства*/
				{RQ_EXIT=2;
				 printf("\033[u UNIT %x IS BUSY                                 ",ADRESS_IO_DEVICE[i]);
				}
			if ((IO_STATUS[i][2]!=0) || (IO_STATUS[i][3]!=0))
				{
				 if ((IO_STATUS[i][3]==0x48) && ((TYPE_IO_DEVICE[i]=='T') ||
						 (TYPE_IO_DEVICE[i]=='5')) )
							RQ_EXIT=1;
				 else
					 {
						RQ_EXIT=2;
						printf("\033[u UNIT %x KEEPING INTERRUPT REQUEST            ",ADRESS_IO_DEVICE[i]);
					 }
				}
		 }

		if (RQ_EXIT==1) return;

	 }
#ifdef DTA_370
 OLD_DINTRADR=DINTRADR;
 DINTRADR=0;
#endif

 for(i=0;i<NUMBER_IO;i++)             /* проверить по всем устройствам*/
	 {if (FLAG_IO_DEVICE[i]&(RQ_INT|RQ_PCI))     /* запрос на прерывание от устройства*/
		{
		 if (RQ_IPL)                      /* для случая первоначальной загрузки*/
			 {
				/*FLAG_IO_DEVICE[i]=0;*/             /* сбросить запрос                 */
				LOAD_PSW(0l);
				WW=GET_WORD(0l);
				WW&=0xffff0000l;
				WW+=ADRESS_IO_DEVICE[i];
				PUT_WORD(0l,WW);
				RQ_IPL=0;
				goto RUN;
			 }
		 #ifdef DTA_370
		 if (PSW_AMWP&0x8)  /* EC */
			 {
				if (PSW_EC_MASK&0x02) ;
				else continue;
				MASK_TEST=(ADRESS_IO_DEVICE[i])>>8;
				MASK_TEST=0x80>>MASK_TEST;
				if ((((unsigned long)MASK_TEST)<<24)&R370[2]) ;
				else continue;
			 }
		 else               /* BC */
			 {
		 #endif
				MASK_TEST=(ADRESS_IO_DEVICE[i])>>8;
				MASK_TEST=0x80>>MASK_TEST;
				if (MASK_TEST&PSW_MASK) ;
				else continue;
		 #ifdef DTA_370
			 }
		 #endif
     if (TraceOut)
      {
       fprintf(TraceOut,"\n STORE CSW %06lx %02x %02x %04lx ",CSW_CAW[i],IO_STATUS[i][1],
					 IO_STATUS[i][0],CSW_COUNT[i]);
      }

		 if (RQ_TRACE)
     {

       printf("\n STORE CSW %06lx %02x %02x %04lx ",CSW_CAW[i],IO_STATUS[i][1],
					 IO_STATUS[i][0],CSW_COUNT[i]);

     }
		 STORE_CSW(i);
		 PSW_COD_INT=ADRESS_IO_DEVICE[i];
		 STORE_PSW(0x38l);
		 #ifdef DTA_370
		 if (PSW_AMWP&0x8)  /* EC */
			 {
				OLD_PSW_KEY=PSW_KEY;
				PSW_KEY=0;
				PUT_WORD(184l,(((unsigned long)GET_BYTE(184l))<<24)+
											((unsigned long)PSW_COD_INT) );
				PSW_KEY=OLD_PSW_KEY;
			 }
		 #endif
		 LOAD_PSW(0x78l);
		 FLAG_IO_DEVICE[i]=0;             /* сбросить запрос                 */
#ifdef DTA_370
		 DINTRADR=OLD_DINTRADR;
#endif
		 goto RUN;
		}
	 }
#ifdef DTA_370
 DINTRADR=OLD_DINTRADR;
#endif

 if (RQ_TIMER)
		{

		 #ifdef DTA_370
		 if (PSW_AMWP&0x8)  /* EC */
			 {
				if (PSW_EC_MASK&0x01)
					{if (R370[0]&0x00000080)
						 {
							PSW_COD_INT=0x0080;
							STORE_PSW(0x18l);
							OLD_PSW_KEY=PSW_KEY;
							PSW_KEY=0;
							PUT_WORD(132l,(unsigned long)PSW_COD_INT);
							PSW_KEY=OLD_PSW_KEY;
							LOAD_PSW(0x58l);
							RQ_TIMER=0;
						 }
					}
			 }
		 else
		 #endif
		 if (PSW_MASK&0x01)
			 {
				PSW_COD_INT=0x0080;
				STORE_PSW(0x18l);
				LOAD_PSW(0x58l);
				RQ_TIMER=0;
			 }
		 goto RUN;
		}
#ifdef TIMER_CPU
	if (RQ_TIMER_CPU)
		{

		 #ifdef DTA_370
		 if (PSW_AMWP&0x8)  /* EC */
			 {
				if (PSW_EC_MASK&0x01)
					{if (R370[0]&0x00000400)
						 {
							PSW_COD_INT=0x1005;
							STORE_PSW(0x18l);
							OLD_PSW_KEY=PSW_KEY;
							PSW_KEY=0;
							PUT_WORD(132l,(unsigned long)PSW_COD_INT);
							PSW_KEY=OLD_PSW_KEY;
							LOAD_PSW(0x58l);
							RQ_TIMER_CPU=0;
						 }
					}
			 }
		 else
		 #endif
		 if (PSW_MASK&0x01)
			 {
				if (R370[0]&0x00000400)
					{
					 PSW_COD_INT=0x1005;
					 STORE_PSW(0x18l);
					 LOAD_PSW(0x58l);
					 RQ_TIMER_CPU=0;
					}
			 }
		 goto RUN;
		}
	if (RQ_COMP)
		{

		 #ifdef DTA_370
		 if (PSW_AMWP&0x8)  /* EC */
			 {
				if (PSW_EC_MASK&0x01)
					{if (R370[0]&0x00000800)
						 {
							PSW_COD_INT=0x1004;
							STORE_PSW(0x18l);
							OLD_PSW_KEY=PSW_KEY;
							PSW_KEY=0;
							PUT_WORD(132l,(unsigned long)PSW_COD_INT);
							PSW_KEY=OLD_PSW_KEY;
							LOAD_PSW(0x58l);
							RQ_COMP=0;
						 }
					}
			 }
		 else
		 #endif
		 if (PSW_MASK&0x01)
			 {
				if (R370[0]&0x00000800)
					{
					 PSW_COD_INT=0x1004;
					 STORE_PSW(0x18l);
					 LOAD_PSW(0x58l);
					 RQ_COMP=0;
					}
			 }
		 goto RUN;
		}
#endif

 goto RUN;
}


void  main(argc,argv)
 char **argv;
 int argc;

{
 static time_t T1,T2;
 static unsigned long int ADD;
 static int ii,i,j;

 static char far *BIOS_AREA=0xf000fff0;
 static unsigned long all_count;
 static int i_count,i_count_2;
 static char bios_32_2[64];

 TraceOut=NULL;
 TraceOutCmd=NULL;
 NUMBER_IO_CUR=0;
 DEBUG_PSW_ADRESS = 0xff000000;
 if (argc==1)
	 {
		HELPHELP("## DST360P /<?/H/I/>");
		return;
	 }
 if ((argv[1][0]=='/' || argv[1][0]=='-')
      &&(argv[1][1]=='h' || argv[1][1]=='H' || argv[1][1]=='?'))
	 {
		HELPHELP("## DST360P /<?/H/I/>");
		return;
	 }



 if (INIT_MEMORY()!=0) return;
 RQ_TIMER=0;
 RQ_EXIT=0;
 RQ_CONSOLE=0;
 RQ_7920=0;
#ifdef COM_STAT
 for (i=0;i<256;i++) COMMAND_STAT[i]=0;
#endif

 if (INIT_CHANEL()!=0) return;

 DEFAULT_RDR_STRING[0]=0;

 if (argv[1][0]=='/' && (argv[1][1]=='i' || argv[1][1]=='I'))
	{

		for(ADD=0;ADD<max_block_memory*2048l;ADD++)
    {
     PUT_BYTE(ADD,0);
    }
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
    PSW_MASK=0;
    PSW_KEY=0;
    PSW_AMWP=0x02;
    PSW_COD_INT=0;
    PSW_ILC=0;
    PSW_CC=0;
    PSW_PRG_MASK=0;
    PSW_ADRESS=0;
    PSW_EC_MASK=0;
    RQ_TRACE=0;

	}
 else
/***********************************************
* process /f<file name command>
***********************************************/

 if (argv[1][0]=='/' && (argv[1][1]!='f' || argv[1][1]!='F'))
   {
    FILE *FT;
    if (FT = fopen(&argv[1][2],"r"))
      {
       fclose(FT);
       strcpy(NAME_FILE_IO_DEVICE[1],&argv[1][2]);
       if (strchr(NAME_FILE_IO_DEVICE[1],'.'))
         {
          strcpy(NAME_FILE_IO_DEVICE[3],&argv[1][2]);
          *strchr(NAME_FILE_IO_DEVICE[3],'.') = 0;
          strcat(NAME_FILE_IO_DEVICE[3],".out");
         }
       RQ_CONSOLE=1;
       strcpy(DEFAULT_RDR_STRING,"s rdr,00c");
       ungetch('\t');
      }
    else ungetch('~');

   }
 else ungetch('~');

#ifdef DTA_370
 HELPHELP("##MAIN370");
#else
 HELPHELP("##MAIN360");
#endif
 printf("\n│ SERIAL NUMBER=%11s               IPL Adress    ║X║║X║║X║      ║IPL║  │",serial_number);
 HELPHELP("##MAIN360_");

 strcpy(bios_32_2,"ead4049902");
 for(i_count=5,BIOS_AREA=0xf000fff5;i_count<16;i_count++)
		 {
			sprintf(&bios_32_2[i_count*2],"%02x",(int)(*BIOS_AREA++));
		 }
 //printf("%s",bios_32_2);

// if (memcmp(bios_32_2,bios_32,32)!=0)
//	 {
//		HELPHELP("##PROTECT");
//	 }

/* PSW_AMWP|=0x02; */
 #ifdef DTA_370
 //for(i=0;i<4096;i++) TLB[i]=i;
 DINTRADR=0;
 if (PSW_AMWP&0x08) if (PSW_EC_MASK&0x04) DINTRADR=1;
 #endif
 COUNT_1000=1000;
 signal(SIGFPE, (fptr)Catcher);

 HELPHELP("## РЕЖИМ ПУЛЬТА ОПЕРАТОРА (ВЫХОД ИЗ ПРОГРАММЫ: ESC)");


 ADD=GET_WORD(0x7c);
 //GET_WORD(ADD);
 //ADD=GET_WORD(0x60);
 //GET_WORD(ADD);
 _AX=1;
 __emit__(0xb1);__emit__(0x25);
 __emit__(0x8a);__emit__(0xe9);
 __emit__(0xb1);__emit__(0x03);
 __emit__(0xb4);__emit__(0x35);
 __emit__(0xcd);__emit__(0x21);
 __emit__(0x8c);__emit__(0xc0);
 __emit__(0x3d);__emit__(0x00);__emit__(0x10);
 __emit__(0x7e);__emit__(0x08);
 __emit__(0x33);__emit__(0xd2);
 __emit__(0x8e);__emit__(0xda);
 __emit__(0x8b);__emit__(0xc1);
 __emit__(0xfa);__emit__(0xf4);

 RQ_PRTR=0;
 RQ_DEBUG=0;
 DO_ALL_WORK();
 CLOSE_MEMORY();
 CLOSE_CHANEL();
 debug_close;
#ifdef COM_STAT
 for (i=0;i<0xc0;i++)
 printf("%02x=%04x ",i,COMMAND_STAT[i]);
 for (i=0xd0;i<0xe0;i++)
 printf("%02x=%04x ",i,COMMAND_STAT[i]);
 for (i=0xf0;i<256;i++)
 printf("%02x=%04x ",i,COMMAND_STAT[i]);
#endif
}
#ifdef INCLUDE
#include "ds360cd0.c"
//#include "ds360cd1.c"
#include "ds360cd4.c"
#include "ds360cd5.c"
#include "ds360cd8.c"
#include "ds360cd9.c"
#endif