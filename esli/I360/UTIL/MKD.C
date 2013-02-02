#include <stdio.h>
#include <conio.h>
#include <io.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <\sys\stat.h>
#include "trn.h"
/************************************************************************
																											 ТРЕК:
 метка начала оборота                          #####
									 <<<<>>>>
 собственный адрес 0   - байт признаков                0  - БАЙТ ПРИЗНАКОВ
									 1-2 - номер цилиндра                1-2 -ЦИЛИНДР
									 3-4 - номер головки                 3-4 -ГОЛОВКА
									 5-6 - циклическая проверка  #####
									 <<<<>>>>
 R0
		поле счетчика  0   - признаки                      5    -R0 ПРИЗНАКИ
									 1-2 цилиндр                         6-7  -R0 ЦИЛИНДР
									 3-4 головка                         8-9  -R0 ГОЛОВКА
									 5   - номер записи                  10   -R0 RN
									 6   - длина ключа  ==0              11   -R0 ДЛИНА КЛЮЧА
									 7-8 -длина данных  ==8 байт         12-13-R0 ДЛИНА ДАННЫХ
									 9-10-циклическря проверка   #####
		поле данных    0-7
									 <<<<>>>>
 адресный маркер                                       XXXX -LEN RX
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


int main(argc,argv)

char **argv;
int argc;
{
static int  DEFTYPE[10]    = {    7,   29,   100,   200,     0, 0, 0, 0, 0, 0 } ;
static int  DEFLENGTH[10]  = { 8000,16000, 28000, 28000,     0, 0, 0, 0, 0, 0 } ;
static long DEFOFSET[10]   = {    0, 8000, 24000, 52000, 80000, 0, 0, 0, 0, 0 } ;
static int  DEFCYL[10]     = {  203,  203,   414,   818,     0, 0, 0, 0, 0, 0 } ;
static int  DEFTRK[10]     = {   10,   20,    19,    19,     0, 0, 0, 0, 0, 0 } ;
static int  DEFBYTE[10]    = { 3625, 7294, 13030, 13030,     0, 0, 0, 0, 0, 0 } ;
static int  DEFMAXBYTE[10] = { 4000, 8000, 14000, 14000,     0, 0, 0, 0, 0, 0 } ;

 static char FILE_IN[80];
 static char FILE_OUT[80];
 static char CONFIG[80];
 static int IN;
 static int OUT;
 static int OPIS;
 static int CYL,TRK,cyl,trk,i,j;
 static long OFF_PREV;
 static long OFF_NEXT;
 static long LEN_BLOCK;
 static long OFF_NOW;
 static char PR=0x11;
 static int BLOCK_SIZE;
 static char BUFER[20000];
 static char BUFER_OPIS[32767];
 static int RET;
 static int BYTE;
 static int MAX_BYTE;
 static char VOLNAME[80];
 static char PCNAME[8];
 static int DISKTYPE=0;
char    title[] =  "\n    MkD - Disk Creator's\n"
                   "Copyright (C) 1996 from 2:5030/269.0\n"
                   "\n";


char param[] =	"\n arguments:"
		"\n MKD <FILE-OUT> <CYL> <TRK> <BYTE> <MAX_BYTE> <VOL-NAME>"
		"\n or"
		"\n MKD <VOL-NAME> <TYPE>\n"
		"\nUnits:"
		"\n5050(7.25MB) CYL=203 TRK=10 BYTE= 3625 MAX= 4000 TYPE   7"
		"\n5061(29MB  ) CYL=203 TRK=20 BYTE= 7294 MAX= 8000 TYPE  29"
		"\n5063(100MB ) CYL=414 TRK=19 BYTE=13030 MAX=14000 TYPE 100"
		"\n5063(200MB ) CYL=818 TRK=19 BYTE=13030 MAX=14000 TYPE 200" ;


fputs(title,stderr);

switch (argc) {

case 7:   {
	  strcpy(PCNAME,argv[1]);
	  strcpy(FILE_OUT,argv[1]);
	  CYL=atoi(argv[2]);
	  TRK=atoi(argv[3]);
	  BYTE=atoi(argv[4]);
	  MAX_BYTE=atoi(argv[5]);



for (i=0;i<6;i++) VOLNAME[i]=0x20;
for (i=0;i<strlen(argv[6]);i++) VOLNAME[i]=argv[6][i];
     VOLNAME[6]=0x00;
if (strlen(PCNAME)!=0x06) printf("\07\07\n\nWarning: VOL NAME (mast be 6 digits)\n");
	 for(i=0;i<6;i++)
	  VOLNAME[i]=ASCII_EBCDIC[VOLNAME[i]];

	  break;
		};
case 3: {

	  strcpy(PCNAME,argv[1]);
	  strcpy(FILE_OUT, argv[1]);
	  strncat(FILE_OUT,".DSK",4);

	  for (DISKTYPE=0; (DEFTYPE[DISKTYPE]!=atoi(argv[2])) & (DISKTYPE<9); DISKTYPE++ ) ;

	  CYL=DEFCYL[DISKTYPE];
	  TRK=DEFTRK[DISKTYPE];
	  BYTE=DEFBYTE[DISKTYPE];
	  MAX_BYTE=DEFMAXBYTE[DISKTYPE];

for (i=0;i<6;i++) VOLNAME[i]=0x20;
for (i=0;i<strlen(argv[1]);i++) VOLNAME[i]=argv[1][i];
     VOLNAME[6]=0x00;
if (strlen(PCNAME)!=0x06) printf("\07\07\n\nWarning: VOL NAME (mast be 6 digits)\n");
	 for(i=0;i<6;i++)
	  VOLNAME[i]=ASCII_EBCDIC[VOLNAME[i]];

	  break;
	 };

default: { fputs(param,stderr);return(32); };
	};

 printf("FILE=%s,CYL=%d,TRK=%d,BYTE=%d,MAX_BYTE=%d,NAME=%s",
         FILE_OUT,  CYL,     TRK,    BYTE,     MAX_BYTE,      PCNAME);

 strcpy(CONFIG,strtok(argv[0],".")); // определение пути к конфиг. файлу
 strcat(CONFIG,".dsk");              // полное имя CONFIG

 OPIS=open(CONFIG,O_RDONLY|O_BINARY);
 if (OPIS<=0) {printf("\n FILE IMAGE %s IS ABSEND",CONFIG);return(32);}

 lseek (OPIS,DEFOFSET[DISKTYPE],SEEK_SET); /* позиционируем файл заготовки */
 read(OPIS,BUFER_OPIS,DEFLENGTH[DISKTYPE]); /* Читаем заготовку */
 close(OPIS);
 OUT=open(FILE_OUT,O_WRONLY|O_BINARY|O_TRUNC|O_CREAT,S_IREAD|S_IWRITE);

printf("\nCurent cylinder=??? ");

 for(cyl=0;cyl<CYL;cyl++)
	 {

		for(trk=0;trk<TRK;trk++)
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

				/*R1*/
				BUFER[23]=0x11;

				BUFER[24]=0x11;
				BUFER[25]=cyl>>8;
				BUFER[26]=cyl&0xff;
				BUFER[27]=trk>>8;
				BUFER[28]=trk&0xff;
				BUFER[29]=1;
				BUFER[30]=0;
				BUFER[31]=BYTE>>8;
				BUFER[32]=BYTE&0xff;
				for(i=33,j=0;j<BYTE;i++,j++) BUFER[i]=0x40;

				/*R2 */
				BUFER[i]=0xff;
				if (trk==0 && cyl==0)
					{
					 for(i=0;i<MAX_BYTE;i++) BUFER[i]=BUFER_OPIS[i];
					 for(i=0xed,j=0;j<6;i++,j++)
							BUFER[i]=VOLNAME[j];

					}
				if (trk==1 && cyl==0)
					{
					 for(i=0;i<MAX_BYTE;i++) BUFER[i]=BUFER_OPIS[i+DEFLENGTH[DISKTYPE]/2];

					}
				write(OUT,BUFER,MAX_BYTE);
			 }
          printf("\\\\%03d ",cyl);
	 }

 close(OUT);
	  printf("\\\\\\\\\\\\\\\\\\\\\                                              \n");

}
