/******************************************************************
*
* void CH_DATA(int UNIT)
* void INIT_CHANEL(void) (PROCESS PRM FILE)
* void CLOSE_CHANEL(void)
* int SIO_DEVICE(unsigned long UNIT)
* int TIO_DEVICE(unsigned long UNIT)
* int TCH_DEVICE(unsigned long UNIT)
* int HIO_DEVICE(unsigned long UNIT)
* int HIO_DEVICE(unsigned long UNIT)
* void STORE_CSW(int unit)
* void RUN_CHANEL(void)
*
* void RUN_READER(int UNIT)
* void RUN_PRINTER(int UNIT)
* void RUN_TYPE(int UNIT)
*
*
******************************************************************/
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

#include "ds360trn.h"

extern int NET_OK;
extern int SHOW_SHOW;
extern int FLAG_OPEN_CONNECTION;

char bios_32[64];
char serial_number[64];
FILE *CONSO;
FILE *READER;
/*****************************************************************/
/*    XMS                                                        */
/*****************************************************************/
static int           XMS_status;
static unsigned long XMS_BLOCK_SIZE;
static int           XMS_ALLOC_HANDLER;
static unsigned long XMS_OFFSET;
static char far     *XMS_POINTER_STR;
static unsigned long XMS_P_STR;
int INTERRUPT;


FILE *TraceOut;

void CH_DATA(int UNIT)
 {
	static unsigned long CAW;
					 CAW=CSW_CAW[UNIT];
					 CAW+=8;
					 CSW_CAW[UNIT]=CAW;
					 CSW_ADRESS[UNIT]=0x00ffffff & GET_WORD(CAW);
					 CSW_MOD[UNIT]=GET_BYTE(CAW+4);
					 CSW_TP[UNIT]=GET_BYTE(CAW+5);
					 CSW_COUNT[UNIT]=0x0000ffff & GET_WORD(CAW+4);
 }
int INIT_CHANEL(void)
{
 FILE *FIL;
 static char STRING[100];
 static int i;
 static int FIL_7920;

 static char far *BIOS_AREA;
 static unsigned long all_count;
 static int i_count,i_count_2;
 static char far*COMMA;
 static int CYL;
 static int TRK;
 static int BYT;
 static int MAXBYTE;
 static char far*CTBM;
 static int FIL_TYPE;
 static char FIL_TYPE_NAME[80];
 static char name_file_io_device[80];
 static unsigned long offset_io_device;
 static int far*TR_CYL_INT;

 NUMBER_IO=0;
 FLAG_OPEN_CONNECTION=0;
 FIL=fopen("DST360P.INI","r");
 if (FIL!=NULL)
	 {

NEXT:if (fgets(STRING,80,FIL)!=NULL)
			 {if (memicmp(STRING,"SERIAL NUMBER=",14)==0)
					{strcpy(serial_number,&STRING[14]);
					 serial_number[11]=0;
					 goto NEXT;
					}
				if (memicmp(STRING,"LN=",3)==0)
					{strcpy(bios_32,&STRING[3]);
					 goto NEXT;
					}
        if (memicmp(STRING,"INTERRUPT=",10)==0)
					{INTERRUPT=ATOX(&STRING[10]);
					 goto NEXT;
					}

				if (memicmp(STRING,"IO=",3)==0) goto IO;
				goto NEXT;
IO:
				for(i=3,ADRESS_IO_DEVICE[NUMBER_IO]=0;i<6;i++)
					{
					 ADRESS_IO_DEVICE[NUMBER_IO]<<=4;
					 if (STRING[i]>='0' && STRING[i]<='9')
							ADRESS_IO_DEVICE[NUMBER_IO]+=STRING[i]-'0';
					 else if (STRING[i]>='a' && STRING[i]<='f')
									 ADRESS_IO_DEVICE[NUMBER_IO]+=STRING[i]-'a'+10;
								else if (STRING[i]>='A' && STRING[i]<='F')
										 ADRESS_IO_DEVICE[NUMBER_IO]+=STRING[i]-'A'+10;
					}
				printf("\n UNIT=%03x ",ADRESS_IO_DEVICE[NUMBER_IO]);
				TYPE_IO_DEVICE[NUMBER_IO]=STRING[7];
				FLAG_IO_DEVICE[NUMBER_IO]=0;
				COMMA=strchr(&STRING[11],',');
				if (COMMA==NULL) COMMA=&STRING[11];
				//if (COMMA[1]>='A' && COMMA[1]<='Z') // ПО ПРОСЬБЕ ВАДИМА !!!!!!!!
					{
					 strcpy(&NAME_FILE_IO_DEVICE[NUMBER_IO][0],&COMMA[1]);
					 if (strchr(&NAME_FILE_IO_DEVICE[NUMBER_IO][0],'\n')!=NULL)
							 *strchr(&NAME_FILE_IO_DEVICE[NUMBER_IO][0],'\n')=0;
					}
				for(i=0;i<10;i++) IO_STATUS[NUMBER_IO][i]=0;
				AREA_7920[NUMBER_IO]=NULL;
				printf(" TYPE=%c ",TYPE_IO_DEVICE[NUMBER_IO]);
				switch (TYPE_IO_DEVICE[NUMBER_IO])
					 {
						case 'D':case 'd':
									 CTBM=strchr(&STRING[7],'C');
									 if (CTBM!=NULL && (memcmp(CTBM,"CYL=",4)==0))
										 {DASD[NUMBER_IO][DASD_CYL]=atoi(&CTBM[4]);
										 }
									 else DASD[NUMBER_IO][DASD_CYL]=203 /*203*/;

									 CTBM=strchr(&STRING[7],'T');
									 if (CTBM!=NULL && (memcmp(CTBM,"TRK=",4)==0))
										 {DASD[NUMBER_IO][DASD_TRK]=atoi(&CTBM[4]);
										 }
									 else DASD[NUMBER_IO][DASD_TRK]=20;

									 CTBM=strchr(&STRING[7],'B');
									 if (CTBM!=NULL && (memcmp(CTBM,"BYTE=",5)==0))
										 {DASD[NUMBER_IO][DASD_MAX_BYTE]=atoi(&CTBM[5]);
										 }
									 else DASD[NUMBER_IO][DASD_MAX_BYTE]=7294;

									 CTBM=strchr(&STRING[7],'M');
									 if (CTBM!=NULL && (memcmp(CTBM,"MAX=",4)==0))
										 {DASD[NUMBER_IO][DASD_LEN]=atoi(&CTBM[4]);
										 }
									 else DASD[NUMBER_IO][DASD_LEN]=8000;

									 printf(" CYL=%x TRK=%x BYTE=%d MAX=%d",
												DASD[NUMBER_IO][DASD_CYL],
												DASD[NUMBER_IO][DASD_TRK],
												DASD[NUMBER_IO][DASD_MAX_BYTE],
												DASD[NUMBER_IO][DASD_LEN]);
									 AREA_DASD[NUMBER_IO]=farmalloc(DASD[NUMBER_IO][DASD_LEN]);
									 OFFSET_IO_DEVICE[NUMBER_IO]=0xffffffff;
									 DASD_WRITE[NUMBER_IO]=0;
#ifdef TRANSL_CYL
									 TR_CYL[NUMBER_IO]=farmalloc(2050);
									 sprintf(FIL_TYPE_NAME,"DASD.%03x",ADRESS_IO_DEVICE[NUMBER_IO]);
									 FIL_TYPE=open(FIL_TYPE_NAME,
										O_RDONLY|O_BINARY);
									 if (FIL_TYPE>0)
										 {
											read(FIL_TYPE,TR_CYL[NUMBER_IO],2048);
											close(FIL_TYPE);
											FIL_TYPE=0;
										 }
									 else
										 {TR_CYL_INT=(int far *)TR_CYL[NUMBER_IO];
											for(i=0;i<=1024;i++) TR_CYL_INT[i]=i;
										 }
#endif
#ifdef FORXMSDASD
									 XMS_BLOCK_SIZE=XMMcoreleft();
									 if (XMS_BLOCK_SIZE<(
														((unsigned long)DASD[NUMBER_IO][DASD_LEN])*
														(unsigned long)max_dasd_cash)
											)
										 {
											printf("\n NOT ENOUGT MEMORY IN XMS FOR CACH DISK %s",
											NAME_FILE_IO_DEVICE[NUMBER_IO]);
											DASD_MEM_XMS[NUMBER_IO]=0;
										 }
									 else
										 {
											DASD_MEM_XMS[NUMBER_IO]=XMMalloc(
														((unsigned long)DASD[NUMBER_IO][DASD_LEN])*
														 (unsigned long)max_dasd_cash
																											);
											//printf("max=%ld xms=%d ",XMS_BLOCK_SIZE,
											//			 DASD_MEM_XMS[NUMBER_IO]);getch();
											DASD_MEM_POINT[NUMBER_IO]=0;
											for(i=0;i<max_dasd_cash;i++)
												{DASD_MEM_CYL[NUMBER_IO][i]=0x0fff;
												 DASD_MEM_TRK[NUMBER_IO][i]=0x0fff;
												 DASD_MEM_WRITE[NUMBER_IO][i]=0;
												}
											DASD_MEM_C[NUMBER_IO]=0x0fff;
											DASD_MEM_T[NUMBER_IO]=0x00ff;
										 }
#else
									DASD_MEM_XMS[NUMBER_IO]=0;
#endif

									 break;
						case '7':AREA_7920[NUMBER_IO]=farmalloc(2000);
									 if (AREA_7920[NUMBER_IO]==NULL) break;

									 FIL_7920=open(NAME_FILE_IO_DEVICE[NUMBER_IO],
																 O_RDONLY|O_BINARY|O_CREAT,S_IREAD|S_IWRITE);
									 if (FIL_7920>0)
										 {
											read(FIL_7920,&AREA_7920[NUMBER_IO][0],1924);
											close(FIL_7920);
											FIL_7920=0;
										 }
									 break;
						case 'T':
									 sprintf(FIL_TYPE_NAME,"TYPE.%03x",ADRESS_IO_DEVICE[NUMBER_IO]);
									 FIL_TYPE=open(FIL_TYPE_NAME,
										O_RDONLY|O_BINARY);
									 if (FIL_TYPE>0)
										 {
											read(FIL_TYPE,name_file_io_device,40);
											read(FIL_TYPE,&offset_io_device,4);
											close(FIL_TYPE);
											FIL_TYPE=0;
											if (strcmp(name_file_io_device,
																 &NAME_FILE_IO_DEVICE[NUMBER_IO][0])==0)
												 {OFFSET_IO_DEVICE[NUMBER_IO]=offset_io_device;
												 }
											else
												 {OFFSET_IO_DEVICE[NUMBER_IO]=0l;
												 }
										 }
									 break;

						case 'N':
									 //AREA_7920[NUMBER_IO]=farmalloc(2000);
                   AREA_7920[NUMBER_IO]= OPEN_CONNECTION(NUMBER_IO);
                   if (AREA_7920[NUMBER_IO]==NULL)
                     {
                      printf("NETWORK initialization falure");
                      return(1);
                     }

									 if (AREA_7920[NUMBER_IO]==NULL) break;

									 FIL_7920=open(NAME_FILE_IO_DEVICE[NUMBER_IO],
									 							 O_RDONLY|O_BINARY|O_CREAT,S_IREAD|S_IWRITE);
									 if (FIL_7920>0)
									 	 {
									 		read(FIL_7920,&AREA_7920[NUMBER_IO][0],1924);
									 		close(FIL_7920);
									 		FIL_7920=0;
									 	 }
                   AREA_7920[NUMBER_IO][1925]=0;
                   AREA_7920[NUMBER_IO][1926]=0;
									 break;
						default:
									 break;
					 }
				NUMBER_IO++;
				if (NUMBER_IO>=max_device)
					{printf("\TOO MANY UNITS (MAX=%d),PRESS ANY KEY",NUMBER_IO);getch();
					}
				else goto NEXT;
			 }
		 fclose(FIL);
	 }
 NU=NUMBER_IO;
 return(0);

}

/***********************************************************************/
/*   программа завершает работу с устройствами в соответствии с
/*   протоколом этих устройств
/***********************************************************************/
/*   1. для дисплея 7920 записывается содержимое изображения экрана
/*   2. для ленты записывается адрес смещения относительно начала
/*      эмулируемой ленты
/*   3. для дисков выполняется закрытие последнего рабочего трека
/***********************************************************************/
void CLOSE_CHANEL(void)
 {static int i,FIL_7920;
	static int FIL_TYPE;
	static char FIL_TYPE_NAME[80];
	for(i=0;i<NUMBER_IO;i++)
	 {if (TYPE_IO_DEVICE[i]=='7' || TYPE_IO_DEVICE[i]=='N')
		 {

      if (AREA_7920[i]==NULL) continue;

			FIL_7920=open(NAME_FILE_IO_DEVICE[i],
										O_WRONLY|O_BINARY|O_CREAT|O_TRUNC,S_IREAD|S_IWRITE);
			if (FIL_7920>0)
				{
				 write(FIL_7920,&AREA_7920[i][0],1924);
				 close(FIL_7920);
				 FIL_7920=0;
				}

      if (TYPE_IO_DEVICE[i]=='N') CLOSE_CONNECTION(i);
      else farfree(AREA_7920[i]);
		 }
		if (TYPE_IO_DEVICE[i]=='T')
		 {sprintf(FIL_TYPE_NAME,"TYPE.%03x",ADRESS_IO_DEVICE[i]);
			FIL_TYPE=open(FIL_TYPE_NAME,
										O_WRONLY|O_BINARY|O_CREAT|O_TRUNC,S_IREAD|S_IWRITE);
			if (FIL_TYPE>0)
				{
				 write(FIL_TYPE,NAME_FILE_IO_DEVICE[i],40);
				 write(FIL_TYPE,&OFFSET_IO_DEVICE[i],4);
				 close(FIL_TYPE);
				}

		 }
		if (TYPE_IO_DEVICE[i]=='D')
		 {DASD_write(i);
#ifdef FORXMSDASD
			if (DASD_MEM_XMS[i]!=0) XMMfree(DASD_MEM_XMS[i]);
#endif
#ifdef TRANSL_CYL
			sprintf(FIL_TYPE_NAME,"DASD.%03x",ADRESS_IO_DEVICE[i]);
			FIL_TYPE=open(FIL_TYPE_NAME,
										O_WRONLY|O_BINARY|O_CREAT|O_TRUNC,S_IREAD|S_IWRITE);
			if (FIL_TYPE>0)
				{
				 write(FIL_TYPE,TR_CYL[i],2050);
				 close(FIL_TYPE);
				 FIL_TYPE=0;
				}
#endif
		 }

	 }
	//if (NET_OK>0)
	//	{
	//	 CLOSE_CONNECTION();
	//	}
 }




int SIO_DEVICE(unsigned long UNIT)
{
 static int unit;
 static unsigned long CAW;
 static unsigned long W1,W2;


 for(unit=0;unit<NUMBER_IO;unit++)
	 {
		if (ADRESS_IO_DEVICE[unit]==(int)(0x00000fff&UNIT) )
		 goto OK_UNIT;
	 }
													/* 1.ЕСЛИ КАНАЛ НЕ РАБОТОСПОСОБЕН CC=3*/
 return(3);

OK_UNIT:
	if ((0x00000f00&UNIT)>0x300) return(3);  /*если адрес канала больше 300*/
							/* 4.ЕСЛИ В КАНАЛЕ ХРАНИТЬСЯ НЕОБРАБОТАННОЕ ПРЕРЫВАНИЕ CC=2*/

	if (FLAG_IO_DEVICE[unit]&RQ_INT)  return(2);
	 CAW=0x00ffffff&GET_WORD(0x48l);
														/* 7. ПРОВЕРИТЬ ПЕРВОЕ CCW на:
																	а) CCW (37-39) != 000
																	b) CCW (4-7)   == 0000
																	c) CCW (4-7)   != 1000  (TIC)
																	d) CCW (48-63) == 0 (поле счетчика)
														 если удовлетворено хотябы одно из перечисленных
																	условий установить S2=1
																	CC=1 CSW=0,S
														 */
					 /* 8. Если S2==0 и CCW (36PCI) ==1 установить S0=1
							при S0==1 возбуждается сигнал прерывания в подканале но S0==1
							не оказывает никакого влияния на выполнение программы канала
						*/
					 /* 13. Если S2==0 и U==0 установить СС=0 */

				/* 14. если S2==0 и CCW(32-33)==01 (цепочка команд) и U==08/0C/4C */
				/* 15. В противном случае установить СС=1 и CSW=U,S*/
 if (CAW&0xf0000000)
	 {
		printf("CAW=%08lx",CAW);
	 }
 CSW_CAW[unit]=CAW;
 CSW_COD[unit]=GET_BYTE(CAW);
 CSW_ADRESS[unit]=0x00ffffff & GET_WORD(CAW);
 CSW_MOD[unit]=GET_BYTE(CAW+4l);
 CSW_TP[unit]=GET_BYTE(CAW+5l);
 CSW_COUNT[unit]=0x0000ffff & GET_WORD(CAW+4l);

 if (IO_STATUS[unit][1]) {STORE_CSW(unit);return(1);}
 FLAG_IO_DEVICE[unit]=RQ_WORK;
 IO_STATUS[unit][0]=0;
 IO_STATUS[unit][1]=0;
 NUMBER_IO_CUR++;
 return(0);


}




int TIO_DEVICE(unsigned long UNIT)
{
 static int unit;
 static unsigned long W1,W2;
 for (unit=0;unit<NUMBER_IO;unit++)
	 {
		if (ADRESS_IO_DEVICE[unit]==(int)(0x00000fff&UNIT) )
		 goto OK_UNIT;
	 }
 return(3);
OK_UNIT:
 if (FLAG_IO_DEVICE[unit]& RQ_INT)
	 {
		STORE_CSW(unit);
		FLAG_IO_DEVICE[unit]=0;
		return(1);
	 }
 if (FLAG_IO_DEVICE[unit]&RQ_WORK)
	 {
		//W1=0;
		// W2=(((unsigned long)IO_STATUS[unit][0])<<16)+
		//	(((unsigned long)IO_STATUS[unit][1])<<24);
		 //PUT_WORD(0x40l,W1);
		 //PUT_WORD(0x44l,W2);
		return(2);

	 }
 return(0);
}
int TCH_DEVICE(unsigned long UNIT)
{
 static int unit;
 static unsigned long W1,W2;
 static int re,re2;
 re=3;re2=0;
 for (unit=0;unit<NUMBER_IO;unit++)
	 {
		if (0x00000F00l&(ADRESS_IO_DEVICE[unit])==(int)(0x00000f00&UNIT) )
		 {re=0;
			if (FLAG_IO_DEVICE[unit]& RQ_INT) re2=1;
			else if (FLAG_IO_DEVICE[unit]&RQ_WORK) re2=2;
		 }
	 }
 if (re==3) return(3);
 else return(re2);
}


int HIO_DEVICE(unsigned long UNIT)
{
 static int unit;
 static unsigned long W1,W2;
 for (unit=0;unit<NUMBER_IO;unit++)
	 {
		if (ADRESS_IO_DEVICE[unit]==(int)(0x00000fff&UNIT) )
		 goto OK_UNIT;
	 }
 return(3);
OK_UNIT:
 if (FLAG_IO_DEVICE[unit]& RQ_INT)
	 {
		return(0);
	 }
 if (FLAG_IO_DEVICE[unit]&RQ_WORK)
	 {
		FLAG_IO_DEVICE[unit]=RQ_INT;
		return(2);

	 }
 return(0);
}
void STORE_CSW(int unit)
{
 static unsigned long W1,W2;
 static char OLD_PSW_KEY;
	if (FLAG_IO_DEVICE[unit]&RQ_INT)
		{
		 W1=CSW_CAW[unit];
		 W2=(((unsigned long)IO_STATUS[unit][0])<<16)+
			(((unsigned long)IO_STATUS[unit][1])<<24)+
			(0x0000ffff&CSW_COUNT[unit]);
		 OLD_PSW_KEY=PSW_KEY;
		 PSW_KEY=0;
		 PUT_WORD(0x40l,W1);
		 PUT_WORD(0x44l,W2);
		 IO_STATUS[unit][0]=0;
		 IO_STATUS[unit][1]=0;
		 PSW_KEY=OLD_PSW_KEY;
		}
}




void RUN_CHANEL(void)
{
 static int cikl_unit;
 static int old_cikl_unit;
 static unsigned long CAW;
 static int i;
 static long adr;
 static unsigned long ADD_CSW;
// old_cikl_unit=-1;
BEGIN:
 if (cikl_unit>=NUMBER_IO) {cikl_unit=0;return;}
// if (old_cikl_unit<0) old_cikl_unit=cikl_unit;
 if (FLAG_IO_DEVICE[cikl_unit]&RQ_WORK)
	 {COUNT_1000=1;
		//if (ADRESS_IO_DEVICE[cikl_unit]==0x234) tt(cikl_unit);
    if (TraceOut)
       {
        fprintf(TraceOut,"\nUNIT (TraceOut)=%03x %06lx=> %02x %06lx %02x %02x %04x ",
						 ADRESS_IO_DEVICE[cikl_unit],
						 CSW_CAW[cikl_unit],
						 CSW_COD[cikl_unit],
						 CSW_ADRESS[cikl_unit],
						 CSW_MOD[cikl_unit],
						 CSW_TP[cikl_unit],
						 CSW_COUNT[cikl_unit]);

       }

		if (RQ_TRACE&0x02)
			if ((TRACE_UNIT==0) || (TRACE_UNIT==ADRESS_IO_DEVICE[cikl_unit]))
			{
       printf("\nUNIT(RQ TRACE)=%03x %06lx=> %02x %06lx %02x %02x %04x ",
						 ADRESS_IO_DEVICE[cikl_unit],
						 CSW_CAW[cikl_unit],
						 CSW_COD[cikl_unit],
						 CSW_ADRESS[cikl_unit],
						 CSW_MOD[cikl_unit],
						 CSW_TP[cikl_unit],
						 CSW_COUNT[cikl_unit]);


			 RQ_TRACE|=0x01;
			}
		if (CSW_MOD[cikl_unit]&0x08)        /* PCI */
			{
			 //FLAG_IO_DEVICE[cikl_unit]=RQ_PCI;
			 IO_STATUS[cikl_unit][0]=S0;       /* PCI */
			 //IO_STATUS[cikl_unit][1]=/*0*/U4|U5;;
			 //return;

			}
		if ((0x0f&(CSW_COD[cikl_unit]))==0x08)       /* переход в канале*/
			{
       if (TraceOut)
          {
           fprintf(TraceOut,"=%04x<",
								 CSW_COUNT[cikl_unit]);
					 for(i=0,adr=CSW_ADRESS[cikl_unit];i<4;i++,adr++)
						 {fprintf(TraceOut,"%02x",GET_BYTE(adr));
						 }

          }

			 if (RQ_TRACE&0x02)
			 if ((TRACE_UNIT==0) || (TRACE_UNIT==ADRESS_IO_DEVICE[cikl_unit]))
				 {
           printf("=%04x<",
								 CSW_COUNT[cikl_unit]);
					 for(i=0,adr=CSW_ADRESS[cikl_unit];i<4;i++,adr++)
						 {printf("%02x",GET_BYTE(adr));
						 }


				 }
			 CAW=CSW_ADRESS[cikl_unit];
			 CSW_CAW[cikl_unit]=CAW;
			 CSW_COD[cikl_unit]=GET_BYTE(CAW);
			 CSW_ADRESS[cikl_unit]=0x00ffffff & GET_WORD(CAW);
			 CSW_MOD[cikl_unit]=GET_BYTE(CAW+4);
			 CSW_TP[cikl_unit]=GET_BYTE(CAW+5);
			 CSW_COUNT[cikl_unit]=0x0000ffff & GET_WORD(CAW+4);
			 goto END_CAW;
			}
		if (CSW_COD[cikl_unit]!=0x04)  /* для всех команд перед выполнением
																	 сброс всех байтов состояния
																	 устройства и уточненного состояния
																	 */
			{IO_STATUS[cikl_unit][1]=0;
			 IO_STATUS[cikl_unit][2]=0;
			 IO_STATUS[cikl_unit][3]=0;
			 IO_STATUS[cikl_unit][4]=0;
			}
		if((CSW_MOD[cikl_unit] & 0x80) && (CSW_COD[cikl_unit]!=0x1d))      /* цепочка данных */
			{
			 if (TYPE_IO_DEVICE[cikl_unit]!='7' && TYPE_IO_DEVICE[cikl_unit]!='N')
			 printf("\nUNIT=%03x %06lx=> %02x %06lx %02x %02x %04x ",
						 ADRESS_IO_DEVICE[cikl_unit],
						 CSW_CAW[cikl_unit],
						 CSW_COD[cikl_unit],
						 CSW_ADRESS[cikl_unit],
						 CSW_MOD[cikl_unit],
						 CSW_TP[cikl_unit],
						 CSW_COUNT[cikl_unit]);
			}
		switch(TYPE_IO_DEVICE[cikl_unit])
			 {
				case 'C':case 'c': RUN_CONSOLE(cikl_unit);break;
				case 'R':case 'r': RUN_READER(cikl_unit);break;
				case 'P':case 'p': RUN_PRINTER(cikl_unit);break;
				/*case 'U':case 'u':RUN_PUNCH(cikl_unit);break;*/
				case 'T':case 't': RUN_TYPE(cikl_unit);break;
				case '5':          RUN_5010(cikl_unit);break;
				case 'D':case 'd': RUN_DASD(cikl_unit);break;
				case '7':          RUN_7920(cikl_unit);break;
				case 'N':case 'n': RUN_7920(cikl_unit);break;
			 }

		if (IO_STATUS[cikl_unit][1]& U1) ADD_CSW=16;  /* для модификатора состояния
																						 следующее CSW надо пропустить
																						 */
		else ADD_CSW=8;

		if (CSW_MOD[cikl_unit]&0x20) IO_STATUS[cikl_unit][0]&=(S1^0xff);
																						/* БЛОКИРОВКА НЕПРАВИЛЬНОЙ ДЛИНЫ*/
		else if (CSW_COUNT[cikl_unit]) IO_STATUS[cikl_unit][0]|=S1;
		if (CSW_COD[cikl_unit]==0x03) IO_STATUS[cikl_unit][0]&=(S1^0xff);

		/* проверка на нормальное завершение работы устройства */

																 /* ЕСЛИ В БАЙТЕ СОСТОЯНИЯ КАНАЛА
																 КАКОЙ-ЛИБО БИТ КРОМЕ S0 (ПРОГРАММНО
																 УПРАВЛЯЕМОЕ ПРЕРЫВАНИЕ) ОКАЖЕТСЯ
																 РАВНЫМ 1 ОПЕРАЦИЯ ПРЕКРАЩАЕТСЯ
																 */
		if (IO_STATUS[cikl_unit][0] &0x7f)
					 {CAW=CSW_CAW[cikl_unit];
						CAW+=8;
						CSW_CAW[cikl_unit]=CAW;
						goto END_CAW;
					 }

																 /*ОПЕРАЦИЯ ТАКЖЕ ПРЕКРАЩАЕТСЯ ЕСЛИ В
																 БАЙТЕ СОСТОЯНИЯ УСТРОЙСТВА
																 КАКОЙ ЛИБО БИТ КРОМЕ КАНАЛ КОНЧИЛ (U4)
																 УСТРОЙСТВО КОНЧИЛО (U5) И МОДИФИКАТОР
																 СОСТОЯНИЯ (U1) ОКАЗАЛСЯ РАВНЫМ 1
																 */

		if (IO_STATUS[cikl_unit][1] & (U0|U2|U3|U6|U7))
					 {CAW=CSW_CAW[cikl_unit];
						CAW+=8;
						CSW_CAW[cikl_unit]=CAW;
						goto END_CAW;
					 }

    if (TraceOut)
       {
        fprintf(TraceOut,"=%04x<",
							CSW_COUNT[cikl_unit]);
			  if (CSW_COD[cikl_unit]==0x29 ||
					 CSW_COD[cikl_unit]==0x49 ||
					 CSW_COD[cikl_unit]==0x69)
			  for(i=0,adr=CSW_ADRESS[cikl_unit];i<16;i++,adr++)
				 {fprintf(TraceOut,"%01c",EBCDIC_ASCII[GET_BYTE(adr)]);
				 }

			  else

			  for(i=0,adr=CSW_ADRESS[cikl_unit];i<8;i++,adr++)
				 {fprintf(TraceOut,"%02x",GET_BYTE(adr));
				 }
       }


		if (RQ_TRACE&0x02)
		if ((TRACE_UNIT==0) || (TRACE_UNIT==ADRESS_IO_DEVICE[cikl_unit]))
			{

        printf("=%04x<",
							CSW_COUNT[cikl_unit]);
			  if (CSW_COD[cikl_unit]==0x29 ||
					 CSW_COD[cikl_unit]==0x49 ||
					 CSW_COD[cikl_unit]==0x69)
			  for(i=0,adr=CSW_ADRESS[cikl_unit];i<16;i++,adr++)
				 {fprintf(TraceOut,"%01c",EBCDIC_ASCII[GET_BYTE(adr)]);
				 }

			  else

			  for(i=0,adr=CSW_ADRESS[cikl_unit];i<8;i++,adr++)
				 {printf("%02x",GET_BYTE(adr));
				 }

			}
		if (CSW_MOD[cikl_unit] & 0x40)    /* цепочка команд */
				{
				 CAW=CSW_CAW[cikl_unit];
				 CAW+=ADD_CSW;
				 CSW_CAW[cikl_unit]=CAW;
				 CSW_COD[cikl_unit]=GET_BYTE(CAW);
				 CSW_ADRESS[cikl_unit]=0x00ffffff & GET_WORD(CAW);
				 CSW_MOD[cikl_unit]=GET_BYTE(CAW+4);
				 CSW_TP[cikl_unit]=GET_BYTE(CAW+5);
				 CSW_COUNT[cikl_unit]=0x0000ffff & GET_WORD(CAW+4);

				}
		else
		if(CSW_MOD[cikl_unit] & 0x80)      /* цепочка данных */
			{
				 CAW=CSW_CAW[cikl_unit];
				 CAW+=ADD_CSW;
				 CSW_CAW[cikl_unit]=CAW;
				 CSW_ADRESS[cikl_unit]=0x00ffffff & GET_WORD(CAW);
				 CSW_MOD[cikl_unit]=GET_BYTE(CAW+4);
				 CSW_TP[cikl_unit]=GET_BYTE(CAW+5);
				 CSW_COUNT[cikl_unit]=0x0000ffff & GET_WORD(CAW+4);
				 //tt(cikl_unit);
			}
		else

		 {CAW=CSW_CAW[cikl_unit];
			CAW+=ADD_CSW;
			CSW_CAW[cikl_unit]=CAW;
			FLAG_IO_DEVICE[cikl_unit]=RQ_INT;
			DASD_MASK[cikl_unit]=0x00;
			//if (IO_STATUS[cikl_unit][1]==0) IO_STATUS[cikl_unit][1]|=0x0c;
		 }


END_CAW:
																 /* ЕСЛИ В БАЙТЕ СОСТОЯНИЯ КАНАЛА
																 КАКОЙ-ЛИБО БИТ КРОМЕ S0 (ПРОГРАММНО
																 УПРАВЛЯЕМОЕ ПРЕРЫВАНИЕ) ОКАЖЕТСЯ
																 РАВНЫМ 1 ОПЕРАЦИЯ ПРЕКРАЩАЕТСЯ
																 */
		if (IO_STATUS[cikl_unit][0] &0x7f)
					 {FLAG_IO_DEVICE[cikl_unit]=RQ_INT;
						DASD_MASK[cikl_unit]=0x00;
					 }

																 /*ОПЕРАЦИЯ ТАКЖЕ ПРЕКРАЩАЕТСЯ ЕСЛИ В
																 БАЙТЕ СОСТОЯНИЯ УСТРОЙСТВА
																 КАКОЙ ЛИБО БИТ КРОМЕ КАНАЛ КОНЧИЛ (U4)
																 УСТРОЙСТВО КОНЧИЛО (U5) И МОДИФИКАТОР
																 СОСТОЯНИЯ (U1) ОКАЗАЛСЯ РАВНЫМ 1
																 */

		if (IO_STATUS[cikl_unit][1] & (U0|U2|U3|U6|U7))
					 {FLAG_IO_DEVICE[cikl_unit]=RQ_INT;
						DASD_MASK[cikl_unit]=0x00;
					 }


//		if (FLAG_IO_DEVICE[cikl_unit]&RQ_INT)
//			{NUMBER_IO_CUR--;
//			 if (NUMBER_IO_CUR<0) NUMBER_IO_CUR=0;
//			}

		if (RQ_TRACE&0x02)
		if ((TRACE_UNIT==0) || (TRACE_UNIT==ADRESS_IO_DEVICE[cikl_unit]))
			{

       if (TraceOut)
       {
        fprintf(TraceOut,">%02x %02x (%02x,%02x)",
							IO_STATUS[cikl_unit][1],
							IO_STATUS[cikl_unit][0],
							IO_STATUS[cikl_unit][2],
							IO_STATUS[cikl_unit][3]);
       }
			}
	 }
 ++cikl_unit;
// if (cikl_unit==old_cikl_unit) return;
// if (NUMBER_IO_CUR<2)
	goto BEGIN;
}

void RUN_READER(int UNIT)
{
 static int flag_reader_open=0;
 static int RDFILE;
 static int RE,re;
 static unsigned long CAW;
 static char BUFER[160];
 static unsigned long ar;
 static int i;
 static char STTT[80];
 static char far *EEGGAA=0xb8000040;


 /**********************************************************************
	БАЙТ СОСТОЯНИЯ УСТРОЙСТВА
	0 1 2 не используется
	3     занято
	4     канал кончил
				ЭТОТ сигнал выдается как только последний
				байт передан в канал
				если считывается менее 80 колонок то сигнал
				выдается как только поле счетчика
				CCW станет равным нулю
	5     УВВ кончило этот сигнал выдается после того как перфокарта
				полностью прошла пункт чтения ЭТО произойдет не ранее чем через
				3,5 миллисекунд после сигнала КАНАЛ КОНЧИЛ
	6     ОШИБКА В УСТРОЙСТВЕ U6==1 всегда когда байт уточненного
				состояния отличен от нуля
	7     Особый случай в устройстве После того как была прочитана
				последняя карта колоды при первом же новом чтении будет выдан
				этот сигнал еще во время выбора устройства
				Т е в ответ на SIO будет установлено СС=1

 БАЙТ уточненного состояния
 0      команда отвергнута
 1      требуется вмешательство СИГНАЛ выдается при полном приемном
				кармане при замятии перфокарты при пустом магазине без EOF
				в состоянии НЕ ГОТОВО
 2      ОШИБКА В ШИНЕ
 3      ОШИБКА В ОБОРУДОВАНИИ
 4      ОШИБКА В ДАННЫХ
 5      ПЕРЕПОЛНЕНИЕ
 6 7    не используются

 ***********************************************************************
 кнопки   EOF
					START
					STOP
 ***********************************************************************/
 //tt(UNIT);
 switch(CSW_COD[UNIT])
	 {
		case 0x02:   /* ЧТЕНИЕ В РЕЖИМЕ 1*/
		case 0x22:   /* ЧТЕНИЕ В РЕЖИМЕ 2*/
			switch(IO_STATUS[UNIT][8])
			 {
				case 0:
					IO_STATUS[UNIT][8]=1;
					if (TYPE_IO_DEVICE[UNIT]=='R')
						 {//READER=fopen(&NAME_FILE_IO_DEVICE[UNIT][0],"r");
							//if (READER==NULL) IO_STATUS[UNIT][8]=2;
							IO_STATUS[UNIT][9]=open(&NAME_FILE_IO_DEVICE[UNIT][0],O_RDONLY|O_BINARY);
						 }
					else
						 IO_STATUS[UNIT][9]=open(&NAME_FILE_IO_DEVICE[UNIT][0],O_RDONLY|O_BINARY);

					if (IO_STATUS[UNIT][9] == 0xff)
								{
								 IO_STATUS[UNIT][9]=0;
								 IO_STATUS[UNIT][8]=0;
								 printf("\n ERROR: RDR FILE-%s CAN NOT BE OPEN, CHECK INIT360.PRM",
								 NAME_FILE_IO_DEVICE[UNIT]);
								 IO_STATUS[UNIT][BYTE_IO_U_0]=0x40;
								 IO_STATUS[UNIT][1]=U4|U5|U6;
								 putchar(7);
								 return;
								}
					IO_STATUS[UNIT][5]=0;
					IO_STATUS[UNIT][0]=0;
					IO_STATUS[UNIT][0]=0;
				case 1:
					if (TYPE_IO_DEVICE[UNIT]=='R')
						{
						 for(i=0;i<80;i++) BUFER[i]=' ';
						 RE=80;
						 for(i=0;i<120;i++)
							{re=read(IO_STATUS[UNIT][9],&BUFER[i],1);
							 if (re!=1) {RE=1;break;}
							 if (BUFER[i]==0x0a) {BUFER[i]=' ';RE=80;break;}
							 if (BUFER[i]==0x0d) BUFER[i]=' ';
							}
						 if (SHOW_SHOW)
							{
							 for(EEGGAA=0xb8000150,i=0;i<20;EEGGAA+=2,i++)
							 *EEGGAA=BUFER[i];
							}
						 for(i=0;i<80;i++) BUFER[i]=ASCII_EBCDIC[BUFER[i]];
						}
					else RE=read(IO_STATUS[UNIT][9],BUFER,80);

					MOVE_MEM_TO_360(BUFER,CSW_ADRESS[UNIT],CSW_COUNT[UNIT]);
					if (RE<CSW_COUNT[UNIT]) CSW_COUNT[UNIT]-=RE;
					else CSW_COUNT[UNIT]=0;
					IO_STATUS[UNIT][5]++;
					IO_STATUS[UNIT][0]=0;
					IO_STATUS[UNIT][1]=0x0c;
					if (RE!=80)
						{IO_STATUS[UNIT][8]=2;
						}

					break;
				case 2:
					 close(IO_STATUS[UNIT][9]);IO_STATUS[UNIT][9]=0;
					IO_STATUS[UNIT][8]=3;
					IO_STATUS[UNIT][1]=U4|U5|U7;
					IO_STATUS[UNIT][0]=0;
					IO_STATUS[UNIT][2]=0x00;
					break;
				case 3:
					IO_STATUS[UNIT][1]=U4|U5;
					IO_STATUS[UNIT][1]=U4|U5|U7;
					IO_STATUS[UNIT][0]=0;
					IO_STATUS[UNIT][2]=0x00;
					break;
			 }
			break;
		 case 0x03:   /* НЕТ ОПЕРАЦИИ  */
				//CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
			break;
		 case 0x04:   /* УТОЧНИТЬ СОСТОЯНИЕ   */
				for(i=0,ar=CSW_ADRESS[UNIT];i<1;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][2]);
						}
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		 default:
				IO_STATUS[UNIT][1]=U4|U5;
				IO_STATUS[UNIT][1]|=U6;
				IO_STATUS[UNIT][2]=0x80; /* КОМАНДА ОТВЕРГНУТА */
				break;
		}

}

void RUN_PRINTER(int UNIT)
{
 static int flag_reader_open=0;
 static int RDFILE;
 static int RE;
 static unsigned long CAW;
 static char BUFER[256];
 static unsigned long ar;
 static int i;
 static char C_COD;
 static int i_skip,isc;
 static char STTT[80];
 static char far *EEGGAA=0xb8000040;

 /*********************************************************************
	БАЙТ СОСТОЯНИЯ УСТРОЙСТВА
	0-2 не используется
	3   занято
	4   канал кончил
	5   УВВ кончило
	6   Ошибка в устройстве
	7   особый случай в устройстве

 **********************************************************************

 *********************************************************************/
 C_COD=CSW_COD[UNIT];
 //if (C_COD&0x78)
 //	 {
 //		i_skip=(C_COD&0x7f)>>1;
 //		for(isc=0;isc<i_skip;isc++)
 //		 {
 //			if (TYPE_IO_DEVICE[UNIT]=='P')
 //			 for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
 //					{
 //					 BUFER[i]=0x20;
 //					}
 //			else
 //			 for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
 //					{
 //					 BUFER[i]=0x40;
 //					}
 //			BUFER[i++]=0x0d;BUFER[i]=0x0a;
 //			//RE=write(IO_STATUS[UNIT][9],BUFER,CSW_COUNT[UNIT]+2);
 //		 }
 //		C_COD&=0x87;
 //	 }
 C_COD&=0x87;
 switch(C_COD)
	 {
		case 0x01: /*0 перевода строк  */  /* ЗАПИСЬ И ПЕРЕВОД СТРОК */
		case 0x09: /*1 строка */
		case 0x11: /*2 строки */
		case 0x19: /*3 строки */
		case 0x81:
							switch(IO_STATUS[UNIT][8])
								{
								 case 0:
											 IO_STATUS[UNIT][9]=
												 open(&NAME_FILE_IO_DEVICE[UNIT][0],
															O_WRONLY|O_BINARY|O_CREAT|O_TRUNC,
															S_IREAD|S_IWRITE);
											 if (IO_STATUS[UNIT][9] == 0xff)
												 {
													IO_STATUS[UNIT][9]=0;
													printf("\n ERROR: PRN FILE-%s CAN NOT BE OPEN, CHECK INIT360.PRM",
																 NAME_FILE_IO_DEVICE[UNIT]);
													IO_STATUS[UNIT][BYTE_IO_U_0]=0x40;
													IO_STATUS[UNIT][1]=U4|U5|U6;
													putchar(7);
													return;
												 }
											 IO_STATUS[UNIT][8]=1;
											 IO_STATUS[UNIT][5]=0;
								 case 1:
												if (TYPE_IO_DEVICE[UNIT]=='P')
												for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
													 {
														BUFER[i]=EBCDIC_ASCII[GET_BYTE(ar)];
													 }
												else
												MOVE_360_TO_MEM(CSW_ADRESS[UNIT],BUFER,CSW_COUNT[UNIT]);
												//for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
												//	 {
												//		BUFER[i]=GET_BYTE(ar);
												//	 }
												BUFER[i++]=0x0d;BUFER[i]=0x0a;

												if (SHOW_SHOW)
													{
													 for(EEGGAA=0xb8000190,i=0;i<20;EEGGAA+=2,i++)
														 *EEGGAA=BUFER[i];
													}

												RE=write(IO_STATUS[UNIT][9],BUFER,CSW_COUNT[UNIT]+2);
												IO_STATUS[UNIT][5]++;
												CSW_COUNT[UNIT]=0;
												IO_STATUS[UNIT][1]=U4|U5;
												break;
								 case 2:close(IO_STATUS[UNIT][9]);IO_STATUS[UNIT][9]=0;
												IO_STATUS[UNIT][8]=0;
												break;
								}
				break;
		case 0x83:
		case 0x03:/*  0 строк */   /* ПЕРЕВОД СТРОК */
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		case 0x04:   /* УТОЧНИТЬ СОСТОЯНИЕ   */
				for(i=0,ar=CSW_ADRESS[UNIT];i<1;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][2]);
						}
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		default:
				IO_STATUS[UNIT][1]=U4|U5;
				IO_STATUS[UNIT][1]|=U6;
				IO_STATUS[UNIT][2]=0x80; /* КОМАНДА ОТВЕРГНУТА */
				break;
		}

}


void RUN_TYPE(int UNIT)
{
 static int flag_reader_open=0;
 static int RDFILE;
 static int RE;
 static unsigned long CAW;
 static unsigned long ar;
 static int i;
 static long OFF_PREV;
 static long OFF_NEXT;
 static long LEN_BLOCK;
 static long OFF_NOW;
 static char PR=0x11;
 static int BLOCK_SIZE;
 static char BUFER[20000];
 static int RET;
 static unsigned int COUNT_CC;
	static char STTT[80];
	static char far *EEGGAA=0xb8000040;

 /********************************************************************
 Байт состояния устройства
 0 - не используется
 1 - модификатор состояния если возбужден одновременно с битом ЗАНЯТО
 2 - контроллер кончил Возбуждается в следующих случаях
		 а) в конце любой операции при выполнении которой был
				выдан сигнал КОНТРОЛЛЕР ЗАНЯТ
		 б) в конце любой операции управления при выполнении которой были
				обнаружены ОШИБКА В УСТРОЙСТВЕ или ОСОБЫЙ СЛУЧАЙ В УСТРОЙСТВЕ
 3 - Занято Если возбужден одновременно с модификатором  состояния
		 то контроллер занят Если возбужденн а модификатор состояния нет
		 - занято устройство
 4 - Канал кончил Для команд управления возбуждается сразу после поступления
		 команды для команд чтения и записи - в конце передачи данных
 5 - УВВ кончило Означает что устройство завершило операцию
		 Сигнал выдается так-же когда устройство переходит
		 из состояния НЕ ГОТОВО в состояние ГОТОВО
 6 - Ошибка в устройстве, Возбуждается всякий раз когда
		 а) возбужден любой бит байта 0 уточненного состояния
		 б) возбужден бит 4 байта 1 уточненного состояния
		 в) контролер завершил свою работу начав
				выполнение команды ПЕРЕМОТКА И РАЗГРУЗКА
 7 - Особый случай в устройстве Возбуждается если
		 при выполнении команды ЗАПИСЬ  WTM ERG пройден отражающий
		 маркер конца ленты EOT

 Байт 0
 0 - команда отвергнута Недопустимая команда или команды ЗАПИСЬ
		 WTM ERG выдана для защищенного файла
 1 - требуется вмешательство (бит 1 байта 1 равен 0)
 2 - ошибка в выходной информационной шине
 3 - ошибка в оборудовании бит 7 байт 3 и 1 5 6 7 байта 4 не все равны 0
 4 - ошибка в данных биты 0-4 байта 4 не все равны 0
 5 - переполнение возможно при выполнении операции ЧТЕНИЕ
		 ЗАПИСЬ ОБРАТНОЕ ЧТЕНИЕ  передача данных прекращается
 6 - нулевое число слов возбуждается при выполнении записи
		 если операция прервана (например HIO) до того как мог быть
		 записан первый байт Движение ленты не было
 7 - не используется

 Байт 1
 0 - помеха при работе в режиме NRZ обнаружены сигналы помех
		 в межблочном промежутке при работе в режиме PE бит всегда 0
 1 - готово устройство находится в состоянии готово
 2 - если этот бит возбужден а бит 1 сброшен то лентопротяжного устройства
		 нет если одновременно с этим битом бит 1 возбужден
		 но сброшен бит занято то устройство находится в состоянии не готово
		 если одновременно с этим битом возбужден бит 1 и бит
		 занято то выполняется перемотка
 3 - головка установлена для работы с 7-дорожечной лентой

 4 - лента находится в точке загрузки
 5 - лента находится в состоянии записи это означает
			что последнее движение ленты относилось к командам
			запись ERG ?WTM
 6 - лента защищена (снято кольцо защиты)
 7 - при режиме NRZ не используется

 Байт 2
 При режиме PE не используется

 Байт 3

 Байт 4

 Байт 5
 ********************************************************************/

 if (IO_STATUS[UNIT][8]==0)
			 {
				IO_STATUS[UNIT][9]=
					open(&NAME_FILE_IO_DEVICE[UNIT][0],O_RDWR|O_BINARY);
				if (IO_STATUS[UNIT][9]==0xff)
					{
					 IO_STATUS[UNIT][9]=0;
					 printf("\n ERROR: TYPE FILE-%s CAN NOT BE OPEN, CHECK INIT360.PRM",
								 NAME_FILE_IO_DEVICE[UNIT]);
					 IO_STATUS[UNIT][BYTE_IO_U_0]=0x40;
					 IO_STATUS[UNIT][BYTE_IO_U_1]=0x00;
					 IO_STATUS[UNIT][1]=U4|U5|U6;
					 putchar(7);
					 return;
					}
				IO_STATUS[UNIT][8]=1;
				IO_STATUS[UNIT][5]=0;
				if (OFFSET_IO_DEVICE[UNIT])
					 lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);

				IO_STATUS[UNIT][3]=0x48;
			 }
	if (SHOW_SHOW)
		{
		 sprintf(STTT,"%04x==%08lx",ADRESS_IO_DEVICE[UNIT],
							 OFFSET_IO_DEVICE[UNIT]);
		 for(EEGGAA=0xb8000170,i=0;i<14;EEGGAA+=2,i++) *EEGGAA=STTT[i];
		}

 switch(CSW_COD[UNIT])
	 {
		case 0x02:   /* ЧТЕНИЕ
								 лента перемещается до следующего IBG данные
								 передаются в канал
								 */
							lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
							OFF_NOW=OFFSET_IO_DEVICE[UNIT];
							read(IO_STATUS[UNIT][9],&OFF_PREV,4);
							read(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							read(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							read(IO_STATUS[UNIT][9],&PR,1);
							BLOCK_SIZE=LEN_BLOCK;
							read(IO_STATUS[UNIT][9],BUFER,BLOCK_SIZE);
							OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
							IO_STATUS[UNIT][1]=U4|U5;
							if (PR==0x11)   /* NORMAL BLOCK */
							 {
								if (BLOCK_SIZE<CSW_COUNT[UNIT]) COUNT_CC=BLOCK_SIZE;
								else COUNT_CC=CSW_COUNT[UNIT];
								MOVE_MEM_TO_360(BUFER,CSW_ADRESS[UNIT],COUNT_CC);
								//for(i=0,ar=CSW_ADRESS[UNIT];i<COUNT_CC;i++,ar++)
								//	{
								//	 PUT_BYTE(ar,BUFER[i]);
								//	}
								CSW_COUNT[UNIT]-=COUNT_CC;
							 }
							else            /* TM     BLOCK */
							 {
								IO_STATUS[UNIT][1]|=U7;
							 }
							//tt(UNIT);
				break;


		case 0x0c:   /* ОБРАТНОЕ ЧТЕНИЕ
								 лента движется в обратном направлении до IBG
								 данные передаются в канал
								 */
							lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
							OFF_NOW=OFFSET_IO_DEVICE[UNIT];
							read(IO_STATUS[UNIT][9],&OFF_PREV,4);
							read(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							read(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							OFF_NOW=OFF_PREV;
							lseek(IO_STATUS[UNIT][9],OFF_NOW,SEEK_SET);
							read(IO_STATUS[UNIT][9],&OFF_PREV,4);
							read(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							read(IO_STATUS[UNIT][9],&LEN_BLOCK,4);

							read(IO_STATUS[UNIT][9],&PR,1);
							BLOCK_SIZE=LEN_BLOCK;
							read(IO_STATUS[UNIT][9],BUFER,BLOCK_SIZE);
							OFFSET_IO_DEVICE[UNIT]=tell(IO_STATUS[UNIT][9]);
							IO_STATUS[UNIT][1]=U4|U5;
							if (PR==0x11)   /* NORMAL BLOCK */
							 {
								MOVE_MEM_TO_360(BUFER,CSW_ADRESS[UNIT],CSW_COUNT[UNIT]);
								//for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
								//	{
								//	 PUT_BYTE(ar,BUFER[i]);
								//	}
								if (BLOCK_SIZE<CSW_COUNT[UNIT]) CSW_COUNT[UNIT]-=RE;
								else CSW_COUNT[UNIT]=0;
							 }
							else            /* TM     BLOCK */
							 {;
							 }

							OFFSET_IO_DEVICE[UNIT]=OFF_NOW;

				break;


		case 0x04:   /* УТОЧНИТЬ СОСТОЯНИЕ
								 шесть байтов информации уточненного состояния
								 передаются в канал
								 байты уточненного состояния сбрасываются в начале
								 каждой операции чтения или записи а также
								 в начале каждой операции управления которая требует
								 движения ленты
								 */
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0x40;
				for(i=0,ar=CSW_ADRESS[UNIT];i<2;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][i+2]);
						}
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0;
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;


		case 0x01:   /* ЗАПИСЬ
								 лента движется в прямом направлении
								 запись производится пока канал посылает данные
								 по окончании передачи на ленте формируется IBG
								 размер блока не должен быть меньше 18 байт
								 */

							lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
							OFF_NOW=OFFSET_IO_DEVICE[UNIT];
							read(IO_STATUS[UNIT][9],&OFF_PREV,4);
							read(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							read(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							read(IO_STATUS[UNIT][9],&PR,1);
							BLOCK_SIZE=LEN_BLOCK;

							lseek(IO_STATUS[UNIT][9],OFF_NOW,SEEK_SET);
							write(IO_STATUS[UNIT][9],&OFF_PREV,4);
							write(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							LEN_BLOCK=CSW_COUNT[UNIT];
							write(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							PR=0x11;
							write(IO_STATUS[UNIT][9],&PR,1);
							BLOCK_SIZE=LEN_BLOCK;

							MOVE_360_TO_MEM(CSW_ADRESS[UNIT],BUFER,CSW_COUNT[UNIT]);
							//for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
							//	{
							//	 BUFER[i]=GET_BYTE(ar);
							//	}
							write(IO_STATUS[UNIT][9],BUFER,BLOCK_SIZE);
							OFF_PREV=OFF_NOW;
							OFF_NOW=tell(IO_STATUS[UNIT][9]);

							lseek(IO_STATUS[UNIT][9],OFF_PREV+4,SEEK_SET);
							write(IO_STATUS[UNIT][9],&OFF_NOW,4);
							lseek(IO_STATUS[UNIT][9],OFF_NOW,SEEK_SET);

							OFFSET_IO_DEVICE[UNIT]=OFF_NOW;

							write(IO_STATUS[UNIT][9],&OFF_PREV,4);
							write(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							LEN_BLOCK=0l;
							write(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							PR=0x11;
							write(IO_STATUS[UNIT][9],&PR,1);

							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;


		case 0x07:   /* ПЕРЕМОТКА      REW
								 Лента перемещается к началу т.е. к точке загрузки
								 как только начинается перемотка вырабатывается
								 сигнал УВВ кончило
								 когда перемотка заканчивается вырабатывается
								 второй сигнал УВВ кончило
								 */
				OFFSET_IO_DEVICE[UNIT]=0l;
				IO_STATUS[UNIT][3]=0x48;
				IO_STATUS[UNIT][1]=U4|U5;
				CSW_COUNT[UNIT]=0;
				putchar(7);putchar(7);
				//tt(UNIT);
				break;


		case 0x0f:   /*  ПЕРЕМОТКА И РАЗГРУЗКА  RUN
								 то же что и ПЕРЕМОТКА кроме того лента разгружается
								 */
				OFFSET_IO_DEVICE[UNIT]=0l;
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][3]=0x48;
				IO_STATUS[UNIT][1]=U4|U5;
				putchar(7);putchar(7);
				//tt(UNIT);
				break;


		case 0x17:   /*  СТЕРЕТЬ УЧАСТОК        EBG
								 Это операция записи но без передачи данных
								 в результатте создается удлиненный IBG
								 */
				tt(UNIT);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;


		case 0x1f:   /* ЗАПИСЬ МАРКИ ЛЕНТЫ      WTM
								 Записывается специальный короткий блок
								 называемый маркой ленты
								 как и для любого другого блока ему предшествует
								 и за ним следует IBG
								 */
							lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
							OFF_NOW=OFFSET_IO_DEVICE[UNIT];
							read(IO_STATUS[UNIT][9],&OFF_PREV,4);
							read(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							read(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							read(IO_STATUS[UNIT][9],&PR,1);
							BLOCK_SIZE=LEN_BLOCK;

							lseek(IO_STATUS[UNIT][9],OFF_NOW,SEEK_SET);
							write(IO_STATUS[UNIT][9],&OFF_PREV,4);
							write(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							LEN_BLOCK=18;
							write(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							PR=0xff;
							write(IO_STATUS[UNIT][9],&PR,1);
							BLOCK_SIZE=LEN_BLOCK;

							for(i=0,ar=CSW_ADRESS[UNIT];i<18;i++,ar++)
								{
								 BUFER[i]=0;
								}
							write(IO_STATUS[UNIT][9],BUFER,BLOCK_SIZE);
							OFF_PREV=OFF_NOW;
							OFF_NOW=tell(IO_STATUS[UNIT][9]);

							lseek(IO_STATUS[UNIT][9],OFF_PREV+4,SEEK_SET);
							write(IO_STATUS[UNIT][9],&OFF_NOW,4);
							lseek(IO_STATUS[UNIT][9],OFF_NOW,SEEK_SET);

							OFFSET_IO_DEVICE[UNIT]=OFF_NOW;

							write(IO_STATUS[UNIT][9],&OFF_PREV,4);
							write(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							LEN_BLOCK=0l;
							write(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							PR=0x11;
							write(IO_STATUS[UNIT][9],&PR,1);

							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;


		case 0x27:   /* ШАГ НАЗАД НА БЛОК       BSB
								 лента движется назад до следующего IBG
								 */
							lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
							read(IO_STATUS[UNIT][9],&OFF_PREV,4);
							read(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							read(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							read(IO_STATUS[UNIT][9],&PR,1);
							OFFSET_IO_DEVICE[UNIT]=OFF_PREV;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;


		case 0x2f:   /* ШАГ НАЗАД НА ФАЙЛ       BSF
								 Лента движется назад за следующую
								 марку ленты если марка не найдена лента устанавливается в точке
								 загрузки
								 */
FOUND:
							lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
							read(IO_STATUS[UNIT][9],&OFF_PREV,4);
							read(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							read(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							read(IO_STATUS[UNIT][9],&PR,1);
							OFFSET_IO_DEVICE[UNIT]=OFF_PREV;
							read(IO_STATUS[UNIT][9],&OFF_PREV,4);
							read(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							read(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							read(IO_STATUS[UNIT][9],&PR,1);
							if (PR==0xff) goto OKFOUND;
							if (OFF_PREV==0l) goto OKFOUND;
OKFOUND:
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;


		case 0x37:   /* ШАГ ВПЕРЕД НА БОЛК      FSB

								 */
							lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
							read(IO_STATUS[UNIT][9],&OFF_PREV,4);
							read(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							read(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							read(IO_STATUS[UNIT][9],&PR,1);
							if (LEN_BLOCK!=0l) OFFSET_IO_DEVICE[UNIT]=OFF_NEXT;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;


		case 0x3f:   /* ШАГ ВПЕРЕД НА ФАЙЛ      FSF
								 */
NEXTFILE:
							lseek(IO_STATUS[UNIT][9],OFFSET_IO_DEVICE[UNIT],SEEK_SET);
							read(IO_STATUS[UNIT][9],&OFF_PREV,4);
							read(IO_STATUS[UNIT][9],&OFF_NEXT,4);
							read(IO_STATUS[UNIT][9],&LEN_BLOCK,4);
							read(IO_STATUS[UNIT][9],&PR,1);
							if (LEN_BLOCK!=0l)
								 {

									OFFSET_IO_DEVICE[UNIT]=OFF_NEXT;
									if (PR==0x11) goto NEXTFILE;
								 }
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;


		case 0xc3:   /* УСТАНОВИТЬ РЕЖИМ 1600 PE   PE

								 */
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;


		case 0xcb:   /* УСТАНОВИТЬ РЕЖИМ 800 NZR   NRZ
								 */
				IO_STATUS[UNIT][1]=U4|U5;
				CSW_COUNT[UNIT]=0;
				break;


		case 0xdb:   /* ЗАПРОС TIE
								 */
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;
		case 0x03:  /*  NOP */
				//CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;


		default:
				tt(UNIT);
				break;
		}

}