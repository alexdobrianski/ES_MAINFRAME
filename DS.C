#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <stat.h>
#include <fcntl.h>
#include <math.h>


extern int RETURN;
extern int RQ_SVC;
extern int RQ_PRG;
/******************* PSW GROUP ****************************/
extern char PSW_MASK;
extern char PSW_KEY;
extern char PSW_AMWP;
extern unsigned int PSW_COD_INT;
extern char PSW_ILC;
extern char PSW_CC;
extern char PSW_PRG_MASK;
extern unsigned long PSW_ADRESS;
/******************* REGISTER GROUP ***********************/
extern unsigned long R[16];
/*************************** CSW GROUP ********************/

void INIT_MEMORY(void);
char GET_BYTE(long unsigned int ADRESS);
char GET_SECOND_BYTE(void);
void PUT_BYTE(long unsigned int ADRESS,char BYTE_PUT);
void CLOSE_MEMORY(void);
void FORW_PSW();
void SET_CC_BY_SIGN(long OP)
{if(OP==0) PSW_CC=0;
 else if (OP<0) PSW_CC=1;
       else PSW_CC=2;
}
void CODE10(char COM)
{
 static char RR;
 static int R1,R2;
 static long *RR1;
 static long *RR2;
 static long *REZ;
 RR=GET_SECOND_BYTE();
 R1=(RR&0xf0)>>4;
 R2=(RR&0x0f);
 FORW_PSW();
 switch(COM)
   {
        case 0x10:RR1=&R[R1];RR2=&R[R2];
                          *(RR1)=abs(*RR2);
              SET_CC_BY_SIGN(*RR1);
              break;
    case 0x11:RR1=&R[R1];RR2=&R[R2];
                          *(RR1)=-abs(*RR2);
              SET_CC_BY_SIGN(*RR1);
              break;
    case 0x12:R[R1]=R[R2];
              RR1=&R[R1];
              SET_CC_BY_SIGN(*RR1);
              break;
    case 0x13:RR1=&R[R1];RR2=&R[R2];
              *(RR1)-=*RR2;
              SET_CC_BY_SIGN(*RR1);
              break;
        case 0x14:RR1=&R[R1];RR2=&R[R2];          /*  !!!!!!!! */
                          *(RR1)=*(RR1)&*RR2;
                          if (*(RR1)==0) PSW_CC=0;
                          else PSW_CC=1;
                          break;
        case 0x15:RR1=&R[R1];RR2=&R[R2];        /*    !!!!!!!!*/
                          *(REZ)=*(RR1)-*(RR2);
                          SET_CC_BY_SIGN(*REZ);
                          break;
        case 0x16:RR1=&R[R1];RR2=&R[R2];         /*   !!!!!!!!*/
                          *(RR1)=*(RR1)|*RR2;
                          if (*(RR1)==0) PSW_CC=0;
                          else PSW_CC=1;
                          break;
        case 0x17:RR1=&R[R1];RR2=&R[R2];         /*   !!!!!!!!*/
                          *(RR1)=*(RR1)^*RR2;
                          if (*(RR1)==0) PSW_CC=0;
                          else PSW_CC=1;
                          break;
        case 0x18:*(R+R1)=*(R+R2);
                          break;
        case 0x19:
                          break;
    case 0x1a:RR1=&R[R1];RR2=&R[R2];
              *(RR1)+=*RR2;
              SET_CC_BY_SIGN(*RR1);
              break;
    case 0x1b:RR1=&R[R1];RR2=&R[R2];
              *(RR1)-=*RR2;
              SET_CC_BY_SIGN(*RR1);
              break;
        case 0x1c:RR1=&R[R1];RR2=&R[R2];
                          *(RR1)*=*RR2;
              SET_CC_BY_SIGN(*RR1);
              break;
        case 0x1d:RR1=&R[R1];RR2=&R[R2];
                          *(RR1)/=*RR2;
              SET_CC_BY_SIGN(*RR1);
                          break;
        case 0x1e:RR1=&R[R1];RR2=&R[R2];         /*   !!!!!!!!   for cods*/
                          *(RR1)=*(RR1)&*RR2;
                          break;
        case 0x1f:RR1=&R[R1];RR2=&R[R2];         /*   !!!!!!!!            */
                          *(RR1)=*(RR1)&*RR2;
                          break;
   }
}
