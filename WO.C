#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <stat.h>
#include <fcntl.h>

#include "ds360psw.h"

#include "ds360dfn.h"

void CODE80(char COM)
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
 static unsigned long ADRESS;
#define B1 B2
#define I2 RX
#define X2 R2
static int r2,r3,is;

 GET_OPERAND_SI;
 PSW_ADRESS+=PSW_ILC;
 /*FORW_PSW();*/
 switch(COM)
	 {
	case 0x80:      /* SSM
									��⠭����� ���� ��⥬�
									*/
						PSW_MASK=GET_BYTE(ADRESS);
						break;
	case 0x81:      /* SPSW
									��⠭����� PSW
									*/
						T();
						break;
	case 0x82:      /* LPSW
									����㧨�� PSW
									*/
						LOAD_PSW(ADRESS);
						break;
	case 0x83:      /*  �����������
									*/
						T();
						break;
	case 0x84:      /* WRD
									��ﬠ� ������
									*/
						T();
						break;
	case 0x85:      /* RDD
									��אַ� �⥭��
									*/
						T();
						break;
	case 0x86:      /* BXH
									���室 �� ������� �����
									*/
						r2=R2;r2&=0xfe;r3=r2+1;
						R[R1]+=R[r2];
						if (R[R1]>R[r3]) PSW_ADRESS=0xffffff&ADRESS;
						break;
	case 0x87:      /* BXLE
									���室 �� ������� ����� ��� ࠢ��
									*/
						r2=R2;r2&=0xfe;r3=r2+1;
						R[R1]+=R[r2];
						if (R[R1]<=R[r3]) PSW_ADRESS=0xffffff&ADRESS;
						break;
	case 0x88:      /* SRL
									ᤢ�� ��ࠢ� ����
									*/
						ADRESS&=0x3f;
						R[R1]>>=(int)ADRESS;
						/* NO PSW_CC*/
						break;
	case 0x89:      /* SLL
									ᤢ�� ����� ����
									*/
						ADRESS&=0x3f;
						R[R1]<<=(int)ADRESS;
						/* NO PSW_CC*/
						break;
	case 0x8a:      /* SRA
									ᤢ�� ��ࠢ� ��䬥��᪨�
									*/
						ADRESS&=0x3f;
						RREZ=(R[R1]>>(int)ADRESS);
						if (
						break;
	case 0x8b:      /* SLA
									ᤢ�� ����� ��䬥��᪨�
									*/
						R[R1]=(R[R1]&0x80000000)|((R[R1]&0x7fffffff)<<(int)ADRESS);

						break;
	case 0x8c:      /* SRDL
									ᤢ�� ��ࠢ� ������� ����
									*/
						R1&=0xfe;
						R[R1+1]>>=(int)ADRESS;
						R[R1+1]|=(R[R1]<<(32-(int)ADRESS));
						R[R1]>>=(int)ADRESS;
						T();
						break;
	case 0x8d:      /* SLDL
									ᤢ�� ����� ������� ����
									*/

						R1&=0xfe;
						R[R1]<<=(int)ADRESS;
						R[R1]|=(R[R1+1]>>(32-(int)ADRESS));
						R[R1+1]<<=(int)ADRESS;
						T();
						break;
	case 0x8e:      /* SRDA
									*/
						R1&=0xfe;
						ADRESS&=0x3f;
						R[R1+1]>>=(int)ADRESS;
						R[R1+1]|=(R[R1]<<(32-(int)ADRESS));
						R[R1]=((signed long)R[R1])>>(int)ADRESS;

						T();
						break;
	case 0x8f:      /* SLDA
									*/
						R1&=0xfe;
						ADRESS&=0x3f;
						R[R1]=(R[R1]&0x80000000)| (R[R1]<< ((int)ADRESS) );
						R[R1]|=(R[R1+1]>>(32-(int)ADRESS));
						R[R1+1]<<=(int)ADRESS;
						T();
						break;
	 }
}