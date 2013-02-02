	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DS360CD6.C"
	?debug	C E9AE0B391E0A44533336304344362E43
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
DS360CD6_TEXT	segment byte public use16 'CODE'
DS360CD6_TEXT	ends
	assume	cs:DS360CD6_TEXT,ds:DS360CD6_DATA
DS360CD6_DATA	segment word public use16 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
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
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	2 dup (?)
	db	8 dup (?)
	db	10 dup (?)
DS360CD6_DATA	ends
DS360CD6_TEXT	segment byte public use16 'CODE'
	?debug	C E8010A44533336304344362E43AE0B391E
   ;	
   ;	 CODE60(char far *COM)
   ;	
	?debug	L 11
	assume	cs:DS360CD6_TEXT
_CODE60	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,DS360CD6_DATA
	mov	ds,ax
	?debug	C E318000400160800
	?debug	C E603434F4D180A060000
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
   ;	 static long *REZ;
   ;	 static long RREZ;
   ;	 static unsigned long URREZ;
   ;	 static unsigned long *URR1;
   ;	 static unsigned long *URR2;
   ;	 static unsigned long ADRESS;
   ;	 static unsigned long ar;
   ;	 static int i;
   ;	 static BYTE arr360[8];
   ;	 static long double f_work;
   ;	
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	
   ;	 GET_OPERAND_RX;
   ;	
	?debug	L 39
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+1,al
 	ror	 ax,4
	mov	byte ptr d@w+2,al
 	shr	 ax,12
	mov	byte ptr d@w+4,al
	or	al,al
	je	short @1@198
	mov	bx,ax
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	dword ptr d@w+42,eax
	jmp	short @1@226
@1@198:
	mov	dword ptr d@w+42,large 0
@1@226:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @1@394
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	add	eax,dword ptr es:_R[bx]
	add	dword ptr d@w+42,eax
	jmp	short @1@450
@1@394:
 	ror	 ax,8
	movzx	eax,ax
	add	dword ptr d@w+42,eax
@1@450:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 40
	mov	ax,seg _PSW_ILC
	mov	es,ax
	movsx	eax,word ptr es:_PSW_ILC
	mov	dx,seg _PSW_ADRESS
	mov	es,dx
	add	dword ptr es:_PSW_ADRESS,eax
   ;	
   ;	 switch(COM[0])
   ;	
	?debug	L 41
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	dl,al
	mov	ah,0
	sub	ax,96
	mov	bx,ax
	cmp	bx,15
	jbe short	@@9
	jmp	@1@1626
@@9:
	shl	bx,1
	jmp	word ptr cs:@1@C1666[bx]
@1@562:
   ;	
   ;		 {
   ;			case 0x60:          		           /* STD */
   ;																				 /* Плавающая точка
   ;																				 запись в память
   ;																				 удвоенная точность
   ;																				 */
   ;	
   ;					floatPC_to_float360((BYTE far *)arr360, &R_FLOAT[R1], TRUE);
   ;	
	?debug	L 49
	push	1
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	add	ax,offset _R_FLOAT
	push	seg _R_FLOAT
	push	ax
	push	ds
	push	offset d@w+52
	call	far ptr _floatPC_to_float360
	add	sp,10
   ;	
   ;					MOVE_MEM_TO_360(arr360,ADRESS,8l);
   ;	
	?debug	L 50
	push	8
	push	dword ptr d@w+42
	push	ds
	push	offset d@w+52
	call	far ptr _MOVE_MEM_TO_360
	add	sp,10
   ;	
   ;					//T();
   ;					break;
   ;	
	?debug	L 52
	pop	ds
	pop	si
	pop	bp
	ret	
@1@590:
   ;	
   ;	
   ;			case 0x61:
   ;	
   ;					T00(COM[0]);
   ;	
	?debug	L 56
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 57
	pop	ds
	pop	si
	pop	bp
	ret	
@1@618:
   ;	
   ;	
   ;			case 0x62:
   ;					T00(COM[0]);
   ;	
	?debug	L 60
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 61
	pop	ds
	pop	si
	pop	bp
	ret	
@1@646:
   ;	
   ;	
   ;			case 0x63:
   ;					T00(COM[0]);
   ;	
	?debug	L 64
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 65
	pop	ds
	pop	si
	pop	bp
	ret	
@1@674:
   ;	
   ;	
   ;			case 0x64:
   ;					T00(COM[0]);
   ;	
	?debug	L 68
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 69
	pop	ds
	pop	si
	pop	bp
	ret	
@1@702:
   ;	
   ;	
   ;			case 0x65:
   ;					T00(COM[0]);
   ;	
	?debug	L 72
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 73
	pop	ds
	pop	si
	pop	bp
	ret	
@1@730:
   ;	
   ;	
   ;			case 0x66:
   ;					T00(COM[0]);
   ;	
	?debug	L 76
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 77
	pop	ds
	pop	si
	pop	bp
	ret	
@1@758:
   ;	
   ;	
   ;			case 0x67:
   ;					T00(COM[0]);
   ;	
	?debug	L 80
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 81
	pop	ds
	pop	si
	pop	bp
	ret	
@1@786:
   ;	
   ;	
   ;			case 0x68:                         /* LD */
   ;																				 /*Загрузка удвоенная точность
   ;																				 */
   ;	
   ;					MOVE_360_TO_MEM(ADRESS,arr360,8l);
   ;	
	?debug	L 87
	push	8
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					//if (R1==6) for(i=0; i<8; i++) printf(" %x",arr360[i]);
   ;					float360_to_floatPC((BYTE far *)arr360, &R_FLOAT[R1], TRUE);
   ;	
	?debug	L 90
	push	1
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	add	ax,offset _R_FLOAT
	push	seg _R_FLOAT
	push	ax
	push	ds
	push	offset d@w+52
	call	far ptr _float360_to_floatPC
	add	sp,10
   ;	
   ;					//if (R1==6) printf("Load float =%Lg \n",R_FLOAT[R1]);
   ;	
   ;	
   ;					//T();
   ;					break;
   ;	
	?debug	L 95
	pop	ds
	pop	si
	pop	bp
	ret	
@1@814:
   ;	
   ;	
   ;			case 0x69:                         /* CD */
   ;																				 /*
   ;																				 сравнение удвоенная точность
   ;																				 */
   ;	
   ;					///T();
   ;					MOVE_360_TO_MEM(ADRESS,arr360,8l);
   ;	
	?debug	L 103
	push	8
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 105
	push	1
	push	ds
	push	offset d@w+60
	push	ds
	push	offset d@w+52
	call	far ptr _float360_to_floatPC
	add	sp,10
   ;	
   ;					if(R_FLOAT[R1] == f_work) PSW_CC=0;
   ;	
	?debug	L 106
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fld	tbyte ptr d@w+60
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@870
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	si
	pop	bp
	ret	
@1@870:
   ;	
   ;					else if(R_FLOAT[R1] < f_work) PSW_CC=1;
   ;	
	?debug	L 107
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fld	tbyte ptr d@w+60
	fcompp
	fstsw	ax
	sahf	
	jbe	short @1@926
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	si
	pop	bp
	ret	
@1@926:
   ;	
   ;					else PSW_CC=2;
   ;	
	?debug	L 108
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	si
	pop	bp
	ret	
@1@954:
   ;	
   ;					///T();
   ;					break;
   ;	
   ;			case 0x6a:                         /* AD */
   ;																				 /* сложение с нормализацией
   ;																				 удвоенная точнасть
   ;																				 */
   ;					MOVE_360_TO_MEM(ADRESS,arr360,8l);
   ;	
	?debug	L 116
	push	8
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 118
	push	1
	push	ds
	push	offset d@w+60
	push	ds
	push	offset d@w+52
	call	far ptr _float360_to_floatPC
	add	sp,10
   ;	
   ;					R_FLOAT[R1]+=f_work;
   ;	
	?debug	L 119
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fld	tbyte ptr d@w+60
	fadd	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
   ;	
   ;					if(R_FLOAT[R1] == 0.0) PSW_CC=0;
   ;	
	?debug	L 120
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@1010
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1010:
   ;	
   ;					else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
   ;	
	?debug	L 121
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jbe	short @1@1066
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1066:
   ;	
   ;					else PSW_CC=2;
   ;	
	?debug	L 122
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1094:
   ;	
   ;	
   ;					//T();
   ;					break;
   ;	
   ;			case 0x6b:                         /* SD */
   ;																				 /*
   ;																				 вычитание с нормализацией
   ;																				 удвоенная точность
   ;																				 */
   ;					///T();
   ;					MOVE_360_TO_MEM(ADRESS,arr360,8l);
   ;	
	?debug	L 133
	push	8
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 135
	push	1
	push	ds
	push	offset d@w+60
	push	ds
	push	offset d@w+52
	call	far ptr _float360_to_floatPC
	add	sp,10
   ;	
   ;					R_FLOAT[R1]-=f_work;
   ;	
	?debug	L 136
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fld	tbyte ptr d@w+60
	fsub	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
   ;	
   ;					if(R_FLOAT[R1] == 0.0) PSW_CC=0;
   ;	
	?debug	L 137
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@1150
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1150:
   ;	
   ;					else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
   ;	
	?debug	L 138
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jbe	short @1@1206
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1206:
   ;	
   ;					else PSW_CC=2;
   ;	
	?debug	L 139
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1234:
   ;	
   ;					///T();
   ;					break;
   ;	
   ;			case 0x6c:                         /* MD  */
   ;																				 /*
   ;																				 умножение удвоенная точность
   ;																				 */
   ;					MOVE_360_TO_MEM(ADRESS,arr360,8l);
   ;	
	?debug	L 147
	push	8
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 149
	push	1
	push	ds
	push	offset d@w+60
	push	ds
	push	offset d@w+52
	call	far ptr _float360_to_floatPC
	add	sp,10
   ;	
   ;					R_FLOAT[R1]*=f_work;
   ;	
	?debug	L 150
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fld	tbyte ptr d@w+60
	fmul	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
   ;	
   ;					break;
   ;	
	?debug	L 151
	fwait	
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1262:
   ;	
   ;			case 0x6d:                         /* DD  */
   ;																				 /*
   ;																				 деление удвоенная точность
   ;																				 */
   ;					MOVE_360_TO_MEM(ADRESS,arr360,8l);
   ;	
	?debug	L 156
	push	8
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 158
	push	1
	push	ds
	push	offset d@w+60
	push	ds
	push	offset d@w+52
	call	far ptr _float360_to_floatPC
	add	sp,10
   ;	
   ;					if (f_work==0.0)
   ;	
	?debug	L 159
	fld	tbyte ptr d@w+60
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@1318
   ;	
   ;						{RQ_PRG=0x000f;RETURN=1;return;
   ;	
	?debug	L 160
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,15
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1318:
   ;	
   ;						}
   ;					else R_FLOAT[R1]/=f_work;
   ;	
	?debug	L 162
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fld	tbyte ptr d@w+60
	fdiv	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
	fwait	
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1346:
   ;	
   ;					break;
   ;			case 0x6e:                         /*  AW */
   ;																				 /*
   ;																				 сложение без нормализации
   ;																				 удвоенная точность
   ;																				 */
   ;					///T();
   ;					MOVE_360_TO_MEM(ADRESS,arr360,8l);
   ;	
	?debug	L 170
	push	8
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 172
	push	1
	push	ds
	push	offset d@w+60
	push	ds
	push	offset d@w+52
	call	far ptr _float360_to_floatPC
	add	sp,10
   ;	
   ;					R_FLOAT[R1]+=f_work;
   ;	
	?debug	L 173
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fld	tbyte ptr d@w+60
	fadd	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
   ;	
   ;					if(R_FLOAT[R1] == 0.0) PSW_CC=0;
   ;	
	?debug	L 174
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@1402
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1402:
   ;	
   ;					else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
   ;	
	?debug	L 175
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jbe	short @1@1458
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1458:
   ;	
   ;					else PSW_CC=2;
   ;	
	?debug	L 176
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1486:
   ;	
   ;					///T();
   ;					break;
   ;			case 0x6f:                         /*  SW */
   ;																				 /*
   ;																				 вычитание без нормализации
   ;																				 удвоенная точность
   ;																				 */
   ;					///T();
   ;					MOVE_360_TO_MEM(ADRESS,arr360,8l);
   ;	
	?debug	L 185
	push	8
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 187
	push	1
	push	ds
	push	offset d@w+60
	push	ds
	push	offset d@w+52
	call	far ptr _float360_to_floatPC
	add	sp,10
   ;	
   ;					R_FLOAT[R1]-=f_work;
   ;	
	?debug	L 188
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fld	tbyte ptr d@w+60
	fsub	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
   ;	
   ;					if(R_FLOAT[R1] == 0.0) PSW_CC=0;
   ;	
	?debug	L 189
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@1542
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1542:
   ;	
   ;					else if(R_FLOAT[R1] < 0.0) PSW_CC=1;
   ;	
	?debug	L 190
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jbe	short @1@1598
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1598:
   ;	
   ;					else PSW_CC=2;
   ;	
	?debug	L 191
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
@1@1626:
   ;	
   ;	
   ;					///T();
   ;					break;
   ;		 }
   ;	}
   ;	
	?debug	L 196
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E3190008001A08
	?debug	C E31A000400160C00
	?debug	C E31B000400160600
	?debug	C E606665F776F726B100000023C00012000066172+
	?debug	C 72333630190000023400011F0001690400000232+
	?debug	C 00011E000261720C0000022E00011D0006414452+
	?debug	C 4553530C0000022A00011C0004555252321A0000+
	?debug	C 022600011B0004555252311A0000022200011A00+
	?debug	C 05555252455A0C0000021E00011900045252455A+
	?debug	C 060000021A000118000352455A1B000002160001+
	?debug	C 1700035252321B0000021200011600035252311B+
	?debug	C 0000020E00011500034444440A0000020C000113+
	?debug	C 00024444080000020B0001120002424408000002+
	?debug	C 0A00011100024953040000020800010E00024232+
	?debug	C 040000020600010E00025232040000020400010E+
	?debug	C 00025231040000020200010E0002525808000002+
	?debug	C 0100010D00025252080000020000010C0003434F+
	?debug	C 4D180A060000
	?debug	E
	?debug	E
_CODE60	endp
@1@C1666	label	word
	dw	@1@562
	dw	@1@590
	dw	@1@618
	dw	@1@646
	dw	@1@674
	dw	@1@702
	dw	@1@730
	dw	@1@758
	dw	@1@786
	dw	@1@814
	dw	@1@954
	dw	@1@1094
	dw	@1@1234
	dw	@1@1262
	dw	@1@1346
	dw	@1@1486
   ;	
   ;	void float360_to_floatPC( BYTE far *float360, long double far *fPC, BYTE prec)
   ;	
	?debug	L 201
	assume	cs:DS360CD6_TEXT
_float360_to_floatPC	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,24
	push	si
	push	di
	push	ds
	mov	ax,DS360CD6_DATA
	mov	ds,ax
	?debug	C E31C000400161000
	?debug	C E60470726563080A0E0000036650431C0A0A0000+
	?debug	C 08666C6F6174333630180A060000
	?debug	B
   ;	
   ;	{
   ;	 int   sign;
   ;	 int cnt;
   ;	 int har;
   ;	 int   i,j,k, l;
   ;	 BYTE far *floatPC =(BYTE far *)fPC;
   ;	
	?debug	L 207
	mov	eax,dword ptr [bp+10]
	mov	dword ptr [bp-12],eax
   ;	
   ;	 BYTE flag =0x80;
   ;	
	?debug	L 208
	mov	byte ptr [bp-13],128
   ;	
   ;	 int far *harPC =(int far *)(floatPC+8);
   ;	
	?debug	L 209
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	add	dx,8
	mov	word ptr [bp-16],ax
	mov	word ptr [bp-18],dx
   ;	
   ;	
   ;	
   ;	 sign   =float360[0]&0x80; //keep sign
   ;	
	?debug	L 212
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	mov	word ptr [bp-20],ax
	and	ax,128
	mov	word ptr [bp-2],ax
   ;	
   ;	 if(sign!=0) sign=1;
   ;	
	?debug	L 213
	cmp	word ptr [bp-2],0
	je	short @2@86
	mov	word ptr [bp-2],1
@2@86:
   ;	
   ;	
   ;	 har =float360[0]&0x7F;
   ;	
	?debug	L 215
	mov	ax,word ptr [bp-20]
	and	ax,127
	mov	word ptr [bp-4],ax
   ;	
   ;	 har -= 0x40;
   ;	
	?debug	L 216
	sub	word ptr [bp-4],64
   ;	
   ;	 har *=4;
   ;	
	?debug	L 217
	mov	dx,4
	mov	ax,word ptr [bp-4]
	imul	dx
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;	 if (prec) cnt=7;
   ;	
	?debug	L 219
	cmp	byte ptr [bp+14],0
	je	short @2@142
	mov	dx,7
	jmp	short @2@170
@2@142:
   ;	
   ;	 else      cnt=3;
   ;	
	?debug	L 220
	mov	dx,3
@2@170:
   ;	
   ;	
   ;	 for(i=0; i<10; i++) floatPC[i]=0;
   ;	
	?debug	L 222
	mov	cx,5
	mov	di,word ptr [bp-12]
	mov	es,word ptr [bp-10]
	xor	ax,ax
	rep 	stosw	
   ;	
   ;	
   ;	 for(i=0; i<cnt; i++)
   ;	
	?debug	L 224
	xor	cx,cx
	mov	si,word ptr [bp+6]
	inc	si
	mov	di,word ptr [bp-12]
	add	di,7
	cmp	cx,dx
	jge	short @2@478
@2@338:
   ;	
   ;		 floatPC[7-i]  = float360[1+i];
   ;	
	?debug	L 225
	mov	es,word ptr [bp+8]
	mov	al,byte ptr es:[si]
	mov	es,word ptr [bp-10]
	mov	byte ptr es:[di],al
	?debug	L 224
	inc	si
	dec	di
	inc	cx
	cmp	cx,dx
	jl	short @2@338
@2@478:
   ;	
   ;	
   ;	
   ;	 //check for all bytes zero and normalize floatPC
   ;	  for(i=0; i<8; i++)
   ;	
	?debug	L 229
	xor	cx,cx
	mov	si,word ptr [bp-12]
	add	si,7
	mov	word ptr [bp-22],si
@2@534:
   ;	
   ;		 if(floatPC[7-i] != 0) break;
   ;	
	?debug	L 230
	mov	es,word ptr [bp-10]
	cmp	byte ptr es:[si],0
	jne	short @2@646
	?debug	L 229
	dec	si
	inc	cx
	cmp	cx,8
	jl	short @2@534
@2@646:
   ;	
   ;	  if (i>7) return;    //all bytes is ZERO !!!
   ;	
	?debug	L 231
	cmp	cx,7
	jle short	@@10
	jmp	@2@1626
@@10:
   ;	
   ;	
   ;	
   ;	  if(i>0)
   ;	
	?debug	L 234
	or	cx,cx
	jle	short @2@954
   ;	
   ;	  {for(k=0; k<7-i; k++)
   ;	
	?debug	L 235
	mov	word ptr [bp-6],0
	mov	si,word ptr [bp-12]
	mov	ax,7
	sub	ax,cx
	mov	word ptr [bp-24],ax
	add	si,ax
	mov	di,word ptr [bp-22]
	jmp	short @2@898
@2@786:
   ;	
   ;		 {floatPC[7-k] =floatPC[7-i-k];
   ;	
	?debug	L 236
	mov	es,word ptr [bp-10]
	mov	al,byte ptr es:[si]
	mov	byte ptr es:[di],al
   ;	
   ;		  floatPC[7-i-k]=0;
   ;	
	?debug	L 237
	mov	byte ptr es:[si],0
	?debug	L 235
	dec	si
	dec	di
	inc	word ptr [bp-6]
@2@898:
	mov	ax,word ptr [bp-24]
	cmp	ax,word ptr [bp-6]
	jg	short @2@786
   ;	
   ;		 }
   ;		 har -=8*i;
   ;	
	?debug	L 239
	mov	ax,cx
	shl	ax,3
	sub	word ptr [bp-4],ax
@2@954:
   ;	
   ;	  }
   ;	 //define count of digits for shift
   ;	 for(k=0; k<8; k++)
   ;	
	?debug	L 242
	mov	word ptr [bp-6],0
@2@982:
   ;	
   ;	 {
   ;	  if(floatPC[7]&flag) break;
   ;	
	?debug	L 244
	les	bx,dword ptr [bp-12]
	mov	al,byte ptr [bp-13]
	test	byte ptr es:[bx+7],al
	jne	short @2@1094
   ;	
   ;	  flag >>=1;
   ;	
	?debug	L 245
	shr	byte ptr [bp-13],1
	?debug	L 242
	inc	word ptr [bp-6]
	cmp	word ptr [bp-6],8
	jl	short @2@982
@2@1094:
   ;	
   ;	 }
   ;	
   ;	 *harPC =0x8000*sign+0x3fff + har -k -1;
   ;	
	?debug	L 248
	mov	ax,word ptr [bp-2]
	shl	ax,15
	add	ax,word ptr [bp-4]
	add	ax,16383
	sub	ax,word ptr [bp-6]
	dec	ax
	les	bx,dword ptr [bp-18]
	mov	word ptr es:[bx],ax
   ;	
   ;	
   ;	  //shift prec bytes to k digits
   ;	  //find number of higher zero bytes
   ;	  for(l=0; l<8; l++)
   ;	
	?debug	L 252
	mov	word ptr [bp-8],0
	mov	si,word ptr [bp-12]
@2@1150:
   ;	
   ;		 if(floatPC[l]!=0) break;
   ;	
	?debug	L 253
	mov	es,word ptr [bp-10]
	cmp	byte ptr es:[si],0
	jne	short @2@1262
	?debug	L 252
	inc	si
	inc	word ptr [bp-8]
	cmp	word ptr [bp-8],8
	jl	short @2@1150
@2@1262:
   ;	
   ;	
   ;	  //8-l bytes to k digits
   ;	  for(i=0; i<k; i++)
   ;	
	?debug	L 256
	xor	cx,cx
	cmp	cx,word ptr [bp-6]
	jge	short @2@1626
@2@1318:
   ;	
   ;	  {
   ;		for(j=7; j>=l; j--)
   ;	
	?debug	L 258
	mov	dx,7
	mov	si,word ptr [bp-12]
	add	si,7
	mov	di,7
	add	di,word ptr [bp-12]
	dec	di
	jmp	short @2@1542
@2@1374:
   ;	
   ;		{floatPC[j] <<= 1;
   ;	
	?debug	L 259
	mov	es,word ptr [bp-10]
	shl	byte ptr es:[si],1
   ;	
   ;		 if(j>0 && floatPC[j-1]&0x80)
   ;	
	?debug	L 260
	or	dx,dx
	jle	short @2@1458
	test	byte ptr es:[di],128
	je	short @2@1458
   ;	
   ;				  floatPC[j] |=1;
   ;	
	?debug	L 261
	or	byte ptr es:[si],1
@2@1458:
	?debug	L 258
	dec	si
	dec	di
	dec	dx
@2@1542:
	cmp	dx,word ptr [bp-8]
	jge	short @2@1374
	?debug	L 256
	inc	cx
	cmp	cx,word ptr [bp-6]
	jl	short @2@1318
@2@1626:
   ;	
   ;		}
   ;	  }
   ;	
   ;	}
   ;	
	?debug	L 265
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
	?debug	C E31D000400160400
	?debug	C E60568617250431D02EEFF01D10004666C616708+
	?debug	C 02F3FF01D00007666C6F617450431802F4FF01CF+
	?debug	C 00016C0402F8FF00016B0402FAFF00016A040801+
	?debug	C 8A01BF0104020001690408018900C80104010003+
	?debug	C 6861720402FCFF0003636E740408017200AB0004+
	?debug	C 0200047369676E0402FEFF0008666C6F61743336+
	?debug	C 30180A060000036650431C0A0A00000470726563+
	?debug	C 080A0E0000
	?debug	E
	?debug	E
_float360_to_floatPC	endp
   ;	
   ;	void floatPC_to_float360( BYTE far *float360, long double far *fPC, BYTE prec)
   ;	
	?debug	L 273
	assume	cs:DS360CD6_TEXT
_floatPC_to_float360	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,28
	push	si
	push	di
	push	ds
	mov	ax,DS360CD6_DATA
	mov	ds,ax
	?debug	C E60470726563080A0E0000036650431C0A0A0000+
	?debug	C 08666C6F6174333630180A060000
	?debug	B
   ;	
   ;	{
   ;	 int   sign;
   ;	 int  cnt;
   ;	 int  har;
   ;	 int   i,j,k, l;
   ;	 int digit, low;
   ;	 BYTE floatPC[10];
   ;	 int far *harPC =(int far *)(floatPC+8);
   ;	
	?debug	L 281
	lea	ax,word ptr [bp-12]
	mov	word ptr [bp-22],ss
	mov	word ptr [bp-24],ax
   ;	
   ;	
   ;	
   ;	 for(i=0; i<10; i++)
   ;	
	?debug	L 284
	xor	di,di
	mov	si,word ptr [bp+10]
@3@86:
   ;	
   ;		floatPC[i] =((BYTE far *)fPC)[i];
   ;	
	?debug	L 285
	mov	es,word ptr [bp+12]
	mov	al,byte ptr es:[si]
	mov	byte ptr [bp+di-20],al
	?debug	L 284
	inc	si
	inc	di
	cmp	di,10
	jl	short @3@86
   ;	
   ;	
   ;	 sign   =*harPC & 0x8000; //keep sign
   ;	
	?debug	L 287
	les	bx,dword ptr [bp-24]
	mov	si,word ptr es:[bx]
	mov	word ptr [bp-26],si
	and	si,000008000h
   ;	
   ;	 if(sign!=0) sign=1;
   ;	
	?debug	L 288
	or	si,si
	je	short @3@254
	mov	si,1
@3@254:
   ;	
   ;	 har    =*harPC&0x7fff;
   ;	
	?debug	L 289
	mov	ax,word ptr [bp-26]
	and	ax,32767
	mov	word ptr [bp-4],ax
   ;	
   ;	 har     += -0x3fff +1;
   ;	
	?debug	L 290
	add	word ptr [bp-4],-16382
   ;	
   ;	 //find nearest number which can divide to 4 whithout remainder
   ;	 if(har/4 *4 ==har) k=0;
   ;	
	?debug	L 292
	mov	ax,word ptr [bp-4]
	mov	bx,4
	cwd	
	idiv	bx
	shl	ax,2
	mov	dx,ax
	cmp	ax,word ptr [bp-4]
	jne	short @3@310
	mov	word ptr [bp-6],0
	jmp	short @3@422
@3@310:
   ;	
   ;	 else
   ;	  {if(har>0)
   ;	
	?debug	L 294
	cmp	word ptr [bp-4],0
	jle	short @3@366
   ;	
   ;		  l =(har/4 +1)*4;
   ;	
	?debug	L 295
	mov	cx,dx
	add	cx,4
	jmp	short @3@394
@3@366:
   ;	
   ;		else
   ;		  l =(har/4 )*4;
   ;	
	?debug	L 297
	mov	cx,dx
@3@394:
   ;	
   ;		 k =l-har;
   ;	
	?debug	L 298
	mov	ax,cx
	sub	ax,word ptr [bp-4]
	mov	word ptr [bp-6],ax
   ;	
   ;		 har =l;
   ;	
	?debug	L 299
	mov	word ptr [bp-4],cx
@3@422:
   ;	
   ;	  }
   ;	  har /=4;
   ;	
	?debug	L 301
	mov	bx,4
	mov	ax,word ptr [bp-4]
	cwd	
	idiv	bx
	mov	word ptr [bp-4],ax
   ;	
   ;	  har +=0x40;
   ;	
	?debug	L 302
	add	word ptr [bp-4],64
   ;	
   ;	
   ;	  if(sign) har |=0x80;
   ;	
	?debug	L 304
	or	si,si
	je	short @3@478
	or	word ptr [bp-4],128
@3@478:
   ;	
   ;	
   ;	 if (prec) cnt=7;
   ;	
	?debug	L 306
	cmp	byte ptr [bp+14],0
	je	short @3@534
	mov	word ptr [bp-2],7
	jmp	short @3@562
@3@534:
   ;	
   ;	 else      cnt=3;
   ;	
	?debug	L 307
	mov	word ptr [bp-2],3
@3@562:
   ;	
   ;	
   ;	 //shift all bytes of mantissa to k digits left
   ;	  for(l=0; l<8; l++)
   ;	
	?debug	L 310
	xor	cx,cx
@3@590:
   ;	
   ;		 if(floatPC[l]!=0) break;
   ;	
	?debug	L 311
	lea	ax,word ptr [bp-20]
	mov	bx,cx
	add	bx,ax
	cmp	byte ptr ss:[bx],0
	jne	short @3@674
	?debug	L 310
	inc	cx
	cmp	cx,8
	jl	short @3@590
@3@674:
   ;	
   ;	
   ;	 if (l>=8)  //case of ZERO !!!
   ;	
	?debug	L 313
	cmp	cx,8
	jl	short @3@870
   ;	
   ;	 { for(i=0; i<cnt+1; i++)
   ;	
	?debug	L 314
	xor	di,di
	mov	ax,word ptr [bp-2]
	inc	ax
	mov	word ptr [bp-28],ax
	cmp	di,ax
	jl short	@@11
	jmp	@3@1430
@@11:
	mov	cx,word ptr [bp-28]
	mov	di,word ptr [bp+6]
	mov	es,word ptr [bp+8]
	xor	ax,ax
	shr	cx,1
	rep 	stosw	
	jnc	short @3@1430
	stosb	
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@3@870:
   ;	
   ;		  float360[i]=0;
   ;	  return;
   ;	 }
   ;	  //8-l bytes to k digits
   ;	  for(i=0; i<k; i++)
   ;	
	?debug	L 319
	xor	di,di
	cmp	di,word ptr [bp-6]
	jge	short @3@1206
@3@926:
   ;	
   ;	  {digit =0;
   ;	
	?debug	L 320
	mov	word ptr [bp-8],0
   ;	
   ;		for(j=7; j>=l; j--)
   ;	
	?debug	L 321
	mov	dx,7
	lea	si,word ptr [bp-13]
	jmp	short @3@1122
@3@982:
   ;	
   ;		{low =  floatPC[j]&0x1;
   ;	
	?debug	L 322
	mov	al,byte ptr ss:[si]
	mov	ah,0
	and	ax,1
	mov	word ptr [bp-10],ax
   ;	
   ;		 floatPC[j] >>= 1;
   ;	
	?debug	L 323
	shr	byte ptr ss:[si],1
   ;	
   ;		 if(digit) floatPC[j] |=0x80;
   ;	
	?debug	L 324
	cmp	word ptr [bp-8],0
	je	short @3@1038
	or	byte ptr ss:[si],128
@3@1038:
   ;	
   ;		 digit=low;
   ;	
	?debug	L 325
	mov	ax,word ptr [bp-10]
	mov	word ptr [bp-8],ax
	?debug	L 321
	dec	si
	dec	dx
@3@1122:
	cmp	dx,cx
	jge	short @3@982
	?debug	L 319
	inc	di
	cmp	di,word ptr [bp-6]
	jl	short @3@926
@3@1206:
   ;	
   ;		}
   ;	  }
   ;	
   ;	
   ;	 float360[0] =(char)har;
   ;	
	?debug	L 330
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp-4]
	mov	byte ptr es:[bx],al
   ;	
   ;	 for(i=0; i<cnt; i++)
   ;	
	?debug	L 331
	xor	di,di
	lea	si,word ptr [bp-13]
	mov	dx,word ptr [bp+6]
	inc	dx
	cmp	di,word ptr [bp-2]
	jge	short @3@1430
@3@1290:
   ;	
   ;		float360[i+1] =floatPC[7-i];
   ;	
	?debug	L 332
	mov	al,byte ptr ss:[si]
	mov	es,word ptr [bp+8]
	mov	bx,dx
	mov	byte ptr es:[bx],al
	?debug	L 331
	dec	si
	inc	dx
	inc	di
	cmp	di,word ptr [bp-2]
	jl	short @3@1290
@3@1430:
   ;	
   ;	
   ;	}
   ;	
	?debug	L 334
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
	?debug	C E31E000A001A08
	?debug	C E60568617250431D02E8FF01190107666C6F6174+
	?debug	C 50431E02ECFF00036C6F770402F6FF0005646967+
	?debug	C 69740402F8FF00016C04080183005B0104010001+
	?debug	C 6B0402FAFF00016A0408012B015B010402000169+
	?debug	C 04080119009401040700036861720402FCFF0003+
	?debug	C 636E740402FEFF00047369676E0408013C00A700+
	?debug	C 04060008666C6F6174333630180A060000036650+
	?debug	C 431C0A0A00000470726563080A0E0000
	?debug	E
	?debug	E
_floatPC_to_float360	endp
DS360CD6_TEXT	ends
DS360CD6_DATA	segment word public use16 'FAR_DATA'
NU	label	word
	db	2 dup (?)
	?debug	C E9
	?debug	C FA5D010000
s@	label	byte
DS360CD6_DATA	ends
DS360CD6_TEXT	segment byte public use16 'CODE'
DS360CD6_TEXT	ends
	extrn	__turboFloat:word
	public	_float360_to_floatPC
	public	_floatPC_to_float360
	extrn	_MOVE_MEM_TO_360:far
	extrn	_MOVE_360_TO_MEM:far
	public	_CODE60
	extrn	_T00:far
_NU	equ	NU
	extrn	_PSW_ADRESS:word
	extrn	_PSW_CC:byte
	extrn	_PSW_ILC:word
	extrn	_R_FLOAT:qword
	extrn	_R:word
	extrn	_RQ_PRG:word
	extrn	_RETURN:word
_s@	equ	s@
	?debug	C EA010D
	?debug	C E31F00000023010400
	?debug	C EC145F666C6F61743336305F746F5F666C6F6174+
	?debug	C 50431F1800
	?debug	C E32000000023010400
	?debug	C EC145F666C6F617450435F746F5F666C6F617433+
	?debug	C 3630201800
	?debug	C E32100000023010400
	?debug	C EB105F4D4F56455F4D454D5F544F5F3336302100
	?debug	C E32200000023010400
	?debug	C EB105F4D4F56455F3336305F544F5F4D454D2200
	?debug	C E32300000023010400
	?debug	C EC075F434F44453630231800
	?debug	C E32400000023010400
	?debug	C EB045F5430302400
	?debug	C EB0B5F5053575F4144524553530C00
	?debug	C EB075F5053575F43430800
	?debug	C EB085F5053575F494C430400
	?debug	C E3250050001A10
	?debug	C EB085F525F464C4F41542500
	?debug	C E3260040001A0C
	?debug	C EB025F522600
	?debug	C EB075F52515F5052470400
	?debug	C EB075F52455455524E0400
	?debug	C E6024E55040000024600000666706F735F740606+
	?debug	C 021F000673697A655F740A06021A00
	end
