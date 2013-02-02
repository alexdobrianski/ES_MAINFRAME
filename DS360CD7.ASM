	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DS360CD7.C"
	?debug	C E9EF0B391E0A44533336304344372E43
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
DS360CD7_TEXT	segment byte public use16 'CODE'
DS360CD7_TEXT	ends
	assume	cs:DS360CD7_TEXT,ds:DS360CD7_DATA
DS360CD7_DATA	segment word public use16 'FAR_DATA'
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
DS360CD7_DATA	ends
DS360CD7_TEXT	segment byte public use16 'CODE'
	?debug	C E8010A44533336304344372E43EF0B391E
   ;	
   ;	 CODE70(char far *COM)
   ;	
	?debug	L 12
	assume	cs:DS360CD7_TEXT
_CODE70	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,DS360CD7_DATA
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
	sub	ax,112
	mov	bx,ax
	cmp	bx,15
	jbe short	@@12
	jmp	@1@1626
@@12:
	shl	bx,1
	jmp	word ptr cs:@1@C1666[bx]
@1@562:
   ;	
   ;		 {
   ;			case 0x70:          		           /* STD */
   ;																				 /* Плавающая точка
   ;																				 запись в память
   ;																				 удвоенная точность
   ;																				 */
   ;					floatPC_to_float360((BYTE far *)arr360, &R_FLOAT[R1], TRUE);
   ;	
	?debug	L 48
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
   ;					MOVE_MEM_TO_360(arr360,ADRESS,4l);
   ;	
	?debug	L 49
	push	4
	push	dword ptr d@w+42
	push	ds
	push	offset d@w+52
	call	far ptr _MOVE_MEM_TO_360
	add	sp,10
   ;	
   ;					///T();
   ;					break;
   ;	
	?debug	L 51
	pop	ds
	pop	si
	pop	bp
	ret	
@1@590:
   ;	
   ;	
   ;			case 0x71:
   ;					T00(COM[0]);
   ;	
	?debug	L 54
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 55
	pop	ds
	pop	si
	pop	bp
	ret	
@1@618:
   ;	
   ;	
   ;			case 0x72:
   ;					T00(COM[0]);
   ;	
	?debug	L 58
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 59
	pop	ds
	pop	si
	pop	bp
	ret	
@1@646:
   ;	
   ;	
   ;			case 0x73:
   ;					T00(COM[0]);
   ;	
	?debug	L 62
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 63
	pop	ds
	pop	si
	pop	bp
	ret	
@1@674:
   ;	
   ;	
   ;			case 0x74:
   ;					T00(COM[0]);
   ;	
	?debug	L 66
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 67
	pop	ds
	pop	si
	pop	bp
	ret	
@1@702:
   ;	
   ;	
   ;			case 0x75:
   ;					T00(COM[0]);
   ;	
	?debug	L 70
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 71
	pop	ds
	pop	si
	pop	bp
	ret	
@1@730:
   ;	
   ;	
   ;			case 0x76:
   ;					T00(COM[0]);
   ;	
	?debug	L 74
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 75
	pop	ds
	pop	si
	pop	bp
	ret	
@1@758:
   ;	
   ;	
   ;			case 0x77:
   ;					T00(COM[0]);
   ;	
	?debug	L 78
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 79
	pop	ds
	pop	si
	pop	bp
	ret	
@1@786:
   ;	
   ;	
   ;			case 0x78:                         /* LD */
   ;																				 /*Загрузка удвоенная точность
   ;																				 */
   ;					arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
   ;	
	?debug	L 84
	mov	byte ptr d@w+52+4,0
	mov	byte ptr d@w+52+5,0
	mov	byte ptr d@w+52+6,0
	mov	byte ptr d@w+52+7,0
   ;	
   ;					MOVE_360_TO_MEM(ADRESS,arr360,4l);
   ;	
	?debug	L 85
	push	4
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &R_FLOAT[R1], TRUE);
   ;	
	?debug	L 87
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
   ;	
   ;					break;
   ;	
	?debug	L 89
	pop	ds
	pop	si
	pop	bp
	ret	
@1@814:
   ;	
   ;	
   ;			case 0x79:                         /* CD */
   ;																				 /*
   ;																				 сравнение удвоенная точность
   ;																				 */
   ;	
   ;					///T();
   ;					arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
   ;	
	?debug	L 97
	mov	byte ptr d@w+52+4,0
	mov	byte ptr d@w+52+5,0
	mov	byte ptr d@w+52+6,0
	mov	byte ptr d@w+52+7,0
   ;	
   ;					MOVE_360_TO_MEM(ADRESS,arr360,4l);
   ;	
	?debug	L 98
	push	4
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 100
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
	?debug	L 101
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
	?debug	L 102
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
	?debug	L 103
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
   ;			case 0x7a:                         /* AD */
   ;																				 /* сложение с нормализацией
   ;																				 удвоенная точнасть
   ;																				 */
   ;					///T();
   ;					arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
   ;	
	?debug	L 112
	mov	byte ptr d@w+52+4,0
	mov	byte ptr d@w+52+5,0
	mov	byte ptr d@w+52+6,0
	mov	byte ptr d@w+52+7,0
   ;	
   ;					MOVE_360_TO_MEM(ADRESS,arr360,4l);
   ;	
	?debug	L 113
	push	4
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 115
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
	?debug	L 116
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
	?debug	L 117
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
	?debug	L 118
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
	?debug	L 119
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
   ;					///T();
   ;					break;
   ;	
   ;			case 0x7b:                         /* SD */
   ;																				 /*
   ;																				 вычитание с нормализацией
   ;																				 удвоенная точность
   ;																				 */
   ;					///T();
   ;					arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
   ;	
	?debug	L 130
	mov	byte ptr d@w+52+4,0
	mov	byte ptr d@w+52+5,0
	mov	byte ptr d@w+52+6,0
	mov	byte ptr d@w+52+7,0
   ;	
   ;					MOVE_360_TO_MEM(ADRESS,arr360,4l);
   ;	
	?debug	L 131
	push	4
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 133
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
	?debug	L 134
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
	?debug	L 135
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
	?debug	L 136
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
	?debug	L 137
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
   ;			case 0x7c:                         /* MD  */
   ;																				 /*
   ;																				 умножение удвоенная точность
   ;																				 */
   ;					///T();
   ;					arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
   ;	
	?debug	L 146
	mov	byte ptr d@w+52+4,0
	mov	byte ptr d@w+52+5,0
	mov	byte ptr d@w+52+6,0
	mov	byte ptr d@w+52+7,0
   ;	
   ;					MOVE_360_TO_MEM(ADRESS,arr360,4l);
   ;	
	?debug	L 147
	push	4
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
   ;					///T();
   ;					break;
   ;	
	?debug	L 152
	fwait	
	pop	ds
	pop	si
	pop	bp
	ret	
@1@1262:
   ;	
   ;			case 0x7d:                         /* DD  */
   ;																				 /*
   ;																				 деление удвоенная точность
   ;																				 */
   ;					///T();
   ;					arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
   ;	
	?debug	L 158
	mov	byte ptr d@w+52+4,0
	mov	byte ptr d@w+52+5,0
	mov	byte ptr d@w+52+6,0
	mov	byte ptr d@w+52+7,0
   ;	
   ;					MOVE_360_TO_MEM(ADRESS,arr360,4l);
   ;	
	?debug	L 159
	push	4
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 161
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
	?debug	L 162
	fld	tbyte ptr d@w+60
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@1318
   ;	
   ;						{RQ_PRG=0x000f;RETURN=1;return;
   ;	
	?debug	L 163
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
	?debug	L 165
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
   ;					///T();
   ;					break;
   ;			case 0x7e:                         /*  AW */
   ;																				 /*
   ;																				 сложение без нормализации
   ;																				 удвоенная точность
   ;																				 */
   ;					///T();
   ;					arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
   ;	
	?debug	L 174
	mov	byte ptr d@w+52+4,0
	mov	byte ptr d@w+52+5,0
	mov	byte ptr d@w+52+6,0
	mov	byte ptr d@w+52+7,0
   ;	
   ;					MOVE_360_TO_MEM(ADRESS,arr360,4l);
   ;	
	?debug	L 175
	push	4
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 177
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
	?debug	L 178
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
	?debug	L 179
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
	?debug	L 180
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
	?debug	L 181
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
   ;			case 0x7f:                         /*  SW */
   ;																				 /*
   ;																				 вычитание без нормализации
   ;																				 удвоенная точность
   ;																				 */
   ;						 ///	T();
   ;					arr360[4]=0;arr360[5]=0;arr360[6]=0;arr360[7]=0;
   ;	
	?debug	L 190
	mov	byte ptr d@w+52+4,0
	mov	byte ptr d@w+52+5,0
	mov	byte ptr d@w+52+6,0
	mov	byte ptr d@w+52+7,0
   ;	
   ;					MOVE_360_TO_MEM(ADRESS,arr360,4l);
   ;	
	?debug	L 191
	push	4
	push	ds
	push	offset d@w+52
	push	dword ptr d@w+42
	call	far ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;					Dtaret;
   ;					float360_to_floatPC((BYTE far *)arr360, &f_work, TRUE);
   ;	
	?debug	L 193
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
	?debug	L 194
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
	?debug	L 195
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
	?debug	L 196
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
	?debug	L 197
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
	?debug	L 202
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E3190008001A08
	?debug	C E31A000400160C00
	?debug	C E31B000400160600
	?debug	C E606665F776F726B100000023C00012100066172+
	?debug	C 7233363019000002340001200001690400000232+
	?debug	C 00011F000261720C0000022E00011E0006414452+
	?debug	C 4553530C0000022A00011D0004555252321A0000+
	?debug	C 022600011C0004555252311A0000022200011B00+
	?debug	C 05555252455A0C0000021E00011A00045252455A+
	?debug	C 060000021A000119000352455A1B000002160001+
	?debug	C 1800035252321B0000021200011700035252311B+
	?debug	C 0000020E00011600034444440A0000020C000114+
	?debug	C 00024444080000020B0001130002424408000002+
	?debug	C 0A00011200024953040000020800010F00024232+
	?debug	C 040000020600010F00025232040000020400010F+
	?debug	C 00025231040000020200010F0002525808000002+
	?debug	C 0100010E00025252080000020000010D0003434F+
	?debug	C 4D180A060000
	?debug	E
	?debug	E
_CODE70	endp
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
DS360CD7_TEXT	ends
DS360CD7_DATA	segment word public use16 'FAR_DATA'
NU	label	word
	db	2 dup (?)
	?debug	C E9
	?debug	C FA01000000
s@	label	byte
DS360CD7_DATA	ends
DS360CD7_TEXT	segment byte public use16 'CODE'
DS360CD7_TEXT	ends
	extrn	__turboFloat:word
	extrn	_float360_to_floatPC:far
	extrn	_floatPC_to_float360:far
	extrn	_MOVE_MEM_TO_360:far
	extrn	_MOVE_360_TO_MEM:far
	public	_CODE70
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
	?debug	C E31C00000023010400
	?debug	C EB145F666C6F61743336305F746F5F666C6F6174+
	?debug	C 50431C00
	?debug	C E31D00000023010400
	?debug	C EB145F666C6F617450435F746F5F666C6F617433+
	?debug	C 36301D00
	?debug	C E31E00000023010400
	?debug	C EB105F4D4F56455F4D454D5F544F5F3336301E00
	?debug	C E31F00000023010400
	?debug	C EB105F4D4F56455F3336305F544F5F4D454D1F00
	?debug	C E32000000023010400
	?debug	C EC075F434F44453730201800
	?debug	C E32100000023010400
	?debug	C EB045F5430302100
	?debug	C EB0B5F5053575F4144524553530C00
	?debug	C EB075F5053575F43430800
	?debug	C EB085F5053575F494C430400
	?debug	C E3220050001A10
	?debug	C EB085F525F464C4F41542200
	?debug	C E3230040001A0C
	?debug	C EB025F522300
	?debug	C EB075F52515F5052470400
	?debug	C EB075F52455455524E0400
	?debug	C E6024E55040000024600000666706F735F740606+
	?debug	C 021F000673697A655F740A06021A00
	end
