	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DS360CD3.C"
	?debug	C E96F0B391E0A44533336304344332E43
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
DS360CD3_TEXT	segment byte public use16 'CODE'
DS360CD3_TEXT	ends
	assume	cs:DS360CD3_TEXT,ds:DS360CD3_DATA
DS360CD3_DATA	segment word public use16 'FAR_DATA'
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
	db	2 dup (?)
	db	2 dup (?)
DS360CD3_DATA	ends
DS360CD3_TEXT	segment byte public use16 'CODE'
	?debug	C E8010A44533336304344332E436F0B391E
   ;	
   ;	 CODE30(char far *COM)
   ;	
	?debug	L 12
	assume	cs:DS360CD3_TEXT
_CODE30	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,DS360CD3_DATA
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
   ;	 static int i,j;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 GET_OPERAND_RR;
   ;	
	?debug	L 35
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+0,al
 	ror	 ax,4
	mov	byte ptr d@w+2,al
 	shr	 ax,12
	mov	byte ptr d@w+4,al
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 36
	mov	ax,seg _PSW_ILC
	mov	es,ax
	movsx	eax,word ptr es:_PSW_ILC
	mov	dx,seg _PSW_ADRESS
	mov	es,dx
	add	dword ptr es:_PSW_ADRESS,eax
   ;	
   ;	 switch(COM[0])
   ;	
	?debug	L 37
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	sub	ax,48
	mov	bx,ax
	cmp	bx,15
	jbe short	@@8
	jmp	@1@1626
@@8:
	shl	bx,1
	jmp	word ptr cs:@1@C1874[bx]
@1@254:
   ;	
   ;		 {
   ;			case 0x30:          		           /* LPDR */
   ;																				 /* Плавающая точка
   ;																				 загрузка положительная
   ;																				 удвоенная точность
   ;																				 */
   ;					///T();
   ;					PSW_CC=2;
   ;	
	?debug	L 45
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
   ;	
   ;					R_FLOAT[R1]=R_FLOAT[R2];
   ;	
	?debug	L 46
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fstp	tbyte ptr es:_R_FLOAT[bx]
   ;	
   ;					if (R_FLOAT[R1]==0.0) PSW_CC=0;
   ;	
	?debug	L 47
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@310
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@310:
   ;	
   ;					else  ((char *)R_FLOAT[R1])[9]|=0x80;
   ;	
	?debug	L 48
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	call	far ptr F_FTOL@
	shl	eax,16
	shrd	eax,edx,16
	mov	ebx,eax
	or	byte ptr [bx+9],128
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@338:
   ;	
   ;					///T();
   ;					break;
   ;	
   ;			case 0x31:                         /* LNDR */
   ;																				 /*
   ;																				 Загрузка отрицательная
   ;																				 удвоенная точнасть
   ;																				 */
   ;	
   ;					///T();
   ;					PSW_CC=1;
   ;	
	?debug	L 59
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
   ;	
   ;					R_FLOAT[R1]=R_FLOAT[R2];
   ;	
	?debug	L 60
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fstp	tbyte ptr es:_R_FLOAT[bx]
   ;	
   ;					if (R_FLOAT[R1]==0.0) PSW_CC=0;
   ;	
	?debug	L 61
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@394
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@394:
   ;	
   ;					else ((char *)R_FLOAT[R1])[9]|=0x80;
   ;	
	?debug	L 62
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	call	far ptr F_FTOL@
	shl	eax,16
	shrd	eax,edx,16
	mov	ebx,eax
	or	byte ptr [bx+9],128
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@422:
   ;	
   ;					///T();
   ;					break;
   ;	
   ;			case 0x32:                         /* LTDR */
   ;																				 /*
   ;																				 Загрузка и проверка удвоенной
   ;																				 точности
   ;																				 */
   ;					///T();
   ;					R_FLOAT[R1]=R_FLOAT[R2];
   ;	
	?debug	L 72
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fstp	tbyte ptr es:_R_FLOAT[bx]
   ;	
   ;					if (R_FLOAT[R1]==0.0) PSW_CC=0;
   ;	
	?debug	L 73
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@478
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@478:
   ;	
   ;					else if (R_FLOAT[R1]<0.0) PSW_CC=1;
   ;	
	?debug	L 74
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jbe	short @1@534
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@534:
   ;	
   ;							else PSW_CC=2;
   ;	
	?debug	L 75
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@562:
   ;	
   ;					///T();
   ;					break;
   ;	
   ;			case 0x33:                         /* LCDR */
   ;																				 /*
   ;																				 Загрузка дополненная удвоенной
   ;																				 точности
   ;																				 */
   ;					///T();
   ;					R_FLOAT[R1]=-R_FLOAT[R2];
   ;	
	?debug	L 85
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fchs	
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fstp	tbyte ptr es:_R_FLOAT[bx]
   ;	
   ;					if (R_FLOAT[R1]==0.0) PSW_CC=0;
   ;	
	?debug	L 86
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@618
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@618:
   ;	
   ;					else if (R_FLOAT[R1]<0.0) PSW_CC=1;
   ;	
	?debug	L 87
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jbe	short @1@674
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@674:
   ;	
   ;							else PSW_CC=2;
   ;	
	?debug	L 88
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@702:
   ;	
   ;	
   ;					///T();
   ;					break;
   ;	
   ;			case 0x34:                         /* HDR  */
   ;																				 /*
   ;																				 ПОПОЛАМ второй операнд делится
   ;																				 пополам и помещается
   ;																				 на место второго
   ;																				 */
   ;					///T();
   ;					R_FLOAT[R1]=R_FLOAT[R2]/2.0;
   ;	
	?debug	L 100
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fdiv	dword ptr s@
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fstp	tbyte ptr es:_R_FLOAT[bx]
   ;	
   ;					///T();
   ;					break;
   ;	
	?debug	L 102
	fwait	
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@730:
   ;	
   ;	
   ;			case 0x35:                         /*  Неопределенный код операции */
   ;					//T();
   ;					break;
   ;	
   ;			case 0x36:                         /* НКО */
   ;					T();
   ;	
	?debug	L 109
	call	far ptr _T
   ;	
   ;					break;
   ;	
	?debug	L 110
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@758:
   ;	
   ;	
   ;			case 0x37:                         /* НКО */
   ;					T();
   ;	
	?debug	L 113
	call	far ptr _T
   ;	
   ;					break;
   ;	
	?debug	L 114
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@786:
   ;	
   ;	
   ;			case 0x38:                         /* LDR */
   ;																				 /*Загрузка удвоенная точность
   ;																				 */
   ;					///T();
   ;					R_FLOAT[R1]=R_FLOAT[R2];
   ;	
	?debug	L 120
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fstp	tbyte ptr es:_R_FLOAT[bx]
   ;	
   ;					///T();
   ;					break;
   ;	
	?debug	L 122
	fwait	
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@814:
   ;	
   ;	
   ;			case 0x39:                         /* CDR */
   ;																				 /*
   ;																				 сравнение удвоенная точность
   ;																				 */
   ;					///T();
   ;					if (R_FLOAT[R1]==R_FLOAT[R2]) PSW_CC=0;
   ;	
	?debug	L 129
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	di,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@870
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@870:
   ;	
   ;					else if (R_FLOAT[R1]<R_FLOAT[R2]) PSW_CC=1;
   ;	
	?debug	L 130
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[si]
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[di]
	fcompp
	fstsw	ax
	sahf	
	jbe	short @1@926
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@926:
   ;	
   ;							else PSW_CC=2;
   ;	
	?debug	L 131
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@954:
   ;	
   ;					///T();
   ;					break;
   ;	
   ;			case 0x3a:                         /* ADR */
   ;																				 /* сложение с нормализацией
   ;																				 удвоенная точнасть
   ;																				 */
   ;					///T();
   ;					R_FLOAT[R1]+=R_FLOAT[R2];
   ;	
	?debug	L 140
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fadd	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
   ;	
   ;					if (R_FLOAT[R1]==0.0) PSW_CC=0;
   ;	
	?debug	L 141
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
	pop	di
	pop	si
	pop	bp
	ret	
@1@1010:
   ;	
   ;					else if (R_FLOAT[R1]<0.0) PSW_CC=1;
   ;	
	?debug	L 142
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
	pop	di
	pop	si
	pop	bp
	ret	
@1@1066:
   ;	
   ;							else PSW_CC=2;
   ;	
	?debug	L 143
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@1094:
   ;	
   ;					///T();
   ;					break;
   ;	
   ;			case 0x3b:                         /* SDR */
   ;																				 /*
   ;																				 вычитание с нормализацией
   ;																				 удвоенная точность
   ;																				 */
   ;					///T();
   ;					R_FLOAT[R1]-=R_FLOAT[R2];
   ;	
	?debug	L 153
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fsubr	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
   ;	
   ;					if (R_FLOAT[R1]==0.0) PSW_CC=0;
   ;	
	?debug	L 154
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
	pop	di
	pop	si
	pop	bp
	ret	
@1@1150:
   ;	
   ;					else if (R_FLOAT[R1]<0.0) PSW_CC=1;
   ;	
	?debug	L 155
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
	pop	di
	pop	si
	pop	bp
	ret	
@1@1206:
   ;	
   ;							else PSW_CC=2;
   ;	
	?debug	L 156
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@1234:
   ;	
   ;					///T();
   ;					break;
   ;	
   ;			case 0x3c:                         /* MDR  */
   ;																				 /*
   ;																				 умножение удвоенная точность
   ;																				 */
   ;					///T();
   ;					R_FLOAT[R1]*=R_FLOAT[R2];
   ;	
	?debug	L 165
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fmul	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
   ;	
   ;					///T();
   ;					break;
   ;	
	?debug	L 167
	fwait	
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@1262:
   ;	
   ;			case 0x3d:                         /* DDR  */
   ;																				 /*
   ;																				 деление удвоенная точность
   ;																				 */
   ;					///T();
   ;					if (R_FLOAT[R2]==0.0)
   ;	
	?debug	L 173
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	di,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fldz	
	fcompp
	fstsw	ax
	sahf	
	jne	short @1@1318
   ;	
   ;						{RQ_PRG=0x000f;RETURN=1;return;
   ;	
	?debug	L 174
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,15
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@1318:
   ;	
   ;						}
   ;					else R_FLOAT[R1]/=R_FLOAT[R2];
   ;	
	?debug	L 176
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fld	tbyte ptr es:_R_FLOAT[di]
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fdivr	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
	fwait	
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@1346:
   ;	
   ;					///T();
   ;					break;
   ;			case 0x3e:                         /*  AWR */
   ;																				 /*
   ;																				 сложение без нормализации
   ;																				 удвоенная точность
   ;																				 */
   ;					///T();
   ;					R_FLOAT[R1]+=R_FLOAT[R2];
   ;	
	?debug	L 185
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fadd	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
   ;	
   ;					if (R_FLOAT[R1]==0.0) PSW_CC=0;
   ;	
	?debug	L 186
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
	pop	di
	pop	si
	pop	bp
	ret	
@1@1402:
   ;	
   ;					else if (R_FLOAT[R1]<0.0) PSW_CC=1;
   ;	
	?debug	L 187
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
	pop	di
	pop	si
	pop	bp
	ret	
@1@1458:
   ;	
   ;							else PSW_CC=2;
   ;	
	?debug	L 188
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@1@1486:
   ;	
   ;					///T();
   ;					break;
   ;			case 0x3f:                         /*  SWR */
   ;																				 /*
   ;																				 вычитание без нормализации
   ;																				 удвоенная точность
   ;																				 */
   ;					///T();
   ;					R_FLOAT[R1]-=R_FLOAT[R2];
   ;	
	?debug	L 197
	mov	ax,word ptr d@w+4
	mov	dx,10
	imul	dx
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	mov	ax,word ptr d@w+2
	mov	dx,10
	imul	dx
	mov	si,ax
	mov	dx,seg _R_FLOAT
	mov	bx,ax
	mov	es,dx
	fld	tbyte ptr es:_R_FLOAT[bx]
	fsubr	
	mov	ax,seg _R_FLOAT
	mov	es,ax
	fstp	tbyte ptr es:_R_FLOAT[si]
   ;	
   ;					if (R_FLOAT[R1]==0.0) PSW_CC=0;
   ;	
	?debug	L 198
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
	pop	di
	pop	si
	pop	bp
	ret	
@1@1542:
   ;	
   ;					else if (R_FLOAT[R1]<0.0) PSW_CC=1;
   ;	
	?debug	L 199
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
	pop	di
	pop	si
	pop	bp
	ret	
@1@1598:
   ;	
   ;							else PSW_CC=2;
   ;	
	?debug	L 200
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
@1@1626:
   ;	
   ;					///T();
   ;					break;
   ;		 }
   ;	}
   ;	
	?debug	L 204
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
	?debug	C E319000400160C00
	?debug	C E31A000400160600
	?debug	C E6016A040000023000011E000169040000022E00+
	?debug	C 011E00064144524553530C0000022A00011D0004+
	?debug	C 55525232190000022600011C0004555252311900+
	?debug	C 00022200011B0005555252455A0C0000021E0001+
	?debug	C 1A00045252455A060000021A000119000352455A+
	?debug	C 1A0000021600011800035252321A000002120001+
	?debug	C 1700035252311A0000020E00011600034444440A+
	?debug	C 0000020C00011400024444080000020B00011300+
	?debug	C 024244080000020A000112000249530400000208+
	?debug	C 00010F00024232040000020600010F0002523204+
	?debug	C 0000020400010F00025231040000020200010F00+
	?debug	C 025258080000020100010E000252520800000200+
	?debug	C 00010D0003434F4D180A060000
	?debug	E
	?debug	E
_CODE30	endp
	db	1 dup (?)
@1@C1874	label	word
	dw	@1@254
	dw	@1@338
	dw	@1@422
	dw	@1@562
	dw	@1@702
	dw	@1@1626
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
DS360CD3_TEXT	ends
DS360CD3_DATA	segment word public use16 'FAR_DATA'
NU	label	word
	db	2 dup (?)
	?debug	C E9
	?debug	C FA01000000
s@	label	byte
	db	0
	db	0
	db	0
	db	'@'
DS360CD3_DATA	ends
DS360CD3_TEXT	segment byte public use16 'CODE'
DS360CD3_TEXT	ends
	extrn	__turboFloat:word
	extrn	F_FTOL@:far
	public	_CODE30
	extrn	_T:far
_NU	equ	NU
	extrn	_PSW_ADRESS:word
	extrn	_PSW_CC:byte
	extrn	_PSW_ILC:word
	extrn	_R_FLOAT:qword
	extrn	_RQ_PRG:word
	extrn	_RETURN:word
_s@	equ	s@
	?debug	C EA010D
	?debug	C E31B00000023040500
	?debug	C EB07465F46544F4C401B00
	?debug	C E31C00000023010400
	?debug	C EC075F434F444533301C1800
	?debug	C E31D00000023010400
	?debug	C EB025F541D00
	?debug	C EB0B5F5053575F4144524553530C00
	?debug	C EB075F5053575F43430800
	?debug	C EB085F5053575F494C430400
	?debug	C E31E0050001A10
	?debug	C EB085F525F464C4F41541E00
	?debug	C EB075F52515F5052470400
	?debug	C EB075F52455455524E0400
	?debug	C E6024E55040000023200000666706F735F740606+
	?debug	C 021F000673697A655F740A06021A00
	end
