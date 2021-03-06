#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <math.h>

#include "ds360psw.h"
#include "ds360dfn.h"

void CODE30(char far *COM)
{static char RR;
 static char RX;
 static int R1,R2,B2,IS;


 static char BD;
 static char DD;
 static unsigned int DDD;

 static signed long *RR1;
 static signed long *RR2;
 static long *REZ;
 static long RREZ;
 static unsigned long URREZ;
 static unsigned long *URR1;
 static unsigned long *URR2;
 static unsigned long ADRESS;
 static int i,j;
#define B1 B2
#define I2 RX
#define X2 R2

 GET_OPERAND_RR;
 FORWARD_PSW;
 switch(COM[0])
	 {
		case 0x30:          		           /* LPDR */
																			 /* �������� �窠
																			 ����㧪� ������⥫쭠�
																			 㤢������ �筮���
																			 */
				///T();
				PSW_CC=2;
				R_FLOAT[R1]=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else  ((char *)R_FLOAT[R1])[9]|=0x80;
				///T();
				break;

		case 0x31:                         /* LNDR */
																			 /*
																			 ����㧪� ����⥫쭠�
																			 㤢������ �筠���
																			 */

				///T();
				PSW_CC=1;
				R_FLOAT[R1]=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else ((char *)R_FLOAT[R1])[9]|=0x80;
				///T();
				break;

		case 0x32:                         /* LTDR */
																			 /*
																			 ����㧪� � �஢�ઠ 㤢������
																			 �筮��
																			 */
				///T();
				R_FLOAT[R1]=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;
				///T();
				break;

		case 0x33:                         /* LCDR */
																			 /*
																			 ����㧪� ����������� 㤢������
																			 �筮��
																			 */
				///T();
				R_FLOAT[R1]=-R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;

				///T();
				break;

		case 0x34:                         /* HDR  */
																			 /*
																			 ������� ��ன ���࠭� �������
																			 ������� � ����頥���
																			 �� ���� ��ண�
																			 */
				///T();
				R_FLOAT[R1]=R_FLOAT[R2]/2.0;
				///T();
				break;

		case 0x35:                         /*  ����।������ ��� ����樨 */
				//T();
				break;

		case 0x36:                         /* ��� */
				T();
				break;

		case 0x37:                         /* ��� */
				T();
				break;

		case 0x38:                         /* LDR */
																			 /*����㧪� 㤢������ �筮���
																			 */
				///T();
				R_FLOAT[R1]=R_FLOAT[R2];
				///T();
				break;

		case 0x39:                         /* CDR */
																			 /*
																			 �ࠢ����� 㤢������ �筮���
																			 */
				///T();
				if (R_FLOAT[R1]==R_FLOAT[R2]) PSW_CC=0;
				else if (R_FLOAT[R1]<R_FLOAT[R2]) PSW_CC=1;
						else PSW_CC=2;
				///T();
				break;

		case 0x3a:                         /* ADR */
																			 /* ᫮����� � ��ଠ����樥�
																			 㤢������ �筠���
																			 */
				///T();
				R_FLOAT[R1]+=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;
				///T();
				break;

		case 0x3b:                         /* SDR */
																			 /*
																			 ���⠭�� � ��ଠ����樥�
																			 㤢������ �筮���
																			 */
				///T();
				R_FLOAT[R1]-=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;
				///T();
				break;

		case 0x3c:                         /* MDR  */
																			 /*
																			 㬭������ 㤢������ �筮���
																			 */
				///T();
				R_FLOAT[R1]*=R_FLOAT[R2];
				///T();
				break;
		case 0x3d:                         /* DDR  */
																			 /*
																			 ������� 㤢������ �筮���
																			 */
				///T();
				if (R_FLOAT[R2]==0.0)
					{RQ_PRG=0x000f;RETURN=1;return;
					}
				else R_FLOAT[R1]/=R_FLOAT[R2];
				///T();
				break;
		case 0x3e:                         /*  AWR */
																			 /*
																			 ᫮����� ��� ��ଠ����樨
																			 㤢������ �筮���
																			 */
				///T();
				R_FLOAT[R1]+=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;
				///T();
				break;
		case 0x3f:                         /*  SWR */
																			 /*
																			 ���⠭�� ��� ��ଠ����樨
																			 㤢������ �筮���
																			 */
				///T();
				R_FLOAT[R1]-=R_FLOAT[R2];
				if (R_FLOAT[R1]==0.0) PSW_CC=0;
				else if (R_FLOAT[R1]<0.0) PSW_CC=1;
						else PSW_CC=2;
				///T();
				break;
	 }
}
#undef B1
#undef I2
#undef X2
