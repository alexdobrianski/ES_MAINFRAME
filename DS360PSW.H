#define max_device 20
#define max_dasd_cash 20

extern int RETURN;
extern int RQ_SVC;
extern int RQ_PRG;
extern int RQ_IPL;
extern int RQ_TRACE;
extern int RQ_TIMER;
extern int RQ_TIMER_CPU;
extern int RQ_COMP;
extern unsigned long CLOCK1_CPU;
extern unsigned long CLOCK2_CPU;
extern unsigned long REAL_TIME_CPU;
extern unsigned long COUNT_CPU;

extern unsigned long CLOCK1_COMP;
extern unsigned long CLOCK2_COMP;
extern unsigned long REAL_TIME_COMP;
extern unsigned long COUNT_COMP;


extern int COUNT_1000;
extern unsigned long CLOCK1;
extern unsigned long CLOCK2;
extern unsigned long REAL_TIME;
extern int RQ_EXIT;
extern int RQ_7920;
extern int RQ_CONSOLE;
/******************* 370 REGISTER GROUP *******************/
extern unsigned long R370[16];

/******************* REGISTER GROUP ***********************/
extern unsigned long R[16];
extern long double R_FLOAT[8];
/******************* PSW GROUP ****************************/
extern char far *PSW_BEGIN;
extern char PSW_MASK;
extern char PSW_KEY;
extern char PSW_AMWP;
extern unsigned int PSW_COD_INT;
extern int PSW_ILC;
extern char PSW_CC;
extern char PSW_PRG_MASK;
extern unsigned long PSW_ADRESS;
extern char PSW_EC_MASK;
extern unsigned int TLB[4096];
extern char DINTRADR;
extern unsigned long ADRESS_DTA;
extern unsigned long PREFIX_PR;
/*************************** CSW GROUP ********************/
extern int ADRESS_IO_DEVICE[max_device];
extern char TYPE_IO_DEVICE[max_device];
extern char FLAG_IO_DEVICE[max_device];
extern char NAME_FILE_IO_DEVICE[max_device][40];
extern char IO_STATUS[max_device][16];
extern unsigned char CSW_COD[max_device];
extern unsigned long CSW_ADRESS[max_device];
extern unsigned char CSW_MOD[max_device];
extern unsigned char CSW_TP[max_device];
extern unsigned long CSW_COUNT[max_device];
extern unsigned long CSW_CAW[max_device];
extern unsigned long OFFSET_IO_DEVICE[max_device];
extern unsigned long OLD_OFFSET_IO_DEVICE[max_device];
extern int OLD_OPERATION[max_device];
extern int FILE_IO_DEVICE[max_device];
extern int NUMBER_IO;
extern int NUMBER_IO_CUR;
extern char far *POINTER_T;
extern unsigned int DASD[max_device][10];
extern char DASD_MASK[max_device];
extern char far*AREA_7920[max_device];
extern char far*AREA_DASD[max_device];
extern int DASD_MEM_CYL[max_device][20];
extern int DASD_MEM_TRK[max_device][20];
extern int DASD_MEM_WRITE[max_device][20];
extern int DASD_MEM_POINT[max_device];
extern int DASD_MEM_XMS[max_device];
extern int DASD_MEM_C[max_device];
extern int DASD_MEM_T[max_device];
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
static int NU;
extern char far*RR_ADRESS[max_device];
extern char COUNT_MARK[max_device];
extern char DASD_WRITE[max_device];
extern char DASD_HEADER[max_device];
extern int TRACE_UNIT;
extern char TRACE_COMMAND[256];
extern char far*TR_CYL[max_device];
extern int RQ_PRTR;
extern int RQ_DEBUG;

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
#define MASK_FILE 6
