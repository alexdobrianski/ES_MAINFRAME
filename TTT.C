#include <stdio.h>
#include <stdlib.h>
#include <mem.h>

#define D_ADD          1
#define D_SUBTRACT     2
#define D_COMPARE      3
#define D_ZAP          4

#define TRUE           1
#define FALSE          0
int DecimalAdd(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2, int Operation );
int DecimalMultiply(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2 );
char GET_BYTE(unsigned long Addr);
void PUT_BYTE(unsigned long Addr, char ch);




unsigned char chBuff[12]={0x0,0x0,0x09,0x98,0x28,0x9d,0x98,0x78,0x9c,0,0, 0};
unsigned char chWork[12];
int PSW_CC=0;

void main()
{

 int i;

 for(i=0; i<12; i++){chWork[i]=chBuff[i];}
 DecimalAdd(0,5,6,2,D_ADD);
 printf("ADD  ");
 for(i=0; i<12; i++) printf(" %x",chWork[i] );
 printf("PSW_CC=%d  \n", PSW_CC);

 for(i=0; i<12; i++){chWork[i]=chBuff[i];}
 DecimalAdd(0,5,6,2,D_SUBTRACT);
 printf("SUBTRACT  ");
 for(i=0; i<12; i++) printf(" %x,",chWork[i] );
 printf("PSW_CC=%d  \n", PSW_CC);

 for(i=0; i<12; i++){chWork[i]=chBuff[i];}
 DecimalAdd(0,5,6,2,D_COMPARE);
 printf("COMPARE  ");
 for(i=0; i<12; i++) printf(" %x,",chWork[i] );
 printf("PSW_CC=%d  \n", PSW_CC);

 for(i=0; i<12; i++){chWork[i]=chBuff[i];}
 DecimalAdd(0,5,6,2,D_ZAP);
 printf("ZAP  ");
 for(i=0; i<12; i++) printf(" %x,",chWork[i] );
 printf("PSW_CC=%d  \n", PSW_CC);

 for(i=0; i<12; i++){chWork[i]=chBuff[i];}
 DecimalMultiply(0,5,6,2);
 printf("MULTIPLY ");
 for(i=0; i<12; i++) printf(" %x,",chWork[i] );
 printf("PSW_CC=%d  \n", PSW_CC);


 getch();
}

int DecimalDivide(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2 )
{int  SIGN_AL1=1, SIGN_AL2=1;
 signed char  work1[32], work2[32];
 int  i,k, nz1, nz2, nRem;
 int  num1, num2;
 char byte, tens, last1, last2;
 signed char remainder[32], divider[32], differ[32], result[32], multi[32];
 int  rrr, rem, div;


	 last1 =GET_BYTE(ADRESS1+L1) & 0x0f;
	 last2 =GET_BYTE(ADRESS2+L2) & 0x0f;

	 //--check data format
	num1=2*L1+1;   //numbers of bytes in work[]
	num2=2*L2+1;
	if(num1<num2) return(-1);  //!!!! illegal data

	if(L2>8) return(-1);                //length of operand should be less then 8

	 if(last1!=0x0c && last1!=0x0d && last1 !=0x0f) return(-1);  //illegal data
	 if(last2!=0x0c && last2!=0x0d && last2 !=0x0f) return(-1);  //illegal data
	 //----check operand's sign
				if   (last1==0x0d)
						SIGN_AL1=-1;
				else
						SIGN_AL1=1;
				if   (last2==0x0d)
						 SIGN_AL2=-1;
				else
						 SIGN_AL2=1;


	 //copy operands to work arrays
			  work1[0]=(GET_BYTE(ADRESS1+L1)>>4)&0xf;
			  for(k=1,i=L1-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS1+i);
				  work1[k++]  =byte&0xf;
				  work1[k++]  =(byte>>4)&0xf;
				}

			  work2[0]=(GET_BYTE(ADRESS2+L2)>>4)&0xf;
			  for(k=1,i=L2-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS2+i);
				  work2[k++]  =byte&0xf;
				  work2[k++]  =(byte>>4)&0xf;
				}

			  //check length of first operand (it should be enough for result)
			  for(i=num1-1,nz1=0; i>=0; i--)
				 if(work1[i]==0) nz1++;
				 else  break;

			  for(i=num2-1,nz2=0; i>=0; i--)
				 if(work2[i]==0) nz2++;
				 else  break;

			  num1 -=nz1; num2 -=nz2;  //don't forgot recalculate num1, num2

				//reverse for work2 !!!!
				for(i=0; i<num2; i++)
					  divider[num2-1-i] =work2[i];

				for(i=0; i<num1; i++)
					  remainder[num1-1-i] =work1[i];

					nRem=num2;
				if(num1>num2 && CmpD(remainder,divider,num2)<0)
				  nRem++;

			  memset(result,0,32);
			  nRes=0;

			  while(TRUE)
			  {
				  //find necessary length of remainder for operation
				 if(nRem<num2 || (nRem==num2 && CmpD(remainder,divider,num2)<0)) break;
				 if(num2>1)
				  div =divider[0]*10+divider[1];
				 else
				  div=divider[0];
				 if(nRem==num2)
					rem=remainder[0];
				 else
					rem=remainder[0]*10 +remainder[1];

				 rrr=rem/div;  //approximately necessary digit for result


			  }

			  memset(buff, 0, 512);    //work array for multiply
			  for(i=0; i<num2-nz2; i++)
			  for(k=0; k<num1-nz1; k++)
			  {byte =work1[k]*work2[i];
				if(byte>=10)
				{tens=byte/10;
				 byte -=tens*10;
				 buff[33*i+k+1] +=tens;
				}
				buff[33*i+k] +=byte;
				if(buff[33*i+k]>=10)
				 {tens =buff[33*i+k]/10;
				  buff[33*i+k] -=tens*10;
				  buff[33*i+k+1] +=tens;
				 }
			  }
			  //count result
			  memset(work1, 0, 32);

			  for(k=0; k<num1-nz1+num2-nz2; k++)
			  {for(i=0; i<num2-nz2; i++)
				{
				 work1[k] +=buff[32*i+k];
				}
				if(work1[k]>=10)
				 {tens=work1[k]/10;
				  work1[k+1]+=tens;
				  work1[k] -=tens*10;
				  if(work1[k+1]>=10 )
				  {tens=work1[k+1]/10;
					work1[k+2]+=tens;
					work1[k+1] -=tens*10;
				  }
				 }
			  }

			SIGN_AL1 *=SIGN_AL2;
					//Write results to 360

		  byte=(work1[0]&0x0f)<<4;
		  if(SIGN_AL1==1) byte|=0xc;
		  else            byte|=0xd;
			PUT_BYTE(ADRESS1+L1,byte);
		  for(k=1,i=L1-1; i>=0; i--, k+=2)
			 {
			  byte=((work1[k+1]&0x0f)<<4)| (work1[k]&0x0f);
			  PUT_BYTE(ADRESS1+i,byte);

			 }

 return(0);

}

int CmpD(signed char Src, signed char Dest, int num)
{
 int i;
 for(i=0; i<num; i++)
	{ if(Src[i]>Dest[i]) return(1);
	  if(Src[i]<Dest[i]) return(-1);
	}
  return 0;
}


int DecimalMultiply(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2 )
{int  SIGN_AL1=1, SIGN_AL2=1;
 signed char  work1[32], work2[32];
 int  i,k, nz1, nz2;
 int  num1, num2;
 char byte, tens, last1, last2;
 signed char buff[512];     //32*16


	 last1 =GET_BYTE(ADRESS1+L1) & 0x0f;
	 last2 =GET_BYTE(ADRESS2+L2) & 0x0f;

	 //--check data format
	 if(L2>8) return(-1);                //length of operand should be less then 8
	 if(last1!=0x0c && last1!=0x0d && last1 !=0x0f) return(-1);  //illegal data
	 if(last2!=0x0c && last2!=0x0d && last2 !=0x0f) return(-1);  //illegal data
	 //----check operand's sign
				if   (last1==0x0d)
						SIGN_AL1=-1;
				else
						SIGN_AL1=1;
				if   (last2==0x0d)
						 SIGN_AL2=-1;
				else
						 SIGN_AL2=1;


	 //copy operands to work arrays
			  work1[0]=(GET_BYTE(ADRESS1+L1)>>4)&0xf;
			  for(k=1,i=L1-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS1+i);
				  work1[k++]  =byte&0xf;
				  work1[k++]  =(byte>>4)&0xf;
				}

			  work2[0]=(GET_BYTE(ADRESS2+L2)>>4)&0xf;
			  for(k=1,i=L2-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS2+i);
				  work2[k++]  =byte&0xf;
				  work2[k++]  =(byte>>4)&0xf;
				}
				num1=2*L1+1;   //numbers of bytes in work[]
				num2=2*L2+1;

			  //check length of first operand (it should be enough for result)
			  for(i=num1-1,nz1=0; i>=0; i--)
				 if(work1[i]==0) nz1++;
				 else  break;

			  for(i=num2-1,nz2=0; i>=0; i--)
				 if(work2[i]==0) nz2++;
				 else  break;

			  if(nz1<num2-nz2) return(-1);  //!!!! not enough space for operation

			  memset(buff, 0, 512);    //work array for multiply
			  for(i=0; i<num2-nz2; i++)
			  for(k=0; k<num1-nz1; k++)
			  {byte =work1[k]*work2[i];
				if(byte>=10)
				{tens=byte/10;
				 byte -=tens*10;
				 buff[33*i+k+1] +=tens;
				}
				buff[33*i+k] +=byte;
				if(buff[33*i+k]>=10)
				 {tens =buff[33*i+k]/10;
				  buff[33*i+k] -=tens*10;
				  buff[33*i+k+1] +=tens;
				 }
			  }
			  //count result
			  memset(work1, 0, 32);

			  for(k=0; k<num1-nz1+num2-nz2; k++)
			  {for(i=0; i<num2-nz2; i++)
				{
				 work1[k] +=buff[32*i+k];
				}
				if(work1[k]>=10)
				 {tens=work1[k]/10;
				  work1[k+1]+=tens;
				  work1[k] -=tens*10;
				  if(work1[k+1]>=10 )
				  {tens=work1[k+1]/10;
					work1[k+2]+=tens;
					work1[k+1] -=tens*10;
				  }
				 }
			  }

			SIGN_AL1 *=SIGN_AL2;
					//Write results to 360

		  byte=(work1[0]&0x0f)<<4;
		  if(SIGN_AL1==1) byte|=0xc;
		  else            byte|=0xd;
			PUT_BYTE(ADRESS1+L1,byte);
		  for(k=1,i=L1-1; i>=0; i--, k+=2)
			 {
			  byte=((work1[k+1]&0x0f)<<4)| (work1[k]&0x0f);
			  PUT_BYTE(ADRESS1+i,byte);

			 }

 return(0);

}


int DecimalAdd(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2, int Operation )
{int  SIGN_AL1=1, SIGN_AL2=1;
 signed char  work1[32], work2[32];
 int  i,k;
 int  num1, num2, number;
 char byte, last1, last2;
 int fReverse, fZero=TRUE;

	 last1 =GET_BYTE(ADRESS1+L1) & 0x0f;
	 last2 =GET_BYTE(ADRESS2+L2) & 0x0f;

	 //--check data format
	 if(last1!=0x0c && last1!=0x0d && last1 !=0x0f) return(-1);  //illagal data
	 if(last2!=0x0c && last2!=0x0d && last2 !=0x0f) return(-1);  //illagal data
	 //----check operand's sign
				if   (last1==0x0d)
						SIGN_AL1=-1;
				else
						SIGN_AL1=1;
				if   (last2==0x0d)
						 SIGN_AL2=-1;
				else
						 SIGN_AL2=1;

		 memset(work1, 0, 32);

		 if(Operation==D_SUBTRACT || Operation==D_COMPARE)
					  SIGN_AL2*=-1;
	 //copy operands to work arrays
		 if(Operation==D_ZAP)
			 {SIGN_AL1=1;
			 }
			else
			 {
			  work1[0]=(GET_BYTE(ADRESS1+L1)>>4)&0xf;
			  for(k=1,i=L1-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS1+i);
				  work1[k++]  =byte&0xf;
				  work1[k++]  =(byte>>4)&0xf;
				}
			 }
			  work2[0]=(GET_BYTE(ADRESS2+L2)>>4)&0xf;
			  for(k=1,i=L2-1; i>=0; i--)
				{ byte=GET_BYTE(ADRESS2+i);
				  work2[k++]  =byte&0xf;
				  work2[k++]  =(byte>>4)&0xf;
				}
				num1=2*L1+1;   //numbers of bytes in work[]
				num2=2*L2+1;
				if(SIGN_AL1==-1)
				  for(i=0; i<num1; i++) work1[i] *= -1;
				if(SIGN_AL2==-1)
				  for(i=0; i<num2; i++) work2[i] *= -1;

							  //add work arrays
			  for(i=0; i<num2; i++)
				 { work1[i] +=work2[i];
				 }

			 //calculate and correct rezults
			 number=max(num1,num2);
			 for(i=0; i<number;i++)               //check for 0
				 if(work1[i]!=0) fZero=FALSE;

			 if(SIGN_AL1 == SIGN_AL2)  //correct as addition
			 {
				if(SIGN_AL1<0)
				  for(i=0; i<number; i++) work1[i] *=-1;  //positiv
				for(i=0; i<number; i++)
				 {if(work1[i]>=10)
					 {work1[i]-=10;
					  work1[i+1]+=1;
					  if(i+1==number) number++;
					 }
				  }
			 }
			 else               //correct as SUBTRACTion
			 { fReverse =FALSE;
				for(i=number-1; i>=0; i--)
				 {if(work1[i]<0){fReverse =TRUE; break;}
				  if(work1[i]>0){ break;}
				 }
				if(fReverse)
				 for(i=0; i<number; i++)
					work1[i] *=(-1);

				 for(i=0; i<number; i++)
				  if(work1[i]<0)
					{work1[i]+=10;
					 work1[i+1]-=1;
					}

				if(fReverse) SIGN_AL1=-1;
				else         SIGN_AL1=1;
			 }

		//make PSW_SS    check overflow !!!
		if(Operation !=D_COMPARE && number>num1) PSW_CC=3;  //overflow
		else
		 {if(fZero) {PSW_CC=0; SIGN_AL1=1;}
		  else{ if( SIGN_AL1>0) PSW_CC=2;
				  else            PSW_CC=1;
				}
		 }

		//Write results to 360
		if(Operation !=D_COMPARE)
		{ byte=(work1[0]&0x0f)<<4;
		  if(SIGN_AL1==1) byte|=0xc;
		  else            byte|=0xd;
			PUT_BYTE(ADRESS1+L1,byte);
		  for(k=1,i=L1-1; i>=0; i--, k+=2)
			 {
			  byte=((work1[k+1]&0x0f)<<4)| (work1[k]&0x0f);
			  PUT_BYTE(ADRESS1+i,byte);

			 }
		}
		return(0);
}

char GET_BYTE(unsigned long Addr)
{
 return(chWork[(int)Addr]);
}

void PUT_BYTE(unsigned long Addr, char ch)
{
 chWork[(int)Addr]=ch;
}