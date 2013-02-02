
#include <stdio.h>
#include <stdlib.h>
#include <mem.h>

#define TRUE           1
#define FALSE          0

#define BYTE  unsigned char

extern double D_FLOAT[8];   //this registers for original copy of loaded float
void Shift_Array( BYTE far *arr, int delta, int num);
int float_add(double far *FR1,   double far *FR2,  int codeOper, int prec);

unsigned char chBuff[8]={0x44,0x67,0x44,0x0,0x89,0x65,0x40,0x0};
unsigned char chWork[8]={0xc4,0x5f,0x00,0x00,0x00,0x00,0x10,0x00};

void main()
{

 int i;
 double far* d1=(double far*)chBuff;
 double far* d2=(double far*)chWork;

 float_add(d1,  d2,  TRUE, TRUE);
 for(i=0; i<8; i++) printf(" %x,",chBuff[i] );

// getch();
}


////////////////////////////////////////////////////////////
//  if code ==FALSE   subtract else addition
//  if prec == TRUE  double precision    else ordinary precision
//  result
//  TRUE  normal   FALSE  took place overflow
////////////////////////////////////////////////////////////
int float_add(double far *FR1,   double far *FR2,  int codeOper, int prec)
{BYTE far *arr1 =(BYTE far *)FR1;
 BYTE far *a2 =(BYTE far *)FR2;

 BYTE arr2[8];
 int i, k;
 int SIGN_AL1, SIGN_AL2;
 int har1, har2;
 int fReverse, fZero=TRUE;
 signed char work1[15], work2[14], x,y;
 int num;
 int fOverflow =FALSE;

 if(prec) num =7;
 else     num =3;

 for(i=0; i<8; i++)
	arr2[i] =a2[i];

 SIGN_AL1   =arr1[0]&0x80; //keep sign
 if(SIGN_AL1!=0) SIGN_AL1=-1;
 else         SIGN_AL1=1;

 SIGN_AL2   =arr2[0]&0x80; //keep sign
 if(SIGN_AL2!=0) SIGN_AL2=-1;
 else  SIGN_AL2 =1;

 har1 =arr1[0]&0x7F;
 //--har1 -= 0x40;

 har2 =arr2[0]&0x7F;
 //--har2 -= 0x40;

 if(har1<=har2)
		{	Shift_Array( arr1, har2-har1, num);
			har1 =har2;
		}
 else
		{	Shift_Array( arr2, har1-har2, num);
			har2 =har1;
	  }


  if(codeOper ==FALSE) SIGN_AL2 *=-1;   //subtract;


 for( k=0,i=num; i>=1; i--, k+=2)
  {x=arr1[i]&0x0f;
	y=(arr1[i]&0xf0)>>4;
	work1[k]=x; work1[k+1]=y;

	x=arr2[i]&0x0f;
	y=(arr2[i]&0xf0)>>4;
	work2[k]=x; work2[k+1]=y;
  }

	if(SIGN_AL1==-1)
				  for(i=0; i<num*2; i++) work1[i] *= -1;
	if(SIGN_AL2==-1)
				  for(i=0; i<num*2; i++) work2[i] *= -1;

							  //add work arrays
	for(i=0; i<num*2; i++)
				 { work1[i] +=work2[i];
				 }
	 work1[num*2]=0;

			 //calculate and correct rezults
	 for(i=0; i<num*2;i++)               //check for 0
				 if(work1[i]!=0) fZero=FALSE;

	 if(fZero)
		{for(i=0; i<8; i++)arr1[i] =0; return TRUE; }


	 if(SIGN_AL1 == SIGN_AL2)  //correct as addition
		{
			if(SIGN_AL1<0)
					for(i=0; i<2*num; i++) work1[i] *=-1;  //positiv

			 for(i=0; i<2*num; i++)
				 {if(work1[i]>=16)
					 {work1[i]-=16;
					  work1[i+1]+=1;
					 }
				  }
		 }
			 else               //correct as SUBTRACTion
			 { fReverse =FALSE;
				for(i=2*num-1; i>=0; i--)
				 {if(work1[i]<0){fReverse =TRUE; break;}
				  if(work1[i]>0){ break;}
				 }
				if(fReverse)
				 for(i=0; i<2*num; i++)
					work1[i] *=(-1);

				 for(i=0; i<2*num; i++)
				  if(work1[i]<0)
					{work1[i]+=16;
					 work1[i+1]-=1;
					}

				if(fReverse) SIGN_AL1=-1;
				else         SIGN_AL1=1;
			 }

	  //create result
	  if(work1[2*num]>0)      //necessary right shift
	  { for(i=0; i<2*num; i++) work1[i] =work1[i+1];
		 if(har1<0x7F) har1++;
		 else
			 fOverflow =TRUE;
	  }

	  for( k=0,i=num; i>=1; i--, k+=2)
	  {
		arr1[i] =(work1[k+1]<<4)+work1[k];
	  }
	 arr1[0]=har1;
	 if(SIGN_AL1 < 0)
		arr1[0] |=0x80;

  if(fOverflow)
		return FALSE;

  return TRUE;
}

void Shift_Array( BYTE far *work, int delta, int num)
{ BYTE x,y;
	int k, i;
		 for(i=0; i<delta; i++)
			{for(k=num; k>1; k--)
			 {x=(work[k]&0xf0)>>4;
			  y=work[k-1]&0x0f;
			  work[k] =(y<<4)+x;
			 }
			  x=(work[1]&0xf0)>>4;
			  work[1] =x;
			}
		}




