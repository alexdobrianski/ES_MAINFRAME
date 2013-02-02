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
 static int CYL,TRK,cyl,trk,i,j;
 static long OFF_PREV;
 static long OFF_NEXT;
 static long LEN_BLOCK;
 static long OFF_NOW;
 static char PR=0x11;
 static int BLOCK_SIZE;
 static char BUFER[20000];
 static int RET;
 static int BYTE;
 static int MAX_BYTE;
 static unsigned long t000=0x11725988;
 static unsigned long t0000;
 static unsigned long adr;
 static unsigned long t001;
 static unsigned long t002=0;
 static char tt000[16]={3,7,1,2,5,6,9,5,8,9,8,0,1,4,5,1};
 static int ttt,tttn,tttn0;
 static char tttname[]={"dst360p.exe"};

 //   (X<<n)+B=X  X*2An+B=X  B=X(1-2An) X=B/(1-2An)

 ttt=open(tttname,O_RDWR|O_BINARY);
 tttn=0;
BEGCC:
			if (read(ttt,&t001,4)!=4) goto ENDCC;
			if (t001==t000)
				{tttn0=tttn;
				 adr=tell(ttt);
				 read(ttt,&t001,4);
				}
			t002=t001<<(tt000[tttn]);
			if (++tttn>15) tttn=0;
			goto BEGCC;
ENDCC:if (adr==0) {printf("ERROR");goto CL;}
	lseek(ttt,adr,SEEK_SET);
	write(ttt,&t002,4);

CL:
 close(ttt);

}