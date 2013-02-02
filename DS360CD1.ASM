	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DS360CD1.C"
	?debug	C E9770570230A44533336304344312E43
	?debug	C E92A0426230A44533336304F50542E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C53+
	?debug	C 5444494F2E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 444546532E48
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 4E46494C452E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 4E554C4C2E48
	?debug	C E94019CA1819433A5C424F524C414E44435C494E434C5544455C44+
	?debug	C 4F532E48
	?debug	C E94019CA1818433A5C424F524C414E44435C494E434C5544455C49+
	?debug	C 4F2E48
	?debug	C E94019CA181F433A5C424F524C414E44435C494E434C5544455C5C+
	?debug	C 5359535C535441542E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C46+
	?debug	C 434E544C2E48
	?debug	C E94019CA181A433A5C424F524C414E44435C494E434C5544455C4D+
	?debug	C 4154482E48
	?debug	C E9F8803A1E0A44533336305053572E48
	?debug	C E952BB30230A445333363044464E2E48
DS360CD1_TEXT	segment byte public use16 'CODE'
DS360CD1_TEXT	ends
	assume	cs:DS360CD1_TEXT,ds:DS360CD1_DATA
DS360CD1_DATA	segment word public use16 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
	db	2 dup (?)
DS360CD1_DATA	ends
DS360CD1_TEXT	segment byte public use16 'CODE'
	?debug	C E8010A44533336304344312E4377057023
   ;	
   ;	 SR(unsigned long *RR1,unsigned long *RR1_PLUS_1,
   ;	
	?debug	L 21
	assume	cs:DS360CD1_TEXT
_SR	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360CD1_DATA
	mov	ds,ax
	?debug	C E318000400160C00
	?debug	C E60A5252325F504C55535F31180A120000035252+
	?debug	C 32180A0E00000A5252315F504C55535F31180A0A+
	?debug	C 000003525231180A060000
	?debug	B
   ;	
   ;					unsigned long *RR2,unsigned long *RR2_PLUS_1)
   ;	 {
   ;	
   ;		static int FLA;
   ;		(*RR1_PLUS_1)-=(*RR2_PLUS_1);
   ;	
	?debug	L 26
	les	bx,dword ptr [bp+18]
	mov	eax,dword ptr es:[bx]
	les	bx,dword ptr [bp+10]
	sub	dword ptr es:[bx],eax
   ;	
   ;		FLA=_FLAGS;
   ;	
	?debug	L 27
	pushf	
	pop	ax
	mov	word ptr d@w+0,ax
   ;	
   ;		(*RR1)-=(*RR2);
   ;	
	?debug	L 28
	les	bx,dword ptr [bp+14]
	mov	eax,dword ptr es:[bx]
	les	bx,dword ptr [bp+6]
	sub	dword ptr es:[bx],eax
   ;	
   ;		if (FLA&0x0001) (*RR1)-=1;
   ;	
	?debug	L 29
	test	word ptr d@w+0,1
	je	short @1@86
	dec	dword ptr es:[bx]
@1@86:
   ;	
   ;	
   ;	
   ;	 }
   ;	
	?debug	L 32
	pop	ds
	pop	bp
	ret	
	?debug	C E603464C4104000002000001190003525231180A+
	?debug	C 0600000A5252315F504C55535F31180A0A000003+
	?debug	C 525232180A0E00000A5252325F504C55535F3118+
	?debug	C 0A120000
	?debug	E
	?debug	E
_SR	endp
DS360CD1_TEXT	ends
DS360CD1_DATA	segment word public use16 'FAR_DATA'
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	2 dup (?)
	db	2 dup (?)
DS360CD1_DATA	ends
DS360CD1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void MR(unsigned long *RR1,unsigned long *RR1_PLUS_1,unsigned long *MN_MN)
   ;	
	?debug	L 33
	assume	cs:DS360CD1_TEXT
_MR	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	ds
	mov	ax,DS360CD1_DATA
	mov	ds,ax
	?debug	C E6054D4E5F4D4E180A0E00000A5252315F504C55+
	?debug	C 535F31180A0A000003525231180A060000
	?debug	B
   ;	
   ;	 {
   ;		static unsigned long rr1;
   ;		static unsigned long rr1_plus_1;
   ;		static unsigned long mn_mn;
   ;		static unsigned long URREZ;
   ;		static unsigned long URREZ2;
   ;		static unsigned long URREZ3;
   ;		static unsigned long URREZ4;
   ;		static int SIGN1,SIGN2;
   ;		SIGN1=0;SIGN2=0;
   ;	
	?debug	L 43
	mov	word ptr d@w+30,0
	mov	word ptr d@w+32,0
   ;	
   ;		if (((signed long)*MN_MN)<0)
   ;	
	?debug	L 44
	les	bx,dword ptr [bp+14]
	cmp	dword ptr es:[bx],large 0
	jge	short @2@86
   ;	
   ;			 {SIGN2=1;
   ;	
	?debug	L 45
	mov	word ptr d@w+32,1
   ;	
   ;				mn_mn=-(*MN_MN);
   ;	
	?debug	L 46
	mov	eax,dword ptr es:[bx]
	neg	eax
	mov	dword ptr d@w+10,eax
   ;	
   ;			 }
   ;	
	?debug	L 47
	jmp	short @2@114
@2@86:
   ;	
   ;		else mn_mn=*MN_MN;
   ;	
	?debug	L 48
	les	bx,dword ptr [bp+14]
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+10,eax
@2@114:
   ;	
   ;		if (((signed long)*RR1_PLUS_1)<0)
   ;	
	?debug	L 49
	les	bx,dword ptr [bp+10]
	cmp	dword ptr es:[bx],large 0
	jge	short @2@170
   ;	
   ;			 {SIGN1=1;
   ;	
	?debug	L 50
	mov	word ptr d@w+30,1
   ;	
   ;				rr1_plus_1=-(*RR1_PLUS_1);
   ;	
	?debug	L 51
	mov	eax,dword ptr es:[bx]
	neg	eax
	mov	dword ptr d@w+6,eax
   ;	
   ;			 }
   ;	
	?debug	L 52
	jmp	short @2@198
@2@170:
   ;	
   ;		else
   ;			 {rr1_plus_1=*RR1_PLUS_1;
   ;	
	?debug	L 54
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+6,eax
@2@198:
   ;	
   ;			 }
   ;					URREZ4  = ((rr1_plus_1) >>16)  * (mn_mn>>16);
   ;	
	?debug	L 56
	mov	eax,dword ptr d@w+6
	shr	eax,16
	mov	dword ptr [bp-4],eax
	mov	edx,dword ptr d@w+10
	shr	edx,16
	mov	dword ptr [bp-8],edx
	imul	eax,edx
	mov	dword ptr d@w+26,eax
   ;	
   ;	
   ;					URREZ   = ((rr1_plus_1) >>16)  * (mn_mn&0xffff);
   ;	
	?debug	L 58
	mov	eax,dword ptr [bp-4]
	mov	edx,dword ptr d@w+10
	and	edx,large 00000FFFFh
	imul	eax,edx
	mov	dword ptr d@w+14,eax
   ;	
   ;					URREZ2  = ((rr1_plus_1)&0xffff)* (mn_mn>>16);
   ;	
	?debug	L 59
	mov	eax,dword ptr d@w+6
	and	eax,large 00000FFFFh
	imul	eax,dword ptr [bp-8]
	mov	dword ptr d@w+18,eax
   ;	
   ;					URREZ4 += URREZ >>16;
   ;	
	?debug	L 60
	mov	eax,dword ptr d@w+14
	shr	eax,16
	add	dword ptr d@w+26,eax
   ;	
   ;					URREZ4 += URREZ2>>16;
   ;	
	?debug	L 61
	mov	eax,dword ptr d@w+18
	shr	eax,16
	add	dword ptr d@w+26,eax
   ;	
   ;					URREZ3  = (0xffff&(rr1_plus_1))* (0xffff&(mn_mn));
   ;	
	?debug	L 62
	mov	eax,large 00000FFFFh
	and	eax,dword ptr d@w+6
	mov	edx,large 00000FFFFh
	and	edx,dword ptr d@w+10
	imul	eax,edx
	mov	dword ptr d@w+22,eax
   ;	
   ;					URREZ   = (0xffff&URREZ)+(0xffff&URREZ2)+(URREZ3>>16);
   ;	
	?debug	L 63
	shr	eax,16
	mov	edx,large 00000FFFFh
	and	edx,dword ptr d@w+14
	mov	ebx,large 00000FFFFh
	and	ebx,dword ptr d@w+18
	add	edx,ebx
	add	edx,eax
	mov	dword ptr d@w+14,edx
   ;	
   ;					rr1     = URREZ4+(URREZ>>16);
   ;	
	?debug	L 64
	mov	eax,dword ptr d@w+14
	shr	eax,16
	mov	edx,dword ptr d@w+26
	add	edx,eax
	mov	dword ptr d@w+2,edx
   ;	
   ;					rr1_plus_1=(URREZ<<16)+(URREZ3&0xffff);
   ;	
	?debug	L 65
	mov	eax,dword ptr d@w+14
	shl	eax,16
	mov	edx,dword ptr d@w+22
	and	edx,large 00000FFFFh
	add	eax,edx
	mov	dword ptr d@w+6,eax
   ;	
   ;		if ( ((SIGN1==0) && (SIGN2==1)) ||
   ;	
	?debug	L 66
   ;	
   ;				 ((SIGN1==1) && (SIGN2==0))
   ;			 )
   ;	
	?debug	L 68
	cmp	word ptr d@w+30,0
	jne	short @2@254
	cmp	word ptr d@w+32,1
	je	short @2@310
@2@254:
	cmp	word ptr d@w+30,1
	jne	short @2@338
	cmp	word ptr d@w+32,0
	jne	short @2@338
@2@310:
   ;	
   ;			 {*RR1=0;*RR1_PLUS_1=0;
   ;	
	?debug	L 69
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx],large 0
	les	bx,dword ptr [bp+10]
	mov	dword ptr es:[bx],large 0
   ;	
   ;				SR(RR1,RR1_PLUS_1,&rr1,&rr1_plus_1);
   ;	
	?debug	L 70
	push	ds
	push	offset d@w+6
	push	ds
	push	offset d@w+2
	push	word ptr [bp+12]
	push	bx
	push	dword ptr [bp+6]
	push	cs
	call	near ptr _SR
	add	sp,16
   ;	
   ;			 }
   ;	
	?debug	L 71
	pop	ds
	leave	
	ret	
@2@338:
   ;	
   ;		else
   ;			 {*RR1=rr1;*RR1_PLUS_1=rr1_plus_1;
   ;	
	?debug	L 73
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr d@w+2
	mov	dword ptr es:[bx],eax
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr d@w+6
	mov	dword ptr es:[bx],eax
   ;	
   ;			 }
   ;	 }
   ;	
	?debug	L 75
	pop	ds
	leave	
	ret	
	?debug	C E6055349474E32040000022000012A0005534947+
	?debug	C 4E31040000021E00012A0006555252455A340C00+
	?debug	C 00021A0001290006555252455A330C0000021600+
	?debug	C 01280006555252455A320C000002120001270005+
	?debug	C 555252455A0C0000020E00012600056D6E5F6D6E+
	?debug	C 0C0000020A000125000A7272315F706C75735F31+
	?debug	C 0C0000020600012400037272310C000002020001+
	?debug	C 230003525231180A0600000A5252315F504C5553+
	?debug	C 5F31180A0A0000054D4E5F4D4E180A0E0000
	?debug	E
	?debug	E
_MR	endp
DS360CD1_TEXT	ends
DS360CD1_DATA	segment word public use16 'FAR_DATA'
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	10 dup (?)
	db	10 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
DS360CD1_DATA	ends
DS360CD1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void DR(unsigned long *RR1,unsigned long *RR1_PLUS_1,unsigned long *DEL_DEL)
   ;	
	?debug	L 76
	assume	cs:DS360CD1_TEXT
_DR	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	ds
	mov	ax,DS360CD1_DATA
	mov	ds,ax
	?debug	C E60744454C5F44454C180A0E00000A5252315F50+
	?debug	C 4C55535F31180A0A000003525231180A060000
	?debug	B
   ;	
   ;		{
   ;		 static unsigned long rr1;
   ;		 static unsigned long rr1_plus_1;
   ;		 static unsigned long del_del;
   ;		 static int SIGN1,SIGN2;
   ;		 static long double F_R1_R2;
   ;		 static long double F_DEL_DEL;
   ;		 static unsigned long r0;
   ;		 static unsigned long r0_plus_1;
   ;		 static unsigned long r2;
   ;		 static unsigned long r2_plus_1;
   ;		 static unsigned long r3;
   ;		 static unsigned long r3_plus_1;
   ;		 SIGN1=0;SIGN2=0;
   ;	
	?debug	L 90
	mov	word ptr d@w+46,0
	mov	word ptr d@w+48,0
   ;	
   ;		 if (((signed long)*DEL_DEL)<0)
   ;	
	?debug	L 91
	les	bx,dword ptr [bp+14]
	cmp	dword ptr es:[bx],large 0
	jge	short @3@86
   ;	
   ;			 {SIGN2=1;
   ;	
	?debug	L 92
	mov	word ptr d@w+48,1
   ;	
   ;				del_del=-(*DEL_DEL);
   ;	
	?debug	L 93
	mov	eax,dword ptr es:[bx]
	neg	eax
	mov	dword ptr d@w+42,eax
   ;	
   ;			 }
   ;	
	?debug	L 94
	jmp	short @3@114
@3@86:
   ;	
   ;		 else del_del=*DEL_DEL;
   ;	
	?debug	L 95
	les	bx,dword ptr [bp+14]
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+42,eax
@3@114:
   ;	
   ;		 if (del_del==0l)
   ;	
	?debug	L 96
	cmp	dword ptr d@w+42,large 0
	jne	short @3@170
   ;	
   ;			{RETURN=1;RQ_PRG=0x0009;return;
   ;	
	?debug	L 97
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,9
	pop	ds
	leave	
	ret	
@3@170:
   ;	
   ;			}
   ;		 if ((*RR1)&0x80000000)
   ;	
	?debug	L 99
	les	bx,dword ptr [bp+6]
	test	dword ptr es:[bx],large 080000000h
	je	short @3@226
   ;	
   ;			 {SIGN1=1;
   ;	
	?debug	L 100
	mov	word ptr d@w+46,1
   ;	
   ;				rr1=0;rr1_plus_1=0;
   ;	
	?debug	L 101
	mov	dword ptr d@w+34,large 0
	mov	dword ptr d@w+38,large 0
   ;	
   ;				SR(&rr1,&rr1_plus_1,RR1,RR1_PLUS_1);
   ;	
	?debug	L 102
	push	dword ptr [bp+10]
	push	word ptr [bp+8]
	push	bx
	push	ds
	push	offset d@w+38
	push	ds
	push	offset d@w+34
	push	cs
	call	near ptr _SR
	add	sp,16
   ;	
   ;			 }
   ;	
	?debug	L 103
	jmp	short @3@254
@3@226:
   ;	
   ;		 else
   ;			 {rr1=*RR1;rr1_plus_1=*RR1_PLUS_1;
   ;	
	?debug	L 105
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+34,eax
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+38,eax
@3@254:
   ;	
   ;			 }
   ;		 if (rr1==0)
   ;	
	?debug	L 107
	cmp	dword ptr d@w+34,large 0
	jne	short @3@310
   ;	
   ;			{
   ;			 rr1=rr1_plus_1%del_del;
   ;	
	?debug	L 109
	mov	eax,dword ptr d@w+38
	xor	edx,edx
	div	dword ptr d@w+42
	mov	dword ptr d@w+34,edx
   ;	
   ;			 rr1_plus_1/=del_del;
   ;	
	?debug	L 110
	mov	eax,dword ptr d@w+38
	xor	edx,edx
	div	dword ptr d@w+42
	mov	dword ptr d@w+38,eax
   ;	
   ;			}
   ;	
	?debug	L 111
	jmp	@3@534
@3@310:
   ;	
   ;		 else
   ;	
   ;			{
   ;			 F_R1_R2=((long double)rr1)/(long double)del_del*4096.0*4096.0*256.0+
   ;	
	?debug	L 115
   ;	
   ;							 ((long double)rr1_plus_1)/(long double)del_del;
   ;	
	?debug	L 116
	mov	eax,dword ptr d@w+34
	mov	dword ptr [bp-8],eax
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	fild	qword ptr [bp-8]
	mov	eax,dword ptr d@w+42
	mov	dword ptr [bp-8],eax
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	fild	qword ptr [bp-8]
	fdiv	
	fmul	dword ptr s@
	fmul	dword ptr s@
	fmul	dword ptr s@+4
	mov	eax,dword ptr d@w+38
	mov	dword ptr [bp-8],eax
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	fild	qword ptr [bp-8]
	mov	eax,dword ptr d@w+42
	mov	dword ptr [bp-8],eax
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	fild	qword ptr [bp-8]
	fdiv	
	fadd	
	fstp	tbyte ptr d@w+50
   ;	
   ;			 if (F_R1_R2>((long double)0x7fffffffl))
   ;	
	?debug	L 117
	fld	tbyte ptr d@w+50
	fld	tbyte ptr s@+8
	fcompp
	fstsw	ax
	sahf	
	jae	short @3@366
   ;	
   ;				 {
   ;					RETURN=1;RQ_PRG=0x0009;return;
   ;	
	?debug	L 119
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,9
	pop	ds
	leave	
	ret	
@3@366:
   ;	
   ;				 }
   ;			 r0_plus_1=F_R1_R2;r0=0;
   ;	
	?debug	L 121
	fld	tbyte ptr d@w+50
	call	far ptr F_FTOL@
	shl	eax,16
	shrd	eax,edx,16
	mov	dword ptr d@w+74,eax
	mov	dword ptr d@w+70,large 0
   ;	
   ;			 if (r0_plus_1>0) r0_plus_1--;
   ;	
	?debug	L 122
	cmp	dword ptr d@w+74,large 0
	jbe	short @3@422
	dec	dword ptr d@w+74
@3@422:
   ;	
   ;			 r2=r0;r2_plus_1=r0_plus_1;
   ;	
	?debug	L 123
	mov	eax,dword ptr d@w+70
	mov	dword ptr d@w+78,eax
	mov	eax,dword ptr d@w+74
	mov	dword ptr d@w+82,eax
   ;	
   ;			 MR(&r2,&r2_plus_1,&del_del);
   ;	
	?debug	L 124
	push	ds
	push	offset d@w+42
	push	ds
	push	offset d@w+82
	push	ds
	push	offset d@w+78
	push	cs
	call	near ptr _MR
	add	sp,12
   ;	
   ;			 SR(&r2,&r2_plus_1,&rr1,&rr1_plus_1);
   ;	
	?debug	L 125
	push	ds
	push	offset d@w+38
	push	ds
	push	offset d@w+34
	push	ds
	push	offset d@w+82
	push	ds
	push	offset d@w+78
	push	cs
	call	near ptr _SR
	add	sp,16
   ;	
   ;			 if (r2&0x80000000)
   ;	
	?debug	L 126
	test	dword ptr d@w+78,large 080000000h
	je	short @3@478
   ;	
   ;				 {
   ;					r3=0;r3_plus_1=0;
   ;	
	?debug	L 128
	mov	dword ptr d@w+86,large 0
	mov	dword ptr d@w+90,large 0
   ;	
   ;					SR(&r3,&r3_plus_1,&r2,&r2_plus_1);
   ;	
	?debug	L 129
	push	ds
	push	offset d@w+82
	push	ds
	push	offset d@w+78
	push	ds
	push	offset d@w+90
	push	ds
	push	offset d@w+86
	push	cs
	call	near ptr _SR
	add	sp,16
   ;	
   ;				 }
   ;	
	?debug	L 130
	jmp	short @3@506
@3@478:
   ;	
   ;			 else
   ;				 {r3=r2;r3_plus_1=r2_plus_1;
   ;	
	?debug	L 132
	mov	eax,dword ptr d@w+78
	mov	dword ptr d@w+86,eax
	mov	eax,dword ptr d@w+82
	mov	dword ptr d@w+90,eax
@3@506:
   ;	
   ;				 }
   ;			 rr1_plus_1=r0_plus_1+r3_plus_1/del_del;
   ;	
	?debug	L 134
	mov	eax,dword ptr d@w+90
	xor	edx,edx
	div	dword ptr d@w+42
	mov	edx,dword ptr d@w+74
	add	edx,eax
	mov	dword ptr d@w+38,edx
   ;	
   ;			 rr1=r3_plus_1%del_del;
   ;	
	?debug	L 135
	mov	eax,dword ptr d@w+90
	xor	edx,edx
	div	dword ptr d@w+42
	mov	dword ptr d@w+34,edx
@3@534:
   ;	
   ;			}
   ;	
   ;		 if ( ((SIGN1==0) && (SIGN2==0)))
   ;	
	?debug	L 138
	cmp	word ptr d@w+46,0
	jne	short @3@618
	cmp	word ptr d@w+48,0
	jne	short @3@618
   ;	
   ;			 {*RR1=rr1;*RR1_PLUS_1=rr1_plus_1;
   ;	
	?debug	L 139
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr d@w+34
	mov	dword ptr es:[bx],eax
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr d@w+38
	mov	dword ptr es:[bx],eax
   ;	
   ;			 }
   ;	
	?debug	L 140
	pop	ds
	leave	
	ret	
@3@618:
   ;	
   ;		 else if ( ((SIGN1==0) && (SIGN2==1)))
   ;	
	?debug	L 141
	cmp	word ptr d@w+46,0
	jne	short @3@702
	cmp	word ptr d@w+48,1
	jne	short @3@702
   ;	
   ;						{*RR1=rr1;*RR1_PLUS_1=-rr1_plus_1;
   ;	
	?debug	L 142
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr d@w+34
	mov	dword ptr es:[bx],eax
	mov	eax,dword ptr d@w+38
	neg	eax
	les	bx,dword ptr [bp+10]
	mov	dword ptr es:[bx],eax
   ;	
   ;						}
   ;	
	?debug	L 143
	pop	ds
	leave	
	ret	
@3@702:
   ;	
   ;					else if ( ((SIGN1==1) && (SIGN2==0)))
   ;	
	?debug	L 144
	cmp	word ptr d@w+46,1
	jne	short @3@786
	cmp	word ptr d@w+48,0
	jne	short @3@786
   ;	
   ;								 {*RR1=-rr1;*RR1_PLUS_1=rr1_plus_1;
   ;	
	?debug	L 145
	mov	eax,dword ptr d@w+34
	neg	eax
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx],eax
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr d@w+38
	mov	dword ptr es:[bx],eax
   ;	
   ;								 }
   ;	
	?debug	L 146
	pop	ds
	leave	
	ret	
@3@786:
   ;	
   ;							 else
   ;								 {*RR1=-rr1;*RR1_PLUS_1=rr1_plus_1;
   ;	
	?debug	L 148
	mov	eax,dword ptr d@w+34
	neg	eax
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx],eax
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr d@w+38
	mov	dword ptr es:[bx],eax
   ;	
   ;								 }
   ;	
   ;		}
   ;	
	?debug	L 151
	pop	ds
	leave	
	ret	
	?debug	C E60972335F706C75735F310C0000025A00015900+
	?debug	C 0272330C00000256000158000972325F706C7573+
	?debug	C 5F310C00000252000157000272320C0000024E00+
	?debug	C 0156000972305F706C75735F310C0000024A0001+
	?debug	C 55000272300C000002460001540009465F44454C+
	?debug	C 5F44454C100000023C0001530007465F52315F52+
	?debug	C 32100000023200015200055349474E3204000002+
	?debug	C 3000015100055349474E31040000022E00015100+
	?debug	C 0764656C5F64656C0C0000022A000150000A7272+
	?debug	C 315F706C75735F310C0000022600014F00037272+
	?debug	C 310C0000022200014E0003525231180A0600000A+
	?debug	C 5252315F504C55535F31180A0A00000744454C5F+
	?debug	C 44454C180A0E0000
	?debug	E
	?debug	E
_DR	endp
   ;	
   ;	void SET_CC_BY_SIGN(long OP)
   ;	
	?debug	L 154
	assume	cs:DS360CD1_TEXT
_SET_CC_BY_SIGN	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360CD1_DATA
	mov	ds,ax
	?debug	C E6024F50060A060000
	?debug	B
   ;	
   ;	{if(OP==0) PSW_CC=0;
   ;	
	?debug	L 155
	cmp	dword ptr [bp+6],large 0
	jne	short @4@86
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	bp
	ret	
@4@86:
   ;	
   ;	 else if (OP<0) PSW_CC=1;
   ;	
	?debug	L 156
	cmp	dword ptr [bp+6],large 0
	jge	short @4@142
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	bp
	ret	
@4@142:
   ;	
   ;	       else PSW_CC=2;
   ;	
	?debug	L 157
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
   ;	
   ;	}
   ;	
	?debug	L 158
	pop	ds
	pop	bp
	ret	
	?debug	C E6024F50060A060000
	?debug	E
	?debug	E
_SET_CC_BY_SIGN	endp
   ;	
   ;	void SET_CC(void)
   ;	
	?debug	L 159
	assume	cs:DS360CD1_TEXT
_SET_CC	proc	far
	?debug	B
	push	ds
	mov	ax,DS360CD1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	{
   ;	
   ;	 asm sahf;
   ;	
	?debug	L 162
 	sahf	
   ;	
   ;	 asm jno NOPR;
   ;	
	?debug	L 163
	jno	short @5@114
   ;	
   ;	 PSW_CC=3;goto EXIT;
   ;	
	?debug	L 164
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,3
	pop	ds
	ret	
@5@114:
   ;	
   ;	NOPR:
   ;	 asm jnz NOZERRO;
   ;	
	?debug	L 166
	jne	short @5@170
   ;	
   ;	 PSW_CC=0;goto EXIT;
   ;	
	?debug	L 167
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	ret	
@5@170:
   ;	
   ;	NOZERRO:
   ;	 asm jl MINUS;
   ;	
	?debug	L 169
	jl	short @5@226
   ;	
   ;	 PSW_CC=2;goto EXIT;
   ;	
	?debug	L 170
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	ret	
@5@226:
   ;	
   ;	MINUS:
   ;	 PSW_CC=1;
   ;	
	?debug	L 172
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
   ;	
   ;	EXIT:;
   ;	
   ;	}
   ;	
	?debug	L 175
	pop	ds
	ret	
	?debug	E
	?debug	E
_SET_CC	endp
DS360CD1_TEXT	ends
DS360CD1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (?)
	db	1 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	1 dup (?)
	db	1 dup (?)
	db	2 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	2 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	10 dup (?)
	db	10 dup (?)
	db	10 dup (?)
	db	10 dup (?)
	db	2 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	2 dup (?)
DS360CD1_DATA	ends
DS360CD1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE10(char far *COM)
   ;	
	?debug	L 176
	assume	cs:DS360CD1_TEXT
_CODE10	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360CD1_DATA
	mov	ds,ax
	?debug	C E319000400160800
	?debug	C E603434F4D190A060000
	?debug	B
   ;	
   ;	{static char RR;
   ;	 static char RX;
   ;	 static int R1,R2,B2,IS;
   ;	
   ;	
   ;	 static char BD;
   ;	 static char DD;
   ;	 static unsigned int DDD;
   ;	
   ;	 static signed long *RR1;
   ;	 static signed long *RR2;
   ;	 static unsigned long *URR1;
   ;	 static unsigned long *URR2;
   ;	 static unsigned int FLA;
   ;	
   ;	 static long *REZ;
   ;	 static long RREZ;
   ;	 static unsigned long URREZ2;
   ;	 static unsigned long URREZ3;
   ;	 static unsigned long URREZ;
   ;	 static unsigned long URREZ_ALR;
   ;	 static unsigned long ADRESS;
   ;	 static long double F_W1;
   ;	 static long double F_W2;
   ;	 static long double F_W3;
   ;	 static long double F_W4;
   ;	 static int psw_cc;
   ;	 static char Op1[4];
   ;	 static char Op2[4];
   ;	 static int k;
   ;	
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 GET_OPERAND_RR;
   ;	
	?debug	L 212
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+94,al
 	ror	 ax,4
	mov	byte ptr d@w+96,al
 	shr	 ax,12
	mov	byte ptr d@w+98,al
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 213
	mov	ax,seg _PSW_ILC
	mov	es,ax
	movsx	eax,word ptr es:_PSW_ILC
	mov	dx,seg _PSW_ADRESS
	mov	es,dx
	add	dword ptr es:_PSW_ADRESS,eax
   ;	
   ;	 switch(COM[0])
   ;	
	?debug	L 214
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	sub	ax,16
	mov	bx,ax
	cmp	bx,15
	jbe short	@@0
	jmp	@6@2466
@@0:
	shl	bx,1
	jmp	word ptr cs:@6@C2786[bx]
@6@254:
   ;	
   ;		 {
   ;			case 0x10:          		     /* LPR */
   ;																				 /* Абсолютное значение второго
   ;																				 операндапомещается по адресу первого
   ;																				 признак результата 0  2  3
   ;																				 0=равно 0 2=больше 0 3=?????
   ;																				 */
   ;					if (R[R2]==0x80000000l)
   ;	
	?debug	L 222
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	cmp	dword ptr es:_R[bx],large 080000000h
	jne	short @6@338
   ;	
   ;						{/*R[R1]=R[R2];*/PSW_CC=3;
   ;	
	?debug	L 223
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,3
   ;	
   ;						 T();
   ;	
	?debug	L 224
	call	far ptr _T
   ;	
   ;						 if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG!!!");}
   ;	
	?debug	L 225
	mov	ax,seg _PSW_PRG_MASK
	mov	es,ax
	test	byte ptr es:_PSW_PRG_MASK,8
	jne short	@@1
	jmp	@6@2466
@@1:
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,8
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	push	ds
	push	offset s@+18
	call	far ptr _printf
	add	sp,4
	pop	ds
	pop	bp
	ret	
@6@338:
   ;	
   ;						}
   ;					else
   ;						{
   ;						 if (R[R2]&0x80000000l) R[R1]=-((signed long)R[R2]);
   ;	
	?debug	L 229
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	test	dword ptr es:_R[bx],large 080000000h
	je	short @6@394
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	neg	eax
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	mov	dword ptr es:_R[bx],eax
	jmp	short @6@422
@6@394:
   ;	
   ;						 else R[R1]=R[R2];
   ;	
	?debug	L 230
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	mov	dword ptr es:_R[bx],eax
@6@422:
   ;	
   ;						 if (R[R1]) PSW_CC=2;
   ;	
	?debug	L 231
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	cmp	dword ptr es:_R[bx],large 0
	je	short @6@478
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	bp
	ret	
@6@478:
   ;	
   ;						 else PSW_CC=0;
   ;	
	?debug	L 232
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	bp
	ret	
@6@506:
   ;	
   ;						}
   ;					//T();
   ;					break;
   ;			case 0x11:                             /* LNR */
   ;																				 /* Дополнение абсолютной величины
   ;																				 второго операнда помещается по адресу
   ;																				 первого операнда
   ;																				 Признае результата устанавливается
   ;																				 равным 0 или 1 в зависимости
   ;																				 от того является ли результат
   ;																				 0 или отрицательным числом
   ;																				 */
   ;	
   ;					if (R[R2]&0x80000000) R[R1]=R[R2];
   ;	
	?debug	L 246
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	test	dword ptr es:_R[bx],large 080000000h
	je	short @6@562
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	mov	dword ptr es:_R[bx],eax
	jmp	short @6@590
@6@562:
   ;	
   ;					else R[R1]=-((signed long)R[R2]);
   ;	
	?debug	L 247
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	neg	eax
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	mov	dword ptr es:_R[bx],eax
@6@590:
   ;	
   ;					if (R[R1]) PSW_CC=1;
   ;	
	?debug	L 248
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	cmp	dword ptr es:_R[bx],large 0
	je	short @6@646
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	bp
	ret	
@6@646:
   ;	
   ;					else PSW_CC=0;
   ;	
	?debug	L 249
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	bp
	ret	
@6@674:
   ;	
   ;					//T();
   ;					break;
   ;			case 0x12:
   ;																				 /* LTR */
   ;																				 /*эта команда подобна команде загрузки
   ;																				 однако в отличие от нее признак
   ;																				 результата устанавливается 0 1 2
   ;																				 если загружаемое число 0
   ;																				 меньше 0 или больше 0
   ;																				 */
   ;					R[R1]=R[R2];
   ;	
	?debug	L 260
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	mov	dword ptr es:_R[bx],eax
   ;	
   ;					SET_CC_BY_SIGN(R[R1]);
   ;	
	?debug	L 261
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	push	dword ptr es:_R[bx]
	push	cs
	call	near ptr _SET_CC_BY_SIGN
	add	sp,4
   ;	
   ;	
   ;					//T();
   ;					break;
   ;	
	?debug	L 264
	pop	ds
	pop	bp
	ret	
@6@702:
   ;	
   ;			case 0x13:                         /* LCR */
   ;																				 /*Дополнение второго операнда
   ;																				 помещается на место первого
   ;																				 операнда Признак результата
   ;																				 устанавливается в зависимости от того
   ;																				 является дополнение нулем
   ;																				 отрицательным и положительным
   ;																				 числом В том случаекогда в R2
   ;																				 находилось максимальное по абсолютной
   ;																				 величчине отричательное число
   ;																				 признак результата устанавливается
   ;																				 равным 3
   ;																				 */
   ;					if (R[R2]==0x80000000l)
   ;	
	?debug	L 278
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	cmp	dword ptr es:_R[bx],large 080000000h
	jne	short @6@786
   ;	
   ;						{PSW_CC=3;//R[R1]=R[R2];
   ;	
	?debug	L 279
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,3
   ;	
   ;						 T();
   ;	
	?debug	L 280
	call	far ptr _T
   ;	
   ;						 if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG!!!");}
   ;	
	?debug	L 281
	mov	ax,seg _PSW_PRG_MASK
	mov	es,ax
	test	byte ptr es:_PSW_PRG_MASK,8
	jne short	@@2
	jmp	@6@2466
@@2:
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,8
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	push	ds
	push	offset s@+18
	call	far ptr _printf
	add	sp,4
	pop	ds
	pop	bp
	ret	
@6@786:
   ;	
   ;						}
   ;					else
   ;						{
   ;						 R[R1]=-((signed long)R[R2]);
   ;	
	?debug	L 285
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	neg	eax
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	mov	dword ptr es:_R[bx],eax
   ;	
   ;						 SET_CC_BY_SIGN(R[R1]);
   ;	
	?debug	L 286
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	push	dword ptr es:_R[bx]
	push	cs
	call	near ptr _SET_CC_BY_SIGN
	add	sp,4
	pop	ds
	pop	bp
	ret	
@6@814:
   ;	
   ;						}
   ;					//T();
   ;					break;
   ;			case 0x14:
   ;																				 /* NR  */
   ;																				 /*Производтся поразрядное логическое
   ;																				 умножение операндов
   ;																				 Результат помещается на место
   ;																				 первого операнда Признак результата
   ;																				 устанавливается 0 если получится 0
   ;																				 в противном случае признак результата
   ;																				 устанавливается 1
   ;																				 */
   ;	
   ;					if ((R[R1]&=R[R2])) PSW_CC=1;
   ;	
	?debug	L 301
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	and	dword ptr es:_R[bx],eax
	mov	eax,dword ptr es:_R[bx]
	cmp	eax,large 0
	je	short @6@870
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	bp
	ret	
@6@870:
   ;	
   ;					else PSW_CC=0;
   ;	
	?debug	L 302
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	bp
	ret	
@6@898:
   ;	
   ;					//T();
   ;					break;
   ;			case 0x15:                         /*  CLR */
   ;																				 /* два операнда принимаемые как
   ;																				 двоичные величины без знака
   ;																				 поразрядно сравниваются операция
   ;																				 сравнения прекращается как только
   ;																				 встречаются несовпадающие разряды
   ;																				 признак результата станавливается
   ;																				 равным 0 если операнды равны,
   ;																				 равным 1 если первый операнд
   ;																				 меньше второго
   ;																				 равным 2 если первый операнд
   ;																				 больше второго
   ;																				 */
   ;	
   ;	        *((unsigned long *)&Op1[0])=R[R1];
   ;	
	?debug	L 319
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	dword ptr d@w+196,eax
   ;	
   ;	        *((unsigned long *)&Op2[0])=R[R2];
   ;	
	?debug	L 320
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	dword ptr d@w+200,eax
   ;	
   ;	        for(k=3;k>=0;k--)
   ;	
	?debug	L 321
	mov	word ptr d@w+204,3
	jmp	short @6@1066
@6@926:
   ;	
   ;	        {
   ;	          if (Op1[k]!=Op2[k])
   ;	
	?debug	L 323
	mov	bx,word ptr d@w+204
	mov	al,byte ptr d@w+196[bx]
	cmp	al,byte ptr d@w+200[bx]
	je	short @6@1038
   ;	
   ;	          {
   ;	            if (Op1[k]<Op2[k]) {PSW_CC=1; return;}
   ;	
	?debug	L 325
	cmp	al,byte ptr d@w+200[bx]
	jae	short @6@1010
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	bp
	ret	
@6@1010:
   ;	
   ;	            else {PSW_CC=2; return;}
   ;	
	?debug	L 326
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	bp
	ret	
@6@1038:
	?debug	L 321
	dec	word ptr d@w+204
@6@1066:
	cmp	word ptr d@w+204,0
	jge	short @6@926
   ;	
   ;	          }
   ;	        }
   ;	        PSW_CC=0;
   ;	
	?debug	L 329
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;	
   ;	//				if (R[R1]==R[R2]) PSW_CC=0;
   ;	//				else if (R[R1] < R[R2]) PSW_CC=1;
   ;	//						 else PSW_CC=2;
   ;					//T();
   ;					break;
   ;	
	?debug	L 335
	pop	ds
	pop	bp
	ret	
@6@1122:
   ;	
   ;			case 0x16:                         /* OR */
   ;					if (R[R1]|=R[R2]) PSW_CC=1;
   ;	
	?debug	L 337
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	or	dword ptr es:_R[bx],eax
	mov	eax,dword ptr es:_R[bx]
	cmp	eax,large 0
	je	short @6@1178
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	bp
	ret	
@6@1178:
   ;	
   ;					else PSW_CC=0;
   ;	
	?debug	L 338
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	bp
	ret	
@6@1206:
   ;	
   ;					//T();
   ;					break;
   ;			case 0x17:                         /* XR */
   ;					if (R[R1]^=R[R2]) PSW_CC=1;
   ;	
	?debug	L 342
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	xor	dword ptr es:_R[bx],eax
	mov	eax,dword ptr es:_R[bx]
	cmp	eax,large 0
	je	short @6@1262
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	bp
	ret	
@6@1262:
   ;	
   ;					else PSW_CC=0;
   ;	
	?debug	L 343
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	bp
	ret	
@6@1290:
   ;	
   ;					//T();
   ;					break;
   ;			case 0x18:                         /* LR */
   ;	//				R[R1]=R[R2];
   ;					T();
   ;	
	?debug	L 348
	call	far ptr _T
   ;	
   ;					break;
   ;	
	?debug	L 349
	pop	ds
	pop	bp
	ret	
@6@1318:
   ;	
   ;	
   ;	
   ;			case 0x19:
   ;																				 /* CR */
   ;																				 /*второй операнд вычитается из первого
   ;																				 как в командах вычитание однако
   ;																				 результат устанавливается так же
   ;																				 как и в операции вычитание
   ;																				 */
   ;					if ((signed long)R[R1]==(signed long)R[R2]) PSW_CC=0;
   ;	
	?debug	L 359
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	cmp	eax,dword ptr es:_R[bx]
	jne	short @6@1374
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	bp
	ret	
@6@1374:
   ;	
   ;					///else
   ;					/// {
   ;					///	FLA=_FLAGS;
   ;					///	if (FLA&0x0080) /*<0*/   PSW_CC=1;
   ;					///	else            /*>0*/   PSW_CC=2;
   ;					/// }
   ;					else if ((signed long)R[R1] < (signed long)R[R2]) PSW_CC=1;
   ;	
	?debug	L 366
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	cmp	eax,dword ptr es:_R[bx]
	jge	short @6@1430
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	bp
	ret	
@6@1430:
   ;	
   ;							 else PSW_CC=2;
   ;	
	?debug	L 367
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	bp
	ret	
@6@1458:
   ;	
   ;					//T();
   ;					break;
   ;			case 0x1a:                         /* AR */
   ;	//				RR1=&R[R1];
   ;	//				(*RR1)+=((signed long)R[R2]);
   ;	//#include "ds360sr.c"
   ;	//				//T();
   ;					((signed long)R[R1])+=((signed long)R[R2]);
   ;	
	?debug	L 375
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	add	dword ptr es:_R[bx],eax
   ;	
   ;	
   ;					FLA=_FLAGS;
   ;	
	?debug	L 377
	pushf	
	pop	ax
	mov	word ptr d@w+124,ax
   ;	
   ;					if (FLA&0x0040)  /*==0*/   PSW_CC=0;
   ;	
	?debug	L 378
	test	word ptr d@w+124,64
	je	short @6@1514
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	jmp	short @6@1598
@6@1514:
   ;	
   ;					else
   ;					 {if (FLA&0x0080) /*<0*/   PSW_CC=1;
   ;	
	?debug	L 380
	test	word ptr d@w+124,128
	je	short @6@1570
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	jmp	short @6@1598
@6@1570:
   ;	
   ;						else            /*>0*/   PSW_CC=2;
   ;	
	?debug	L 381
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
@6@1598:
   ;	
   ;					 }
   ;					if (FLA&0x0800)   /* PEREPOLNENIE*/
   ;	
	?debug	L 383
	test	word ptr d@w+124,2048
	jne short	@@3
	jmp	@6@2466
@@3:
   ;	
   ;						 {PSW_CC=3;
   ;	
	?debug	L 384
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,3
   ;	
   ;							//T();
   ;							if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG!!!");}
   ;	
	?debug	L 386
	mov	ax,seg _PSW_PRG_MASK
	mov	es,ax
	test	byte ptr es:_PSW_PRG_MASK,8
	jne short	@@4
	jmp	@6@2466
@@4:
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,8
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	push	ds
	push	offset s@+18
	call	far ptr _printf
	add	sp,4
	pop	ds
	pop	bp
	ret	
@6@1682:
   ;	
   ;						 }
   ;	
   ;					break;
   ;			case 0x1b:
   ;	//				RR1=&R[R1];										 /* SR */
   ;	//				(*RR1)+= (-((signed long)R[R2]));
   ;	//#include "ds360sr.c"
   ;	//				//T();
   ;					((signed long)R[R1])+= (-((signed long)R[R2]));
   ;	
	?debug	L 395
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	neg	eax
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	add	dword ptr es:_R[bx],eax
   ;	
   ;	
   ;					FLA=_FLAGS;
   ;	
	?debug	L 397
	pushf	
	pop	ax
	mov	word ptr d@w+124,ax
   ;	
   ;					if (FLA&0x0040)  /*==0*/   PSW_CC=0;
   ;	
	?debug	L 398
	test	word ptr d@w+124,64
	je	short @6@1738
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	jmp	short @6@1822
@6@1738:
   ;	
   ;					else
   ;					 {if (FLA&0x0080) /*<0*/   PSW_CC=1;
   ;	
	?debug	L 400
	test	word ptr d@w+124,128
	je	short @6@1794
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	jmp	short @6@1822
@6@1794:
   ;	
   ;						else            /*>0*/   PSW_CC=2;
   ;	
	?debug	L 401
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
@6@1822:
   ;	
   ;					 }
   ;					if (FLA&0x0800)   /* PEREPOLNENIE*/
   ;	
	?debug	L 403
	test	word ptr d@w+124,2048
	jne short	@@5
	jmp	@6@2466
@@5:
   ;	
   ;						 {PSW_CC=3;
   ;	
	?debug	L 404
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,3
   ;	
   ;							//T();
   ;							if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG!!!");}
   ;	
	?debug	L 406
	mov	ax,seg _PSW_PRG_MASK
	mov	es,ax
	test	byte ptr es:_PSW_PRG_MASK,8
	jne short	@@6
	jmp	@6@2466
@@6:
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,8
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	push	ds
	push	offset s@+18
	call	far ptr _printf
	add	sp,4
	pop	ds
	pop	bp
	ret	
@6@1906:
   ;	
   ;						 }
   ;	
   ;					break;
   ;			case 0x1c:                         /* MR  */
   ;																				 /*
   ;																				 R1+1 * R2 -> R1,R1+1
   ;																				 */
   ;	
   ;	        if (R1&0x01) {RQ_PRG=0x0006;RETURN=1;printf("SPEC!!!");break;}
   ;	
	?debug	L 415
	test	word ptr d@w+96,1
	je	short @6@1962
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,6
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	push	ds
	push	offset s@+25
	call	far ptr _printf
	add	sp,4
	pop	ds
	pop	bp
	ret	
@6@1962:
   ;	
   ;					MR(&R[R1],&R[R1+1],&R[R2]);
   ;	
	?debug	L 416
	mov	ax,word ptr d@w+98
	shl	ax,2
	add	ax,offset _R
	push	seg _R
	push	ax
	mov	ax,word ptr d@w+96
	shl	ax,2
	add	ax,offset _R+4
	push	seg _R
	push	ax
	mov	ax,word ptr d@w+96
	shl	ax,2
	add	ax,offset _R
	push	seg _R
	push	ax
	push	cs
	call	near ptr _MR
	add	sp,12
   ;	
   ;					//T();
   ;					break;
   ;	
	?debug	L 418
	pop	ds
	pop	bp
	ret	
@6@1990:
   ;	
   ;			case 0x1d:                         /* DR  */
   ;																				 /*
   ;																				 (R1,R1+1)/R2->частное->R1+1
   ;																											 остаток->R1
   ;																				 */
   ;	
   ;	        if (R1&0x01) {RQ_PRG=0x0006;RETURN=1;printf("SPEC!!!");break;}
   ;	
	?debug	L 425
	test	word ptr d@w+96,1
	je	short @6@2046
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,6
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	push	ds
	push	offset s@+25
	call	far ptr _printf
	add	sp,4
	pop	ds
	pop	bp
	ret	
@6@2046:
   ;	
   ;					DR(&R[R1],&R[R1+1],&R[R2]);
   ;	
	?debug	L 426
	mov	ax,word ptr d@w+98
	shl	ax,2
	add	ax,offset _R
	push	seg _R
	push	ax
	mov	ax,word ptr d@w+96
	shl	ax,2
	add	ax,offset _R+4
	push	seg _R
	push	ax
	mov	ax,word ptr d@w+96
	shl	ax,2
	add	ax,offset _R
	push	seg _R
	push	ax
	push	cs
	call	near ptr _DR
	add	sp,12
   ;	
   ;					//T();
   ;					break;
   ;	
	?debug	L 428
	pop	ds
	pop	bp
	ret	
@6@2074:
   ;	
   ;			case 0x1e:                         /*  ALR */
   ;																				 /*
   ;																				 тоже что и AR но признак результата
   ;																				 0 -сумма равна 0 и перенос из
   ;																				 знакового бита отсутствует
   ;																				 1 -сумма не равна 0 и перенос
   ;																				 из знакового бита отсутствует
   ;																				 2 -сумма равна 0 и произошел
   ;																				 перенос из знакового бита
   ;																				 3 - сумма не равна 0 и произошел
   ;																				 перенос из знакового бита
   ;																				 */
   ;					((signed long)R[R1])+=((signed long)R[R2]);
   ;	
	?debug	L 441
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	add	dword ptr es:_R[bx],eax
   ;	
   ;					FLA=_FLAGS;
   ;	
	?debug	L 442
	pushf	
	pop	ax
	mov	word ptr d@w+124,ax
   ;	
   ;					if (FLA&0x0040)  /*==0*/
   ;	
	?debug	L 443
	test	word ptr d@w+124,64
	je	short @6@2186
   ;	
   ;					 {if (FLA&0x0001) PSW_CC=2;  /*перенос*/
   ;	
	?debug	L 444
	test	word ptr d@w+124,1
	je	short @6@2158
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	bp
	ret	
@6@2158:
   ;	
   ;						else            PSW_CC=0;
   ;	
	?debug	L 445
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	bp
	ret	
@6@2186:
   ;	
   ;					 }
   ;					else
   ;					 {if (FLA&0x0001) PSW_CC=3;
   ;	
	?debug	L 448
	test	word ptr d@w+124,1
	je	short @6@2242
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,3
	pop	ds
	pop	bp
	ret	
@6@2242:
   ;	
   ;						else            PSW_CC=1;
   ;	
	?debug	L 449
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	bp
	ret	
@6@2270:
   ;	
   ;					 }
   ;	
   ;				  //T();
   ;					break;
   ;			case 0x1f:                         /*  SLR */
   ;																				 /*
   ;																				 тоже что и SR но признак результата
   ;																				 0 -сумма равна 0 и перенос из
   ;																				 знакового бита отсутствует
   ;																				 1 -сумма не равна 0 и перенос
   ;																				 из знакового бита отсутствует
   ;																				 2 -сумма равна 0 и произошел
   ;																				 перенос из знакового бита
   ;																				 3 - сумма не равна 0 и произошел
   ;																				 перенос из знакового бита
   ;																				 */
   ;					((signed long)R[R1])+=(-((signed long)R[R2]));
   ;	
	?debug	L 466
	mov	bx,word ptr d@w+98
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	neg	eax
	mov	bx,word ptr d@w+96
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	add	dword ptr es:_R[bx],eax
   ;	
   ;					FLA=_FLAGS;
   ;	
	?debug	L 467
	pushf	
	pop	ax
	mov	word ptr d@w+124,ax
   ;	
   ;					if (FLA&0x0040)  /*==0*/
   ;	
	?debug	L 468
	test	word ptr d@w+124,64
	je	short @6@2382
   ;	
   ;					 {if (FLA&0x0001) PSW_CC=2;  /*перенос*/
   ;	
	?debug	L 469
	test	word ptr d@w+124,1
	je	short @6@2354
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	bp
	ret	
@6@2354:
   ;	
   ;						else            PSW_CC=0;
   ;	
	?debug	L 470
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	bp
	ret	
@6@2382:
   ;	
   ;					 }
   ;					else
   ;					 {if (FLA&0x0001) PSW_CC=3;
   ;	
	?debug	L 473
	test	word ptr d@w+124,1
	je	short @6@2438
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,3
	pop	ds
	pop	bp
	ret	
@6@2438:
   ;	
   ;						else            PSW_CC=1;
   ;	
	?debug	L 474
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
@6@2466:
   ;	
   ;					 }
   ;	
   ;					//T();
   ;					break;
   ;		 }
   ;	}
   ;	
	?debug	L 480
	pop	ds
	pop	bp
	ret	
	?debug	C E31A0004001A08
	?debug	C E31B0004001A08
	?debug	C E31C000400160600
	?debug	C E6016B04000002CC0001CE00034F70321A000002+
	?debug	C C80001CD00034F70311B000002C40001CC000670+
	?debug	C 73775F636304000002C20001CB0004465F573410+
	?debug	C 000002B80001CA0004465F573310000002AE0001+
	?debug	C C90004465F573210000002A40001C80004465F57+
	?debug	C 31100000029A0001C700064144524553530C0000+
	?debug	C 02960001C60009555252455A5F414C520C000002+
	?debug	C 920001C50005555252455A0C0000028E0001C400+
	?debug	C 06555252455A330C0000028A0001C30006555252+
	?debug	C 455A320C000002860001C200045252455A060000+
	?debug	C 02820001C1000352455A1C0000027E0001C00003+
	?debug	C 464C410A0000027C0001BE000455525232180000+
	?debug	C 02780001BD00045552523118000002740001BC00+
	?debug	C 035252321C000002700001BB00035252311C0000+
	?debug	C 026C0001BA00034444440A0000026A0001B80002+
	?debug	C 444408000002690001B700024244080000026800+
	?debug	C 01B60002495304000002660001B3000242320400+
	?debug	C 0002640001B30002523204000002620001B30002+
	?debug	C 523104000002600001B300025258080000025F00+
	?debug	C 01B200025252080000025E0001B10003434F4D19+
	?debug	C 0A060000
	?debug	E
	?debug	E
_CODE10	endp
	db	1 dup (?)
@6@C2786	label	word
	dw	@6@254
	dw	@6@506
	dw	@6@674
	dw	@6@702
	dw	@6@814
	dw	@6@898
	dw	@6@1122
	dw	@6@1206
	dw	@6@1290
	dw	@6@1318
	dw	@6@1458
	dw	@6@1682
	dw	@6@1906
	dw	@6@1990
	dw	@6@2074
	dw	@6@2270
DS360CD1_TEXT	ends
DS360CD1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (?)
	db	1 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
DS360CD1_DATA	ends
DS360CD1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE18(char far *COM)
   ;	
	?debug	L 486
	assume	cs:DS360CD1_TEXT
_CODE18	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360CD1_DATA
	mov	ds,ax
	?debug	C E603434F4D190A060000
	?debug	B
   ;	
   ;	{static char RR;
   ;	 static char RX;
   ;	 static int R1,R2,B2,IS;
   ;	
   ;	
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 GET_OPERAND_RR;
   ;	
	?debug	L 496
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+206,al
 	ror	 ax,4
	mov	byte ptr d@w+208,al
 	shr	 ax,12
	mov	byte ptr d@w+210,al
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 497
	mov	ax,seg _PSW_ILC
	mov	es,ax
	movsx	eax,word ptr es:_PSW_ILC
	mov	dx,seg _PSW_ADRESS
	mov	es,dx
	add	dword ptr es:_PSW_ADRESS,eax
   ;	
   ;	 R[R1]=R[R2];         /* LR */
   ;	
	?debug	L 498
	mov	bx,word ptr d@w+210
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	bx,word ptr d@w+208
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	mov	dword ptr es:_R[bx],eax
   ;	
   ;	}
   ;	
	?debug	L 499
	pop	ds
	pop	bp
	ret	
	?debug	C E602495304000002D60001E90102423204000002+
	?debug	C D40001E90102523204000002D20001E901025231+
	?debug	C 04000002D00001E90102525808000002CF0001E8+
	?debug	C 0102525208000002CE0001E70103434F4D190A06+
	?debug	C 0000
	?debug	E
	?debug	E
_CODE18	endp
DS360CD1_TEXT	ends
DS360CD1_DATA	segment word public use16 'FAR_DATA'
NU	label	word
	db	2 dup (?)
	?debug	C E9
	?debug	C FA01000000
s@	label	byte
	db	0
	db	0
	db	128
	db	'E'
	db	0
	db	0
	db	128
	db	'C'
	db	0
	db	0
	db	0
	db	0
	db	254
	db	255
	db	255
	db	255
	db	29
	db	'@PRG!!!'
	db	0
	db	'SPEC!!!'
	db	0
DS360CD1_DATA	ends
DS360CD1_TEXT	segment byte public use16 'CODE'
DS360CD1_TEXT	ends
	public	_SET_CC
	public	_SET_CC_BY_SIGN
	extrn	F_FTOL@:far
	public	_DR
	public	_MR
	public	_SR
	public	_CODE18
	public	_CODE10
	extrn	_T:far
_NU	equ	NU
	extrn	_PSW_ADRESS:word
	extrn	_PSW_PRG_MASK:byte
	extrn	_PSW_CC:byte
	extrn	_PSW_ILC:word
	extrn	_R:word
	extrn	_RQ_PRG:word
	extrn	_RETURN:word
	extrn	_printf:far
_s@	equ	s@
	?debug	C EA010D
	?debug	C E31D00000023010400
	?debug	C EC075F5345545F43431D1800
	?debug	C E31E00000023010400
	?debug	C EC0F5F5345545F43435F42595F5349474E1E1800
	?debug	C E31F00000023040500
	?debug	C EB07465F46544F4C401F00
	?debug	C E32000000023010400
	?debug	C EC035F4452201800
	?debug	C E32100000023010400
	?debug	C EC035F4D52211800
	?debug	C E32200000023010400
	?debug	C EC035F5352221800
	?debug	C E32300000023010400
	?debug	C EC075F434F44453138231800
	?debug	C E32400000023010400
	?debug	C EC075F434F44453130241800
	?debug	C E32500000023010400
	?debug	C EB025F542500
	?debug	C EB0B5F5053575F4144524553530C00
	?debug	C EB0D5F5053575F5052475F4D41534B0800
	?debug	C EB075F5053575F43430800
	?debug	C EB085F5053575F494C430400
	?debug	C E3260040001A0C
	?debug	C EB025F522600
	?debug	C EB075F52515F5052470400
	?debug	C EB075F52455455524E0400
	?debug	C E32700000023040401
	?debug	C EB075F7072696E74662700
	?debug	C E6024E5504000002D800000666706F735F740606+
	?debug	C 021F000673697A655F740A06021A00
	end
