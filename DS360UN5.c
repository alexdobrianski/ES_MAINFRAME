/****************************************************************
*
* void RUN_5010(int UNIT) - spesial tape
*
****************************************************************/
#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <alloc.h>
#include <mem.h>

#include "ds360psw.h"

#include "ds360dfn.h"

//#include "ds360trn.h"


void RUN_5010(int UNIT)
{
 static int flag_reader_open=0;
 static int RDFILE;
 static int RE;
 static unsigned long CAW;
 static unsigned long ar;
 static int i;
 static long OFF_PREV;
 static long OFF_NEXT;
 static long LEN_BLOCK;
 static long OFF_NOW;
 static char PR=0x11;
 static int BLOCK_SIZE;
 static char BUFER[20000];
 static char far*bufer;
 static unsigned int RET;
 static unsigned int COUNT_CC;
 static unsigned int count_cc;


 /********************************************************************
 ���� ���ﭨ� ���ன�⢠
 0 - �� �ᯮ������
 1 - ����䨪��� ���ﭨ� �᫨ ����㦤�� �����६���� � ��⮬ ������
 2 - ����஫��� ���稫 ����㦤����� � ᫥����� �����
		 �) � ���� �� ����樨 �� �믮������ ���ன ��
				�뤠� ᨣ��� ���������� �����
		 �) � ���� �� ����樨 �ࠢ����� �� �믮������ ���ன �뫨
				�����㦥�� ������ � ���������� ��� ������ ������ � ����������
 3 - ����� �᫨ ����㦤�� �����६���� � ����䨪��஬  ���ﭨ�
		 � ����஫��� ����� �᫨ ����㦤��� � ����䨪��� ���ﭨ� ���
		 - ����� ���ன�⢮
 4 - ����� ���稫 ��� ������ �ࠢ����� ����㦤����� �ࠧ� ��᫥ ����㯫����
		 ������� ��� ������ �⥭�� � ����� - � ���� ��।�� ������
 5 - ��� ���稫� ����砥� �� ���ன�⢮ �����訫� ������
		 ������ �뤠���� ⠪-�� ����� ���ன�⢮ ���室��
		 �� ���ﭨ� �� ������ � ���ﭨ� ������
 6 - �訡�� � ���ன�⢥, ����㦤����� ��直� ࠧ �����
		 �) ����㦤�� �� ��� ���� 0 ��筥����� ���ﭨ�
		 �) ����㦤�� ��� 4 ���� 1 ��筥����� ���ﭨ�
		 �) ����஫�� �����訫 ᢮� ࠡ��� ��砢
				�믮������ ������� ��������� � ���������
 7 - �ᮡ� ��砩 � ���ன�⢥ ����㦤����� �᫨
		 �� �믮������ ������� ������  WTM ERG �ன��� ��ࠦ��騩
		 ��થ� ���� ����� EOT

 ���� 0
 0 - ������� �⢥࣭�� �������⨬�� ������� ��� ������� ������
		 WTM ERG �뤠�� ��� ���饭���� 䠩��
 1 - �ॡ���� ����⥫��⢮ (��� 1 ���� 1 ࠢ�� 0)
 2 - �訡�� � ��室��� ���ଠ樮���� 設�
 3 - �訡�� � ����㤮����� ��� 7 ���� 3 � 1 5 6 7 ���� 4 �� �� ࠢ�� 0
 4 - �訡�� � ������ ���� 0-4 ���� 4 �� �� ࠢ�� 0
 5 - ��९������� �������� �� �믮������ ����樨 ������
		 ������ �������� ������  ��।�� ������ �४�頥���
 6 - �㫥��� �᫮ ᫮� ����㦤����� �� �믮������ �����
		 �᫨ ������ ��ࢠ�� (���ਬ�� HIO) �� ⮣� ��� ��� ����
		 ����ᠭ ���� ���� �������� ����� �� �뫮
 7 - �� �ᯮ������

 ���� 1
 0 - ����� �� ࠡ�� � ०��� NRZ �����㦥�� ᨣ���� �����
		 � ������筮� �஬���⪥ �� ࠡ�� � ०��� PE ��� �ᥣ�� 0
 1 - ��⮢� ���ன�⢮ ��室���� � ���ﭨ� ��⮢�
 2 - �᫨ ��� ��� ����㦤�� � ��� 1 ��襭 � ���⮯��玲��� ���ன�⢠
		 ��� �᫨ �����६���� � �⨬ ��⮬ ��� 1 ����㦤��
		 �� ��襭 ��� ����� � ���ன�⢮ ��室���� � ���ﭨ� �� ��⮢�
		 �᫨ �����६���� � �⨬ ��⮬ ����㦤�� ��� 1 � ���
		 ����� � �믮������ ��६�⪠
 3 - ������� ��⠭������ ��� ࠡ��� � 7-��஦�筮� ���⮩

 4 - ���� ��室���� � �窥 ����㧪�
 5 - ���� ��室���� � ���ﭨ� ����� �� ����砥�
			�� ��᫥���� �������� ����� �⭮ᨫ��� � ��������
			������ ERG ?WTM
 6 - ���� ���饭� (��� ����� �����)
 7 - �� ०��� NRZ �� �ᯮ������

 ���� 2
 �� ०��� PE �� �ᯮ������

 ���� 3

 ���� 4

 ���� 5
 ********************************************************************/

 if (IO_STATUS[UNIT][8]==0)
			 {
//				IO_STATUS[UNIT][9]=
//					open(&NAME_FILE_IO_DEVICE[UNIT][0],O_RDWR|O_BINARY);
				IO_STATUS[UNIT][8]=1;
				IO_STATUS[UNIT][5]=0;
				OFFSET_IO_DEVICE[UNIT]=0l;
				IO_STATUS[UNIT][3]=0x48;
			 }
 bufer=BUFER;
 switch(CSW_COD[UNIT])
	 {
		case 0x02:   /* ������
								 ���� ��६�頥��� �� ᫥���饣� IBG �����
								 ��।����� � �����
								 */

							//tt(UNIT);
							COUNT_CC=CSW_COUNT[UNIT];
							asm pusha;
							asm push ds;
							asm mov cx,COUNT_CC;
							asm lds dx,bufer;
							asm mov ah,2;
							asm int 0x61;
							asm pop ds;
							asm mov count_cc,cx;
							RET=_AX;
							asm popa;

							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* �� ������ */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto R1;
								 }
							if (RET&0x0084)    /* ������ */
								 {
									IO_STATUS[UNIT][2]=U4;
									IO_STATUS[UNIT][1]|=U6;
									goto R1;
								 }
							if (RET&0x0008)    /* TM */
								 {IO_STATUS[UNIT][1]|=U7;
								 }
							else
								 {if (RET&0x8000)
										{BLOCK_SIZE=COUNT_CC;
										}
									else
										{BLOCK_SIZE=COUNT_CC-count_cc;
										}
									MOVE_MEM_TO_360(BUFER,CSW_ADRESS[UNIT],COUNT_CC);
									CSW_COUNT[UNIT]-=COUNT_CC;
								 }

R1:
							//tt(UNIT);
				break;


		case 0x0c:   /* �������� ������
								 ���� �������� � ���⭮� ���ࠢ����� �� IBG
								 ����� ��।����� � �����
								 */
							tt(UNIT);

				break;


		case 0x04:   /* �������� ���������
								 ���� ���⮢ ���ଠ樨 ��筥����� ���ﭨ�
								 ��।����� � �����
								 ����� ��筥����� ���ﭨ� ���뢠���� � ��砫�
								 ������ ����樨 �⥭�� ��� ����� � ⠪��
								 � ��砫� ������ ����樨 �ࠢ����� ����� �ॡ��
								 �������� �����
								 */
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0x40;
				for(i=0,ar=CSW_ADRESS[UNIT];i<2;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][i+2]);
						}
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0;
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;


		case 0x01:   /* ������
								 ���� �������� � ��אַ� ���ࠢ�����
								 ������ �ந�������� ���� ����� ���뫠�� �����
								 �� ����砭�� ��।�� �� ���� �ନ����� IBG
								 ࠧ��� ����� �� ������ ���� ����� 18 ����
								 */

							MOVE_360_TO_MEM(CSW_ADRESS[UNIT],BUFER,CSW_COUNT[UNIT]);
							COUNT_CC=CSW_COUNT[UNIT];
							asm pusha;
							asm push ds;
							asm mov cx,COUNT_CC;
							asm lds dx,bufer;
							asm mov ah,1;
							asm int 0x61;
							asm pop ds;
							asm mov count_cc,cx;
							RET=_AX;
							asm popa;
							IO_STATUS[UNIT][1]=U4|U5;
							CSW_COUNT[UNIT]=0;
							if (RET&0x0002)    /* �� ������ */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto W1;
								 }
							if (RET&0x0084)    /* ������ */
								 {
									IO_STATUS[UNIT][2]=U4;
									IO_STATUS[UNIT][1]|=U6;
									goto W1;
								 }
							if (RET&0x0040)    /* ������ ������*/
								 {
									IO_STATUS[UNIT][2]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W1;
								 }
W1:
							tt(UNIT);
				break;


		case 0x07:   /* ���������      REW
								 ���� ��६�頥��� � ��砫� �.�. � �窥 ����㧪�
								 ��� ⮫쪮 ��稭����� ��६�⪠ ��ࠡ��뢠����
								 ᨣ��� ��� ���稫�
								 ����� ��६�⪠ �����稢����� ��ࠡ��뢠����
								 ��ன ᨣ��� ��� ���稫�
								 */
							asm pusha;
							asm push ds;
							asm mov ah,9;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							IO_STATUS[UNIT][3]=0x48;
							IO_STATUS[UNIT][1]=U4|U5;
							CSW_COUNT[UNIT]=0;
							if (RET&0x0002)    /* �� ������ */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;


		case 0x0f:   /*  ��������� � ���������  RUN
								 � �� �� � ��������� �஬� ⮣� ���� ࠧ��㦠����
								 */
							asm pusha;
							asm push ds;
							asm mov ah,9;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							IO_STATUS[UNIT][3]=0x48;
							IO_STATUS[UNIT][1]=U4|U5;
							CSW_COUNT[UNIT]=0;
							if (RET&0x0002)    /* �� ������ */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;




		case 0x17:   /*  ������� �������        EBG
								 �� ������ ����� �� ��� ��।�� ������
								 � १����� ᮧ������ 㤫������ IBG
								 */
							asm pusha;
							asm push ds;
							asm mov cx,0xffff;
							asm mov ah,8;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							tt(UNIT);
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* �� ������ */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto W2;
								 }
							if (RET&0x0084)    /* ������ */
								 {
									IO_STATUS[UNIT][3]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W2;
								 }
							if (RET&0x0040)    /* ������ ������*/
								 {
									IO_STATUS[UNIT][2]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W2;
								 }
W2:           tt(UNIT);
				break;


		case 0x1f:   /* ������ ����� �����      WTM
								 �����뢠���� ᯥ樠��� ���⪨� ����
								 ���뢠��� ��મ� �����
								 ��� � ��� ��� ��㣮�� ����� ��� �।�����
								 � �� ��� ᫥��� IBG
								 */
							asm pusha;
							asm push ds;
							asm mov ah,3;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;

							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* �� ������ */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto W3;
								 }
							if (RET&0x0084)    /* ������ */
								 {
									IO_STATUS[UNIT][2]=U4;
									IO_STATUS[UNIT][1]|=U6;
									goto W3;
								 }
							if (RET&0x0040)    /* ������ ������*/
								 {
									IO_STATUS[UNIT][2]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W3;
								 }
W3:
							tt(UNIT);
				break;


		case 0x27:   /* ��� ����� �� ����       BSB
								 ���� �������� ����� �� ᫥���饣� IBG
								 */
							asm pusha;
							asm push ds;
							asm mov ah,7;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;

							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* �� ������ */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							if (RET&0x0008)    /* TM */
								 {IO_STATUS[UNIT][1]|=U7;
								 }
							tt(UNIT);
				break;


		case 0x2f:   /* ��� ����� �� ����       BSF
								 ���� �������� ����� �� ᫥������
								 ���� ����� �᫨ ��ઠ �� ������� ���� ��⠭���������� � �窥
								 ����㧪�
								 */
							asm pusha;
							asm push ds;
							asm mov ah,5;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* �� ������ */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;


		case 0x37:   /* ��� ������ �� ����      FSB

								 */
							asm pusha;
							asm push ds;
							asm mov ah,6;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* �� ������ */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							if (RET&0x0008)    /* TM */
								 {IO_STATUS[UNIT][1]|=U7;
								 }
							tt(UNIT);
				break;


		case 0x3f:   /* ��� ������ �� ����      FSF
								 */
							asm pusha;
							asm push ds;
							asm mov ah,4;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* �� ������ */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;


		case 0xc3:   /* ���������� ����� 1600 PE   PE

								 */
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;


		case 0xcb:   /* ���������� ����� 800 NZR   NRZ
								 */
				IO_STATUS[UNIT][1]=U4|U5;
				CSW_COUNT[UNIT]=0;
				break;


		case 0xdb:   /* ������ TIE
								 */
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;
		case 0x03:  /*  NOP */
				//CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;


		default:
				tt(UNIT);
				break;
		}

}
