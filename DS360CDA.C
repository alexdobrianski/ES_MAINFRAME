#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>

#include "ds360psw.h"
#include "ds360dfn.h"
void CODEA0(char far *COM)
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
 switch(COM[0])
	 {
		case 0xa0:
				T00(COM[0]);
				break;
		case 0xa1:
				T00(COM[0]);
				break;
		case 0xa2:
				T00(COM[0]);
				break;
		case 0xa3:
				T00(COM[0]);
				break;
		case 0xa4:
				T00(COM[0]);
				break;
		case 0xa5:
				T00(COM[0]);
				break;
		case 0xa6:
				T00(COM[0]);
				break;
		case 0xa7:
				T00(COM[0]);
				break;
		case 0xa8:
				 T00(COM[0]);
				 break;
		case 0xa9:
				T00(COM[0]);
				break;
		case 0xaa:
				T00(COM[0]);
				break;
		case 0xab:
				T00(COM[0]);
				break;
		case 0xac:
				T();
				break;
		case 0xad:
				T();
				break;
		case 0xae:
				T();
				break;
		case 0xaf:
				if (R370[8]&(0x8000>>RX))
					{
					 RQ_PRG=0x0040;
					 RETURN=1;
					 PUT_BYTE(149l,RX);
					 PUT_BYTE(148l,0);
					 PUT_WORD(156l,(unsigned long)ADRESS);
					}
				//T();
				break;

	 }
}
#undef B1
#undef I2
#undef X2
