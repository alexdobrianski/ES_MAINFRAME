/*****************************************************
* DISPLAY 7920
*
*
******************************************************/
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <stat.h>
#include <fcntl.h>
#include <time.h>
#include <conio.h>

#include "ds360psw.h"

#include "ds360dfn.h"
extern char EBCDIC_ASCII[256];
extern char ASCII_EBCDIC[256];
/*************************************************************/
int NET_OK;
#include "ncb.h"
#include "ncbcmds.h"
#include "codetbl.h"
#include "neterror.h"

//typedef unsigned char  BYTE;
typedef unsigned short WORD;
typedef char far *     ADDRESS;

//#include "funcdef.h"

/* global variables */

//extern NCB  Ncb;			/* NCB used for all commands	      */
//extern char Lana;			/* 0 or 1			      */

//#define  NET_LSN	 6	/* maximum number of local sessions   */
//#define  NET_NUM	12	/* maximum number of outstanding NCBs */
//#define  SEND		 0	/* Mode flag for SEND		      */
//#define  RECV		 1	/* Mode flag for RECEIVE	      */



//void TEST_CONNECTION(int unit)
//{
//if (NET_OK<0) return;
// if (NET_OK==0)
//	{Lana=0;
//	 NetReset(Lana,NET_LSN,NET_NUM);
//	 if (Ncb.retcode)
//		 {NET_OK=-1;
//			return;
//		 }
//	 NetAddName(Lana,"MAIN_FRM_IBM_360");
//	 if (Ncb.retcode)
//		 {NET_OK=-1;
//			return;
//		 }
//
//	}
//
//}
//void CLOSE_CONNECTION(void)
//{
// NetReset(Lana,NET_LSN,NET_NUM);
//}


/*************************************************************/
void RUN_7920_WR_NET(unsigned long BUFER,int count,int unit)
{static int i,j;
 static unsigned long ar;
 static char COUT;
 static int POINT_BUFER;
 static int NEXT_POINT_BUFER;
 static char FILLING_CHAR;
 POINT_BUFER=((AREA_7920[unit][1922])<<8)+AREA_7920[unit][1923];
	 if (POINT_BUFER<0 || POINT_BUFER>1919) POINT_BUFER=0;
	i=1;ar=CSW_ADRESS[unit]+1;
BEGWR:
 for(;i<CSW_COUNT[unit];i++,ar++)
	 {
		COUT=GET_BYTE(ar);
		switch(COUT)
			{
			 case 0x1d:       /*  €—€‹Ž Ž‹Ÿ */
								COUT=GET_BYTE(ar+1);
								COUT=0x10|((0x20&COUT)>>2)|((0x0c&COUT)>>1)|(COUT&0x01);
								AREA_7920[unit][POINT_BUFER]=COUT;
								//printf("p=%d ATR=%x",POINT_BUFER,COUT);getch();
								i++;ar++;
								POINT_BUFER++;
								if (POINT_BUFER>1919) POINT_BUFER=0;
								break;
			 case 0x11:       /*  “‘’€Ž‚ˆ’œ €„…‘ “”…Ž‰ €ŒŸ’ˆ */
								POINT_BUFER=ADRESS_BUFER(GET_BYTE(ar+1),GET_BYTE(ar+2));
								//printf("POINT BUFER=%d",POINT_BUFER);getch();
								i+=2;ar+=2;
								break;
			 case 0x13:       /*  “‘’€Ž‚ˆ’œ Š“‘Ž                */
								AREA_7920[unit][1920]=POINT_BUFER>>8;
								AREA_7920[unit][1921]=POINT_BUFER&0x00ff;

								break;
			 case 0x3c:       /*  Ž‚’Žˆ’œ „Ž €„…‘€              */
								NEXT_POINT_BUFER=ADRESS_BUFER(GET_BYTE(ar+1),GET_BYTE(ar+2));
								FILLING_CHAR=GET_BYTE(ar+3);
								ar+=3;i+=3;
								//printf("from=%d(%x) to=%d(%x)",POINT_BUFER,POINT_BUFER,
								//NEXT_POINT_BUFER,NEXT_POINT_BUFER);getch();
								if (NEXT_POINT_BUFER>=0 && NEXT_POINT_BUFER<1920)
									{
FILL:              if (POINT_BUFER==NEXT_POINT_BUFER) break;
									 AREA_7920[unit][POINT_BUFER]=EBCDIC_ASCII[FILLING_CHAR];
									 POINT_BUFER++;if (POINT_BUFER>1919) POINT_BUFER=0;
									 goto FILL;
									}
								break;
			 case 0x12:       /*  ‘’……’œ …‡€™ˆ™…Ž…             */
								 printf("steret nezaschischennoe");getch();
								break;
			 case 0x05:       /* Žƒ€ŒŒ€Ÿ ’€“‹Ÿ–ˆŸ             */
								printf("programmnaia tabuliacia");getch();
								break;
			 default  :
								AREA_7920[unit][POINT_BUFER]=EBCDIC_ASCII[GET_BYTE(ar)];
								POINT_BUFER++;
								if (POINT_BUFER>1919) POINT_BUFER=0;
								break;
			}
	 }
 if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
	{
	 CH_DATA(unit);
	 i=0;ar=CSW_ADRESS[unit];
	 goto BEGWR;
	}
 IO_STATUS[unit][5]=1;
 AREA_7920[unit][1922]=POINT_BUFER>>8;
 AREA_7920[unit][1923]=POINT_BUFER&0x00ff;


}
/*************************************************************/
void RUN_7920_CLWR_NET(unsigned long BUFER,int count,int unit)
{static int i;
 for(i=0;i<1924;i++) AREA_7920[unit][i]=0;
 RUN_7920_WR(BUFER,count,unit);
}
/*************************************************************/
int  RUN_7920_RD_NET(unsigned long BUFER,int count,int unit)
{static unsigned long ar;
 static unsigned int ADC;
 static int i,flag_write;
 static char COUT;
 static int p_buffer,CURSOR;
 ar=CSW_ADRESS[unit];
 p_buffer=((AREA_7920[unit][1922])<<8)+AREA_7920[unit][1923];
 if (p_buffer<0 || p_buffer>1919) p_buffer=0;
 if ((CSW_MOD[unit]&0x10) == 0) flag_write=1;
 else flag_write=0;
 COUT=IO_STATUS[unit][6];
 if (COUT==0) COUT=0x60;
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,COUT);
 ar++;
 if (count<=1)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
		 {
			CH_DATA(unit);
			ar=CSW_ADRESS[unit];
			i=0;
			//goto BEGRD;
		 }
		else  goto RET;
	 }
 ADC=MAKE_ADRESS_BUFER((AREA_7920[unit][1920])<<8+AREA_7920[unit][1921]);
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC>>8);
 ar++;
 if (count<=2)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
			{
			 CH_DATA(unit);
			 ar=CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else  goto RET;
	 }
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC&0x00ff);
 ar++;i=3;
 if (count<=3)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
			{
			 CH_DATA(unit);
			 ar=CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else goto RET;
	 }
BEGRD:
 if ((CSW_MOD[unit]&0x10) == 0) flag_write=1;
 else flag_write=0;
 for(;i<CSW_COUNT[unit];i++,ar++,p_buffer++)
	 {if (p_buffer>1919) goto WRRD;
		COUT=AREA_7920[unit][p_buffer];
		if (COUT>0 && COUT<0x20)
			{
			 if (flag_write)PUT_BYTE(ar,0x1d);
			 if (flag_write)PUT_BYTE(ar+1,((COUT&0x08)<<2)|((COUT&0x06)<<1)|(COUT&0x01));
			 ar++;i++;
			}
		else
			{if (flag_write)PUT_BYTE(ar,ASCII_EBCDIC[COUT]);
			}
	 }
 if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
	 {
		CH_DATA(unit);
		ar=CSW_ADRESS[unit];
		i=0;
		goto BEGRD;
	 }
 else goto RET;
RET:
	 CSW_COUNT[unit]=0;
	 return;
WRRD:
	 CSW_COUNT[unit]-=i;
	 return;

}
/***********************************************************/
int RUN_7920_RDMD_NET(unsigned long BUFER,int count,int unit)
{static unsigned long ar;
 static unsigned int ADC;
 static int i,flag_write,k;
 static char COUT;
 static int p_buffer,CURSOR;
 ar=CSW_ADRESS[unit];
 p_buffer=((AREA_7920[unit][1922])<<8)+AREA_7920[unit][1923];
 if (p_buffer<0 || p_buffer>1919) p_buffer=0;
 p_buffer=0;
 COUT=IO_STATUS[unit][6];
 if (COUT==0) COUT=0x60;
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,COUT);
 ar++;
 if (count<=1)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
		 {
			CH_DATA(unit);
			ar=CSW_ADRESS[unit];
			i=0;
			//goto BEGRD;
		 }
		else  goto RET;
	 }
 if (COUT==0x6d || COUT==0x6c || COUT==0x6e || COUT==0x6b)
		{i=1;
		 goto WRRD;
		}
 ADC=MAKE_ADRESS_BUFER( (( (int) AREA_7920[unit][1920])<<8) +(int)AREA_7920[unit][1921]);
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC>>8);
 ar++;
 if (count<=2)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
			{
			 CH_DATA(unit);
			 ar=CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else  goto RET;
	 }
 if ((CSW_MOD[unit]&0x10) == 0)PUT_BYTE(ar,ADC&0x00ff);
 ar++;i=3;k=0;
 if (count<=3)
	 {if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
			{
			 CH_DATA(unit);
			 ar=CSW_ADRESS[unit];
			 i=0;
			 //goto BEGRD;
			}
		else goto RET;
	 }
BEGRD:
	if ((CSW_MOD[unit]&0x10) == 0) flag_write=1;
 else flag_write=0;

 for(;i<CSW_COUNT[unit];i++,ar++,p_buffer++)
	 {
NEXTB:
		if (p_buffer>1919) goto WRRD;
		COUT=AREA_7920[unit][p_buffer];
		switch(k)
			{
			 case 0:if (COUT>0 && COUT<0x20 && COUT&0x01)
								{
								 PUT_BYTE(ar,0x11);
								 ADC=MAKE_ADRESS_BUFER(p_buffer+1);
								 ar++;i++;
								 PUT_BYTE(ar,ADC>>8);
								 ar++;i++;
								 PUT_BYTE(ar,ADC&0x00ff);
								 k=1;
								}
							 else
								{p_buffer++;
								 goto NEXTB;
								}
							 break;
			 case 1:if (COUT>0 && COUT<0x20) {k=0;p_buffer++;goto NEXTB;}
							if (COUT==0)
								 {p_buffer++;
									goto NEXTB;
								 }
							PUT_BYTE(ar,ASCII_EBCDIC[COUT]);
							break;
			}
	 }
 if(CSW_MOD[unit] & 0x80)      /* æ¥¯®çª  ¤ ­­ëå */
	 {
		CH_DATA(unit);
		ar=CSW_ADRESS[unit];
		i=0;
		goto BEGRD;
	 }
 else goto RET;
RET:
	 CSW_COUNT[unit]=0;
	 return;
WRRD:
	 CSW_COUNT[unit]-=i;
	 return;


}
/***************************************************************/
void RUN_7920_CLNZ_NET(unsigned long BUFER,int count,int unit)
{
}
