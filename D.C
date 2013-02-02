#include <stdio.h>
#include <conio.h>
#include <io.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <\sys\stat.h>
#include <mem.h>
void WRITE(int OUT,char far*BUFER,long LEN_BLOCK,char PR)
{
 static long OFF_PREV=0l;
 static long OFF_NEXT=0l;
 static long OFF_NOW=0l;


 OFF_NOW=tell(OUT);
 write(OUT,&OFF_PREV,4);
 write(OUT,&OFF_NEXT,4);
 write(OUT,&LEN_BLOCK,4);
 write(OUT,&PR,1);
 if (LEN_BLOCK) write(OUT,BUFER,LEN_BLOCK);
 OFF_PREV=OFF_NOW;

 OFF_NOW=tell(OUT);
 lseek(OUT,OFF_PREV+4l,SEEK_SET);
 write(OUT,&OFF_NOW,4);
 lseek(OUT,OFF_NOW,SEEK_SET);
}

int main(argc,argv)
char **argv;
int argc;
{
 static long i,k;
 static int j;
 static char FILE_IN[80];
 static char FILE_OUT[80];
 static int IN;
 static int OUT;
 static long OFF_PREV;
 static long OFF_NEXT;
 static long LEN_BLOCK;
 static long OFF_NOW;
 static char PR=0x11;
 static int BLOCK_SIZE;
 static char COMPP2[0x18]=
					{0x06,0x00,0x0d,0xd8,  0x10,0x00,0x00,0x08,
					 0x00,0x00,0x00,0x00,  0x00,0x00,0x00,0x00,
					 0x07,0x00,0x32,0xaa,  0x60,0x00,0x00,0x06
					};
 static char COMPP[0x38]=
					{0x00,0x00,0x00,0x00,  0x00,0x00,0x00,0x00,
					 0x00,0x00,0x00,0x00,  0x00,0x00,0x00,0x00,
					 0x07,0x00,0x32,0xaa,  0x60,0x00,0x00,0x06,
					 0x1f,0x00,0x31,0xa6,  0x60,0x00,0x00,0x01,
					 0x31,0x00,0x32,0xac,  0x60,0x00,0x00,0x05,
					 0x08,0x00,0x32,0xd8,  0x60,0x00,0x00,0x05,
					 0x08,0x00,0x32,0xf0

					};
 static char VOL[80]={0xe5,0xd6,0xd3,0xf1,
											0xf1,0xf1,0xf1,0xf1,0xf1,0xf1,
											0xf0};
 static char HDR[80]={0xc8,0xc4,0xd9,0xf1,

											0xf2,0xf2,0xf2,0xf2,0xf2,0xf2,0xf2,0xf2,

											' ',' ',' ',' ',' ',' ',' ',' ',' ',

											0xf1,0xf1,0xf1,0xf1,0xf1,0xf1,

											0xf0,0xf0,0xf0,0xf1};
 static char EF[80]={0xc5,0xd6,0xc6,0xf1};
 static char BUFER[40000];
 static int RET;
 if (argc!=3) {printf("\n arguments:\n ds360tf <FILE-IN> <FILE-OUT> ");return;}
 strcpy(FILE_IN,argv[1]);
 strcpy(FILE_OUT,argv[2]);
 BLOCK_SIZE=atoi(argv[3]);
 IN=open(FILE_IN,O_RDONLY|O_BINARY);
 if (IN<=0) {printf("\n INPUT FILE IS ABSEND");return;}
 OUT=open(FILE_OUT,O_WRONLY|O_BINARY|O_TRUNC|O_CREAT,S_IREAD|S_IWRITE);
 OFF_PREV=0;

 /*****VOL1******/
 WRITE(OUT,VOL,80,0x11);

 /******HDR1*****/
 WRITE(OUT,HDR,80,0x11);

 /*********TM*********/
 WRITE(OUT,BUFER,18,0xff);


 /*********records*******/
 read(IN,BUFER,0x18l);
 WRITE(OUT,BUFER,0x18l,0x11);

 i=0x34;
 j=0;
 read(IN,BUFER,0x34);
NEXTREAD:
 RET=read(IN,&BUFER[i++],1);
 if (RET<1) goto ENDINPUT;
 if (i<0x20) goto NEXTREAD;
 if (memcmp(&BUFER[i-0x34],COMPP,0x34)==0)
		{
		 for (k=16;k<i;k+=8)
			 {if (memcmp(&BUFER[k],COMPP2,8)==0)

					goto FIND;
			 }
FIND:k+=8;
		 WRITE(OUT,&BUFER[0],k,0x11);
		 WRITE(OUT,&BUFER[k],i-k,0x11);
		 i=0x34;
		 printf("%d ",j);
		 if (++j>2240) goto ENDINPUT;
		}
 goto NEXTREAD;

ENDINPUT:
 /**********TM***********/
 WRITE(OUT,BUFER,18,0xff);

 /******EOF1*****/
 WRITE(OUT,EF,80,0x11);

 /*********TM*********/
 WRITE(OUT,BUFER,18,0xff);

 /******LAST REC******/
 WRITE(OUT,BUFER,0,0xff);

 close(IN);
 close(OUT);

}