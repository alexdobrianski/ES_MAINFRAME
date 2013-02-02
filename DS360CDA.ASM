	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DS360CDA.C"
	?debug	C E92C80951D0A44533336304344412E43
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
	?debug	C E9F8803A1E0A44533336305053572E48
	?debug	C E952BB30230A445333363044464E2E48
DS360CDA_TEXT	segment byte public use16 'CODE'
DS360CDA_TEXT	ends
	assume	cs:DS360CDA_TEXT,ds:DS360CDA_DATA
DS360CDA_DATA	segment word public use16 'FAR_DATA'
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
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
DS360CDA_DATA	ends
DS360CDA_TEXT	segment byte public use16 'CODE'
	?debug	C E8010A44533336304344412E432C80951D
   ;	
   ;	 CODEA0(char far *COM)
   ;	
	?debug	L 10
	assume	cs:DS360CDA_TEXT
_CODEA0	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360CDA_DATA
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
   ;	 static long *RR1;
   ;	 static long *RR2;
   ;	 static long *REZ;
   ;	 static long RREZ;
   ;	 static unsigned long URREZ;
   ;	 static unsigned long URREZ_AL;
   ;	 static unsigned long URREZ_WORK;
   ;	 static unsigned long URREZ2;
   ;	 static unsigned long URREZ3;
   ;	 static unsigned int FLA;
   ;	
   ;	 static unsigned long *URR1;
   ;	 static unsigned long *URR2;
   ;	 static unsigned long ADRESS;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	
   ;	 GET_OPERAND_SI;
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
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @1@310
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
	mov	dword ptr d@w+60,eax
	jmp	short @1@366
@1@310:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+60,eax
@1@366:
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
	sub	ax,160
	mov	bx,ax
	cmp	bx,15
	jbe short	@@13
	jmp	@1@954
@@13:
	shl	bx,1
	jmp	word ptr cs:@1@C786[bx]
@1@478:
   ;	
   ;		 {
   ;			case 0xa0:
   ;					T00(COM[0]);
   ;	
	?debug	L 44
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 45
	pop	ds
	pop	bp
	ret	
@1@506:
   ;	
   ;			case 0xa1:
   ;					T00(COM[0]);
   ;	
	?debug	L 47
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 48
	pop	ds
	pop	bp
	ret	
@1@534:
   ;	
   ;			case 0xa2:
   ;					T00(COM[0]);
   ;	
	?debug	L 50
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 51
	pop	ds
	pop	bp
	ret	
@1@562:
   ;	
   ;			case 0xa3:
   ;					T00(COM[0]);
   ;	
	?debug	L 53
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 54
	pop	ds
	pop	bp
	ret	
@1@590:
   ;	
   ;			case 0xa4:
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
	pop	bp
	ret	
@1@618:
   ;	
   ;			case 0xa5:
   ;					T00(COM[0]);
   ;	
	?debug	L 59
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 60
	pop	ds
	pop	bp
	ret	
@1@646:
   ;	
   ;			case 0xa6:
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
	pop	bp
	ret	
@1@674:
   ;	
   ;			case 0xa7:
   ;					T00(COM[0]);
   ;	
	?debug	L 65
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 66
	pop	ds
	pop	bp
	ret	
@1@702:
   ;	
   ;			case 0xa8:
   ;					 T00(COM[0]);
   ;	
	?debug	L 68
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					 break;
   ;	
	?debug	L 69
	pop	ds
	pop	bp
	ret	
@1@730:
   ;	
   ;			case 0xa9:
   ;					T00(COM[0]);
   ;	
	?debug	L 71
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 72
	pop	ds
	pop	bp
	ret	
@1@758:
   ;	
   ;			case 0xaa:
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
	pop	bp
	ret	
@1@786:
   ;	
   ;			case 0xab:
   ;					T00(COM[0]);
   ;	
	?debug	L 77
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;					break;
   ;	
	?debug	L 78
	pop	ds
	pop	bp
	ret	
@1@814:
   ;	
   ;			case 0xac:
   ;					T();
   ;	
	?debug	L 80
	call	far ptr _T
   ;	
   ;					break;
   ;	
	?debug	L 81
	pop	ds
	pop	bp
	ret	
@1@842:
   ;	
   ;			case 0xad:
   ;					T();
   ;	
	?debug	L 83
	call	far ptr _T
   ;	
   ;					break;
   ;	
	?debug	L 84
	pop	ds
	pop	bp
	ret	
@1@870:
   ;	
   ;			case 0xae:
   ;					T();
   ;	
	?debug	L 86
	call	far ptr _T
   ;	
   ;					break;
   ;	
	?debug	L 87
	pop	ds
	pop	bp
	ret	
@1@898:
   ;	
   ;			case 0xaf:
   ;					if (R370[8]&(0x8000>>RX))
   ;	
	?debug	L 89
	mov	ax,000008000h
	mov	cl,byte ptr d@+1
	shr	ax,cl
	movzx	eax,ax
	mov	dx,seg _R370
	mov	es,dx
	test	eax,dword ptr es:_R370+32
	je	short @1@954
   ;	
   ;						{
   ;						 RQ_PRG=0x0040;
   ;	
	?debug	L 91
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,64
   ;	
   ;						 RETURN=1;
   ;	
	?debug	L 92
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
   ;	
   ;						 PUT_BYTE(149l,RX);
   ;	
	?debug	L 93
	mov	al,byte ptr d@+1
	push	ax
	push	large 149
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;						 PUT_BYTE(148l,0);
   ;	
	?debug	L 94
	push	0
	push	large 148
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;						 PUT_WORD(156l,(unsigned long)ADRESS);
   ;	
	?debug	L 95
	push	dword ptr d@w+60
	push	large 156
	call	far ptr _PUT_WORD
	add	sp,8
@1@954:
   ;	
   ;						}
   ;					//T();
   ;					break;
   ;	
   ;		 }
   ;	}
   ;	
	?debug	L 101
	pop	ds
	pop	bp
	ret	
	?debug	C E319000400160C00
	?debug	C E31A000400160600
	?debug	C E6064144524553530C0000023C00012100045552+
	?debug	C 5232190000023800012000045552523119000002+
	?debug	C 3400011F0003464C410A0000023200011D000655+
	?debug	C 5252455A330C0000022E00011C0006555252455A+
	?debug	C 320C0000022A00011B000A555252455A5F574F52+
	?debug	C 4B0C0000022600011A0008555252455A5F414C0C+
	?debug	C 000002220001190005555252455A0C0000021E00+
	?debug	C 011800045252455A060000021A00011700035245+
	?debug	C 5A1A0000021600011600035252321A0000021200+
	?debug	C 011500035252311A0000020E0001140003444444+
	?debug	C 0A0000020C00011200024444080000020B000111+
	?debug	C 00024244080000020A0001100002495304000002+
	?debug	C 0800010D00024232040000020600010D00025232+
	?debug	C 040000020400010D00025231040000020200010D+
	?debug	C 00025258080000020100010C0002525208000002+
	?debug	C 0000010B0003434F4D180A060000
	?debug	E
	?debug	E
_CODEA0	endp
@1@C786	label	word
	dw	@1@478
	dw	@1@506
	dw	@1@534
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
	dw	@1@842
	dw	@1@870
	dw	@1@898
DS360CDA_TEXT	ends
DS360CDA_DATA	segment word public use16 'FAR_DATA'
NU	label	word
	db	2 dup (?)
	?debug	C E9
	?debug	C FA01000000
s@	label	byte
DS360CDA_DATA	ends
DS360CDA_TEXT	segment byte public use16 'CODE'
DS360CDA_TEXT	ends
	public	_CODEA0
	extrn	_PUT_WORD:far
	extrn	_PUT_BYTE:far
	extrn	_T00:far
	extrn	_T:far
_NU	equ	NU
	extrn	_PSW_ADRESS:word
	extrn	_PSW_ILC:word
	extrn	_R:word
	extrn	_R370:word
	extrn	_RQ_PRG:word
	extrn	_RETURN:word
_s@	equ	s@
	?debug	C EA010D
	?debug	C E31B00000023010400
	?debug	C EC075F434F444541301B1800
	?debug	C E31C00000023010400
	?debug	C EB095F5055545F574F52441C00
	?debug	C E31D00000023010400
	?debug	C EB095F5055545F425954451D00
	?debug	C E31E00000023010400
	?debug	C EB045F5430301E00
	?debug	C E31F00000023010400
	?debug	C EB025F541F00
	?debug	C EB0B5F5053575F4144524553530C00
	?debug	C EB085F5053575F494C430400
	?debug	C E3200040001A0C
	?debug	C EB025F522000
	?debug	C E3210040001A0C
	?debug	C EB055F523337302100
	?debug	C EB075F52515F5052470400
	?debug	C EB075F52455455524E0400
	?debug	C E6024E55040000024000000666706F735F740606+
	?debug	C 021F000673697A655F740A06021A00
	end
