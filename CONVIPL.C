#include <stdio.h>
#include <io.h>
#include <fcntl.h>
void  main(argc,argv)
 char **argv;
 int argc;

{
static int IN,OUT,IN2;
static char STR[320];
IN=open("IPL.IBC",O_BINARY|O_RDONLY);
IN2=open(argv[1],O_BINARY|O_RDONLY);
OUT=open("IPL.000",O_BINARY|O_TRUNC|O_WRONLY);
read(IN,STR,320);
write(OUT,STR,320);
while(read(IN2,STR,80)==80)
	{write(OUT,STR,80);
	}
close(IN);
close(IN2);
close(OUT);
}