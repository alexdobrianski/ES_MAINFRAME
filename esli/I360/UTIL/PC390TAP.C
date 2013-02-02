#include <stdio.h>
#include <conio.h>
#include <io.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <\sys\stat.h>
#include <mem.h>
#include "trn.h"

static int LEN_READ=0;
static int size=0;
static int psize=0;
static int FLAG=0;
static int Lsize=0;
#include "write.h"
#include "readp390.h"

int main(argc,argv)
char **argv;
int argc;
{
 static long i,k;
 static int j,L;
 static char FILE_IN[80];
 static char FILE_OUT[80];
 struct stat statbuf;
 struct stat stati;
 static int IN;
 static int OUT;
 static long OFF_PREV;
 static long OFF_NEXT;
 static long LEN_BLOCK;
 static long OFF_NOW;
 static char PR=0x11;
 static int CCC, TTT;
 static int CCCD,TTTD;
 static unsigned long OFF_HEADER;
 static unsigned int minl,maxl;
 static char BUFER[40000];

char    title[] =  "\n    PC390Tap - Convertor tape's\n"
                   "Copyright (C) 1996 from 2:5030/269.0\n"
                   "\n";

char    usage[] =  "\n\nUsage: PC390Tap <FILE-IN> <FILE-OUT> [/WTM]\n"
                   "\n";

char    absend[] = "Input file is ABSEND\n";

char    smwrong[] = "samething wrong\n";

char    FF00[20]  = { 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0x00,
		      0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0x00 };

                fputs( title, stdout );

	     if (argc<3) { fputs( usage, stderr ); return(32);};

 strcpy(FILE_IN,argv[1]);
 strcpy(FILE_OUT,argv[2]);

 IN=open(FILE_IN,O_RDONLY|O_BINARY);
 if (IN<=0) {fputs(absend,stderr);return(16);}

 printf("\n\n  Create tape of ESLI format");


 printf("\n\n %s --> %s (     ",FILE_IN,FILE_OUT);

 fstat(IN,&statbuf);
 OUT=open(FILE_OUT,O_WRONLY|O_BINARY|O_TRUNC|O_CREAT,S_IREAD|S_IWRITE);

/*********TM*********/
if (strncmp(argv[3],"/WTM",4)==0) WRITE(OUT,BUFER,18,0xff);

nextread:

switch(PC390READ(IN,BUFER))  {

case 0x40:
//		printf("\n TM \n ");
			WRITE(OUT,FF00,18,0xff);
			break;

case 0xA0:
//		printf("\n блок длиной %d ", size );
			WRITE(OUT,BUFER,size,0x11);
			break;

case 0xFF:
//              printf("\n достигнут конец файла");
			close(IN); 
			WRITE(OUT,FF00,18,0xff);
			WRITE(OUT,FF00,18,0xff);
			WRITE(OUT,FF00,18,0xff);
			close(OUT);
			exit(0);
			break;

case 0x80:
//              printf("\n Начало длинного блока");
			Lsize=size;
			while (PC390READ(IN,&BUFER[Lsize])==0x00) Lsize+=size;
			WRITE(OUT,BUFER,Lsize+size,0x11);
			break;
			   };
	
        printf("\\\\\%03ld\%)",(long)((long)(tell(IN)*100) / statbuf.st_size));

goto nextread;

 close(IN);
 close(OUT);
}
