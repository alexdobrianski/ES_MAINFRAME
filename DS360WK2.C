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

#include "ds360trn.h"


char bios_32[64];
char serial_number[64];
FILE *CONSO;
FILE *READER;
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
void INIT_CHANEL(void)
{
 FILE *FIL;
 static char STRING[100];
 static int i;
 static int FIL_7920;

 static char far *BIOS_AREA;
 static unsigned long all_count;
 static int i_count,i_count_2;


 NUMBER_IO=0;
 FIL=fopen("INIT360.PRM","r");
 if (FIL!=NULL)
	 {

NEXT:if (fgets(STRING,80,FIL)!=NULL)
			 {if (memcmp(STRING,"SERIAL NUMBER=",14)==0)
					{strcpy(serial_number,&STRING[14]);
					 serial_number[11]=0;
					 goto NEXT;
					}
				if (memcmp(STRING,"LN=",3)==0)
					{strcpy(bios_32,&STRING[3]);
					 goto NEXT;
					}
				if (memcmp(STRING,"IO=",3)==0) goto IO;
				if (memcmp(STRING,"io=",3)==0) goto IO;
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
				TYPE_IO_DEVICE[NUMBER_IO]=STRING[7];
				FLAG_IO_DEVICE[NUMBER_IO]=0;
				if (STRING[12]>='A' && STRING[12]<='Z')
					{
					 strcpy(&NAME_FILE_IO_DEVICE[NUMBER_IO][0],&STRING[12]);
					 if (strchr(&NAME_FILE_IO_DEVICE[NUMBER_IO][0],'\n')!=NULL)
							 *strchr(&NAME_FILE_IO_DEVICE[NUMBER_IO][0],'\n')=0;
					}
				for(i=0;i<10;i++) IO_STATUS[NUMBER_IO][i]=0;
				AREA_7920[NUMBER_IO]=NULL;
				switch (TYPE_IO_DEVICE[NUMBER_IO])
					 {
						case 'D':case 'd':
									 DASD[NUMBER_IO][DASD_CYL]=23 /*203*/;
									 DASD[NUMBER_IO][DASD_TRK]=20;
									 DASD[NUMBER_IO][DASD_MAX_BYTE]=7294;
									 DASD[NUMBER_IO][DASD_LEN]=8000;
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
						default:
									 break;
					 }
				NUMBER_IO++;
				goto NEXT;
			 }
		 fclose(FIL);
	 }
 NU=NUMBER_IO;

}
void CLOSE_CHANEL(void)
 {static int i,FIL_7920;
	for(i=0;i<NUMBER_IO;i++)
	 {if (TYPE_IO_DEVICE[i]=='7')
		 {if (AREA_7920[i]==NULL) continue;

			FIL_7920=open(NAME_FILE_IO_DEVICE[i],
										O_WRONLY|O_BINARY|O_CREAT|O_TRUNC,S_IREAD|S_IWRITE);
			if (FIL_7920>0)
				{
				 write(FIL_7920,&AREA_7920[i][0],1924);
				 close(FIL_7920);
				 FIL_7920=0;
				}
			farfree(AREA_7920[i]);
		 }
	 }
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

		if (RQ_TRACE)
			printf("\nUNIT=%03x %06lx=> %02x %06lx %02x %02x %04x ",
						 ADRESS_IO_DEVICE[cikl_unit],
						 CSW_CAW[cikl_unit],
						 CSW_COD[cikl_unit],
						 CSW_ADRESS[cikl_unit],
						 CSW_MOD[cikl_unit],
						 CSW_TP[cikl_unit],
						 CSW_COUNT[cikl_unit]);
		if (CSW_MOD[cikl_unit]&0x08)        /* PCI */
			{
			 //FLAG_IO_DEVICE[cikl_unit]=RQ_PCI;
			 IO_STATUS[cikl_unit][0]=S0;       /* PCI */
			 //IO_STATUS[cikl_unit][1]=/*0*/U4|U5;;
			 //return;

			}
		if (CSW_COD[cikl_unit]==0x08)       /* переход в канале*/
			{
			 if (RQ_TRACE)
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
			 if (TYPE_IO_DEVICE[cikl_unit]!='7')
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



		if (RQ_TRACE)
			{
			 printf("=%04x<",
							CSW_COUNT[cikl_unit]);
			 if (CSW_COD[cikl_unit]==0x29 ||
					 CSW_COD[cikl_unit]==0x49 ||
					 CSW_COD[cikl_unit]==0x69)
			 for(i=0,adr=CSW_ADRESS[cikl_unit];i<16;i++,adr++)
				 {printf("%01c",EBCDIC_ASCII[GET_BYTE(adr)]);
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

		if (RQ_TRACE)
			{
			 printf(">%02x %02x (%02x,%02x)",
							IO_STATUS[cikl_unit][1],
							IO_STATUS[cikl_unit][0],
							IO_STATUS[cikl_unit][2],
							IO_STATUS[cikl_unit][3]);
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
 if (C_COD&0x78)
	 {
		i_skip=(C_COD&0x7f)>>1;
		for(isc=0;isc<i_skip;isc++)
		 {
			if (TYPE_IO_DEVICE[UNIT]=='P')
			 for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
					{
					 BUFER[i]=0x20;
					}
			else
			 for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
					{
					 BUFER[i]=0x40;
					}
			BUFER[i++]=0x0d;BUFER[i]=0x0a;
			//RE=write(IO_STATUS[UNIT][9],BUFER,CSW_COUNT[UNIT]+2);
		 }
		C_COD&=0x87;
	 }
 switch(C_COD)
	 {
		case 0x01: /*0 перевода строк  */  /* ЗАПИСЬ И ПЕРЕВОД СТРОК */
		case 0x09: /*1 строка */
		case 0x11: /*2 строки */
		case 0x19: /*3 строки */
							switch(IO_STATUS[UNIT][8])
								{
								 case 0:
											 IO_STATUS[UNIT][9]=
												 open(&NAME_FILE_IO_DEVICE[UNIT][0],
															O_WRONLY|O_BINARY|O_CREAT|O_TRUNC,
															S_IREAD|S_IWRITE);
											 IO_STATUS[UNIT][8]=1;
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
												RE=write(IO_STATUS[UNIT][9],BUFER,CSW_COUNT[UNIT]+2);
												CSW_COUNT[UNIT]=0;
												IO_STATUS[UNIT][1]=U4|U5;
												break;
								 case 2:close(IO_STATUS[UNIT][9]);IO_STATUS[UNIT][9]=0;
												IO_STATUS[UNIT][8]=0;
												break;
								}
				break;

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

void RUN_CONSOLE(int UNIT)
{
 static int flag_console_open=0;
 static int FLFILE;
 static int RE;
 static unsigned long CAW;
 static char BUFER[400];
 static unsigned long ar;
 static int i;
 static char CHAR;

 /*******************************************************************
 БАЙТ СОСТОЯНИЯ УСТРОЙСТВА
 0 ВНИМАНИЕ возбуждается если нажата клавиша ЗАПРОС
	 если контроллер устройства занят сигнал ВНИМАНИЕ на выдается пока
	 не закончится выполняемая операция
 1 2 не используются
 3 занято
 4 канал кончил
 5 устройство кончило
 6 ошибка в устройстве
 7 ОСОБЫЙ случай в устройстве (если нажато анулироватьь)
 БАЙТ УТОЧНЕННОГО СОСТОЯНИЯ
 0 команда отвергнута
 1 требуется вмешательство
 2 ошибка в выходной информационной шине
 3 ошибка в оборудовании
 4-7 не используются
 *******************************************************************
 клавиши
		 READY
		 REQWEST
		 NOT READY
		 CANSEL
		 EOB
 ********************************************************************/
 if (flag_console_open==0)
	 {CONSO=fopen(&NAME_FILE_IO_DEVICE[UNIT][0],"a");
		if (CONSO!=NULL) FLFILE=1;
		else FLFILE=0;
		flag_console_open=1;
	 }
 switch(CSW_COD[UNIT])
	 {
		case 0x0A:   /* ЗАПРОС ДЛЯ ВВОДА ИНФОРМАЦИИ С КЛАВИАТУРЫ */
				if (kbhit()) getchar();

				if (RQ_7920)
					{RQ_7920=0;
					 if (FLFILE)
						 {fclose(CONSO);
							CONSO=fopen(NAME_FILE_IO_DEVICE[UNIT],"r");
							if (CONSO!=NULL)
								{
								 while(fgets(BUFER,80,CONSO)!=NULL)
									 {printf("%s",BUFER);
									 }
								 printf("\n");
								 fclose(CONSO);
								}
							CONSO=fopen(NAME_FILE_IO_DEVICE[UNIT],"a");
						 }
					 else
						 {CONSO=fopen(NAME_FILE_IO_DEVICE[UNIT],"r");
							if (CONSO!=NULL)
								{
								 while(fgets(BUFER,80,CONSO)!=NULL)
									 {printf("%s",BUFER);
									 }
								 printf("\n");
								 fclose(CONSO);
								}
							CONSO=NULL;
						 }
					}
				putchar('█');putchar(8);
				gets(BUFER);
				for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
						{if (BUFER[i]==0)  break;
						 if (BUFER[i]==13) break;
						 PUT_BYTE(ar,ASCII_EBCDIC[BUFER[i]]);
						}
				BUFER[i]=0;
				if (FLFILE) fprintf(CONSO,"\n%s",BUFER);
				CSW_COUNT[UNIT]-=i;
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		case 0x09:   /* ЗАПИСЬ С ВОЗВРАТОМ КАРЕТКИ  */
				//printf("\n");
				for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
						{
						 CHAR=GET_BYTE(ar);BUFER[i]=EBCDIC_ASCII[CHAR];
						}
				if (RQ_7920==0)
					{
					 for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++) putchar(BUFER[i]);
					 if (CSW_COUNT[UNIT]==80) putchar(8); printf("\n");
					}
				BUFER[CSW_COUNT[UNIT]]=0;
				if (FLFILE) fprintf(CONSO,"\n%s",BUFER);

				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		case 0x01:   /* ЗАПИСЬ БЕЗ ВОЗВРАТА КАРЕТКИ */
				for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++)
						{
						 CHAR=GET_BYTE(ar);BUFER[i]=EBCDIC_ASCII[CHAR];
						}
				if (RQ_7920==0)
					{
					 for(i=0,ar=CSW_ADRESS[UNIT];i<CSW_COUNT[UNIT];i++,ar++) putchar(BUFER[i]);
					}
				BUFER[CSW_COUNT[UNIT]]=0;
				if (FLFILE) fprintf(CONSO,"\n%s",BUFER);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		case 0x03:   /*  НЕТ ОПЕРАЦИИ  */
				//CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;

		case 0x0b:   /* ЗВУКОВАЯ СИГНАЛИЗАЦИЯ */
				putchar(7);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;
		case 0x04:   /* УТОЧНИТЬ СОСТОЯНИЕ   */
				for(i=0,ar=CSW_ADRESS[UNIT];i<1;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][2]);

						}
				IO_STATUS[UNIT][2]=0;
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;
		default:
				IO_STATUS[UNIT][1]=U4|U5;
				IO_STATUS[UNIT][1]|=U6;
				IO_STATUS[UNIT][2]=0x80; /* КОМАНДА ОТВЕРГНУТА */
				//tt(UNIT);
				break;
		}

}

void RUN_7920(int UNIT)
{
 static int flag_reader_open=0;
 static int RDFILE;
 static int RE;
 static unsigned long CAW;
 static char BUFER[80];
 static unsigned long ar;
 static int i;
 static char CHAR;

 /****************************************************************
	команда чтения буфера
	1 байт ИНДИКАТОР ВНИМАНИЯ
			 7D клавиша ввод
			 F1 клавиша F1
			 ..
			 F9 клавиша F9
			 7A клавиша F10
			 7B         F11
			 7C         F12
			 6C         PD1
			 6E         PD2
			 6B         PD3
			 6D         CLEAR
	2 байта АДРЕС КУРСОРА
	1 байт НАЧАЛО ПОЛЯ
	1 байт СИМВОЛ АТРИБУТ
	ТЕКСТ
	.....
 *****************************************************************
 чтение модифицированного
 1 байт ИНДИКАТОР ВНИМАНИЯ
 2 байта АДРЕС КУРСОРА
 1 байт УАБ
 1 байт адрес атрибута
 АЛФАВИТНО ЦИФРОВЫЕ ДАННЫЕ (НУЛИ ПОДАВЛЯЮТСЯ)
 *****************************************************************
 запись и стирание запись

 ****************************************************************/
 switch(CSW_COD[UNIT])
	 {
		case 0x01:
									/*   ЗАПИСЬ            */
				RUN_7920_WR(CSW_ADRESS[UNIT],CSW_COUNT[UNIT],UNIT);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;

		case 0x05:    /*  СТИРАНИЕ_ЗАПИСЬ*/
				RUN_7920_CLWR(CSW_ADRESS[UNIT],CSW_COUNT[UNIT],UNIT);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;

		case 0x02:    /* ЧИТАТЬ БУФЕР    */
				RUN_7920_RD(CSW_ADRESS[UNIT],CSW_COUNT[UNIT],UNIT);
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;

		case 0x06:    /* ЧИТАТЬ МОДИФИЦИРУЕМОЕ */

				RUN_7920_RDMD(CSW_ADRESS[UNIT],CSW_COUNT[UNIT],UNIT);
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;

		case 0x07:    /* КОПИРОВАТЬ            */
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;

		case 0x1f:    /* СТЕРЕТЬ ВСЕ НЕЗАЩИЩЕННОЕ */
				RUN_7920_CLNZ(CSW_ADRESS[UNIT],CSW_COUNT[UNIT],UNIT);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;

		case 0x0b:
				putchar(7);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;
		case 0x03:   /* X X   */
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;
		case 0x04:   /* УТОЧНИТЬ СОСТОЯНИЕ   */
				for(i=0,ar=CSW_ADRESS[UNIT];i<1;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][2]);
						}
				IO_STATUS[UNIT][2]=0;
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;

		default:
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
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
				IO_STATUS[UNIT][8]=1;
				IO_STATUS[UNIT][5]=0;
				OFFSET_IO_DEVICE[UNIT]=0l;
				IO_STATUS[UNIT][3]=0x48;
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
							tt(UNIT);
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
				tt(UNIT);
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
				tt(UNIT);
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
				tt(UNIT);
				break;


		case 0x0f:   /*  ПЕРЕМОТКА И РАЗГРУЗКА  RUN
								 то же что и ПЕРЕМОТКА кроме того лента разгружается
								 */
				OFFSET_IO_DEVICE[UNIT]=0l;
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][3]=0x48;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
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
				tt(UNIT);
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
				tt(UNIT);
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
				tt(UNIT);
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
				tt(UNIT);
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
				tt(UNIT);
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
void RUN_5010(int UNIT)
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
 static char far*bufer;
 static unsigned int RET;
 static unsigned int COUNT_CC;
 static unsigned int count_cc;


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
//				IO_STATUS[UNIT][9]=
//					open(&NAME_FILE_IO_DEVICE[UNIT][0],O_RDWR|O_BINARY);
				IO_STATUS[UNIT][8]=1;
				IO_STATUS[UNIT][5]=0;
				OFFSET_IO_DEVICE[UNIT]=0l;
				IO_STATUS[UNIT][3]=0x48;
			 }
 bufer=BUFER;
 switch(CSW_COD[UNIT])
	 {
		case 0x02:   /* ЧТЕНИЕ
								 лента перемещается до следующего IBG данные
								 передаются в канал
								 */

							//tt(UNIT);
							COUNT_CC=CSW_COUNT[UNIT];
							asm pusha;
							asm push ds;
							asm mov cx,COUNT_CC;
							asm lds dx,bufer;
							asm mov ah,2;
							asm int 0x61;
							asm pop ds;
							asm mov count_cc,cx;
							RET=_AX;
							asm popa;

							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto R1;
								 }
							if (RET&0x0084)    /* ОШИБКА */
								 {
									IO_STATUS[UNIT][2]=U4;
									IO_STATUS[UNIT][1]|=U6;
									goto R1;
								 }
							if (RET&0x0008)    /* TM */
								 {IO_STATUS[UNIT][1]|=U7;
								 }
							else
								 {if (RET&0x8000)
										{BLOCK_SIZE=COUNT_CC;
										}
									else
										{BLOCK_SIZE=COUNT_CC-count_cc;
										}
									MOVE_MEM_TO_360(BUFER,CSW_ADRESS[UNIT],COUNT_CC);
									CSW_COUNT[UNIT]-=COUNT_CC;
								 }

R1:
							//tt(UNIT);
				break;


		case 0x0c:   /* ОБРАТНОЕ ЧТЕНИЕ
								 лента движется в обратном направлении до IBG
								 данные передаются в канал
								 */
							tt(UNIT);

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
				tt(UNIT);
				break;


		case 0x01:   /* ЗАПИСЬ
								 лента движется в прямом направлении
								 запись производится пока канал посылает данные
								 по окончании передачи на ленте формируется IBG
								 размер блока не должен быть меньше 18 байт
								 */

							MOVE_360_TO_MEM(CSW_ADRESS[UNIT],BUFER,CSW_COUNT[UNIT]);
							COUNT_CC=CSW_COUNT[UNIT];
							asm pusha;
							asm push ds;
							asm mov cx,COUNT_CC;
							asm lds dx,bufer;
							asm mov ah,1;
							asm int 0x61;
							asm pop ds;
							asm mov count_cc,cx;
							RET=_AX;
							asm popa;
							IO_STATUS[UNIT][1]=U4|U5;
							CSW_COUNT[UNIT]=0;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto W1;
								 }
							if (RET&0x0084)    /* ОШИБКА */
								 {
									IO_STATUS[UNIT][2]=U4;
									IO_STATUS[UNIT][1]|=U6;
									goto W1;
								 }
							if (RET&0x0040)    /* ЗАЩИТА ЗАПИСИ*/
								 {
									IO_STATUS[UNIT][2]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W1;
								 }
W1:
							tt(UNIT);
				break;


		case 0x07:   /* ПЕРЕМОТКА      REW
								 Лента перемещается к началу т.е. к точке загрузки
								 как только начинается перемотка вырабатывается
								 сигнал УВВ кончило
								 когда перемотка заканчивается вырабатывается
								 второй сигнал УВВ кончило
								 */
							asm pusha;
							asm push ds;
							asm mov ah,9;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							IO_STATUS[UNIT][3]=0x48;
							IO_STATUS[UNIT][1]=U4|U5;
							CSW_COUNT[UNIT]=0;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;


		case 0x0f:   /*  ПЕРЕМОТКА И РАЗГРУЗКА  RUN
								 то же что и ПЕРЕМОТКА кроме того лента разгружается
								 */
							asm pusha;
							asm push ds;
							asm mov ah,9;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							IO_STATUS[UNIT][3]=0x48;
							IO_STATUS[UNIT][1]=U4|U5;
							CSW_COUNT[UNIT]=0;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;




		case 0x17:   /*  СТЕРЕТЬ УЧАСТОК        EBG
								 Это операция записи но без передачи данных
								 в результатте создается удлиненный IBG
								 */
							asm pusha;
							asm push ds;
							asm mov cx,0xffff;
							asm mov ah,8;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							tt(UNIT);
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto W2;
								 }
							if (RET&0x0084)    /* ОШИБКА */
								 {
									IO_STATUS[UNIT][3]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W2;
								 }
							if (RET&0x0040)    /* ЗАЩИТА ЗАПИСИ*/
								 {
									IO_STATUS[UNIT][2]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W2;
								 }
W2:           tt(UNIT);
				break;


		case 0x1f:   /* ЗАПИСЬ МАРКИ ЛЕНТЫ      WTM
								 Записывается специальный короткий блок
								 называемый маркой ленты
								 как и для любого другого блока ему предшествует
								 и за ним следует IBG
								 */
							asm pusha;
							asm push ds;
							asm mov ah,3;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;

							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto W3;
								 }
							if (RET&0x0084)    /* ОШИБКА */
								 {
									IO_STATUS[UNIT][2]=U4;
									IO_STATUS[UNIT][1]|=U6;
									goto W3;
								 }
							if (RET&0x0040)    /* ЗАЩИТА ЗАПИСИ*/
								 {
									IO_STATUS[UNIT][2]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W3;
								 }
W3:
							tt(UNIT);
				break;


		case 0x27:   /* ШАГ НАЗАД НА БЛОК       BSB
								 лента движется назад до следующего IBG
								 */
							asm pusha;
							asm push ds;
							asm mov ah,7;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;

							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							if (RET&0x0008)    /* TM */
								 {IO_STATUS[UNIT][1]|=U7;
								 }
							tt(UNIT);
				break;


		case 0x2f:   /* ШАГ НАЗАД НА ФАЙЛ       BSF
								 Лента движется назад за следующую
								 марку ленты если марка не найдена лента устанавливается в точке
								 загрузки
								 */
							asm pusha;
							asm push ds;
							asm mov ah,5;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;


		case 0x37:   /* ШАГ ВПЕРЕД НА БОЛК      FSB

								 */
							asm pusha;
							asm push ds;
							asm mov ah,6;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							if (RET&0x0008)    /* TM */
								 {IO_STATUS[UNIT][1]|=U7;
								 }
							tt(UNIT);
				break;


		case 0x3f:   /* ШАГ ВПЕРЕД НА ФАЙЛ      FSF
								 */
							asm pusha;
							asm push ds;
							asm mov ah,4;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
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
				tt(UNIT);
				break;


		default:
				tt(UNIT);
				break;
		}

}
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