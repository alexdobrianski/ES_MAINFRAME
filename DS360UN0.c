/****************************************************************
*
* void DASD_PRE_FIND(int UNIT,char far *ID,unsigned int COUNT)
* int DASD_NEXT_TRK(int UNIT)
* int DASD_NEXT_TRK_F(int UNIT)
* void DASD_SEEK(int UNIT)
* void DASD_NEXT(UNIT)
* void DASD_write(int UNIT)
*
* void RUN_DASD(int UNIT)
*
****************************************************************/
#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <alloc.h>
#include <mem.h>
#include "xmsif.h"
#include "ds360psw.h"

#include "ds360dfn.h"
/*****************************************************************/
/*    XMS                                                        */
/*****************************************************************/
static int           XMS_status;
static unsigned long XMS_BLOCK_SIZE;
static int           XMS_ALLOC_HANDLER;
static unsigned long XMS_OFFSET;
static char far     *XMS_POINTER_STR;
static unsigned long XMS_P_STR;

int SHOW_SHOW;
//extern FILE *TraceOut;


//#include "ds360trn.h"

void DASD_PRE_FIND(int UNIT,char far *ID,unsigned int COUNT)
	{
	 static char far* rr_adress_old;
	 static char far* rr_adress;
	 static struct RECORD *record;
	 static char id[80];
	 static int LEN_KEY,LEN_DATA;
	 if (CSW_COD[UNIT]==0x31)
		 {
			if (COUNT==5)
			 {//rr_adress=AREA_DASD[UNIT]+5;
				rr_adress=RR_ADRESS[UNIT];
NEXT_R:
				record=rr_adress;
				if (record->MY_F==0x11)
					{
					 if (memcmp(rr_adress+2,ID,5)==0)
						 {/* FIND */
							RR_ADRESS[UNIT]=rr_adress;
							return;
						 }
					 LEN_KEY=record->KL;
					 LEN_DATA=(record->DL_H<<8)+record->DL_L;
					 rr_adress+=10+LEN_KEY+LEN_DATA;
					 goto NEXT_R;
					}
				else
					{/* NOT FIND */
					 return;
					}
			 }
		 }
	}

int DASD_NEXT_TRK(int UNIT)
	{
	 if ((DASD_MASK[UNIT] & 0x18)==0x18)
		 {  /*******запрещен преход на следующий TRK******/
			IO_STATUS[UNIT][BYTE_IO_U_1]=0x01;
			IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
		 }
	 else
		 {  /*******переход на следующий TRK**************/
			if (++DASD[UNIT][DASD_CUR_TRK] ==DASD[UNIT][DASD_TRK])
				{  /*    END OF CYL */
				 IO_STATUS[UNIT][BYTE_IO_U_1]=0x20;
				 IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
				}
			else
				{  /*    NEXT TRK   */
				 DASD_SEEK(UNIT);
				 return(1);
				}
		 }
	 return(0);
	}
int DASD_NEXT_TRK_F(int UNIT)
	{
	 if ((DASD_MASK[UNIT] & 0x18)==0x18)
		 {  /*******запрещен преход на следующий TRK******/
			IO_STATUS[UNIT][BYTE_IO_U_1]=0x04;
			IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
		 }
	 else
		 {  /*******переход на следующий TRK**************/
			if (++DASD[UNIT][DASD_CUR_TRK] ==DASD[UNIT][DASD_TRK])
				{  /*    END OF CYL */
				 IO_STATUS[UNIT][BYTE_IO_U_1]=0x20;
				 IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
				}
			else
				{  /*    NEXT TRK   */
				 DASD_SEEK(UNIT);
				 return(1);
				}
		 }
	 return(0);
	}

void DASD_SEEK(int UNIT)
{ static unsigned long OFFSET_TRK;
	static int i;
	static unsigned long OFFSET_IN_XMS;
	static char STTT[80];
	static char far *EEGGAA=0xb8000040;
	if (SHOW_SHOW)
		{
		 sprintf(STTT,"%04x=%04x=%04x",ADRESS_IO_DEVICE[UNIT],
							 DASD[UNIT][DASD_CUR_CYL],DASD[UNIT][DASD_CUR_TRK]);
		 for(EEGGAA=0xb80001ba,i=0;i<14;EEGGAA+=2,i++) *EEGGAA=STTT[i];
		}


	if (DASD_MEM_XMS[UNIT]==0)
			 {
#ifdef TRANSL_CYL
#define BUFER AREA_DASD[UNIT]
#define cyl DASD[UNIT][DASD_CUR_CYL]
#define trk DASD[UNIT][DASD_CUR_TRK]
				if ((((int far*)TR_CYL[UNIT])[(DASD[UNIT][DASD_CUR_CYL])])==0xffff)
						 OFFSET_TRK=(
												 (long)DASD[UNIT][DASD_CUR_CYL]*
												 (long)DASD[UNIT][DASD_TRK]+
												 (long)DASD[UNIT][DASD_CUR_TRK]
												)*(long)(DASD[UNIT][DASD_LEN]);
				else
						 OFFSET_TRK=(
										(long)(((int far*)TR_CYL[UNIT])[(DASD[UNIT][DASD_CUR_CYL])])*
										(long)DASD[UNIT][DASD_TRK]+
										(long)DASD[UNIT][DASD_CUR_TRK]
									 )*(long)(DASD[UNIT][DASD_LEN]);
				if (OFFSET_TRK!=OFFSET_IO_DEVICE[UNIT])
					{
					 if (DASD_WRITE[UNIT])
						 {
							if ((((int far*)TR_CYL[UNIT])[(DASD[UNIT][DASD_CUR_CYL])])!=0xffff)
								{

								 lseek(dasd_file,dasd_offset,SEEK_SET);
								 write(dasd_file,AREA_DASD[UNIT],DASD[UNIT][DASD_LEN]);
								}
						 }
					 if ((((int far*)TR_CYL[UNIT])[(DASD[UNIT][DASD_CUR_CYL])])!=0xffff)
						 {
							lseek(dasd_file,OFFSET_TRK,SEEK_SET);
							read(dasd_file,AREA_DASD[UNIT],DASD[UNIT][DASD_LEN]);
						 }
					 else
						 {
							BUFER[0]=0;
							BUFER[1]=cyl>>8;
							BUFER[2]=cyl&0xff;
							BUFER[3]=trk>>8;
							BUFER[4]=trk&0xff;

							/*R0*/
							BUFER[5]=0x11;

							BUFER[6]=0x11;
							BUFER[7]=cyl>>8;
							BUFER[8]=cyl&0xff;
							BUFER[9]=trk>>8;
							BUFER[10]=trk&0xff;
							BUFER[11]=0;
							BUFER[12]=0;
							BUFER[13]=0;
							BUFER[14]=8;
							for(i=15;i<23;i++) BUFER[i]=0;
							BUFER[23]=0xff;

						 }
					 OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
					 DASD_WRITE[UNIT]=0;
					}
#undef BUFER
#undef cyl
#undef trk

#else
				OFFSET_TRK=(
										(long)DASD[UNIT][DASD_CUR_CYL]*
										(long)DASD[UNIT][DASD_TRK]+
										(long)DASD[UNIT][DASD_CUR_TRK]
									 )*(long)(DASD[UNIT][DASD_LEN]);
				if (OFFSET_TRK!=OFFSET_IO_DEVICE[UNIT])
					{
					 if (DASD_WRITE[UNIT])
						 {
							lseek(dasd_file,dasd_offset,SEEK_SET);
							write(dasd_file,AREA_DASD[UNIT],DASD[UNIT][DASD_LEN]);
						 }
					 lseek(dasd_file,OFFSET_TRK,SEEK_SET);
					 read(dasd_file,AREA_DASD[UNIT],DASD[UNIT][DASD_LEN]);
					 OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
					 DASD_WRITE[UNIT]=0;
					}
#endif
				RR_ADRESS[UNIT]=AREA_DASD[UNIT]+5;
				COUNT_MARK[UNIT]=0;
				DASD_HEADER[UNIT]=HEADER_BEFOR_ID;
			 }
#ifdef FORXMSDASD
	else
			 {
				OFFSET_TRK=(
#ifdef TRANSL_CYL
										(long)(((int far*)TR_CYL[UNIT])[(DASD[UNIT][DASD_CUR_CYL])])*
#else

										(long)DASD[UNIT][DASD_CUR_CYL]*
#endif
										(long)DASD[UNIT][DASD_TRK]+
										(long)DASD[UNIT][DASD_CUR_TRK]
									 )*(long)(DASD[UNIT][DASD_LEN]);
				if (OFFSET_TRK!=OFFSET_IO_DEVICE[UNIT])
					{
					 if (DASD_WRITE[UNIT])
						 {
							for(i=0;i<max_dasd_cash;i++)
								{
								 if ((DASD_MEM_C[UNIT]==DASD_MEM_CYL[UNIT][i]) &&
										 (DASD_MEM_T[UNIT]==DASD_MEM_TRK[UNIT][i])
										)
								 goto OK_FIND_IN_WR;
								}
OK_FIND_IN_WR:if (i<max_dasd_cash)
								{XMS_POINTER_STR=AREA_DASD[UNIT];
								 XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
								 OFFSET_IN_XMS=((unsigned long)(i))*
												((unsigned long)(DASD[UNIT][DASD_LEN]));
								 XMS_status=_XMMcopy(DASD[UNIT][DASD_LEN],0,XMS_P_STR,
															DASD_MEM_XMS[UNIT],OFFSET_IN_XMS);
								 DASD_MEM_WRITE[UNIT][i]=1;
								 goto BEG_FIND;
								}
						 }
BEG_FIND:
					 for(i=0;i<max_dasd_cash;i++)
						 {
							if ((DASD[UNIT][DASD_CUR_CYL]==DASD_MEM_CYL[UNIT][i]) &&
									(DASD[UNIT][DASD_CUR_TRK]==DASD_MEM_TRK[UNIT][i])
								 )
							goto OK_FIND;
						 }
OK_FIND:   if (i<max_dasd_cash)
						 {
							XMS_POINTER_STR=AREA_DASD[UNIT];
							XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
							OFFSET_IN_XMS=((unsigned long)(i))*
												((unsigned long)(DASD[UNIT][DASD_LEN]));
							XMS_status=_XMMcopy(DASD[UNIT][DASD_LEN],
																	DASD_MEM_XMS[UNIT],
																	OFFSET_IN_XMS,0,XMS_P_STR);
							goto OK_READ;
						 }
					 if (DASD_MEM_WRITE[UNIT][DASD_MEM_POINT[UNIT]])
						 {XMS_POINTER_STR=AREA_DASD[UNIT];
							XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
							OFFSET_IN_XMS=((unsigned long)(DASD_MEM_POINT[UNIT]))*
												((unsigned long)(DASD[UNIT][DASD_LEN]));
							XMS_status=_XMMcopy(DASD[UNIT][DASD_LEN],
																	DASD_MEM_XMS[UNIT],
																	OFFSET_IN_XMS,0,XMS_P_STR);
							lseek(dasd_file,(
#ifdef TRANSL_CYL
										(long)(((int far*)TR_CYL[UNIT])[(DASD_MEM_CYL[UNIT][DASD_MEM_POINT[UNIT]])])*
#else

															 (long)DASD_MEM_CYL[UNIT][DASD_MEM_POINT[UNIT]]*
#endif
															 (long)DASD[UNIT][DASD_TRK]+
															 (long)DASD_MEM_TRK[UNIT][DASD_MEM_POINT[UNIT]]
															)*(long)(DASD[UNIT][DASD_LEN])
										,SEEK_SET);
							write(dasd_file,AREA_DASD[UNIT],DASD[UNIT][DASD_LEN]);
						 }
					 lseek(dasd_file,OFFSET_TRK,SEEK_SET);
					 read(dasd_file,AREA_DASD[UNIT],DASD[UNIT][DASD_LEN]);
					 XMS_POINTER_STR=AREA_DASD[UNIT];
					 XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
					 OFFSET_IN_XMS=((unsigned long)(DASD_MEM_POINT[UNIT]))*
												((unsigned long)(DASD[UNIT][DASD_LEN]));
					 XMS_status=_XMMcopy(DASD[UNIT][DASD_LEN],0,XMS_P_STR,
															DASD_MEM_XMS[UNIT],OFFSET_IN_XMS);
					 DASD_MEM_WRITE[UNIT][DASD_MEM_POINT[UNIT]]=0;
					 DASD_MEM_CYL[UNIT][DASD_MEM_POINT[UNIT]]=DASD[UNIT][DASD_CUR_CYL];
					 DASD_MEM_TRK[UNIT][DASD_MEM_POINT[UNIT]]=DASD[UNIT][DASD_CUR_TRK];

					 if (++DASD_MEM_POINT[UNIT]>=max_dasd_cash) DASD_MEM_POINT[UNIT]=0;

OK_READ:	 DASD_MEM_C[UNIT]=DASD[UNIT][DASD_CUR_CYL];
					 DASD_MEM_T[UNIT]=DASD[UNIT][DASD_CUR_TRK];

					 OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
					 DASD_WRITE[UNIT]=0;
					}
				RR_ADRESS[UNIT]=AREA_DASD[UNIT]+5;
				COUNT_MARK[UNIT]=0;
				DASD_HEADER[UNIT]=HEADER_BEFOR_ID;
			 }
#endif
}
void DASD_NEXT(UNIT)
{static int LEN_KEY,LEN_DATA;
 struct RECORD *record;
 record=RR_ADRESS[UNIT];
 LEN_KEY=record->KL;
 LEN_DATA=(record->DL_H<<8)+record->DL_L;
 RR_ADRESS[UNIT]+=10+LEN_KEY+LEN_DATA;
 DASD_HEADER[UNIT]=HEADER_BEFOR_ID;
}
void DASD_write(int UNIT)
{ static unsigned long OFFSET_TRK;
 static int i;
 static unsigned long OFFSET_IN_XMS;
if (DASD_MEM_XMS[UNIT]==0)
 {
	if (DASD_WRITE[UNIT])
		{
		 lseek(dasd_file,dasd_offset,SEEK_SET);
		 write(dasd_file,AREA_DASD[UNIT],DASD[UNIT][DASD_LEN]);
		}
	DASD_WRITE[UNIT]=0;
 }
#ifdef FORXMSDASD
else
 {if (DASD_WRITE[UNIT])
		{
		 lseek(dasd_file,dasd_offset,SEEK_SET);
		 write(dasd_file,AREA_DASD[UNIT],DASD[UNIT][DASD_LEN]);
		 for(i=0;i<max_dasd_cash;i++)
			 {if ((DASD_MEM_C[UNIT]==DASD_MEM_CYL[UNIT][i]) &&
						(DASD_MEM_T[UNIT]==DASD_MEM_TRK[UNIT][i])
					 )
						{DASD_MEM_WRITE[UNIT][i]=0;break;}
			 }
		}
	DASD_WRITE[UNIT]=0;
	for(i=0;i<max_dasd_cash;i++)
	 {
		if (DASD_MEM_WRITE[UNIT][i])
			{XMS_POINTER_STR=AREA_DASD[UNIT];
			 XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
			 OFFSET_IN_XMS=((unsigned long)(i))*
												((unsigned long)(DASD[UNIT][DASD_LEN]));
			 XMS_status=_XMMcopy(DASD[UNIT][DASD_LEN],
																	DASD_MEM_XMS[UNIT],
																	OFFSET_IN_XMS,0,XMS_P_STR);
			 lseek(dasd_file,(
#ifdef TRANSL_CYL
										(long)(((int far*)TR_CYL[UNIT])[(DASD_MEM_CYL[UNIT][i])])*
#else

															 (long)DASD_MEM_CYL[UNIT][i]*
#endif
															 (long)DASD[UNIT][DASD_TRK]+
															 (long)DASD_MEM_TRK[UNIT][i]
															)*(long)(DASD[UNIT][DASD_LEN])
										,SEEK_SET);
			 write(dasd_file,AREA_DASD[UNIT],DASD[UNIT][DASD_LEN]);

			}
	 }
 }
#endif
}

void RUN_DASD(int UNIT)
{
 static int flag_reader_open=0;
 static int RDFILE;
 static int RE;
 static unsigned long CAW;
 static unsigned long ar;
 static int i,j;
 static unsigned int CYL,TRK,RR;
 static unsigned long OFFSET_TRK;
 static unsigned long OFFSET_RR;
 static char FF_00[5];
 static char ID_R0[512];
 static char C_ID_R0_KEY[512];
 static unsigned int COUNT_CC,count_cc,MOVE_COUNT_CC;
 static char KEY[256];
 static char C_KEY[256];
 static int LEN_KEY,LEN_DATA;
 static int KEY_CMP,KEY_FIND,KEY_MT,KEY_READ,KEY_READ_MT,all_read,KEY_READ_R0;
 static char far * AREA_KEY;
 static unsigned int LEN_ALL_DATA;
 static unsigned int COUNT_CC_WRITE;
 static unsigned char BYTE_PR_OUT[10];
 struct SOBSTV_ADRESS *SA;
 struct RECORD *record;
 static int OF_IN_REC;

/************************************************************************
																											 ТРЕК:
 метка начала оборота                          #####
									 <<<<>>>>
 собственный адрес 0   - байт признаков                0  - БАЙТ ПРИЗНАКОВ
									 1-2 - номер цилиндра                1-2 -ЦИЛИНДР
									 3-4 - номер головки                 3-4 -ГОЛОВКА
									 5-6 - циклическая проверка  #####
									 <<<<>>>>
 R0                                                    0    -ПРИЗНАК
																														 FF-больше нет
		поле счетчика  0   - признаки                      0    -R0 ПРИЗНАКИ
									 1-2 цилиндр                         1-2  -R0 ЦИЛИНДР
									 3-4 головка                         3-4  -R0 ГОЛОВКА
									 5   - номер записи                  5    -R0 RN
									 6   - длина ключа  ==0              6    -R0 ДЛИНА КЛЮЧА
									 7-8 -длина данных  ==8 байт         7-8  -R0 ДЛИНА ДАННЫХ
									 9-10-циклическря проверка   #####
		поле данных    0-7
									 <<<<>>>>

																											 0    -ПРИЗНАК
																														 FF-больше нет
 адресный маркер
									 0-специальный байт          #####
									 1-2 циклическая проверка    #####
 R1
		поле счетчика  0   - признаки                      0    -RX
									 1-2 цилиндр                         1-2  -RX
									 3-4 головка                         3-4  -RX
									 5   - номер записи                  5    -RX
									 6   - длина ключа                   6    -RX
									 7-8 -длина данных                   7-8  -RX
									 9-10-циклическря проверка   #####


		поле ключа
									 X...X-содержимое
									 CC-циклическая проверка     #####


		поле данных
									 X...X-содежание
									 CC-циклическая проверка     #####




*************************************************************************/

 if (IO_STATUS[UNIT][8]==0)
			 {
				IO_STATUS[UNIT][9]=
					open(&NAME_FILE_IO_DEVICE[UNIT][0],O_RDWR|O_BINARY);
				if (IO_STATUS[UNIT][9]==0xff)
					{
					 IO_STATUS[UNIT][9]=0;
					 printf("\n ERROR: DASD FILE-%s CAN NOT BE OPEN, CHECK INIT360.PRM",
								 NAME_FILE_IO_DEVICE[UNIT]);
					 IO_STATUS[UNIT][BYTE_IO_U_0]=0x40;
					 IO_STATUS[UNIT][BYTE_IO_U_0]=0x00;
					 IO_STATUS[UNIT][1]=U4|U5|U6;
					 putchar(7);
					 return;
					}
				IO_STATUS[UNIT][8]=1;
				IO_STATUS[UNIT][5]=0;
				//OFFSET_IO_DEVICE[UNIT]=0l;

			 }

 switch(CSW_COD[UNIT])
	 {
		case 0x07:   /* УСТАНОВКА SEEK  */
				CYL=(GET_BYTE(CSW_ADRESS[UNIT]+2)<<8)+GET_BYTE(CSW_ADRESS[UNIT]+3);
				TRK=(GET_BYTE(CSW_ADRESS[UNIT]+4)<<8)+GET_BYTE(CSW_ADRESS[UNIT]+5);
SEEK_00:
				DASD[UNIT][DASD_CUR_CYL]=CYL;
SEEK_01:
				DASD[UNIT][DASD_CUR_TRK]=TRK;
				if (CSW_COUNT[UNIT]>6) {;}
				else if (CSW_COUNT[UNIT]<6) {;}
						 else CSW_COUNT[UNIT]=0;

				DASD[UNIT][DASD_CUR_RR]=0;
				if ((DASD[UNIT][DASD_CUR_CYL]<DASD[UNIT][DASD_CYL]) &&
						(DASD[UNIT][DASD_CUR_TRK]<DASD[UNIT][DASD_TRK])) ;
				else
					{
					 IO_STATUS[UNIT][BYTE_IO_U_0]=0x81;
					 IO_STATUS[UNIT][BYTE_IO_U_1]=0;
					 IO_STATUS[UNIT][1]=U4|U5|U6;
					 break;
					}
				DASD_SEEK(UNIT);

				IO_STATUS[UNIT][2]=0;  /* уточнить состояние==0*/
				IO_STATUS[UNIT][3]=0;

				IO_STATUS[UNIT][1]=U4|U5;
				//if (ADRESS_IO_DEVICE[UNIT]==0x234) {tt(UNIT);RQ_TRACE=2;}
				break;


		case 0x0b:    /* УСТАНОВКА ЦИЛИНДРА SEEK CYLINDER */
				CYL=(GET_BYTE(CSW_ADRESS[UNIT]+2)<<8)+GET_BYTE(CSW_ADRESS[UNIT]+3);
				TRK=DASD[UNIT][DASD_CUR_TRK];
				goto SEEK_00;
				break;


		case 0x1b:     /* УСТАНОВКА ГОЛОВКИ SEEK HEAD
									 команды установки передают из основной памяти 6 байт
									 0-1 ячейка (всегда 0)
									 2-3 цилиндр
									 4-5 головка
									 */

				TRK=(GET_BYTE(CSW_ADRESS[UNIT]+4)<<8)+GET_BYTE(CSW_ADRESS[UNIT]+5);
				goto SEEK_01;
				break;



		case 0x39:     /* ПОИСК ПО СОБСТВЕННОМУ АДРЕСУ НА РАВНО
									 */
				MOVE_360_TO_MEM(CSW_ADRESS[UNIT],C_ID_R0_KEY,CSW_COUNT[UNIT]);
				if (CSW_COUNT[UNIT]<4) {COUNT_CC=CSW_COUNT[UNIT];CSW_COUNT[UNIT]=0;}
				else COUNT_CC=4;
				CSW_COUNT[UNIT]-=4;
				IO_STATUS[UNIT][1]=U4|U5;
				RR_ADRESS[UNIT]=AREA_DASD[UNIT]+5;
				/*printf("KEY39=%02x %02x %02x %02x %02x %02x %02x %02x",
							 (int)AREA_DASD[UNIT][0],
							 (int)AREA_DASD[UNIT][1],
							 (int)AREA_DASD[UNIT][2],
							 (int)AREA_DASD[UNIT][3],
							 (int)AREA_DASD[UNIT][4],
							 (int)AREA_DASD[UNIT][5],
							 (int)AREA_DASD[UNIT][6],
							 (int)AREA_DASD[UNIT][7]);*/
				////COUNT_MARK[UNIT]=0;
				DASD_HEADER[UNIT]=HEADER_BEFOR_ID;
				if (memcmp(&AREA_DASD[UNIT][1],C_ID_R0_KEY,COUNT_CC)==0)
					 {IO_STATUS[UNIT][1]|=(U1);
																							 /* модификатор состояния
																									устройство кончило
																							 */
					 }
				else
					{IO_STATUS[UNIT][1]|=U6;
					 IO_STATUS[UNIT][BYTE_IO_U_1]=0x08;
					}

				//tt(UNIT);
				break;

		case 0x31:     /* ПОИСК ПО ИДЕНТИФИКАТОРУ НА РАВНО
									 */
				if (CSW_COUNT[UNIT]<5) COUNT_CC=CSW_COUNT[UNIT];
				else COUNT_CC=5;

				KEY_CMP=CC_EQ;
				KEY_FIND=FIND_ID;
				KEY_MT=NORMAL_FIND;

FIND_00:
				IO_STATUS[UNIT][2]=0;  /* уточнить состояние==0*/
				IO_STATUS[UNIT][3]=0;
				MOVE_360_TO_MEM(CSW_ADRESS[UNIT],C_ID_R0_KEY,COUNT_CC);

				switch(KEY_FIND)
					{
					 case FIND_ID:
								switch(DASD_HEADER[UNIT])
									 {
										case HEADER_BEFOR_ID:
												 break;
										default:DASD_NEXT(UNIT);
												 break;
									 }
					 case FIND_KEY:
								switch(DASD_HEADER[UNIT])
									 {case HEADER_BEFOR_ID:
										case HEADER_BEFOR_KEY:
												 break;
										default:DASD_NEXT(UNIT);
												 break;
									 }
					}
FIND_NEXT_RR: DASD_PRE_FIND(UNIT,C_ID_R0_KEY,COUNT_CC);
				record=RR_ADRESS[UNIT];
				/*printf("MY_F=%x F=%x C=%x %x T=%x %x R=%x ",
						 (int)(record->MY_F),
						 (int)(record->F),
						 (int)(record->CC_H),
						 (int)(record->CC_L),
						 (int)(record->HH_H),
						 (int)(record->HH_L),
						 (int)(record->R));*/
				if (record->MY_F==0x11)
					{
					 switch(KEY_FIND)
						 {
							case FIND_ID:AREA_KEY=RR_ADRESS[UNIT]+2;
													 count_cc=COUNT_CC;
													 DASD_HEADER[UNIT]=HEADER_AFTER_ID;
													 break;
							case FIND_KEY:
													 LEN_KEY=record->KL;
													 AREA_KEY=RR_ADRESS[UNIT]+10;
													 if (LEN_KEY==0)
														 {
                              for(i=LEN_KEY;i<COUNT_CC;i++) KEY[i]=0;
															AREA_KEY=KEY;
															count_cc=COUNT_CC;
														 }
													 else if (LEN_KEY<COUNT_CC) count_cc=LEN_KEY;
																else count_cc=COUNT_CC;
													 DASD_HEADER[UNIT]=HEADER_AFTER_KEY;
													 break;
						 }
					 /*printf("KEY=%02x %02x %02x %02x %02x %02x %02x %02x",
							 (int)AREA_KEY[0],
							 (int)AREA_KEY[1],
							 (int)AREA_KEY[2],
							 (int)AREA_KEY[3],
							 (int)AREA_KEY[4],
							 (int)AREA_KEY[5],
							 (int)AREA_KEY[6],
							 (int)AREA_KEY[7]);*/
					 if ( count_cc &&
               (
								((KEY_CMP==CC_EQ)&&(memcmp(AREA_KEY,C_ID_R0_KEY,count_cc)==0))||
								((KEY_CMP==CC_GT)&&(memcmp(AREA_KEY,C_ID_R0_KEY,count_cc)> 0))||
								((KEY_CMP==CC_GE)&&(memcmp(AREA_KEY,C_ID_R0_KEY,count_cc)>=0))
               )
							)
						 {
//              if (LEN_KEY)
                IO_STATUS[UNIT][1]=(U1|U4|U5);
																							 /* модификатор состояния
																									устройство кончило
																							 */
//              else
//                {
//                 if (KEY_FIND==FIND_KEY)
//                   IO_STATUS[UNIT][1]=(U4|U5);
//                 else
//                   IO_STATUS[UNIT][1]=(U1|U4|U5);
//                }

						 }
					 else
						 {IO_STATUS[UNIT][1]=(U4|U5);
						 }
					}
				else
					{
					 if (KEY_MT==MT_FIND)
						 {
							//if (DASD_NEXT_TRK_F(UNIT)) goto FIND_NEXT_RR;
							if ((DASD_MASK[UNIT] & 0x18)==0x18)
								{  /*******запрещен преход на следующий TRK******/
								 IO_STATUS[UNIT][BYTE_IO_U_1]=0x04;
								 IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
								}
							else
								{  /*******переход на следующий TRK**************/
								 if (++DASD[UNIT][DASD_CUR_TRK] ==DASD[UNIT][DASD_TRK])
									 {  /*    END OF CYL */
										IO_STATUS[UNIT][BYTE_IO_U_1]=0x20;
										IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
                    IO_STATUS[UNIT][0]&=0x7f;
									 }
								 else
									 {  /*    NEXT TRK   */
										DASD_SEEK(UNIT);
										goto FIND_NEXT_RR;
									 }
								 }
							}
						if (KEY_MT==NORMAL_FIND)
							{/*printf("COUNT=%d ",COUNT_MARK[UNIT]);*/
							 if (COUNT_MARK[UNIT])
								 {
									IO_STATUS[UNIT][1]=(U4|U5|U6);
									IO_STATUS[UNIT][BYTE_IO_U_1]=0x08;
								 }
							 else
								 {DASD_SEEK(UNIT);
									COUNT_MARK[UNIT]=1;
									goto FIND_NEXT_RR;
								 }
							}
					 }

FIND_EXIT:
				CSW_COUNT[UNIT]-=COUNT_CC;

				//tt(UNIT);
				break;
		case 0x51:     /* ПОИСК ПО ИДЕНТИФИКАТОРУ НА БОЬШЕ
									 */
				if (CSW_COUNT[UNIT]<5) COUNT_CC=CSW_COUNT[UNIT];
				else COUNT_CC=5;

				KEY_CMP=CC_GT;
				KEY_FIND=FIND_ID;
				KEY_MT=NORMAL_FIND;
				goto FIND_00;
				break;
		case 0x71:     /* ПОИСК ПО ИДЕНТИФИКАТОРУ НА БОЛЬШЕ ИЛИ РАВНО
									 */
				if (CSW_COUNT[UNIT]<5) COUNT_CC=CSW_COUNT[UNIT];
				else COUNT_CC=5;

				KEY_CMP=CC_GE;
				KEY_FIND=FIND_ID;
				KEY_MT=NORMAL_FIND;
				goto FIND_00;
				break;

		case 0x29:     /* ПОИСК ПО КЛЮЧУ НА РАВНО
									 */
				COUNT_CC=CSW_COUNT[UNIT];
				KEY_CMP=CC_EQ;
				KEY_FIND=FIND_KEY;
				KEY_MT=NORMAL_FIND;
				goto FIND_00;
				break;
		case 0x49:     /* ПОИСК ПО КЛЮЧУ НА БОЛЬШЕ
									 */
				COUNT_CC=CSW_COUNT[UNIT];
				KEY_CMP=CC_GT;
				KEY_FIND=FIND_KEY;
				KEY_MT=NORMAL_FIND;
				goto FIND_00;
				break;
		case 0x69:     /* ПОИСК ПО КЛЮЧУ НА БОЛЬШЕ ИЛИ РАВНО
									 */
				COUNT_CC=CSW_COUNT[UNIT];
				KEY_CMP=CC_GE;
				KEY_FIND=FIND_KEY;
				KEY_MT=NORMAL_FIND;
				goto FIND_00;
				break;

		case 0x2d:     /* ПОИСК ПО КЛЮЧУ И ДАННЫМ НА РАВНО
									 */
				tt(UNIT);
				break;
		case 0x4d:     /* ПОИСК ПО КЛЮЧУ И ДАННЫМ НА БОЛЬШЕ
									 */
				tt(UNIT);
				break;
		case 0x6d:     /* ПОИСК ПО КЛЮЧУ И ДАННЫМ НА БОЛЬШЕ ИЛИ РАВНО
									 */
				tt(UNIT);
				break;

		case 0xb9:     /* МТ-ПОИСК ПО СОБСТВЕННОМУ АДРЕСУ НА РАВНО
									 */
				tt(UNIT);
				break;
		case 0xb1:     /* МТ-ПОИСК ПО ИДЕНТИФИКАТОРУ НА РАВНО
									 */
				if (CSW_COUNT[UNIT]<5) COUNT_CC=CSW_COUNT[UNIT];
				else COUNT_CC=5;

				KEY_CMP=CC_EQ;
				KEY_FIND=FIND_ID;
				KEY_MT=MT_FIND;
				goto FIND_00;
				break;
		case 0xd1:     /* МТ-ПОИСК ПО ИДЕНТИФИКАТОРУ НА БОЛЬШЕ
									 */
				if (CSW_COUNT[UNIT]<5) COUNT_CC=CSW_COUNT[UNIT];
				else COUNT_CC=5;

				KEY_CMP=CC_GT;
				KEY_FIND=FIND_ID;
				KEY_MT=MT_FIND;
				goto FIND_00;
				break;
		case 0xf1:     /* МТ-ПОИСК ПО ИДЕНТИФИКАТОРУ НА БОЛЬШЕ ИЛИ РАВНО
									 */

				if (CSW_COUNT[UNIT]<5) COUNT_CC=CSW_COUNT[UNIT];
				else COUNT_CC=5;

				KEY_CMP=CC_GE;
				KEY_FIND=FIND_ID;
				KEY_MT=MT_FIND;
				goto FIND_00;
				break;
		case 0xa9:     /* МТ-ПОИСК ПО КЛЮЧУ НА РАВНО
									 */
				COUNT_CC=CSW_COUNT[UNIT];
				KEY_CMP=CC_EQ;
				KEY_FIND=FIND_KEY;
				KEY_MT=MT_FIND;
				goto FIND_00;
				break;
		case 0xc9:     /* МТ-ПОИСК ПО КЛЮЧУ НА БОЛЬШЕ
									 */
				COUNT_CC=CSW_COUNT[UNIT];
				KEY_CMP=CC_GT;
				KEY_FIND=FIND_KEY;
				KEY_MT=MT_FIND;
				goto FIND_00;
				break;
		case 0xe9:     /* МТ-ПОИСК ПО КЛЮЧУ НА БОЛЬШЕ ИЛИ РАВНО
									 */
				COUNT_CC=CSW_COUNT[UNIT];
				KEY_CMP=CC_GE;
				KEY_FIND=FIND_KEY;
				KEY_MT=MT_FIND;
				goto FIND_00;
				break;
		case 0xad:     /* МТ-ПОИСК ПО КЛЮЧУ И ДАННЫМ НА РАВНО
									 */
				tt(UNIT);
				break;
		case 0xcd:     /* МТ-ПОИСК ПО КДЮЧУ И ДАННЫМ НА БОЛЬШЕ
									 */
				tt(UNIT);
				break;
		case 0xed:     /* МТ-ПОТСК ПО КЛЮЧУ И ДАННЫМ НА БОЛЬШЕ ИЛИ РАВНО
									 */
				tt(UNIT);
				break;

		case 0x12:     /* ЧТЕНИЕ СЧЕТЧИКА
									 */
				KEY_READ_R0=NOT_READ_R0;
				KEY_READ_MT=READ_NORMAL;
				KEY_READ=READ_COUNT;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;
				break;
		case 0x92:     /* МТ-ЧТЕНИЕ СЧЕТЧИКА

									 */
				KEY_READ_R0=NOT_READ_R0;
				KEY_READ_MT=READ_MT;
				KEY_READ=READ_COUNT;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;
				break;
		case 0x1e:     /* ЧТЕНИЕ СЧЕТЧИКА УЛЮЧА М ДАННЫХ
									 */
				KEY_READ_R0=NOT_READ_R0;
				KEY_READ_MT=READ_NORMAL;
				KEY_READ=READ_COUNT|READ_KEY|READ_DATA;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;
				break;
		case 0x9e:     /* МТ-ЧТЕНИЕ СЧЕТЧИКА КЛЮЧА И ДАННЫХ
									 */
				KEY_READ_R0=NOT_READ_R0;
				KEY_READ_MT=READ_MT;
				KEY_READ=READ_COUNT|READ_KEY|READ_DATA;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;
				break;
		case 0x0e:     /* ЧТЕНИЕ КЛЮЧА И ДАННЫХ
									 */
				KEY_READ_R0=NOT_READ_R0;
				KEY_READ_MT=READ_NORMAL;
				KEY_READ=READ_DATA|READ_KEY;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;
				break;
		case 0x8e:     /* МТ-ЧТЕНИЕ КЛЮЧА И ДАННЫХ
									 */
				KEY_READ_R0=NOT_READ_R0;
				KEY_READ_MT=READ_MT;
				KEY_READ=READ_DATA|READ_KEY;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;

				break;
		case 0x06:     /* ЧТЕНИЕ ДАННЫХ
									 */
				KEY_READ_R0=NOT_READ_R0;
				KEY_READ_MT=READ_NORMAL;
				KEY_READ=READ_DATA;
				COUNT_CC=CSW_COUNT[UNIT];

READ:   IO_STATUS[UNIT][2]=0;  /* уточнить состояние==0*/
				IO_STATUS[UNIT][3]=0;
				switch(KEY_READ)
					{
           case READ_COUNT:
					   switch(DASD_HEADER[UNIT])
						 {
							case HEADER_BEFOR_ID:
									 break;
							case HEADER_BEFOR_KEY:
							case HEADER_BEFOR_DATA:
							case HEADER_AFTER_DATA:
									 DASD_NEXT(UNIT);
									 break;
						 }
             break;
           case READ_KEY|READ_DATA:
             switch(DASD_HEADER[UNIT])
						 {
							case HEADER_BEFOR_ID:
							case HEADER_BEFOR_KEY:
									 break;
							case HEADER_BEFOR_DATA:
							case HEADER_AFTER_DATA:
									 DASD_NEXT(UNIT);
									 break;
						 }
             break;
           case READ_COUNT|READ_KEY|READ_DATA:
					   switch(DASD_HEADER[UNIT])
						 {
							case HEADER_BEFOR_ID:
									 break;
							case HEADER_BEFOR_KEY:
							case HEADER_BEFOR_DATA:
							case HEADER_AFTER_DATA:
									 DASD_NEXT(UNIT);
						 }
             break;
           case READ_DATA:
					   switch(DASD_HEADER[UNIT])
						 {
							case HEADER_BEFOR_ID:
							case HEADER_BEFOR_KEY:
							case HEADER_BEFOR_DATA:
									 break;
							case HEADER_AFTER_DATA:
									 DASD_NEXT(UNIT);
									 break;
						 }
             break;
					}
READ0:  record=RR_ADRESS[UNIT];
				if (record->MY_F==0x11)
					{COUNT_MARK[UNIT]=0;
           switch(KEY_READ)
           {
            /////////////////////////////////////////////////////
            case READ_COUNT:
							 if (record->R==0)
									{DASD_HEADER[UNIT]=HEADER_AFTER_ID;goto READ;/*    R0  NOT READ */
									}
							 if (COUNT_CC<=8) count_cc=CSW_COUNT[UNIT];
							 else count_cc=8;
							 if ((CSW_MOD[UNIT]&0x10)==0)
								 MOVE_MEM_TO_360(&RR_ADRESS[UNIT][2],CSW_ADRESS[UNIT],count_cc);
							 DASD_HEADER[UNIT]=HEADER_AFTER_ID;
               break;

            /////////////////////////////////////////////////////
					  case READ_COUNT|READ_KEY|READ_DATA:
               if (record->R==0 && KEY_READ_R0==NOT_READ_R0)
									 {DASD_HEADER[UNIT]=HEADER_AFTER_DATA;goto READ;/*    R0  NOT READ */
									 }
							 if (record->R!=0 && KEY_READ_R0==READ_R0)
									 {DASD_HEADER[UNIT]=HEADER_AFTER_DATA;goto READ;
									 }
							 count_cc=8+record->KL+((record->DL_H)<<8)+record->DL_L;
							 if (count_cc<=COUNT_CC)
								 {if ((CSW_MOD[UNIT]&0x10)==0)
									MOVE_MEM_TO_360(&RR_ADRESS[UNIT][2],CSW_ADRESS[UNIT],count_cc);
									if (record->F==0x51)          /* продолжить чтение на другой дорожке*/
										{DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
										 if (count_cc==COUNT_CC)
											 {if (CSW_MOD[UNIT] & 0x80)  /* ЦЕПОЧКА ДАННЫХ */
												 {CH_DATA(UNIT);
													if (DASD_NEXT_TRK(UNIT)) goto READ;else goto ABNREAD;
												 }
											 }
										 else
											 {CSW_ADRESS[UNIT]+=count_cc;
												CSW_COUNT[UNIT]-=count_cc;
												if (DASD_NEXT_TRK(UNIT)) goto READ;else goto ABNREAD;
											 }
										}
									DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
								 }
							 else
								 {OF_IN_REC=2;
READ11:
									if ((CSW_MOD[UNIT]&0x10)==0)
									MOVE_MEM_TO_360(&RR_ADRESS[UNIT][OF_IN_REC],CSW_ADRESS[UNIT],COUNT_CC);
									if(CSW_MOD[UNIT] & 0x80)      /* цепочка данных */
										{
										 CH_DATA(UNIT);
										 OF_IN_REC+=COUNT_CC;
										 goto READ11;
										}
									count_cc=COUNT_CC;
									DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
								 }

               break;

           //////////////////////////////////////////////////////
           case READ_KEY|READ_DATA:
							if (record->R==0)
									{DASD_HEADER[UNIT]=HEADER_AFTER_DATA;goto READ;/*    R0  NOT READ */
									}
							 count_cc=record->KL+((record->DL_H)<<8)+record->DL_L;
							 if (count_cc<=COUNT_CC)
								 {if ((CSW_MOD[UNIT]&0x10)==0)
									MOVE_MEM_TO_360(&RR_ADRESS[UNIT][10],CSW_ADRESS[UNIT],count_cc);
									if (record->F==0x51)          /* продолжить чтение на другой дорожке*/
										{DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
										 if (count_cc==COUNT_CC)
											 {if (CSW_MOD[UNIT] & 0x80)  /* ЦЕПОЧКА ДАННЫХ */
												 {CH_DATA(UNIT);
													if (DASD_NEXT_TRK(UNIT)) goto READ;else goto ABNREAD;
												 }
											 }
										 else
											 {CSW_ADRESS[UNIT]+=count_cc;
												CSW_COUNT[UNIT]-=count_cc;
												if (DASD_NEXT_TRK(UNIT)) goto READ;else goto ABNREAD;
											 }
										}
									DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
								 }
							 else
								 {OF_IN_REC=10;
READ12:
									if ((CSW_MOD[UNIT]&0x10)==0)
									MOVE_MEM_TO_360(&RR_ADRESS[UNIT][OF_IN_REC],CSW_ADRESS[UNIT],COUNT_CC);
									if(CSW_MOD[UNIT] & 0x80)      /* цепочка данных */
										{
										 CH_DATA(UNIT);
										 OF_IN_REC+=COUNT_CC;
										 goto READ12;
										}
									count_cc=COUNT_CC;
									DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
								 }
               break;

           //////////////////////////////////////////////////////////
					 case READ_DATA:
							if (record->R==0)
									{DASD_HEADER[UNIT]=HEADER_AFTER_DATA;goto READ;/*    R0  NOT READ */
									}
							 count_cc=((record->DL_H)<<8)+record->DL_L;
							 if (count_cc<=COUNT_CC)
								 {if ((CSW_MOD[UNIT]&0x10)==0)
									MOVE_MEM_TO_360(&RR_ADRESS[UNIT][10+record->KL],CSW_ADRESS[UNIT],count_cc);
									if (record->F==0x51)          /* продолжить чтение на другой дорожке*/
										{DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
										 if (count_cc==COUNT_CC)
											 {if (CSW_MOD[UNIT] & 0x80)  /* ЦЕПОЧКА ДАННЫХ */
												 {CH_DATA(UNIT);
													if (DASD_NEXT_TRK(UNIT)) goto READ;else goto ABNREAD;
												 }
											 }
										 else
											 {CSW_ADRESS[UNIT]+=count_cc;
												CSW_COUNT[UNIT]-=count_cc;
												if (DASD_NEXT_TRK(UNIT)) goto READ;else goto ABNREAD;
											 }
										}
									DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
								 }
							 else
								 {OF_IN_REC=10;
READ14:
									if ((CSW_MOD[UNIT]&0x10)==0)
									MOVE_MEM_TO_360(&RR_ADRESS[UNIT][OF_IN_REC+record->KL],CSW_ADRESS[UNIT],COUNT_CC);
									if(CSW_MOD[UNIT] & 0x80)      /* цепочка данных */
										{
										 CH_DATA(UNIT);
										 OF_IN_REC+=COUNT_CC;
										 goto READ14;
										}
									count_cc=COUNT_CC;
									DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
								 }
					 }
					 IO_STATUS[UNIT][1]=U4|U5;
					 CSW_COUNT[UNIT]-=count_cc;

					 if ((KEY_READ==(READ_DATA)) ||
							 (KEY_READ==(READ_KEY|READ_DATA)) ||
               (KEY_READ==(READ_COUNT|READ_KEY|READ_DATA))
							)
						 {                        /*****EOF ON DASD*/
							if ((record->DL_H==0)&&(record->DL_L==0)) IO_STATUS[UNIT][1]|=U7;
						 }
ABNREAD:
					}
				else
					{
					 //if (DASD_NEXT_TRK_F(UNIT)) goto READ;
					 if (KEY_READ_MT==READ_MT)
						 {
							if ((DASD_MASK[UNIT] & 0x18)==0x18)
								{  /*******запрещен преход на следующий TRK******/
								 IO_STATUS[UNIT][BYTE_IO_U_1]=0x04;
								 IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
								}
							else
								{  /*******переход на следующий TRK**************/
								 if (++DASD[UNIT][DASD_CUR_TRK] ==DASD[UNIT][DASD_TRK])
									 {  /*    END OF CYL */
										IO_STATUS[UNIT][BYTE_IO_U_1]=0x20;
										IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
									 }
								 else
									 {  /*    NEXT TRK   */
										DASD_SEEK(UNIT);
										goto READ;
									 }
								}
						 }
					 else
						 {
							DASD_SEEK(UNIT);
										goto READ;
							//IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
							//IO_STATUS[UNIT][BYTE_IO_U_1]=0x08;
						 }
					}
				//tt(UNIT);
				break;
		case 0x86:     /* МТ-ЧТЕНИЕ ДАННЫХ
									 */
				KEY_READ_R0=NOT_READ_R0;
				KEY_READ_MT=READ_MT;
				KEY_READ=READ_DATA;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;
				//tt(UNIT);
				break;
		case 0x16:     /* ЧТЕНИЕ R0
									 */
//				DASD_SEEK(UNIT);
				KEY_READ_R0=READ_R0;
				KEY_READ_MT=READ_NORMAL;
				KEY_READ=READ_COUNT|READ_KEY|READ_DATA;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;
				break;
		case 0x96:     /* МТ-ЧТЕНИЕ R0
									 */
				DASD_SEEK(UNIT);
				KEY_READ_R0=READ_R0;
				KEY_READ_MT=READ_MT;
				KEY_READ=READ_COUNT|READ_KEY|READ_DATA;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;
				break;
		case 0x1a:     /* ЧТЕНИЕ СОБСТВЕННОГО АДРЕСА
									 */
				if ((CSW_MOD[UNIT]&0x10)==0)
				 MOVE_MEM_TO_360(AREA_DASD[UNIT],CSW_ADRESS[UNIT],CSW_COUNT[UNIT]);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				RR_ADRESS[UNIT]=AREA_DASD[UNIT]+5;
				DASD_HEADER[UNIT]=HEADER_BEFOR_ID;
				COUNT_MARK[UNIT]=0;
				//tt(UNIT);
				break;
		case 0x9a:     /* МТ-ЧТЕНИЕ СОБСТВЕННОГО АДРЕСА
									 */
				tt(UNIT);
				break;
		case 0x02:     /* ЧТЕНИЕ НАЧАЛЬНОЙ ЗАГРУЗКИ ПРОГРАММЫ
									 */
				DASD[UNIT][DASD_CUR_CYL]=0;
				DASD[UNIT][DASD_CUR_TRK]=0;
				DASD[UNIT][DASD_CUR_RR]=0;
				DASD_SEEK(UNIT);

				C_ID_R0_KEY[0]=0;
				C_ID_R0_KEY[1]=0;

				C_ID_R0_KEY[2]=0;
				C_ID_R0_KEY[3]=0;

				C_ID_R0_KEY[4]=1;
				COUNT_CC=5;

CIKL_DD2:
				record=RR_ADRESS[UNIT];
			 /*	printf("MY_F=%x F=%x C=%x %x T=%x %x R=%x ",
						 (int)(record->MY_F),
						 (int)(record->F),
						 (int)(record->CC_H),
						 (int)(record->CC_L),
						 (int)(record->HH_H),
						 (int)(record->HH_L),
						 (int)(record->R));*/
				if (record->MY_F==0x11)
					{
					 if (memcmp(&RR_ADRESS[UNIT][2],C_ID_R0_KEY,COUNT_CC)==0)
						 {IO_STATUS[UNIT][1]=(U1|U4|U5);
																							 /* модификатор состояния
																									устройство кончило
																							 */
							KEY_READ_R0=NOT_READ_R0;
							KEY_READ_MT=READ_NORMAL;
							KEY_READ=READ_DATA;
							COUNT_CC=CSW_COUNT[UNIT];
							DASD_HEADER[UNIT]=HEADER_AFTER_ID;
							goto READ;
						 }
					 else
						 {DASD_NEXT(UNIT);
							goto CIKL_DD2;
						 }
					}
				else
					{IO_STATUS[UNIT][1]=(U4|U5|U6);
					 IO_STATUS[UNIT][BYTE_IO_U_1]=0x08;
					}

				tt(UNIT);
				break;
		case 0x19:     /* ЗАПИСЬ СОБСТВЕННОГО АДРЕСА
									 */
				MOVE_360_TO_MEM(CSW_ADRESS[UNIT],AREA_DASD[UNIT],5);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				DASD_WRITE[UNIT]=1;
				RR_ADRESS[UNIT]=AREA_DASD[UNIT]+5;
				DASD_HEADER[UNIT]=HEADER_BEFOR_ID;
				COUNT_MARK[UNIT]=0;
				tt(UNIT);
				break;
		case 0x15:     /* ЗАПИСЬ R0
									 */
				DASD_SEEK(UNIT);
				BYTE_PR_OUT[0]=0x11;
				//tt(UNIT);
				COUNT_MARK[UNIT]=0;
				goto WR_C_K_D;
				break;
		case 0x1d:     /* ЗАПИСЬ СЧЕТЧИКА КЛЮЧА И ДАННЫХ
									 */
				BYTE_PR_OUT[0]=0x11;
				COUNT_MARK[UNIT]=0;
WR_C_K_D:
				IO_STATUS[UNIT][2]=0;  /* уточнить состояние==0*/
				IO_STATUS[UNIT][3]=0;
				switch(DASD_HEADER[UNIT])
					{
					 case HEADER_BEFOR_ID:
								break;
					 case HEADER_BEFOR_KEY:
					 case HEADER_BEFOR_DATA:
					 case HEADER_AFTER_DATA:
								DASD_NEXT(UNIT);
								break;
					}
				record=RR_ADRESS[UNIT];
				record->MY_F=0x11;
				record->F=BYTE_PR_OUT[0];
				OF_IN_REC=0;

				MOVE_360_TO_MEM(CSW_ADRESS[UNIT],&RR_ADRESS[UNIT][2+OF_IN_REC],8);
				COUNT_CC=8+(unsigned int)record->KL+
									 (((unsigned int)record->DL_H)<<8)+
									 (unsigned int)record->DL_L;

//WR1D:
				if (((unsigned long)COUNT_CC)<=CSW_COUNT[UNIT])
						MOVE_COUNT_CC=COUNT_CC;
				else
						MOVE_COUNT_CC=CSW_COUNT[UNIT];
WR1D:
				MOVE_360_TO_MEM(CSW_ADRESS[UNIT],&RR_ADRESS[UNIT][2+OF_IN_REC],MOVE_COUNT_CC);
				if(CSW_MOD[UNIT] & 0x80)      /* цепочка данных */
					{OF_IN_REC+=MOVE_COUNT_CC;
					 CH_DATA(UNIT);
           MOVE_COUNT_CC=CSW_COUNT[UNIT];
					 goto WR1D;
					}
				OF_IN_REC+=MOVE_COUNT_CC;
				LEN_DATA=8+(unsigned int)record->KL+((unsigned int)record->DL_H<<8)+
								 (unsigned int)record->DL_L;

        RR_ADRESS[UNIT][2+LEN_DATA]=0xff;
			  if (LEN_DATA>OF_IN_REC)
					{for(i=OF_IN_REC;i<LEN_DATA;i++) RR_ADRESS[UNIT][2+i]=0;
					}
				IO_STATUS[UNIT][BYTE_IO]=U4|U5;
				CSW_COUNT[UNIT]-=(unsigned long)MOVE_COUNT_CC;
				//CSW_COUNT[UNIT]=0;
				DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
				DASD_WRITE[UNIT]=1;

				//tt(UNIT);
				break;
		case 0x01:     /* ЗАПИСЬ СПЕЦИАЛЬНОГО СЧЕТЧИКА КЛЮЧА И ДАННЫХ
									 */
				BYTE_PR_OUT[0]=0x51;
				COUNT_MARK[UNIT]=0;
				goto WR_C_K_D;
				//tt(UNIT);
				break;
		case 0x05:     /* ЗАПИСЬ ДАННЫХ
									 */
				IO_STATUS[UNIT][2]=0;  /* уточнить состояние==0*/
				IO_STATUS[UNIT][3]=0;
				switch(DASD_HEADER[UNIT])
					{
					 case HEADER_BEFOR_ID:
					 case HEADER_BEFOR_KEY:
					 case HEADER_BEFOR_DATA:
								break;
					 case HEADER_AFTER_DATA:
								DASD_NEXT(UNIT);
								break;
					}
				record=RR_ADRESS[UNIT];
				if (record->MY_F==0x11)
					{COUNT_MARK[UNIT]=0;
					 LEN_DATA=(record->DL_H<<8)+record->DL_L;
					 if (LEN_DATA<=CSW_COUNT[UNIT])
							MOVE_360_TO_MEM(CSW_ADRESS[UNIT],&RR_ADRESS[UNIT][10+record->KL],LEN_DATA);
					 else
						 {OF_IN_REC=0;
WR2D:					MOVE_360_TO_MEM(CSW_ADRESS[UNIT],
									&RR_ADRESS[UNIT][10+record->KL+OF_IN_REC],CSW_COUNT[UNIT]);
							OF_IN_REC+=CSW_COUNT[UNIT];
							if(CSW_MOD[UNIT] & 0x80)      /* цепочка данных */
								{
								 CH_DATA(UNIT);
								 goto WR2D;
								}
							if (LEN_DATA>OF_IN_REC)
								for(i=OF_IN_REC;i<LEN_DATA;i++)
									RR_ADRESS[UNIT][10+record->KL+i]=0;
						 }
					 DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
					 IO_STATUS[UNIT][BYTE_IO]=U4|U5;
					 CSW_COUNT[UNIT]=0;
					 DASD_WRITE[UNIT]=1;
					}
				else
					{
					 IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
					 IO_STATUS[UNIT][BYTE_IO_U_1]=0x10;
					}
				//tt(UNIT);
				break;
		case 0x0d:     /* ЗАПИСЬ КЛЮЧА И ДАННЫХ
									 */
				IO_STATUS[UNIT][2]=0;  /* уточнить состояние==0*/
				IO_STATUS[UNIT][3]=0;
				record=RR_ADRESS[UNIT];
				if (record->MY_F==0x11)
					{COUNT_MARK[UNIT]=0;
					 LEN_DATA=record->KL+(record->DL_H<<8)+record->DL_L;
					 if (LEN_DATA<=CSW_COUNT[UNIT])
						 MOVE_360_TO_MEM(CSW_ADRESS[UNIT],&RR_ADRESS[UNIT][10],LEN_DATA);
					 else
						 {OF_IN_REC=0;
WR3D:				  MOVE_360_TO_MEM(CSW_ADRESS[UNIT],
									&RR_ADRESS[UNIT][10+OF_IN_REC],CSW_COUNT[UNIT]);
							OF_IN_REC+=CSW_COUNT[UNIT];
							if(CSW_MOD[UNIT] & 0x80)      /* цепочка данных */
							 {
								CH_DATA(UNIT);
								goto WR3D;
							 }
							if (LEN_DATA>OF_IN_REC)
							 for(i=OF_IN_REC;i<LEN_DATA;i++)
								 RR_ADRESS[UNIT][10+i]=0;
						 }
					 DASD_HEADER[UNIT]=HEADER_AFTER_DATA;
					 IO_STATUS[UNIT][BYTE_IO]=U4|U5;
					 CSW_COUNT[UNIT]=0;
					 DASD_WRITE[UNIT]=1;
					}
				else
					{
					 IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
					 IO_STATUS[UNIT][BYTE_IO_U_1]=0x10;
					}

				//tt(UNIT);
				break;
		case 0x11:     /* СТЕРЕТЬ
									 */
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][BYTE_IO]=U4|U5;
				switch(DASD_HEADER[UNIT])
					 {case HEADER_BEFOR_ID:
								 break;
						default:
								 DASD_NEXT(UNIT);
								 break;
					 }
				record=RR_ADRESS[UNIT];
				record->MY_F=0xff;
				DASD_WRITE[UNIT]=1;
				DASD_HEADER[UNIT]=HEADER_BEFOR_ID;
				//tt(UNIT);
				break;
		case 0x14:      /*		14 - безусловное резервирование
										*/

		case 0x94:           /*94 - освободить накопитель
										*/
		case 0xb4:
										/*b4 - резервирует накопитель за коналом
												 резервирование сбрасывается освобождение накопителя или безусл резерв
										*/

		case 0x0f:     /**0f - управлять пропуском счета
														разрешает пропуск дефектной части области счета
														передаются 3 байта ДЛИНА ОБЛАСТИ КЛЮЧА
														ДЛИНА ОБЛАСТИ ДАННЫХ
									 */

		case 0x17:     /*  восстановление
									 */
		case 0x23:     /**23 -  установка сектора
												предается 1 байт с номером сектора 0-127
												0-127 - КК ВУК
												127-254 - КК ВУК СБОЙ
												255     - холостой ход
									 */
		case 0x03:     /* НОП

									 */
				//CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][BYTE_IO]=U4|U5;
				//IO_STATUS[UNIT][0]=S0;
				//tt(UNIT);
				break;
		case 0x1f:     /* УСТАНОВИТЬ МАСКУ ФАЙЛА
									 */
				ar=CSW_ADRESS[UNIT];
				DASD_MASK[UNIT]=GET_BYTE(ar);
				CSW_COUNT[UNIT]=0;
				OLD_OPERATION[UNIT]=0;
				IO_STATUS[UNIT][BYTE_IO]=U4|U5;
//				tt(UNIT);
				break;
		case 0x13:     /* УСТАНОВКА В НАЧАЛЬНОЕ ПОЛОЖЕНИЕ
									 */
				DASD[UNIT][DASD_CUR_CYL]=0;
				DASD[UNIT][DASD_CUR_TRK]=0;
				DASD[UNIT][DASD_CUR_RR]=0;
				DASD_SEEK(UNIT);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][BYTE_IO]=U4|U5;
				tt(UNIT);
				break;
	 case 0x22:
									 /*22 -     считать сектор
									 при выполнении команды в канал передается один байт данных
									 содержащий номер сектора последней обработанной записи
									 */
				PUT_BYTE(CSW_ADRESS[UNIT],0x11);
				IO_STATUS[UNIT][1]=U4|U5;
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0;
				CSW_COUNT[UNIT]=0;
				tt(UNIT);

		case 0x00:     /*	*00 -  ПРОВЕРИТЬ ВВОД-ВЫВОД
												 получается 1 байт СОСТОЯНИЯ ==00 или
												 состояние отвергнутого байта или состояние прерывания
									 */
				PUT_BYTE(CSW_ADRESS[UNIT],0x00);
				IO_STATUS[UNIT][1]=U4|U5;
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0;
				CSW_COUNT[UNIT]=0;
				tt(UNIT);
				break;
		case 0xe4:
						/* e4 - уточнить тип накопителя
							 0  1  2  3  4  5  6
							 ff 55 63 00 50 67 02	 100
							 ff 55 63 00 50 67 00	 200
							 ff 55 63 00 50 63 00	 317
						*/


				PUT_BYTE(CSW_ADRESS[UNIT],0xff);
				PUT_BYTE(CSW_ADRESS[UNIT]+1,0x55);
				PUT_BYTE(CSW_ADRESS[UNIT]+2,0x63);
				PUT_BYTE(CSW_ADRESS[UNIT]+3,0x00);
				PUT_BYTE(CSW_ADRESS[UNIT]+4,0x50);
				PUT_BYTE(CSW_ADRESS[UNIT]+5,0x67);
				PUT_BYTE(CSW_ADRESS[UNIT]+6,0x02);
				IO_STATUS[UNIT][1]=U4|U5;
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0;
				CSW_COUNT[UNIT]=0;
				tt(UNIT);
		case 0xa4:							 /*a4 - считать и сбросить буфер регистрации
										 УУ передает 24 БУС в формате 6
									 */

				for(i=0,ar=CSW_ADRESS[UNIT];i<6;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][i+2]);IO_STATUS[UNIT][i+2]=0;
						}
				for(i=0,ar=CSW_ADRESS[UNIT]+6;i<24;i++,ar++)
						{
						 PUT_BYTE(ar,0x00);
						}
				IO_STATUS[UNIT][1]=U4|U5;
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0;
				CSW_COUNT[UNIT]=0;
				if (RQ_TRACE&0x02) printf("\n 04 command ");
				tt(UNIT);
				break;

		case 0x04:     /* УТОЧНИТЬ СОСТОЯНИЕ
									 */


				for(i=0,ar=CSW_ADRESS[UNIT];i<6;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][i+2]);IO_STATUS[UNIT][i+2]=0;
						}
				IO_STATUS[UNIT][1]=U4|U5;
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0;
				CSW_COUNT[UNIT]=0;
				if (RQ_TRACE&0x02) printf("\n 04 command ");
				//tt(UNIT);
				break;


		default:
				IO_STATUS[UNIT][BYTE_IO_U_0]=0x80; /* недорустимая команда */
				IO_STATUS[UNIT][BYTE_IO_U_1]=0x10;
				IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
				tt(UNIT);
				break;
		}

}
