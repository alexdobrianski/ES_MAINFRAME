	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DS360CDG.C"
	?debug	C E92398951D0A44533336304344472E43
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
DS360CDG_TEXT	segment byte public use16 'CODE'
DS360CDG_TEXT	ends
	assume	cs:DS360CDG_TEXT,ds:DS360CDG_DATA
DS360CDG_DATA	segment word public use16 'FAR_DATA'
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
DS360CDG_DATA	ends
DS360CDG_TEXT	segment byte public use16 'CODE'
	?debug	C E8010A44533336304344472E432398951D
   ;	
   ;	 CODEGG(char far *COM)
   ;	
	?debug	L 10
	assume	cs:DS360CDG_TEXT
_CODEGG	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360CDG_DATA
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
   ;		T00(COM[0]);
   ;	
	?debug	L 41
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	push	ax
	call	far ptr _T00
	add	sp,2
   ;	
   ;	}
   ;	
	?debug	L 42
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
_CODEGG	endp
DS360CDG_TEXT	ends
DS360CDG_DATA	segment word public use16 'FAR_DATA'
NU	label	word
	db	2 dup (?)
	?debug	C E9
	?debug	C FA00000000
s@	label	byte
DS360CDG_DATA	ends
DS360CDG_TEXT	segment byte public use16 'CODE'
DS360CDG_TEXT	ends
	public	_CODEGG
	extrn	_T00:far
_NU	equ	NU
	extrn	_PSW_ADRESS:word
	extrn	_PSW_ILC:word
	extrn	_R:word
_s@	equ	s@
	?debug	C EA010D
	?debug	C E31B00000023010400
	?debug	C EC075F434F444547471B1800
	?debug	C E31C00000023010400
	?debug	C EB045F5430301C00
	?debug	C EB0B5F5053575F4144524553530C00
	?debug	C EB085F5053575F494C430400
	?debug	C E31D0040001A0C
	?debug	C EB025F521D00
	?debug	C E6024E55040000024000000666706F735F740606+
	?debug	C 021F000673697A655F740A06021A00
	end
