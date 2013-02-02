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

char    title[] =  "\n    WTM - Tape creator\n"
                   "Copyright (C) 1996 from 2:5030/269.0\n"
                   "\n";

char    usage[] =  "\n\nUsage: WTM  <TAPE> [n wtm]\n"
                   "\n";

char    absend[] = "Input file is ABSEND\n";

char    smwrong[] = "samething wrong\n";

char    FF00[20]  = { 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0x00,
		      0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0x00 };

                fputs( title, stdout );

 strcpy(FILE_OUT,argv[1]);
 i=atoi(argv[2]);
 
 if (i<2) { i=2; printf("\n warning: n < 2, ignore. Set N = 2");};

 printf("\n\nCreated %s ...",FILE_OUT);

 OUT=open(FILE_OUT,O_WRONLY|O_BINARY|O_TRUNC|O_CREAT,S_IREAD|S_IWRITE);

 for (i;i>0;i--)  {
                        WRITE(OUT,FF00,18,0xff);
		  };

 printf("\nDone.");
			close(OUT);
}
