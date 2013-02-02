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

int main(argc,argv)
char **argv;
int argc;
{
 static long i,k;
 static int j,L;
 static char FILE_IN[80];
 static char FILE_OUT[80];
 struct stat statbuf;
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

char    title[] =  "\n    TpFixLen - Convertor fixed block tapes\n"
                   "Copyright (C) 1996 from 2:5030/269.0\n"
                   "\n";

char    usage[] =  "\n\nUsage: TpFixLen <FILE-IN> <FILE-OUT> LenBlk\n"
                   "\n";

char    absend[] = "Input file is ABSEND\n";

char    smwrong[] = "samething wrong\n";

char    FF00[20]  = { 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0x00,
		      0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0x00 };

                fputs( title, stdout );

	     if (argc<4) { fputs( usage, stderr ); return(32);};

 strcpy(FILE_IN,argv[1]);
 strcpy(FILE_OUT,argv[2]);
 LEN_BLOCK=atoi(argv[3]);
 
 IN=open(FILE_IN,O_RDONLY|O_BINARY);
 if (IN<=0) {fputs(absend,stderr);return(16);}

 printf("\n\n  Create tape of ESLI format");


 printf("\n\n %s --> %s (     ",FILE_IN,FILE_OUT);

 fstat(IN,&statbuf);
 OUT=open(FILE_OUT,O_WRONLY|O_BINARY|O_TRUNC|O_CREAT,S_IREAD|S_IWRITE);

nextread:

   i=read(IN,BUFER,LEN_BLOCK);
     if (i)  { WRITE(OUT,BUFER,i,0x11); 
	      }
     else goto st;
printf("\\\\\%03ld\%)",(long)((long)(tell(IN)*100) / statbuf.st_size));


goto nextread;

st:              if (i) WRITE(OUT,BUFER,i,0x11);
                        WRITE(OUT,FF00,18,0xff);
                        WRITE(OUT,FF00,18,0xff);
                        WRITE(OUT,FF00,18,0xff);
                        WRITE(OUT,FF00,18,0xff);
                        close(IN);
			close(OUT);
}
