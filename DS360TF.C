#include <stdio.h>
#include <conio.h>
#include <io.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <\sys\stat.h>
int main(argc,argv)
char **argv;
int argc;
{
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
 static char BUFER[20000];
 static int RET;
 if (argc!=4) {printf("\n arguments:\n ds360tf <FILE-IN> <FILE-OUT> <BLOCK-SIZE>");return;}
 strcpy(FILE_IN,argv[1]);
 strcpy(FILE_OUT,argv[2]);
 BLOCK_SIZE=atoi(argv[3]);
 IN=open(FILE_IN,O_RDONLY|O_BINARY);
 if (IN<=0) {printf("\n INPUT FILE IS ABSEND");return;}
 OUT=open(FILE_OUT,O_WRONLY|O_BINARY|O_TRUNC|O_CREAT,S_IREAD|S_IWRITE);
 OFF_PREV=0;
 LEN_BLOCK=BLOCK_SIZE;
M1:
 RET=read(IN,BUFER,BLOCK_SIZE);
 if (RET>0)
	 {
		OFF_NOW=tell(OUT);
		if (OFF_NOW!=0l)
			{
			 lseek(OUT,OFF_PREV+4l,SEEK_SET);
			 write(OUT,&OFF_NOW,4);
			 lseek(OUT,OFF_NOW,SEEK_SET);
			}
		write(OUT,&OFF_PREV,4);
		write(OUT,&OFF_NEXT,4);
		write(OUT,&LEN_BLOCK,4);
		write(OUT,&PR,1);
		write(OUT,BUFER,RET);
		OFF_PREV=OFF_NOW;
		if (RET==BLOCK_SIZE) goto M1;
	 }

 OFF_NOW=tell(OUT);
 if (OFF_PREV!=0l)
	 {
		lseek(OUT,OFF_PREV+4l,SEEK_SET);
		write(OUT,&OFF_NOW,4);
		lseek(OUT,OFF_NOW,SEEK_SET);
	 }
 write(OUT,&OFF_PREV,4);
 write(OUT,&OFF_NEXT,4);
 LEN_BLOCK=18;
 BLOCK_SIZE=18;
 PR=0xff;
 write(OUT,&LEN_BLOCK,4);
 write(OUT,&PR,1);
 write(OUT,BUFER,BLOCK_SIZE);
 OFF_PREV=OFF_NOW;
 OFF_NOW=tell(OUT);
 lseek(OUT,OFF_PREV+4l,SEEK_SET);
 write(OUT,&OFF_NOW,4);
 lseek(OUT,OFF_NOW,SEEK_SET);
 write(OUT,&OFF_PREV,4);
 write(OUT,&OFF_NEXT,4);
 LEN_BLOCK=0;
 BLOCK_SIZE=0;
 PR=0xff;
 write(OUT,&LEN_BLOCK,4);
 write(OUT,&PR,1);

 close(IN);
 close(OUT);

}