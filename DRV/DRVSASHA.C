#include "drvsasha.h"
#include <dos.h>



/////////////////////////////////////////////

void mediacheck(void);
void getbpb(void);
void ioctlinput(void);
void input(void);
void ndinput(void);
void inputstatus(void);
void inputflush(void);
void output(void);
void outputverify(void);
void outputstatus(void);
void outputflush(void);
void ioctloutput(void);
void deviceopen(void);
void deviceclose(void);
void removeable(void);
void outputbusy(void);
void badcommand(void);
void genericioctl(void);
void getdevice(void);
void setdevice(void);
void ioctlquery(void);
void init(void);
void endend(void);
/////////////////////////////////////////////
extern rh_t far *rhptr;
static unsigned int PI=0xe00;//4B84;
#define MAX_BUFFER_SIZE 3000
static unsigned char Buffer[MAX_BUFFER_SIZE];

void mediacheck(void)
		{rh1_t far *rh1;
		 rh1=(rh1_t far*)rhptr;
		 rh1->rh.Status = DONE;
		}
void getbpb(void)
		{rh2_t far *rh2;
		 rh2=(rh2_t far*)rhptr;
		 rh2->rh.Status = DONE;
		}
void ioctlinput(void)
		{rh3_t far *rh3;
		 rh3=(rh3_t far*)rhptr;
		 rh3->rh.Status = DONE;
		}
void input(void)

		{rh4_t far *rh4;
		 int i,op,j;
     unsigned long ptBuffer;
     unsigned char far*ptchBuffer;
     int addr,size;

		 rh4=(rh4_t far*)rhptr;
     op=rh4->buf[0];
     addr = rh4->buf[1]+((rh4->buf[2])<<8);
     size = rh4->buf[3]+((rh4->buf[4])<<8);
     if (op ==1)
       {
		    for(i=5,j=addr;i<size&&i<rh4->count;i++,j++)
           Buffer[j] =rh4->buf[i];
       }
     if (op ==2)
       {
        for(i=5,j=addr;i<size&&i<rh4->count;i++,j++)
           rh4->buf[i] =Buffer[j];
       }

     if (op ==3)
       {
		    for(i=1;i<rh4->count;i++)
           Buffer[i-1] =rh4->buf[i];
       }
     if (op ==4)
       {
        for(i=1;i<rh4->count;i++)
           rh4->buf[i] =Buffer[i-1];
       }

      if (op ==5)
       {
        ptchBuffer=Buffer;
        ptBuffer=ptchBuffer;
        rh4->buf[0]= (ptBuffer)&0xff;
        rh4->buf[1]= (ptBuffer>>8)&0xff;
        rh4->buf[2]= (ptBuffer>>16)&0xff;
        rh4->buf[3]= (ptBuffer>>24)&0xff;
       }

//		 int i,j;
//     int addr,size;
//		 rh4=(rh4_t far*)rhptr;
//     addr = *(int *)(&rh4->buf[1]);
//     size = *(int *)(&rh4->buf[3]);
//       if (rh4->buf[0] ==1)
//         {
//          for(i=0,j=addr;i<rh4->count && i<size && j<MAX_BUFFER_SIZE;i++,j++)
//            Buffer[j] =rh4->buf[i];
//         }
//       else if (rh4->buf[0] ==2)
//         {
//          for(i=0,j=addr;i<rh4->count && i<size && j<MAX_BUFFER_SIZE;i++,j++)
//            rh4->buf[i] =Buffer[j];
//         }
//       else
//       if (rh4->buf[0] ==3)
//         {
//          for(i=0;i<rh4->count; i++)
//            Buffer[i] =rh4->buf[i];
//         }
//       else
//       if (rh4->buf[0] ==4)
//         {
//          for(i=0;i<rh4->count; i++)
//             rh4->buf[i]=Buffer[i];
//         }
//       else if (rh4->buf[0] ==5)
//         {
//          *((unsigned long*)&rh4->buf[0]) =(unsigned long)((char huge*)Buffer);
//			   }
		 rh4->rh.Status = DONE;
		}
void ndinput(void)
		{
		static rh5_t far *rh5;
		rh5=(rh5_t far*)rhptr;
		rh5->rh.Status = DONE;
		}
void inputstatus(void)
		{
		rhptr->Status = DONE;
		}
void inputflush(void)
		{
		rhptr->Status = DONE;
		}

void output(void)
		{rh8_t far *rh8;
		 rh8=(rh8_t far*)rhptr;
		 rh8->rh.Status = DONE;
		}
void outputverify(void)
		{

		output();
		}
void outputstatus(void)
		{
		rhptr->Status = DONE;
		}
void outputflush(void)
		{
		rhptr->Status = DONE;
		}
void ioctloutput(void)
		{rh12_t far *rh12;
		 rh12=(rh12_t far*)rhptr;
		 rh12->rh.Status = DONE;
		}

void deviceopen(void)
		{
		 rhptr->Status = DONE;
		}
void deviceclose(void)
		{
		 rhptr->Status = DONE;
		}
void removeable(void)
		{
		rhptr->Status = DONE;
		}
void outputbusy(void)
		{
		rh16_t far *rh16;
		rh16=(rh16_t far*)rhptr;
		rh16->rh.Status = DONE;
		}
void badcommand(void)
		{
		rhptr->Status = DONE | ERROR | UNKNOWN;
		}
void genericioctl(void)
		{
		rh19_t far *rh19;
		rh19=(rh19_t far*)rhptr;
		rh19->rh.Status = DONE;
		}
void getdevice(void)
		{
		rh23_t far *rh23;
		rh23=(rh23_t far*)rhptr;
		rh23->rh.Status = DONE;
		}
void setdevice(void)
		{
		rh24_t far *rh24;
		rh24=(rh24_t far*)rhptr;
		rh24->rh.Status = DONE;
		}
void ioctlquery(void)
		{
		rh25_t far *rh25;
		rh25=(rh25_t far*)rhptr;
		rh25->rh.Status = DONE;
		}

void init(void)
		{
		static rh0_t far *rh0;
		static char MY[80]={"\nMainframe display driver 1.0\n$"};
		static unsigned int MY_OFF,MY_SEG;
		static int MYMY={0x4c00};
		static unsigned int I1,I2;
		static char huge *mymy;

		rh0=(rh0_t far*)rhptr;
		asm push ds;
		asm pop ax;
		asm push ds;
		asm push bp;
		MY_OFF = FP_OFF(MY);
		MY_SEG = FP_SEG(MY);
		_DX=MY_OFF;_AX=0x0900;_DS=MY_SEG;
		__int__(0x21);
		asm pop bp;
		asm pop ds;
		asm push ds;
		asm pop ds;
		rh0->EndAddress = ((char far*)endend)+PI;

		rh0->rh.Status = DONE;
		}


void endend(void)
{int i;
i=0;

}
