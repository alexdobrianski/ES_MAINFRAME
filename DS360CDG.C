#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>

#include "ds360psw.h"
#include "ds360dfn.h"
void CODEGG(char far *COM)
{static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static long *RR1;
 static long *RR2;
 static long *REZ;
 static long RREZ;
 static unsigned long URREZ;
 static unsigned long URREZ_AL;
 static unsigned long URREZ_WORK;
 static unsigned long URREZ2;
 static unsigned long URREZ3;
 static unsigned int FLA;

 static unsigned long *URR1;
 static unsigned long *URR2;
 static unsigned long ADRESS;
#define B1 B2
#define I2 RX
#define X2 R2


 GET_OPERAND_SI;
 FORWARD_PSW;
	T00(COM[0]);
}
#undef B1
#undef I2
#undef X2

