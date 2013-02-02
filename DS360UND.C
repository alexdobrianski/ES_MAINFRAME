#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <stat.h>
#include <fcntl.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <alloc.h>
#include <mem.h>

#include "ds360psw.h"

#include "ds360dfn.h"

//#include "ds360trn.h"


void RUN_DASD(int UNIT)
{
 static int flag_reader_open=0;
 static int RDFILE;
 static int RE;
 static unsigned long CAW;
 static char BUFER[8000];
 static unsigned long ar;
 static int i,j;
 static unsigned int CYL,TRK,RR;
 static unsigned long OFFSET_TRK;
 static unsigned long OFFSET_RR;
 static char FF_00[5];
 static char ID_R0[512];
 static char C_ID_R0_KEY[512];
 static int COUNT_CC,count_cc;
 static char KEY[256];
 static char C_KEY[256];
 static int LEN_KEY,LEN_DATA;
 static int KEY_CMP,KEY_FIND,KEY_MT,KEY_READ,KEY_READ_MT,all_read,KEY_READ_R0;
 static char far * AREA_KEY;
 static unsigned int LEN_ALL_DATA;
 static unsigned int COUNT_CC_WRITE;
 static unsigned char BYTE_PR_OUT[10];

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
				IO_STATUS[UNIT][8]=1;
				IO_STATUS[UNIT][5]=0;
				OFFSET_IO_DEVICE[UNIT]=0l;

			 }

 switch(CSW_COD[UNIT])
	 {
		case 0x07:   /* УСТАНОВКА SEEK  */
				CYL=(GET_BYTE(CSW_ADRESS[UNIT]+2)<<8)+GET_BYTE(CSW_ADRESS[UNIT]+3);
				TRK=(GET_BYTE(CSW_ADRESS[UNIT]+4)<<8)+GET_BYTE(CSW_ADRESS[UNIT]+5);
SEEK_00:
				DASD[UNIT][DASD_CUR_CYL]=CYL;
				//if (CYL>=0xaf) tt(UNIT);
SEEK_01:
				IO_STATUS[UNIT][2]=0;  /* уточнить состояние==0*/
				IO_STATUS[UNIT][3]=0;
				DASD[UNIT][DASD_CUR_TRK]=TRK;
				if (CSW_COUNT[UNIT]>6) {;}
				else if (CSW_COUNT[UNIT]<6) {;}
						 else CSW_COUNT[UNIT]=0;

				DASD[UNIT][DASD_CUR_RR]=0;
				OFFSET_TRK=(long)(
													DASD[UNIT][DASD_CUR_CYL]*
													DASD[UNIT][DASD_TRK]+
													DASD[UNIT][DASD_CUR_TRK]
												 )*(long)(DASD[UNIT][DASD_LEN]);

				OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
				lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT]+5l,SEEK_SET);
				//read(IO_STATUS[UNIT][9],ID_R0,5);
				OFFSET_IO_DEVICE[UNIT]+=5l/*=tell(IO_STATUS[UNIT][9])*/;
				IO_STATUS[UNIT][1]=U4|U5;
				OLD_OPERATION[UNIT]=0;
				//tt(UNIT);
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
				OFFSET_TRK=(long)(
													DASD[UNIT][DASD_CUR_CYL]*
													DASD[UNIT][DASD_TRK]+
													DASD[UNIT][DASD_CUR_TRK]
												 )*(long)(DASD[UNIT][DASD_LEN]);

				OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
				lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
				read(IO_STATUS[UNIT][9],ID_R0,5);
				MOVE_360_TO_MEM(CSW_ADRESS[UNIT],C_ID_R0_KEY,CSW_COUNT[UNIT]);
				if (CSW_COUNT[UNIT]<4) {COUNT_CC=CSW_COUNT[UNIT];CSW_COUNT[UNIT]=0;}
				else COUNT_CC=4;
				CSW_COUNT[UNIT]-=4;
				IO_STATUS[UNIT][1]=U4|U5;
				if (memcmp(&ID_R0[1],C_ID_R0_KEY,COUNT_CC)==0)
					 {IO_STATUS[UNIT][1]|=(U1);
																							 /* модификатор состояния
																									устройство кончило
																							 */
						OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
						DASD[UNIT][DASD_CUR_RR]=0;
					 }
				else
					{IO_STATUS[UNIT][1]|=U6;
					 IO_STATUS[UNIT][BYTE_IO_U_1]=0x08;
					}

//				tt(UNIT);
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

FIND_NEXT_RR:
CIKL_DD1:
				if ( OLD_OPERATION[UNIT]==READ_COUNT ||
						(OLD_OPERATION[UNIT]==FIND_ID && KEY_FIND==FIND_KEY) ||
						 OLD_OPERATION[UNIT]==END_OF_CYL
					 )
							lseek(IO_STATUS[UNIT][9],OLD_OFFSET_IO_DEVICE[UNIT],SEEK_SET);
				else
						if ((OLD_OPERATION[UNIT]==WRITE_DATA) /*||
								 (KEY_FIND==FIND_ID)						 /*||
								 (OLD_OPERATION[UNIT]==(READ_COUNT|READ_KEY|READ_DATA))*/
								)
							 {OFFSET_TRK=(long)(
																DASD[UNIT][DASD_CUR_CYL]*
																DASD[UNIT][DASD_TRK]+
																DASD[UNIT][DASD_CUR_TRK]
																)*(long)(DASD[UNIT][DASD_LEN]);

								OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
								lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT]+5l,SEEK_SET);
								//read(IO_STATUS[UNIT][9],ID_R0,5);
								OFFSET_IO_DEVICE[UNIT]+=5l/*=tell(IO_STATUS[UNIT][9])*/;
							 }
						 else lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
NEXT_FND_FND:
				OFFSET_RR=tell(IO_STATUS[UNIT][9]);
				OLD_OFFSET_IO_DEVICE[UNIT]=OFFSET_RR;
				read(IO_STATUS[UNIT][9],FF_00,1);
				if (FF_00[0]==0x11)
					{
					 switch(KEY_FIND)
						 {
							case FIND_ID:read(IO_STATUS[UNIT][9],ID_R0,9);
													 AREA_KEY=&ID_R0[1];
													 count_cc=COUNT_CC;
													 break;
							case FIND_KEY:read(IO_STATUS[UNIT][9],ID_R0,9);
													 LEN_KEY=ID_R0[6];
													 if (LEN_KEY) read(IO_STATUS[UNIT][9],KEY,LEN_KEY);
													 else for(i=LEN_KEY;i<COUNT_CC;i++) KEY[i]=0;
													 lseek(IO_STATUS[UNIT][9],OFFSET_RR+10l,SEEK_SET);
													 AREA_KEY=&KEY[0];
													 count_cc=COUNT_CC;
													 break;
						 }

					 if (

								((KEY_CMP==CC_EQ)&&(memcmp(AREA_KEY,C_ID_R0_KEY,count_cc)==0))||
								((KEY_CMP==CC_GT)&&(memcmp(AREA_KEY,C_ID_R0_KEY,count_cc)> 0))||
								((KEY_CMP==CC_GE)&&(memcmp(AREA_KEY,C_ID_R0_KEY,count_cc)>=0))

							)
						 {IO_STATUS[UNIT][1]=(U1|U4|U5);
																							 /* модификатор состояния
																									устройство кончило
																							 */
							CYL=(ID_R0[1]<<8)+ID_R0[2];
							TRK=(ID_R0[3]<<8)+ID_R0[4];
							RR= ID_R0[5];
							DASD[UNIT][DASD_CUR_CYL]=CYL;
							DASD[UNIT][DASD_CUR_TRK]=TRK;
							DASD[UNIT][DASD_CUR_RR] =RR;
							OFFSET_IO_DEVICE[UNIT]=OFFSET_RR;
							OLD_OPERATION[UNIT]=KEY_FIND;
						 }
					 else
						 {LEN_KEY=ID_R0[6];
							if (LEN_KEY)
								{//read(IO_STATUS[UNIT][9],KEY,LEN_KEY);
								 lseek(IO_STATUS[UNIT][9],(unsigned long)LEN_KEY,SEEK_CUR);
								}
							LEN_DATA=(ID_R0[7]<<8)+ID_R0[8];
							if (LEN_DATA)
								{//read(IO_STATUS[UNIT][9],BUFER,LEN_DATA);
								 lseek(IO_STATUS[UNIT][9],(unsigned long)LEN_DATA,SEEK_CUR);
								}
							OFFSET_RR=tell(IO_STATUS[UNIT][9]);
							//if (KEY_FIND==FIND_ID)
							//	{goto NEXT_FND_FND;
							//	}
							read(IO_STATUS[UNIT][9],FF_00,1);
							if (FF_00[0]==0x11)
								{OFFSET_IO_DEVICE[UNIT]=OFFSET_RR;
								 lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
								 OLD_OPERATION[UNIT]=KEY_FIND;
								 ;/*normal record*/
								}
							else
							 {OLD_OPERATION[UNIT]=0;
								if (KEY_MT==MT_FIND)
									{if ((DASD_MASK[UNIT] & 0x18)==0x18)
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
												 OFFSET_TRK=(long)(
																		DASD[UNIT][DASD_CUR_CYL]*
																		DASD[UNIT][DASD_TRK]+
																		DASD[UNIT][DASD_CUR_TRK]
																					)*(long)(DASD[UNIT][DASD_LEN]);

												 OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
												 lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT]+5l,SEEK_SET);
												 //read(IO_STATUS[UNIT][9],ID_R0,5);
												 OFFSET_IO_DEVICE[UNIT]+=5l/*=tell(IO_STATUS[UNIT][9])*/;
												}
										 }
									}
								if (KEY_MT==NORMAL_FIND)
									{
									 OLD_OPERATION[UNIT]=END_OF_CYL;
									 OLD_OFFSET_IO_DEVICE[UNIT]=OFFSET_RR;
								//	 IO_STATUS[UNIT][1]=(U4|U5|U6);
								//	 IO_STATUS[UNIT][BYTE_IO_U_1]=0x08;
									}
							 }
						 }
					}
				else
							 {OLD_OPERATION[UNIT]=0;
								if (KEY_MT==MT_FIND)
									{if ((DASD_MASK[UNIT] & 0x18)==0x18)
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
												 OFFSET_TRK=(long)(
																		DASD[UNIT][DASD_CUR_CYL]*
																		DASD[UNIT][DASD_TRK]+
																		DASD[UNIT][DASD_CUR_TRK]
																					)*(long)(DASD[UNIT][DASD_LEN]);

												 OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
												 lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT]+5l,SEEK_SET);
												 //read(IO_STATUS[UNIT][9],ID_R0,5);
												 OFFSET_IO_DEVICE[UNIT]+=5l/*=tell(IO_STATUS[UNIT][9])*/;
												}
										 }
									}
								if (KEY_MT==NORMAL_FIND)
									{
									 IO_STATUS[UNIT][1]=(U4|U5|U6);
									 IO_STATUS[UNIT][BYTE_IO_U_1]=0x08;
									}
							 }


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
				if (
						((OLD_OPERATION[UNIT]==READ_COUNT)   &&
						 ((KEY_READ==(READ_KEY|READ_DATA))|| (KEY_READ==READ_DATA)
						 )
						)
					 ) lseek(IO_STATUS[UNIT][9],OLD_OFFSET_IO_DEVICE[UNIT],SEEK_SET);
				else lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
READ0:
				OFFSET_RR=tell(IO_STATUS[UNIT][9]);
				OLD_OFFSET_IO_DEVICE[UNIT]=OFFSET_RR;
				read(IO_STATUS[UNIT][9],FF_00,1);
				if (FF_00[0]==0x11)
					{
					 read(IO_STATUS[UNIT][9],ID_R0,9);
					 LEN_KEY=ID_R0[6];
					 if (LEN_KEY) read(IO_STATUS[UNIT][9],KEY,LEN_KEY);
					 LEN_DATA=(ID_R0[7]<<8)+ID_R0[8];
					 if (LEN_DATA) read(IO_STATUS[UNIT][9],BUFER,LEN_DATA);
					 if (KEY_READ==READ_COUNT && OLD_OPERATION[UNIT]==FIND_ID)
							{OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
							 OLD_OPERATION[UNIT]=0;
							 goto READ0;
							}
					 if (KEY_READ==READ_COUNT)
							{if (ID_R0[5]==0) goto READ0;/*    R0  NOT READ */
							 if (COUNT_CC<=8) count_cc=CSW_COUNT[UNIT];
							 else count_cc=8;
							 if ((CSW_MOD[UNIT]&0x10)==0)
								 MOVE_MEM_TO_360(&ID_R0[1],CSW_ADRESS[UNIT],count_cc);
							}
					 if (KEY_READ==(READ_COUNT|READ_KEY|READ_DATA))
							{if (ID_R0[5]==0 && KEY_READ_R0==NOT_READ_R0) goto READ0;/*    R0  NOT READ */
							 if (ID_R0[5]!=0 && KEY_READ_R0==READ_R0) goto READ0;
							 if (COUNT_CC<8) count_cc=COUNT_CC;
							 else count_cc=8;
							 if ((CSW_MOD[UNIT]&0x10)==0)
								MOVE_MEM_TO_360(&ID_R0[1],CSW_ADRESS[UNIT],count_cc);
							 all_read=count_cc;

							 if ((COUNT_CC-all_read)<LEN_KEY) count_cc=COUNT_CC-all_read;
							 else count_cc=LEN_KEY;

							 if ((CSW_MOD[UNIT]&0x10)==0)
								MOVE_MEM_TO_360(KEY,CSW_ADRESS[UNIT]+all_read,count_cc);
							 all_read+=count_cc;
							 if ((COUNT_CC-all_read)<LEN_DATA) count_cc=COUNT_CC-all_read;
							 else count_cc=LEN_DATA;

							 if ((CSW_MOD[UNIT]&0x10)==0)
								MOVE_MEM_TO_360(BUFER,CSW_ADRESS[UNIT]+all_read,count_cc);
							 all_read+=count_cc;
							 count_cc=all_read;
							}
					 if (KEY_READ==(READ_KEY|READ_DATA))
							{if (ID_R0[5]==0) goto READ0;/*    R0  NOT READ */
							 all_read=0;
							 if ((COUNT_CC-all_read)<LEN_KEY) count_cc=COUNT_CC-all_read;
							 else count_cc=LEN_KEY;

							 if ((CSW_MOD[UNIT]&0x10)==0)
								MOVE_MEM_TO_360(KEY,CSW_ADRESS[UNIT],count_cc);
							 all_read+=count_cc;
							 if ((COUNT_CC-all_read)<LEN_DATA) count_cc=COUNT_CC-all_read;
							 else count_cc=LEN_DATA;

							 if ((CSW_MOD[UNIT]&0x10)==0)
								MOVE_MEM_TO_360(BUFER,CSW_ADRESS[UNIT]+all_read,count_cc);
							 all_read+=count_cc;
							 count_cc=all_read;
							}
					 if (KEY_READ==(READ_DATA))
							{
							 if (COUNT_CC<=LEN_DATA) count_cc=COUNT_CC;
							 else count_cc=LEN_DATA;

							 if ((CSW_MOD[UNIT]&0x10)==0)
								MOVE_MEM_TO_360(BUFER,CSW_ADRESS[UNIT],count_cc);
							}
					 CSW_COUNT[UNIT]-=count_cc;
					 IO_STATUS[UNIT][1]=U4|U5;

					 if ((KEY_READ==(READ_DATA)) ||
							 (KEY_READ==(READ_KEY|READ_DATA))
							)
						 {
							if (LEN_DATA==0) IO_STATUS[UNIT][1]|=U7;
						 }
					 //OLD_OFFSET_IO_DEVICE[UNIT]=OFFSET_IO_DEVICE[UNIT];
					 OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
					 OLD_OPERATION[UNIT]=KEY_READ;
					 read(IO_STATUS[UNIT][9],FF_00,1);
					 if (FF_00[0]==0x11) DASD[UNIT][DASD_CUR_RR]++;
					}
				else
					{OLD_OPERATION[UNIT]=0;
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
										OFFSET_TRK=(long)(
													DASD[UNIT][DASD_CUR_CYL]*
													DASD[UNIT][DASD_TRK]+
													DASD[UNIT][DASD_CUR_TRK]
												 )*(long)(DASD[UNIT][DASD_LEN]);

										lseek(IO_STATUS[UNIT][9],OFFSET_TRK/*+5l*/,SEEK_SET);
										read(IO_STATUS[UNIT][9],ID_R0,5);
										OFFSET_IO_DEVICE[UNIT]=/*OFFSET_TRK+5l*/tell(IO_STATUS[UNIT][9]);
										DASD[UNIT][DASD_CUR_RR]=0;
										goto READ;
									 }
								}
						 }
					 else
						 {IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
							IO_STATUS[UNIT][BYTE_IO_U_1]=0x08;
						 }
					}
//				tt(UNIT);
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
				OFFSET_TRK=(long)(
													DASD[UNIT][DASD_CUR_CYL]*
													DASD[UNIT][DASD_TRK]+
													DASD[UNIT][DASD_CUR_TRK]
												 )*(long)(DASD[UNIT][DASD_LEN]);

				OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
				lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
				read(IO_STATUS[UNIT][9],ID_R0,5);
				OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
				KEY_READ_R0=READ_R0;
				KEY_READ_MT=READ_NORMAL;
				KEY_READ=READ_COUNT|READ_KEY|READ_DATA;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;
				break;
		case 0x96:     /* МТ-ЧТЕНИЕ R0
									 */
				OFFSET_TRK=(long)(
													DASD[UNIT][DASD_CUR_CYL]*
													DASD[UNIT][DASD_TRK]+
													DASD[UNIT][DASD_CUR_TRK]
												 )*(long)(DASD[UNIT][DASD_LEN]);

				OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
				lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
				read(IO_STATUS[UNIT][9],ID_R0,5);
				OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
				KEY_READ_R0=READ_R0;
				KEY_READ_MT=READ_MT;
				KEY_READ=READ_COUNT|READ_KEY|READ_DATA;
				COUNT_CC=CSW_COUNT[UNIT];
				goto READ;
				break;
		case 0x1a:     /* ЧТЕНИЕ СОБСТВЕННОГО АДРЕСА
									 */
				OFFSET_TRK=(long)(
													DASD[UNIT][DASD_CUR_CYL]*
													DASD[UNIT][DASD_TRK]+
													DASD[UNIT][DASD_CUR_TRK]
												 )*(long)(DASD[UNIT][DASD_LEN]);

				OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
				lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
				read(IO_STATUS[UNIT][9],ID_R0,5);
				if ((CSW_MOD[UNIT]&0x10)==0)
				 MOVE_MEM_TO_360(ID_R0,CSW_ADRESS[UNIT],CSW_COUNT[UNIT]);
				OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				OLD_OPERATION[UNIT]=0;
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
				OFFSET_TRK=(long)(
													DASD[UNIT][DASD_CUR_CYL]*
													DASD[UNIT][DASD_TRK]+
													DASD[UNIT][DASD_CUR_TRK]
												 )*(long)(DASD[UNIT][DASD_LEN]);

				OFFSET_IO_DEVICE[UNIT]=OFFSET_TRK;
				lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
				read(IO_STATUS[UNIT][9],ID_R0,5);

				C_ID_R0_KEY[0]=0;
				C_ID_R0_KEY[1]=0;

				C_ID_R0_KEY[2]=0;
				C_ID_R0_KEY[3]=0;

				C_ID_R0_KEY[4]=1;
				COUNT_CC=5;

				OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
CIKL_DD2:OFFSET_RR=tell(IO_STATUS[UNIT][9]);
				read(IO_STATUS[UNIT][9],FF_00,1);
				if (FF_00[0]==0x11)
					{
					 read(IO_STATUS[UNIT][9],ID_R0,9);
					 if (memcmp(&ID_R0[1],C_ID_R0_KEY,COUNT_CC)==0)
						 {IO_STATUS[UNIT][1]=(U1|U4|U5);
																							 /* модификатор состояния
																									устройство кончило
																							 */
							CYL=(ID_R0[1]<<8)+ID_R0[2];
							TRK=(ID_R0[3]<<8)+ID_R0[4];
							RR= ID_R0[5];
							DASD[UNIT][DASD_CUR_CYL]=CYL;
							DASD[UNIT][DASD_CUR_TRK]=TRK;
							DASD[UNIT][DASD_CUR_RR] =RR;
							OFFSET_IO_DEVICE[UNIT]=OFFSET_RR;
							KEY_READ_R0=NOT_READ_R0;
							KEY_READ_MT=READ_NORMAL;
							KEY_READ=READ_DATA;
							COUNT_CC=CSW_COUNT[UNIT];
							goto READ;
						 }
					 else
						 {LEN_KEY=ID_R0[6];
							if (LEN_KEY)
								{read(IO_STATUS[UNIT][9],KEY,LEN_KEY);
								 //lseek(IO_STATUS[UNIT][9],(unsigned long)LEN_KEY,SEEK_CUR);
								}
							LEN_DATA=(ID_R0[7]<<8)+ID_R0[8];
							if (LEN_DATA)
								{read(IO_STATUS[UNIT][9],BUFER,LEN_DATA);
								 //lseek(IO_STATUS[UNIT][9],(unsigned long)LEN_DATA,SEEK_CUR);
								}
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
				tt(UNIT);
				break;
		case 0x15:     /* ЗАПИСЬ R0
									 */
				tt(UNIT);
				break;
		case 0x1d:     /* ЗАПИСЬ СЧЕТЧИКА КЛЮЧА И ДАННЫХ
									 */
				BYTE_PR_OUT[0]=0x11;
WR_C_K_D:
				IO_STATUS[UNIT][2]=0;  /* уточнить состояние==0*/
				IO_STATUS[UNIT][3]=0;
				lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
				read(IO_STATUS[UNIT][9],FF_00,1);
				if (FF_00[0]==0x11)
					{
					 read(IO_STATUS[UNIT][9],ID_R0,9);
					 LEN_KEY=ID_R0[6];
					 if (LEN_KEY) read(IO_STATUS[UNIT][9],KEY,LEN_KEY);
					 LEN_DATA=(ID_R0[7]<<8)+ID_R0[8];
					 if (LEN_DATA) read(IO_STATUS[UNIT][9],BUFER,LEN_DATA);
					}
				else
					{
					 lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
					}
				FF_00[0]=0x11;
				OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
				write(IO_STATUS[UNIT][9],FF_00,1);
				write(IO_STATUS[UNIT][9],BYTE_PR_OUT,1);
				LEN_ALL_DATA=0;
				for(i=0;i<9;i++) ID_R0[i]=BUFER[i];
				LEN_KEY=ID_R0[6];
				LEN_DATA=(ID_R0[7]<<8)+ID_R0[8];
				COUNT_CC=9+LEN_KEY+LEN_DATA;

WR1D:
				MOVE_360_TO_MEM(CSW_ADRESS[UNIT],BUFER,CSW_COUNT[UNIT]);
				write(IO_STATUS[UNIT][9],BUFER,CSW_COUNT[UNIT]);
				LEN_ALL_DATA+=CSW_COUNT[UNIT];
				if(CSW_MOD[UNIT] & 0x80)      /* цепочка данных */
					{
					 CH_DATA(UNIT);
					 //tt(UNIT);
					 goto WR1D;
					}
				IO_STATUS[UNIT][BYTE_IO]=U4|U5;
				CSW_COUNT[UNIT]=0;
				OLD_OPERATION[UNIT]=WRITE_DATA;

				//tt(UNIT);
				break;
		case 0x01:     /* ЗАПИСЬ СПЕЦИАЛЬНОГО СЧЕТЧИКА КЛЮЧА И ДАННЫХ
									 */
				BYTE_PR_OUT[0]=0x51;
				goto WR_C_K_D;
				//tt(UNIT);
				break;
		case 0x05:     /* ЗАПИСЬ ДАННЫХ
									 */
				IO_STATUS[UNIT][2]=0;  /* уточнить состояние==0*/
				IO_STATUS[UNIT][3]=0;
				lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
				read(IO_STATUS[UNIT][9],FF_00,1);
				if (FF_00[0]==0x11)
					{
					 read(IO_STATUS[UNIT][9],ID_R0,9);
					 LEN_KEY=ID_R0[6];
					 LEN_DATA=(ID_R0[7]<<8)+ID_R0[8];
					 if (LEN_KEY) read(IO_STATUS[UNIT][9],KEY,LEN_KEY);
					 MOVE_360_TO_MEM(CSW_ADRESS[UNIT],BUFER,CSW_COUNT[UNIT]);
					 if (LEN_DATA>CSW_COUNT[UNIT])
							for(i=CSW_COUNT[UNIT];i<LEN_DATA;i++)
								 BUFER[i]=0;
					 write(IO_STATUS[UNIT][9],BUFER,LEN_DATA);
					 //if(CSW_MOD[UNIT] & 0x80)      /* цепочка данных */
					 //	 {
					 //		CH_DATA(UNIT);
					 //		tt(UNIT);
					 //		goto WR1D;
					 //	 }
					 OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
					 IO_STATUS[UNIT][BYTE_IO]=U4|U5;
					 CSW_COUNT[UNIT]=0;

					}
				else
					{
					 IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
					 IO_STATUS[UNIT][BYTE_IO_U_1]=0x10;
					}

				OLD_OPERATION[UNIT]=WRITE_DATA;
				//tt(UNIT);
				break;
		case 0x0d:     /* ЗАПИСЬ КЛЮЧА И ДАННЫХ
									 */
				IO_STATUS[UNIT][2]=0;  /* уточнить состояние==0*/
				IO_STATUS[UNIT][3]=0;
				lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
				read(IO_STATUS[UNIT][9],FF_00,1);
				if (FF_00[0]==0x11)
					{
					 read(IO_STATUS[UNIT][9],ID_R0,9);
					 LEN_KEY=ID_R0[6];
					 LEN_DATA=(ID_R0[7]<<8)+ID_R0[8];
					 MOVE_360_TO_MEM(CSW_ADRESS[UNIT],BUFER,CSW_COUNT[UNIT]);
					 if (LEN_KEY+LEN_DATA>CSW_COUNT[UNIT])
							for(i=CSW_COUNT[UNIT];i<LEN_KEY+LEN_DATA;i++)
								 BUFER[i]=0;
					 write(IO_STATUS[UNIT][9],BUFER,LEN_KEY+LEN_DATA);
					 OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
					 IO_STATUS[UNIT][BYTE_IO]=U4|U5;
					 CSW_COUNT[UNIT]=0;

					}
				else
					{
					 IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
					 IO_STATUS[UNIT][BYTE_IO_U_1]=0x10;
					}

				OLD_OPERATION[UNIT]=WRITE_DATA;
				//tt(UNIT);
				break;
		case 0x11:     /* СТЕРЕТЬ
									 */
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][BYTE_IO]=U4|U5;
				tt(UNIT);
				break;
		case 0x17:     /*  НОП
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
				OFFSET_IO_DEVICE[UNIT]=0;
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][BYTE_IO]=U4|U5;
				OLD_OPERATION[UNIT]=0;
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
				if (RQ_TRACE) printf("\n 04 command ");
				//tt(UNIT);
				break;
		case 0xb4:     /* ЗАРЕЗЕРВИРОВАТЬ УСТРОЙСТВО
									 */
				tt(UNIT);
				break;
		case 0x94:     /* ОСВОБОДИТЬ УСТРОЙСТВО
									 */
				tt(UNIT);
				break;


		default:
				IO_STATUS[UNIT][BYTE_IO_U_0]=0x80; /* недорустимая команда */
				IO_STATUS[UNIT][BYTE_IO_U_1]=0x10;
				IO_STATUS[UNIT][BYTE_IO]=U4|U5|U6;
				tt(UNIT);
				break;
		}

}