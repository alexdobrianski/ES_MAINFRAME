	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DRVSASHA.C"
	?debug	C E9E50E21230A44525653415348412E43
	?debug	C E97972501F0A44525653415348412E48
	?debug	C E94019CA1819433A5C424F524C414E44435C494E434C5544455C44+
	?debug	C 4F532E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 444546532E48
_TEXT	segment byte public use16 'CODE'
_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_DATA	segment word public use16 'DATA'
PI	label	word
	db	132
	db	75
_DATA	ends
_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void mediacheck(void)
   ;	
	assume	cs:_TEXT
_mediacheck	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;			{rh1_t far *rh1;
   ;			 rh1=(rh1_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;			 rh1->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	leave	
	ret	
_mediacheck	endp
   ;	
   ;	void getbpb(void)
   ;	
	assume	cs:_TEXT
_getbpb	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;			{rh2_t far *rh2;
   ;			 rh2=(rh2_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;			 rh2->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	leave	
	ret	
_getbpb	endp
   ;	
   ;	void ioctlinput(void)
   ;	
	assume	cs:_TEXT
_ioctlinput	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;			{rh3_t far *rh3;
   ;			 rh3=(rh3_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;			 rh3->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	leave	
	ret	
_ioctlinput	endp
   ;	
   ;	void input(void)
   ;	
	assume	cs:_TEXT
_input	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	
   ;			{rh4_t far *rh4;
   ;			 int i,op;
   ;	     unsigned long ptBuffer;
   ;	     unsigned char *ptchBuffer;
   ;			 rh4=(rh4_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;	     op=rh4->buf[0];
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+14]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	mov	dx,ax
   ;	
   ;	     if (op ==3)
   ;	
	cmp	dx,3
	jne	short @4@170
   ;	
   ;	       {
   ;			    for(i=0;i<rh4->count;i++)
   ;	
	xor	di,di
	jmp	short @4@142
@4@86:
   ;	
   ;	           Buffer[i] =rh4->buf[i];
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+14]
	add	bx,di
	mov	al,byte ptr es:[bx]
	mov	byte ptr DGROUP:Buffer[di],al
	inc	di
@4@142:
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx+18],di
	ja	short @4@86
@4@170:
   ;	
   ;	       }
   ;	     if (op ==4)
   ;	
	cmp	dx,4
	jne	short @4@310
   ;	
   ;	       {
   ;	        for(i=0;i<rh4->count;i++)
   ;	
	xor	di,di
	jmp	short @4@282
@4@226:
   ;	
   ;	           rh4->buf[i] =Buffer[i];
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+14]
	add	bx,di
	mov	al,byte ptr DGROUP:Buffer[di]
	mov	byte ptr es:[bx],al
	inc	di
@4@282:
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx+18],di
	ja	short @4@226
@4@310:
   ;	
   ;	       }
   ;	
   ;	//      if (op ==5)
   ;	//       {
   ;	//        rh4->buf[0]= 7;
   ;	//       }
   ;	
   ;	//		 int i,j;
   ;	//     int addr,size;
   ;	//		 rh4=(rh4_t far*)rhptr;
   ;	//     addr = *(int *)(&rh4->buf[1]);
   ;	//     size = *(int *)(&rh4->buf[3]);
   ;	//       if (rh4->buf[0] ==1)
   ;	//         {
   ;	//          for(i=0,j=addr;i<rh4->count && i<size && j<MAX_BUFFER_SIZE;i++,j++)
   ;	//            Buffer[j] =rh4->buf[i];
   ;	//         }
   ;	//       else if (rh4->buf[0] ==2)
   ;	//         {
   ;	//          for(i=0,j=addr;i<rh4->count && i<size && j<MAX_BUFFER_SIZE;i++,j++)
   ;	//            rh4->buf[i] =Buffer[j];
   ;	//         }
   ;	//       else
   ;	//       if (rh4->buf[0] ==3)
   ;	//         {
   ;	//          for(i=0;i<rh4->count; i++)
   ;	//            Buffer[i] =rh4->buf[i];
   ;	//         }
   ;	//       else
   ;	//       if (rh4->buf[0] ==4)
   ;	//         {
   ;	//          for(i=0;i<rh4->count; i++)
   ;	//             rh4->buf[i]=Buffer[i];
   ;	//         }
   ;	//       else if (rh4->buf[0] ==5)
   ;	//         {
   ;	//          *((unsigned long*)&rh4->buf[0]) =(unsigned long)((char huge*)Buffer);
   ;	//			   }
   ;			 rh4->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	pop	di
	pop	si
	leave	
	ret	
_input	endp
_TEXT	ends
_BSS	segment word public use16 'BSS'
	db	4 dup (?)
_BSS	ends
_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void ndinput(void)
   ;	
	assume	cs:_TEXT
_ndinput	proc	near
   ;	
   ;			{
   ;			static rh5_t far *rh5;
   ;			rh5=(rh5_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr DGROUP:b@w+0,eax
   ;	
   ;			rh5->rh.Status = DONE;
   ;	
	les	bx,dword ptr DGROUP:b@w+0
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	ret	
_ndinput	endp
   ;	
   ;	void inputstatus(void)
   ;	
	assume	cs:_TEXT
_inputstatus	proc	near
   ;	
   ;			{
   ;			rhptr->Status = DONE;
   ;	
	les	bx,dword ptr DGROUP:_rhptr
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	ret	
_inputstatus	endp
   ;	
   ;	void inputflush(void)
   ;	
	assume	cs:_TEXT
_inputflush	proc	near
   ;	
   ;			{
   ;			rhptr->Status = DONE;
   ;	
	les	bx,dword ptr DGROUP:_rhptr
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	ret	
_inputflush	endp
   ;	
   ;	void output(void)
   ;	
	assume	cs:_TEXT
_output	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;			{rh8_t far *rh8;
   ;			 rh8=(rh8_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;			 rh8->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	leave	
	ret	
_output	endp
   ;	
   ;	void outputverify(void)
   ;	
	assume	cs:_TEXT
_outputverify	proc	near
   ;	
   ;			{
   ;	
   ;			output();
   ;	
	call	near ptr _output
   ;	
   ;			}
   ;	
	ret	
_outputverify	endp
   ;	
   ;	void outputstatus(void)
   ;	
	assume	cs:_TEXT
_outputstatus	proc	near
   ;	
   ;			{
   ;			rhptr->Status = DONE;
   ;	
	les	bx,dword ptr DGROUP:_rhptr
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	ret	
_outputstatus	endp
   ;	
   ;	void outputflush(void)
   ;	
	assume	cs:_TEXT
_outputflush	proc	near
   ;	
   ;			{
   ;			rhptr->Status = DONE;
   ;	
	les	bx,dword ptr DGROUP:_rhptr
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	ret	
_outputflush	endp
   ;	
   ;	void ioctloutput(void)
   ;	
	assume	cs:_TEXT
_ioctloutput	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;			{rh12_t far *rh12;
   ;			 rh12=(rh12_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;			 rh12->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	leave	
	ret	
_ioctloutput	endp
   ;	
   ;	void deviceopen(void)
   ;	
	assume	cs:_TEXT
_deviceopen	proc	near
   ;	
   ;			{
   ;			 rhptr->Status = DONE;
   ;	
	les	bx,dword ptr DGROUP:_rhptr
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	ret	
_deviceopen	endp
   ;	
   ;	void deviceclose(void)
   ;	
	assume	cs:_TEXT
_deviceclose	proc	near
   ;	
   ;			{
   ;			 rhptr->Status = DONE;
   ;	
	les	bx,dword ptr DGROUP:_rhptr
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	ret	
_deviceclose	endp
   ;	
   ;	void removeable(void)
   ;	
	assume	cs:_TEXT
_removeable	proc	near
   ;	
   ;			{
   ;			rhptr->Status = DONE;
   ;	
	les	bx,dword ptr DGROUP:_rhptr
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	ret	
_removeable	endp
   ;	
   ;	void outputbusy(void)
   ;	
	assume	cs:_TEXT
_outputbusy	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;			{
   ;			rh16_t far *rh16;
   ;			rh16=(rh16_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;			rh16->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	leave	
	ret	
_outputbusy	endp
   ;	
   ;	void badcommand(void)
   ;	
	assume	cs:_TEXT
_badcommand	proc	near
   ;	
   ;			{
   ;			rhptr->Status = DONE | ERROR | UNKNOWN;
   ;	
	les	bx,dword ptr DGROUP:_rhptr
	mov	word ptr es:[bx+3],000008103h
   ;	
   ;			}
   ;	
	ret	
_badcommand	endp
   ;	
   ;	void genericioctl(void)
   ;	
	assume	cs:_TEXT
_genericioctl	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;			{
   ;			rh19_t far *rh19;
   ;			rh19=(rh19_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;			rh19->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	leave	
	ret	
_genericioctl	endp
   ;	
   ;	void getdevice(void)
   ;	
	assume	cs:_TEXT
_getdevice	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;			{
   ;			rh23_t far *rh23;
   ;			rh23=(rh23_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;			rh23->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	leave	
	ret	
_getdevice	endp
   ;	
   ;	void setdevice(void)
   ;	
	assume	cs:_TEXT
_setdevice	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;			{
   ;			rh24_t far *rh24;
   ;			rh24=(rh24_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;			rh24->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	leave	
	ret	
_setdevice	endp
   ;	
   ;	void ioctlquery(void)
   ;	
	assume	cs:_TEXT
_ioctlquery	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;			{
   ;			rh25_t far *rh25;
   ;			rh25=(rh25_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr [bp-4],eax
   ;	
   ;			rh25->rh.Status = DONE;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	leave	
	ret	
_ioctlquery	endp
_TEXT	ends
_BSS	segment word public use16 'BSS'
	db	4 dup (?)
_BSS	ends
_DATA	segment word public use16 'DATA'
	db	10
	db	73
	db	66
	db	77
	db	32
	db	51
	db	54
	db	48
	db	32
	db	100
	db	105
	db	115
	db	112
	db	108
	db	97
	db	121
	db	32
	db	100
	db	114
	db	105
	db	118
	db	101
	db	114
	db	32
	db	49
	db	46
	db	48
	db	10
	db	36
	db	51 dup (0)
_DATA	ends
_BSS	segment word public use16 'BSS'
	db	2 dup (?)
	db	2 dup (?)
_BSS	ends
_DATA	segment word public use16 'DATA'
	db	0
	db	76
_DATA	ends
_BSS	segment word public use16 'BSS'
	db	2 dup (?)
	db	2 dup (?)
	db	4 dup (?)
_BSS	ends
_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void init(void)
   ;	
	assume	cs:_TEXT
_init	proc	near
   ;	
   ;			{
   ;			static rh0_t far *rh0;
   ;			static char MY[80]={"\nIBM 360 display driver 1.0\n$"};
   ;			static unsigned int MY_OFF,MY_SEG;
   ;			static int MYMY={0x4c00};
   ;			static unsigned int I1,I2;
   ;			static char huge *mymy;
   ;	
   ;			rh0=(rh0_t far*)rhptr;
   ;	
	mov	eax,dword ptr DGROUP:_rhptr
	mov	dword ptr DGROUP:b@w+4,eax
   ;	
   ;			asm push ds;
   ;	
 	push	 ds
   ;	
   ;			asm pop ax;
   ;	
 	pop	 ax
   ;	
   ;			asm push ds;
   ;	
 	push	 ds
   ;	
   ;			asm push bp;
   ;	
 	push	 bp
   ;	
   ;			MY_OFF = FP_OFF(MY);
   ;	
	mov	word ptr DGROUP:b@w+8,offset DGROUP:d@w+2
   ;	
   ;			MY_SEG = FP_SEG(MY);
   ;	
	mov	word ptr DGROUP:b@w+10,ds
   ;	
   ;			_DX=MY_OFF;_AX=0x0900;_DS=MY_SEG;
   ;	
	mov	dx,offset DGROUP:d@w+2
	mov	ax,2304
   ;	
   ;			__int__(0x21);
   ;	
	mov	ds,word ptr DGROUP:b@w+10
	int	33
   ;	
   ;			asm pop bp;
   ;	
 	pop	 bp
   ;	
   ;			asm pop ds;
   ;	
 	pop	 ds
   ;	
   ;			asm push ds;
   ;	
 	push	 ds
   ;	
   ;			asm pop ds;
   ;	
 	pop	 ds
   ;	
   ;			rh0->EndAddress = ((char far*)endend)+PI;
   ;	
	mov	ax,word ptr DGROUP:PI
	add	ax,offset _endend
	les	bx,dword ptr DGROUP:b@w+4
	mov	word ptr es:[bx+16],cs
	mov	word ptr es:[bx+14],ax
   ;	
   ;	
   ;			rh0->rh.Status = DONE;
   ;	
	mov	word ptr es:[bx+3],256
   ;	
   ;			}
   ;	
	ret	
_init	endp
   ;	
   ;	void endend(void)
   ;	
	assume	cs:_TEXT
_endend	proc	near
   ;	
   ;	{int i;
   ;	i=0;
   ;	
   ;	
   ;	
   ;	}
   ;	
	ret	
_endend	endp
_TEXT	ends
_BSS	segment word public use16 'BSS'
Buffer	label	byte
	db	3000 dup (?)
	?debug	C E9
	?debug	C FA10030000
_BSS	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public use16 'CODE'
_TEXT	ends
_Buffer	equ	Buffer
_PI	equ	PI
	extrn	_rhptr:dword
	public	_endend
	public	_init
	public	_ioctlquery
	public	_setdevice
	public	_getdevice
	public	_genericioctl
	public	_badcommand
	public	_outputbusy
	public	_removeable
	public	_deviceclose
	public	_deviceopen
	public	_ioctloutput
	public	_outputflush
	public	_outputstatus
	public	_outputverify
	public	_output
	public	_inputflush
	public	_inputstatus
	public	_ndinput
	public	_input
	public	_ioctlinput
	public	_getbpb
	public	_mediacheck
_s@	equ	s@
	end
