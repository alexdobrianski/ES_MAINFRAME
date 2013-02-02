/****************************************************************
*
* void RUN_7920_NET(int UNIT) (network 7920)
*
****************************************************************/
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <stat.h>
#include <fcntl.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <alloc.h>
#include <mem.h>

#include "ds360psw.h"

#include "ds360dfn.h"

//#include "ds360trn.h"


void RUN_7920_NET(int UNIT)
{
 static int flag_reader_open=0;
 static int RDFILE;
 static int RE;
 static unsigned long CAW;
 static char BUFER[80];
 static unsigned long ar;
 static int i;
 static char CHAR;

 /****************************************************************
	������� �⥭�� ����
	1 ���� ��������� ��������
			 7D ������ ����
			 F1 ������ F1
			 ..
			 F9 ������ F9
			 7A ������ F10
			 7B         F11
			 7C         F12
			 6C         PD1
			 6E         PD2
			 6B         PD3
			 6D         CLEAR
	2 ���� ����� �������
	1 ���� ������ ����
	1 ���� ������ �������
	�����
	.....
 *****************************************************************
 �⥭�� ������஢������
 1 ���� ��������� ��������
 2 ���� ����� �������
 1 ���� ���
 1 ���� ���� ��ਡ��
 ��������� �������� ������ (���� �����������)
 *****************************************************************
 ������ � ��࠭�� ������

 ****************************************************************/
 switch(CSW_COD[UNIT])
	 {
		case 0x01:
									/*   ������            */
				RUN_7920_WR_NET(CSW_ADRESS[UNIT],CSW_COUNT[UNIT],UNIT);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;

		case 0x05:    /*  ��������_������*/
				RUN_7920_CLWR_NET(CSW_ADRESS[UNIT],CSW_COUNT[UNIT],UNIT);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;

		case 0x02:    /* ������ �����    */
				RUN_7920_RD_NET(CSW_ADRESS[UNIT],CSW_COUNT[UNIT],UNIT);
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;

		case 0x06:    /* ������ �������������� */

				RUN_7920_RDMD_NET(CSW_ADRESS[UNIT],CSW_COUNT[UNIT],UNIT);
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;

		case 0x07:    /* ����������            */
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;

		case 0x1f:    /* ������� ��� ������������ */
				RUN_7920_CLNZ_NET(CSW_ADRESS[UNIT],CSW_COUNT[UNIT],UNIT);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;

		case 0x0b:
				//putchar(7);
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				//tt(UNIT);
				break;
		case 0x03:   /* X X   */
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;
		case 0x04:   /* �������� ���������   */
				for(i=0,ar=CSW_ADRESS[UNIT];i<1;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][2]);
						}
				IO_STATUS[UNIT][2]=0;
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;

		default:
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;
		}

}
