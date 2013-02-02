	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DS360CDF.C"
	?debug	C E94DB34A220A44533336304344462E43
	?debug	C E92A0426230A44533336304F50542E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C53+
	?debug	C 5444494F2E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 444546532E48
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 4E46494C452E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 4E554C4C2E48
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C53+
	?debug	C 54444C49422E48
	?debug	C E94019CA1819433A5C424F524C414E44435C494E434C5544455C4D+
	?debug	C 454D2E48
	?debug	C E94019CA1819433A5C424F524C414E44435C494E434C5544455C44+
	?debug	C 4F532E48
	?debug	C E94019CA1818433A5C424F524C414E44435C494E434C5544455C49+
	?debug	C 4F2E48
	?debug	C E94019CA181F433A5C424F524C414E44435C494E434C5544455C5C+
	?debug	C 5359535C535441542E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C46+
	?debug	C 434E544C2E48
	?debug	C E94019CA181A433A5C424F524C414E44435C494E434C5544455C54+
	?debug	C 494D452E48
	?debug	C E9F8803A1E0A44533336305053572E48
	?debug	C E952BB30230A445333363044464E2E48
DS360CDF_TEXT	segment byte public use16 'CODE'
DS360CDF_TEXT	ends
	assume	cs:DS360CDF_TEXT,ds:DS360CDF_DATA
DS360CDF_DATA	segment word public use16 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
	db	4 dup (?)
	db	2 dup (?)
	db	136
	db	89
	db	114
	db	17
	db	4 dup (0)
	db	4 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	3
	db	7
	db	1
	db	2
	db	5
	db	6
	db	9
	db	5
	db	8
	db	9
	db	8
	db	0
	db	1
	db	4
	db	5
	db	1
	db	2 dup (0)
	db	2 dup (0)
	db	84
	db	98
	db	98
	db	32
	db	34
	db	27
	db	90
	db	23
	db	77
	db	95
	db	75
	db	0
	db	4 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	32 dup (0)
	db	32 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
DS360CDF_DATA	ends
DS360CDF_TEXT	segment byte public use16 'CODE'
	?debug	C E8010A44533336304344462E434DB34A22
   ;	
   ;	void CODEF0(char far *COM)
   ;	
	?debug	L 29
	assume	cs:DS360CDF_TEXT
_CODEF0	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360CDF_DATA
	mov	ds,ax
	?debug	C E318000400160800
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	
   ;	 static unsigned long t0t0t0;
   ;		 static char t0t0[2];
   ;	 static unsigned long t000=0x11725988;
   ;	 static unsigned long t0000;
   ;	 static unsigned long t001;
   ;	 static unsigned long t002=0;
   ;	 static char tt000[16]={3,7,1,2,5,6,9,5,8,9,8,0,1,4,5,1};
   ;	 static int ttt,tttn;
   ;	 static char tttname[12]={'d'-0x10,'s'-0x11,'t'-0x12,'3'-0x13,
   ;													'6'-0x14,'0'-0x15,'p'-0x16,'.'-0x17,'e'-0x18,'x'-0x19,
   ;													'e'-0x1a,0};
   ;	 static time_t TIME_NOW;
   ;	
   ;	 static char RR;
   ;	 static char RX;
   ;	 static int R1,R2,B1,B2,IS;
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
   ;	
   ;	 static unsigned long *URR1;
   ;	 static unsigned long *URR2;
   ;	 static unsigned long ADRESS;
   ;	#define LL RX
   ;	#define L1 R1
   ;	#define L2 R2
   ;	 static int LEN;
   ;	 static unsigned int DDD1,DDD2;
   ;	
   ;	 static unsigned long ADR, ADRESS1,ADRESS2;
   ;	 static int i,j,k;
   ;	 static char REZ11, REZ12, REZ21, REZ22;
   ;	 static char BYT1, BYT2;
   ;	 static unsigned long AL1[8];
   ;	 static unsigned long AL2[8];
   ;	 static char far* P_AL1;
   ;	 static char far* P_AL2;
   ;	 static int L_AL1;
   ;	 static int L_AL2;
   ;	 static int SIGN_AL1;
   ;	 static int SIGN_AL2;
   ;	
   ;	
   ;	 GET_OPERAND_SS;
   ;	
	?debug	L 82
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+59,al
 	ror	 ax,4
	mov	byte ptr d@w+60,al
 	shr	 ax,12
	mov	byte ptr d@w+62,al
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
	mov	dword ptr d@w+112,eax
	jmp	short @1@366
@1@310:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+112,eax
@1@366:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	test	al,240
	je	short @1@534
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
	mov	dword ptr d@w+116,eax
	jmp	short @1@590
@1@534:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+116,eax
@1@590:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 83
	mov	ax,seg _PSW_ILC
	mov	es,ax
	movsx	eax,word ptr es:_PSW_ILC
	mov	dx,seg _PSW_ADRESS
	mov	es,dx
	add	dword ptr es:_PSW_ADRESS,eax
   ;	
   ;	 switch(COM[0])
   ;	
	?debug	L 84
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	cl,al
	mov	ah,0
	sub	ax,240
	mov	bx,ax
	cmp	bx,15
	jbe short	@@29
	jmp	@1@2774
@@29:
	shl	bx,1
	jmp	word ptr cs:@1@C2482[bx]
@1@702:
   ;	
   ;		 {
   ;			case 0xf0:
   ;								T();
   ;	
	?debug	L 87
	call	far ptr _T
   ;	
   ;								break;
   ;	
	?debug	L 88
	pop	ds
	pop	bp
	ret	
@1@730:
   ;	
   ;			case 0xf1:  /*   MVO пересылка со сдвигом
   ;									Второй операнд сдвигается на 4 разряда влево и к нему
   ;									пристраивается в качестве младших раздядов знаковая позиция
   ;									первого операнда. Результат помещается в поле первого
   ;									операнда. Поля обрабатываются справа налево. Если необходимо,
   ;									второй операнд дополняется нулями. Если поле первого операнда
   ;									не вмещает результат операции, левые (старшие) разряды второго
   ;									операнда теряются. Поля первого и второго операндов могут
   ;									перекрываться. С помощью этой команды легко произвести сдвиг
   ;									десятичного числа на нечетное числоцифр вправо.
   ;	
   ;	
   ;	
   ;	
   ;									*/
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,L1);
   ;						DtaEnd(ADRESS2,L2);
   ;	#endif
   ;	
   ;								L1++;L2++;
   ;	
	?debug	L 111
	inc	word ptr d@w+60
	inc	word ptr d@w+62
   ;	
   ;								for(i=L2-1,j=L1-1,k=0; i>=0 && j>=0 ;i--)
   ;	
	?debug	L 112
	mov	ax,word ptr d@w+62
	dec	ax
	mov	word ptr d@w+120,ax
	mov	ax,word ptr d@w+60
	dec	ax
	mov	word ptr d@w+122,ax
	mov	word ptr d@w+124,0
	jmp	@1@982
@1@758:
   ;	
   ;									{BYT1=GET_BYTE(ADRESS2+i);
   ;	
	?debug	L 113
	movsx	eax,word ptr d@w+120
	mov	edx,dword ptr d@w+116
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+130,al
   ;	
   ;									 switch(k)
   ;	
	?debug	L 114
	mov	ax,word ptr d@w+124
	or	ax,ax
	je	short @1@898
	cmp	ax,1
	je	short @1@926
	jmp	@1@954
@1@898:
   ;	
   ;										 {
   ;											case 0:BYT2=GET_BYTE(ADRESS1+j);
   ;	
	?debug	L 116
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+131,al
   ;	
   ;														 BYT2=((BYT1&0x0f)<<4) | (BYT2&0x0f);
   ;	
	?debug	L 117
	mov	al,byte ptr d@+130
	and	al,15
	shl	al,4
	mov	dl,byte ptr d@+131
	and	dl,15
	or	al,dl
	mov	byte ptr d@+131,al
   ;	
   ;														 PUT_BYTE(ADRESS1+j,BYT2);
   ;	
	?debug	L 118
	push	ax
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;														 BYT2=(BYT1>>4);
   ;	
	?debug	L 119
	mov	al,byte ptr d@+130
	mov	ah,0
	sar	ax,4
	mov	byte ptr d@+131,al
   ;	
   ;														 j--;k=1;
   ;	
	?debug	L 120
	dec	word ptr d@w+122
	mov	word ptr d@w+124,1
   ;	
   ;														 break;
   ;	
	?debug	L 121
	jmp	short @1@954
@1@926:
   ;	
   ;											case 1:BYT2|=((BYT1&0x0f)<<4);
   ;	
	?debug	L 122
	mov	al,byte ptr d@+130
	and	al,15
	shl	al,4
	or	byte ptr d@+131,al
   ;	
   ;														 PUT_BYTE(ADRESS1+j,BYT2);
   ;	
	?debug	L 123
	mov	al,byte ptr d@+131
	push	ax
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;														 BYT2=(BYT1>>4);
   ;	
	?debug	L 124
	mov	al,byte ptr d@+130
	mov	ah,0
	sar	ax,4
	mov	byte ptr d@+131,al
   ;	
   ;														 j--;
   ;	
	?debug	L 125
	dec	word ptr d@w+122
   ;	
   ;														 break;
   ;	
	?debug	L 126
@1@954:
	?debug	L 112
	dec	word ptr d@w+120
@1@982:
	cmp	word ptr d@w+120,0
	jl	short @1@1038
	cmp	word ptr d@w+122,0
	jl short	@@30
	jmp	@1@758
@@30:
@1@1038:
   ;	
   ;										 }
   ;									}
   ;								if (j>=0)
   ;	
	?debug	L 129
	cmp	word ptr d@w+122,0
	jge short	@@31
	jmp	@1@2774
@@31:
   ;	
   ;								 {
   ;									PUT_BYTE(ADRESS1+j,BYT2);
   ;	
	?debug	L 131
	mov	al,byte ptr d@+131
	push	ax
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;									j--;
   ;	
	?debug	L 132
	dec	word ptr d@w+122
   ;	
   ;									if (j>=0)
   ;	
	?debug	L 133
	cmp	word ptr d@w+122,0
	jge short	@@32
	jmp	@1@2774
@@32:
	jmp	short @1@1178
@1@1122:
   ;	
   ;									 {
   ;										for(;j>=0;j--) PUT_BYTE(ADRESS1+j,0x00);
   ;	
	?debug	L 135
	push	0
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	dec	word ptr d@w+122
@1@1178:
	cmp	word ptr d@w+122,0
	jge	short @1@1122
   ;	
   ;									 }
   ;								 }
   ;								//T();
   ;								break;
   ;	
	?debug	L 139
	pop	ds
	pop	bp
	ret	
@1@1234:
   ;	
   ;	
   ;			case 0xf2:
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,L1);
   ;						DtaEnd(ADRESS2,L2);
   ;	#endif
   ;	
   ;								/*   PACK Упаковать
   ;									Второй операнд преобразуется из зонного формата в упакованный
   ;									формат и помещается на место первого операнда. Если поле поле
   ;									первого операнда не вмещает весь результат операции, левые
   ;									(старшие) значащие цифры теряются,правые(младшие) значащие
   ;									цифры остаются.Если поле первого операнда имеет большую длину,
   ;									чем это требуется для хранения результата,оно дополняется
   ;									слева нулями.
   ;	
   ;									*/
   ;	
   ;								L1++;L2++;
   ;	
	?debug	L 160
	inc	word ptr d@w+60
	inc	word ptr d@w+62
   ;	
   ;								for(i=L2-1,j=L1-1,k=0; i>=0 && j>=0 ;i--)
   ;	
	?debug	L 161
	mov	ax,word ptr d@w+62
	dec	ax
	mov	word ptr d@w+120,ax
	mov	ax,word ptr d@w+60
	dec	ax
	mov	word ptr d@w+122,ax
	mov	word ptr d@w+124,0
	jmp	@1@1542
@1@1262:
   ;	
   ;									{BYT1=GET_BYTE(ADRESS2+i);
   ;	
	?debug	L 162
	movsx	eax,word ptr d@w+120
	mov	edx,dword ptr d@w+116
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+130,al
   ;	
   ;									 switch(k)
   ;	
	?debug	L 163
	mov	ax,word ptr d@w+124
	or	ax,ax
	je	short @1@1430
	cmp	ax,1
	je	short @1@1458
	cmp	ax,2
	je	short @1@1486
	jmp	@1@1514
@1@1430:
   ;	
   ;										 {
   ;											case 0:BYT2=(BYT1>>4)| ((BYT1&0x0f)<<4);
   ;	
	?debug	L 165
	mov	al,byte ptr d@+130
	mov	ah,0
	sar	ax,4
	mov	dl,byte ptr d@+130
	and	dl,15
	shl	dl,4
	or	al,dl
	mov	byte ptr d@+131,al
   ;	
   ;														 PUT_BYTE(ADRESS1+j,BYT2);
   ;	
	?debug	L 166
	push	ax
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;														 j--;k=1;
   ;	
	?debug	L 167
	dec	word ptr d@w+122
	mov	word ptr d@w+124,1
   ;	
   ;														 break;
   ;	
	?debug	L 168
	jmp	short @1@1514
@1@1458:
   ;	
   ;											case 1:BYT2=BYT1&0x0f;
   ;	
	?debug	L 169
	mov	al,byte ptr d@+130
	and	al,15
	mov	byte ptr d@+131,al
   ;	
   ;														 k=2;
   ;	
	?debug	L 170
	mov	word ptr d@w+124,2
   ;	
   ;														 break;
   ;	
	?debug	L 171
	jmp	short @1@1514
@1@1486:
   ;	
   ;											case 2:BYT2|=((BYT1&0x0f)<<4);
   ;	
	?debug	L 172
	mov	al,byte ptr d@+130
	and	al,15
	shl	al,4
	or	byte ptr d@+131,al
   ;	
   ;														 PUT_BYTE(ADRESS1+j,BYT2);
   ;	
	?debug	L 173
	mov	al,byte ptr d@+131
	push	ax
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;														 j--;k=1;
   ;	
	?debug	L 174
	dec	word ptr d@w+122
	mov	word ptr d@w+124,1
   ;	
   ;														 break;
   ;	
	?debug	L 175
@1@1514:
	?debug	L 161
	dec	word ptr d@w+120
@1@1542:
	cmp	word ptr d@w+120,0
	jl	short @1@1598
	cmp	word ptr d@w+122,0
	jl short	@@33
	jmp	@1@1262
@@33:
@1@1598:
   ;	
   ;										 }
   ;									}
   ;								if (j>=0)
   ;	
	?debug	L 178
	cmp	word ptr d@w+122,0
	jge short	@@34
	jmp	@1@2774
@@34:
   ;	
   ;								 {
   ;									if (k==2)
   ;	
	?debug	L 180
	cmp	word ptr d@w+124,2
	jne	short @1@1682
   ;	
   ;										{
   ;										 PUT_BYTE(ADRESS1+j,BYT2);
   ;	
	?debug	L 182
	mov	al,byte ptr d@+131
	push	ax
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;										 j--;
   ;	
	?debug	L 183
	dec	word ptr d@w+122
@1@1682:
   ;	
   ;										}
   ;									if (j>=0)
   ;	
	?debug	L 185
	cmp	word ptr d@w+122,0
	jge short	@@35
	jmp	@1@2774
@@35:
	jmp	short @1@1794
@1@1738:
   ;	
   ;									 {
   ;										for(;j>=0;j--) PUT_BYTE(ADRESS1+j,0x00);
   ;	
	?debug	L 187
	push	0
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	dec	word ptr d@w+122
@1@1794:
	cmp	word ptr d@w+122,0
	jge	short @1@1738
   ;	
   ;									 }
   ;								 }
   ;								//T();
   ;								break;
   ;	
	?debug	L 191
	pop	ds
	pop	bp
	ret	
@1@1850:
   ;	
   ;	
   ;			case 0xf3:
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,L1);
   ;						DtaEnd(ADRESS2,L2);
   ;	#endif
   ;	
   ;							 /*   UNPK Распаковать
   ;									Эта команда преобразует второй операнд из упакованного
   ;									формата в зонный формат; результат помещается на место
   ;									первого операнда. Знак упакованного поля помещается в зоне
   ;									младшей цифры; всем остальным зонам присваивается
   ;									шестнадцатеричное значение F - cтандартное обозначение зоны
   ;									цифровых символов в коде EBCDIC. Если поле первого операнда
   ;									не вмещает результат операции, старшие значащие цифры теряются:
   ;									если оно длиннее результата операции, свободные левые байты
   ;									заполняются нулями. Если вычислительная машина переключена на
   ;									работу в коде ASCII, то зонам будет присваиваться значение 5,
   ;									а не F.
   ;									*/
   ;								L1++;L2++;
   ;	
	?debug	L 214
	inc	word ptr d@w+60
	inc	word ptr d@w+62
   ;	
   ;								for(i=L2-1,j=L1-1,k=0; i>=0 && j>=0 ;i--)
   ;	
	?debug	L 215
	mov	ax,word ptr d@w+62
	dec	ax
	mov	word ptr d@w+120,ax
	mov	ax,word ptr d@w+60
	dec	ax
	mov	word ptr d@w+122,ax
	mov	word ptr d@w+124,0
	jmp	@1@2214
@1@1878:
   ;	
   ;									{BYT1=GET_BYTE(ADRESS2+i);
   ;	
	?debug	L 216
	movsx	eax,word ptr d@w+120
	mov	edx,dword ptr d@w+116
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+130,al
   ;	
   ;									 BYT2=(BYT1&0xf0)>>4;
   ;	
	?debug	L 217
	mov	ah,0
	and	ax,240
	sar	ax,4
	mov	byte ptr d@+131,al
   ;	
   ;									 BYT1&=0x0f;
   ;	
	?debug	L 218
	and	byte ptr d@+130,15
   ;	
   ;									 switch(k)
   ;	
	?debug	L 219
	mov	ax,word ptr d@w+124
	or	ax,ax
	je	short @1@2046
	cmp	ax,1
	je	short @1@2074
	cmp	ax,2
	je	short @1@2130
	jmp	@1@2186
@1@2046:
   ;	
   ;										 {
   ;											case 0:BYT2=(BYT1<<4)| (BYT2);
   ;	
	?debug	L 221
	mov	al,byte ptr d@+130
	shl	al,4
	or	al,byte ptr d@+131
	mov	byte ptr d@+131,al
   ;	
   ;														 PUT_BYTE(ADRESS1+j,BYT2);
   ;	
	?debug	L 222
	push	ax
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;														 j--;k=1;
   ;	
	?debug	L 223
	dec	word ptr d@w+122
	mov	word ptr d@w+124,1
   ;	
   ;														 break;
   ;	
	?debug	L 224
	jmp	short @1@2186
@1@2074:
   ;	
   ;											case 1:PUT_BYTE(ADRESS1+j  ,0xf0|BYT1);
   ;	
	?debug	L 225
	mov	al,240
	or	al,byte ptr d@+130
	push	ax
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;														 j--;k=2;
   ;	
	?debug	L 226
	dec	word ptr d@w+122
	mov	word ptr d@w+124,2
   ;	
   ;														 if (j<0) goto MEND;
   ;	
	?debug	L 227
	cmp	word ptr d@w+122,0
	jge	short @1@2130
	jmp	short @1@2270
@1@2130:
   ;	
   ;	
   ;											case 2:PUT_BYTE(ADRESS1+j,0xf0|BYT2);
   ;	
	?debug	L 229
	mov	al,240
	or	al,byte ptr d@+131
	push	ax
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;														 j--;k=1;
   ;	
	?debug	L 230
	dec	word ptr d@w+122
	mov	word ptr d@w+124,1
   ;	
   ;														 if (j<0) goto MEND;
   ;	
	?debug	L 231
	cmp	word ptr d@w+122,0
	jge	short @1@2186
	jmp	short @1@2270
@1@2186:
	?debug	L 215
	dec	word ptr d@w+120
@1@2214:
	cmp	word ptr d@w+120,0
	jl	short @1@2270
	cmp	word ptr d@w+122,0
	jl short	@@36
	jmp	@1@1878
@@36:
@1@2270:
   ;	
   ;														 break;
   ;										 }
   ;									}
   ;	MEND:
   ;								if (j>=0)
   ;	
	?debug	L 236
	cmp	word ptr d@w+122,0
	jge short	@@37
	jmp	@1@2774
@@37:
	jmp	short @1@2382
@1@2326:
   ;	
   ;								 {
   ;									for(;j>=0;j--) PUT_BYTE(ADRESS1+j,0xf0);
   ;	
	?debug	L 238
	push	240
	movsx	eax,word ptr d@w+122
	mov	edx,dword ptr d@w+112
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	dec	word ptr d@w+122
@1@2382:
	cmp	word ptr d@w+122,0
	jge	short @1@2326
   ;	
   ;								 }
   ;								//T();
   ;								break;
   ;	
	?debug	L 241
	pop	ds
	pop	bp
	ret	
@1@2438:
   ;	
   ;			case 0xf4:
   ;								T00(COM[0]);
   ;	
	?debug	L 243
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 244
	pop	ds
	pop	bp
	ret	
@1@2466:
   ;	
   ;			case 0xf5:
   ;								T00(COM[0]);
   ;	
	?debug	L 246
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 247
	pop	ds
	pop	bp
	ret	
@1@2494:
   ;	
   ;			case 0xf6:
   ;								T00(COM[0]);
   ;	
	?debug	L 249
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 250
	pop	ds
	pop	bp
	ret	
@1@2522:
   ;	
   ;			case 0xf7:
   ;								T00(COM[0]);
   ;	
	?debug	L 252
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 253
	pop	ds
	pop	bp
	ret	
@1@2550:
   ;	
   ;			case 0xf8:  /*   ZAP  Сложение с очисткой
   ;									Второй операнд помещается на место первого операнда. Признак
   ;									результата устанавливается по правилам команды сложения. Если
   ;									длина поля первого операнда превышает длину поля второго
   ;									операнда, слева добавляются нули; если длина поля первого
   ;									операнда короче длины поля второго операнда, старшие левые
   ;									цифры теряются. Если теряются ненулевые цифры, признак
   ;									результата устанавливается равным 3, что указывает на
   ;									переполнение.Поля первого и второго операндамогут
   ;									перекрываться, но так, чтобы их правые байты совпадали.
   ;									Фактически эта команда засылает нули в поле первого операнда
   ;									а затем добавляет туда второй операнд.
   ;									*/
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,L1);
   ;						DtaEnd(ADRESS2,L2);
   ;	#endif
   ;	
   ;								DecimalAdd(ADRESS1, L1, ADRESS2, L2, D_ZAP);
   ;	
	?debug	L 274
	push	4
	push	word ptr d@w+62
	push	dword ptr d@w+116
	push	word ptr d@w+60
	push	dword ptr d@w+112
	call	far ptr _DecimalAdd
	add	sp,14
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 276
	pop	ds
	pop	bp
	ret	
@1@2578:
   ;	
   ;			case 0xf9:    /* CP   Сравнение десятичное
   ;									Эта команда аналогична команде вычитания. Отличие заключается в том,
   ;									что результат не сохраняется.Оба операнда остаются без изменения.
   ;									Признак результата устанавливается равным 0, если операнды равны;
   ;									равным 1,если первый операнд меньше;равным 2,если первый операнд
   ;									больше второго.Переполнения не возникает.Разницы между
   ;									положительным и отрицательным 0 нет.
   ;									*/
   ;	
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,L1);
   ;						DtaEnd(ADRESS2,L2);
   ;	#endif
   ;	
   ;								 DecimalAdd(ADRESS1, L1, ADRESS2, L2, D_COMPARE);
   ;	
	?debug	L 293
	push	3
	push	word ptr d@w+62
	push	dword ptr d@w+116
	push	word ptr d@w+60
	push	dword ptr d@w+112
	call	far ptr _DecimalAdd
	add	sp,14
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 295
	pop	ds
	pop	bp
	ret	
@1@2606:
   ;	
   ;	
   ;			case 0xfa:  /*   AP   Сложение десятичное
   ;									Второй операнд складывается с первым и сумма помещается на место первого
   ;									операнда.Поля операндов могут перекрываться но так, чтобы
   ;									их правый и младший байты совпадали. Знак результата определяется
   ;									по правилам алгебры, но 0 результат всегда имеет знак плюс.
   ;									Признак результата устанавливается равным 0,1 или 2,если
   ;									сумма равна 0, меньше 0,или больше 0 соответственно.Если сумма
   ;									слишком длинна и не укладывается в отведенное для результата
   ;									поле признак результата устанавливается равным 3,что указывает
   ;									на переполнение.В этом случае теряются старшие значащие цифры.
   ;	
   ;									*/
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,L1);
   ;						DtaEnd(ADRESS2,L2);
   ;	#endif
   ;	
   ;								DecimalAdd(ADRESS1, L1, ADRESS2, L2, D_ADD);
   ;	
	?debug	L 316
	push	1
	push	word ptr d@w+62
	push	dword ptr d@w+116
	push	word ptr d@w+60
	push	dword ptr d@w+112
	call	far ptr _DecimalAdd
	add	sp,14
   ;	
   ;								//T();
   ;								/******************************************
   ;								if ((GET_BYTE(ADRESS1+L1) & 0x0f)==0x0c) SIGN_AL1=1;
   ;								else SIGN_AL1=-1;
   ;								if ((GET_BYTE(ADRESS2+L2) & 0x0f)==0x0c) SIGN_AL2=1;
   ;								else SIGN_AL2=-1;
   ;	
   ;								P_AL1=(char far*)AL1;
   ;								if (SIGN_AL1==1) for(i=L1,L_AL1=0;i>=0;i--)
   ;																	 {BYT1=GET_BYTE(ADRESS1+i);
   ;																		*(P_AL1++)=0x20+(0x0f&BYT1);
   ;																		*(P_AL1++)=0x20+(BYT1>>4);
   ;																	 }
   ;								else for(i=L1,L_AL1=0;i>=0;i--)
   ;																	 {BYT1=GET_BYTE(ADRESS1+i);
   ;																		*(P_AL1++)=0x20-(0x0f&BYT1);
   ;																		*(P_AL1++)=0x20-(BYT1>>4);
   ;																	 }
   ;	
   ;								P_AL2=(char far*)AL2;
   ;								if (SIGN_AL2==1) for(j=L2,L_AL2=0;j>=0;j--)
   ;																	 {BYT1=GET_BYTE(ADRESS2+j);
   ;																		*(P_AL2++)=0x20+(0x0f&BYT1);
   ;																		*(P_AL2++)=0x20+(BYT1>>4);
   ;																	 }
   ;								else for(j=L2,L_AL2=0;j>=0;j--)
   ;																	 {BYT1=GET_BYTE(ADRESS2+j);
   ;																		*(P_AL2++)=0x20-(0x0f&BYT1);
   ;																		*(P_AL2++)=0x20-(BYT1>>4);
   ;																	 }
   ;	
   ;								if (L1&0x01) {*(P_AL1++)=0;*(P_AL1++)=0;L_AL1=(L1+2)/2;}
   ;								else L_AL1=L1/2;
   ;	
   ;								if (L2&0x01) {*(P_AL2++)=0;*(P_AL2++)=0;L_AL2=(L2+2)/2;}
   ;								else L_AL2=L2/2;
   ;								if (L_AL1==L_AL2) for(i=0;i<L_AL2;i++) AL1[i]+=(AL2[i]-0x20202020l);
   ;								else if (L_AL1<L_AL2)
   ;											 {for(i=L_AL1;i<L_AL2;i++) AL1[i]=0;
   ;												for(i=0;i<L_AL2;i++) AL1[i]+=(AL2[i]-0x20202020l);
   ;											 }
   ;										 else
   ;											 {for(i=L_AL2;i<L_AL1;i++) AL2[i]=0;
   ;												for(i=0;i<L_AL1;i++) AL1[i]+=(AL2[i]-0x20202020l);
   ;											 }
   ;								P_AL1=(char far*)AL1;
   ;								for(i=L1;i>=0;i--)
   ;									 {
   ;										if (*P_AL1>0x29)
   ;											 {*P_AL1-=0x0a;
   ;												(*(P_AL1+1))++;
   ;											 }
   ;										else
   ;											if (*P_AL1<0x17)
   ;												{
   ;												}
   ;										BYT1=(*(P_AL1++))&0x0f;
   ;										if (*P_AL1>0x29)
   ;											 {*P_AL1-=0x0a;
   ;												(*(P_AL1+1))++;
   ;											 }
   ;										else
   ;											if (*P_AL1<0x17)
   ;												{
   ;												}
   ;										BYT1|=((*(P_AL1++))&0x0f)<<4;
   ;										PUT_BYTE(ADRESS1+i,BYT1);
   ;									 }
   ;	
   ;									T();
   ;								 ************************************/
   ;								break;
   ;	
	?debug	L 388
	pop	ds
	pop	bp
	ret	
@1@2634:
   ;	
   ;			case 0xfb:  /*   SP   Вычитание десятичное
   ;									Второй операнд вычитается из первого операнда, разница помещается
   ;									на место первого операнда.Команда аналогична команде сложения.
   ;									Отличие состоит в том,что машина при выполнении операции
   ;									автоматически изменяет знак второго операнда на обратный.
   ;									Совместив правые байты обоих операндов,команду SP можно
   ;									использовать для очистки всего поля или его части.
   ;									*/
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,L1);
   ;						DtaEnd(ADRESS2,L2);
   ;	#endif
   ;	
   ;								DecimalAdd(ADRESS1, L1, ADRESS2, L2, D_SUBTRACT);
   ;	
	?debug	L 404
	push	2
	push	word ptr d@w+62
	push	dword ptr d@w+116
	push	word ptr d@w+60
	push	dword ptr d@w+112
	call	far ptr _DecimalAdd
	add	sp,14
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 406
	pop	ds
	pop	bp
	ret	
@1@2662:
   ;	
   ;			case 0xfc:    /* MP   Умножение десятичное
   ;									Второй операнд(множитель) умножается на первый операнд
   ;									(множимое).Результат помещается в поле первого операнда.
   ;									Длина второго операнда не может превышать восьми байтов и
   ;									должна быть всегда меньше длины первого операнда.Кроме того,
   ;									в первом операнде должно быть столько нулевых старших
   ;									цифр,каков размер поля второго операнда. В этих условиях
   ;									переполнения результата произойти не может.Поля могут
   ;									перекрываться,но так,чтобы совпадали их правые (младшие) байты
   ;									Признак результата остается без изменения.Заметим,что для расширения
   ;									поля первого операнда может использоваться команда сложения с
   ;									очисткой.
   ;										*/
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,L1);
   ;						DtaEnd(ADRESS2,L2);
   ;	#endif
   ;	
   ;								DecimalMultiply(ADRESS1, L1, ADRESS2, L2);
   ;	
	?debug	L 427
	push	word ptr d@w+62
	push	dword ptr d@w+116
	push	word ptr d@w+60
	push	dword ptr d@w+112
	call	far ptr _DecimalMultiply
	add	sp,12
   ;	
   ;	//#include "ds360ch0.cc"
   ;								//T();
   ;								break;
   ;	
	?debug	L 430
	pop	ds
	pop	bp
	ret	
@1@2690:
   ;	
   ;			case 0xfd:    /* DP   Деление десятичное
   ;									Первый операнд(делимое)делится на второй операнд (делитель).
   ;									Частное помещается в поле первого операнда и его длина в байтах
   ;									равна L1-L2.Остаток помещается после частного по адресу
   ;									E1+L1-L2, и его длина в байтах равна L2.Длина поля делителя не
   ;									может быть больше восьми байтов, и во всех случаях его длина
   ;									должна быть меньше длины поля делимого.Делимое,делитель,частное
   ;									и остаток рассматриваются как целые числа.Знак остатка тот же
   ;									что и у делимого,даже если остаток равен 0.Поля операндов
   ;									могут перекрываться,но так,чтобы совпадали их младшие байты.
   ;									Признак результата остается без изменения.Максимальный размер
   ;									делимого равен 31 десятичной цифре; максимальный размер
   ;									частного равен 29 десятичным цифрам.
   ;										*/
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,L1);
   ;						DtaEnd(ADRESS2,L2);
   ;	#endif
   ;	
   ;								DecimalDivide(ADRESS1, L1, ADRESS2, L2);
   ;	
	?debug	L 452
	push	word ptr d@w+62
	push	dword ptr d@w+116
	push	word ptr d@w+60
	push	dword ptr d@w+112
	call	far ptr _DecimalDivide
	add	sp,12
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 454
	pop	ds
	pop	bp
	ret	
@1@2718:
   ;	
   ;			case 0xfe:
   ;								T00(COM[0]);
   ;	
	?debug	L 456
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 457
	pop	ds
	pop	bp
	ret	
@1@2746:
   ;	
   ;			case 0xff:
   ;								T00(COM[0]);
   ;	
	?debug	L 459
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 460
@1@2774:
   ;	
   ;		 }
   ;	}
   ;	
	?debug	L 462
	pop	ds
	pop	bp
	ret	
	?debug	C E3190020001A0C
	?debug	C E31A0020001A0C
	?debug	C E31B000400160C00
	?debug	C E31C000400160600
	?debug	C E31D000C001A08
	?debug	C E31E0010001A08
	?debug	C E31F0002001A08
	?debug	C E6085349474E5F414C3204000002D200014F0008+
	?debug	C 5349474E5F414C3104000002D000014E00054C5F+
	?debug	C 414C3204000002CE00014D00054C5F414C310400+
	?debug	C 0002CC00014C0005505F414C3218000002C80001+
	?debug	C 4B0005505F414C3118000002C400014A0003414C+
	?debug	C 3219000002A40001490003414C311A0000028400+
	?debug	C 0148000442595432080000028300014700044259+
	?debug	C 54310800000282000147000552455A3232080000+
	?debug	C 0281000146000552455A32310800000280000146+
	?debug	C 000552455A3132080000027F000146000552455A+
	?debug	C 3131080000027E00014600016B040000027C0001+
	?debug	C 4500016A040000027A0001450001690400000278+
	?debug	C 0001450007414452455353320C00000274000144+
	?debug	C 0007414452455353310C00000270000144000341+
	?debug	C 44520C0000026C0001440004444444320A000002+
	?debug	C 6A0001420004444444310A000002680001420003+
	?debug	C 4C454E040000026600014100064144524553530C+
	?debug	C 0000026200013D0004555252321B0000025E0001+
	?debug	C 3C0004555252311B0000025A00013B0004525245+
	?debug	C 5A0600000256000139000352455A1C0000025200+
	?debug	C 013800035252321C0000024E0001370003525231+
	?debug	C 1C0000024A00013600034444440A000002480001+
	?debug	C 3400024444080000024700013300024244080000+
	?debug	C 024600013200024953040000024400012F000242+
	?debug	C 32040000024200012F0002423104000002400001+
	?debug	C 2F00025232040000023E00012F00025231040000+
	?debug	C 023C00012F00025258080000023B00012E000252+
	?debug	C 52080000023A00012D000854494D455F4E4F5706+
	?debug	C 0000023600012B00077474746E616D651D000002+
	?debug	C 2A00012800047474746E04000002280001270003+
	?debug	C 7474740400000226000127000574743030301E00+
	?debug	C 0002160001260004743030320C00000212000125+
	?debug	C 0004743030310C0000020E000124000574303030+
	?debug	C 300C0000020A0001230004743030300C00000206+
	?debug	C 0001220004743074301F00000204000121000674+
	?debug	C 30743074300C000002000001200003434F4D180A+
	?debug	C 060000
	?debug	E
	?debug	E
_CODEF0	endp
	db	1 dup (?)
@1@C2482	label	word
	dw	@1@702
	dw	@1@730
	dw	@1@1234
	dw	@1@1850
	dw	@1@2438
	dw	@1@2466
	dw	@1@2494
	dw	@1@2522
	dw	@1@2550
	dw	@1@2578
	dw	@1@2606
	dw	@1@2634
	dw	@1@2662
	dw	@1@2690
	dw	@1@2718
	dw	@1@2746
   ;	
   ;	int DecimalAdd(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2, int Operation )
   ;	
	?debug	L 468
	assume	cs:DS360CDF_TEXT
_DecimalAdd	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,76
	push	si
	push	di
	push	ds
	mov	ax,DS360CDF_DATA
	mov	ds,ax
	?debug	C E6094F7065726174696F6E040A12000002523204+
	?debug	C 0A10000007414452455353320C0A0C0000025231+
	?debug	C 040A0A000007414452455353310C0A060000
	?debug	B
   ;	
   ;	{int  SIGN_AL1=1, SIGN_AL2=1;
   ;	
	?debug	L 469
   ;	
   ;	 signed char  work1[32], work2[32];
   ;	 int  i,k;
   ;	 int  num1, num2, number;
   ;	 char byte, last1, last2;
   ;	 int fReverse, fZero=TRUE;
   ;	
	?debug	L 474
	mov	word ptr [bp-12],1
   ;	
   ;	
   ;		 last1 =GET_BYTE(ADRESS1+L1) & 0x0f;
   ;	
	?debug	L 476
	movsx	eax,word ptr [bp+10]
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	and	al,15
	mov	byte ptr [bp-7],al
   ;	
   ;		 last2 =GET_BYTE(ADRESS2+L2) & 0x0f;
   ;	
	?debug	L 477
	movsx	eax,word ptr [bp+16]
	mov	edx,dword ptr [bp+12]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	and	al,15
	mov	dl,al
   ;	
   ;	
   ;		 //--check data format
   ;		 if (Operation!=D_ZAP)
   ;	
	?debug	L 480
	cmp	word ptr [bp+18],4
	je	short @2@170
   ;	
   ;				{if(last1!=0x0c && last1!=0x0d && last1 !=0x0f)
   ;	
	?debug	L 481
	cmp	byte ptr [bp-7],12
	je	short @2@170
	cmp	byte ptr [bp-7],13
	je	short @2@170
	cmp	byte ptr [bp-7],15
	je	short @2@170
   ;	
   ;					 {RQ_PRG=7; RETURN=1; return(-1);}  //illagal data
   ;	
	?debug	L 482
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,7
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@2@170:
   ;	
   ;				}
   ;		 if(last2!=0x0c && last2!=0x0d && last2 !=0x0f)
   ;	
	?debug	L 484
	cmp	dl,12
	je	short @2@282
	cmp	dl,13
	je	short @2@282
	cmp	dl,15
	je	short @2@282
   ;	
   ;			 {RQ_PRG=7; RETURN=1; return(-1);}  //illagal data
   ;	
	?debug	L 485
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,7
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@2@282:
   ;	
   ;		 //----check operand's sign
   ;					if   (last1==0x0d)
   ;	
	?debug	L 487
	cmp	byte ptr [bp-7],13
	jne	short @2@338
   ;	
   ;							SIGN_AL1=-1;
   ;	
	?debug	L 488
	mov	word ptr [bp-2],-1
	jmp	short @2@366
@2@338:
   ;	
   ;					else
   ;							SIGN_AL1=1;
   ;	
	?debug	L 490
	mov	word ptr [bp-2],1
@2@366:
   ;	
   ;					if   (last2==0x0d)
   ;	
	?debug	L 491
	cmp	dl,13
	jne	short @2@422
   ;	
   ;							 SIGN_AL2=-1;
   ;	
	?debug	L 492
	mov	word ptr [bp-4],-1
	jmp	short @2@450
@2@422:
   ;	
   ;					else
   ;							 SIGN_AL2=1;
   ;	
	?debug	L 494
	mov	word ptr [bp-4],1
@2@450:
   ;	
   ;	
   ;			 memset(work1, 0, 32);
   ;	
	?debug	L 496
	push	ss
	pop	es
	lea	di,word ptr [bp-44]
	xor	ax,ax
	mov	ah,al
	mov	cx,16
	rep 	stosw	
   ;	
   ;	
   ;			 if(Operation==D_SUBTRACT || Operation==D_COMPARE)
   ;	
	?debug	L 498
	cmp	word ptr [bp+18],2
	je	short @2@506
	cmp	word ptr [bp+18],3
	jne	short @2@534
@2@506:
   ;	
   ;						  SIGN_AL2*=-1;
   ;	
	?debug	L 499
	mov	dx,-1
	mov	ax,word ptr [bp-4]
	imul	dx
	mov	word ptr [bp-4],ax
@2@534:
   ;	
   ;		 //copy operands to work arrays
   ;			 if(Operation==D_ZAP)
   ;	
	?debug	L 501
	cmp	word ptr [bp+18],4
	jne	short @2@590
   ;	
   ;				 {SIGN_AL1=1;
   ;	
	?debug	L 502
	mov	word ptr [bp-2],1
   ;	
   ;				 }
   ;	
	?debug	L 503
	jmp	short @2@702
@2@590:
   ;	
   ;				else
   ;				 {
   ;				  work1[0]=(GET_BYTE(ADRESS1+L1)>>4)&0xf;
   ;	
	?debug	L 506
	movsx	eax,word ptr [bp+10]
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp-44],al
   ;	
   ;				  for(k=1,i=L1-1; i>=0; i--)
   ;	
	?debug	L 507
	mov	di,1
	mov	si,word ptr [bp+10]
	dec	si
	jmp	short @2@674
@2@618:
   ;	
   ;					{ byte=GET_BYTE(ADRESS1+i);
   ;	
	?debug	L 508
	movsx	eax,si
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	dl,al
   ;	
   ;					  work1[k++]  =byte&0xf;
   ;	
	?debug	L 509
	and	al,15
	mov	byte ptr [bp+di-44],al
	inc	di
   ;	
   ;					  work1[k++]  =(byte>>4)&0xf;
   ;	
	?debug	L 510
	mov	al,dl
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp+di-44],al
	inc	di
	?debug	L 507
	dec	si
@2@674:
	or	si,si
	jge	short @2@618
@2@702:
   ;	
   ;					}
   ;				 }
   ;				  work2[0]=(GET_BYTE(ADRESS2+L2)>>4)&0xf;
   ;	
	?debug	L 513
	movsx	eax,word ptr [bp+16]
	mov	edx,dword ptr [bp+12]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp-76],al
   ;	
   ;				  for(k=1,i=L2-1; i>=0; i--)
   ;	
	?debug	L 514
	mov	di,1
	mov	si,word ptr [bp+16]
	dec	si
	jmp	short @2@786
@2@730:
   ;	
   ;					{ byte=GET_BYTE(ADRESS2+i);
   ;	
	?debug	L 515
	movsx	eax,si
	mov	edx,dword ptr [bp+12]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	dl,al
   ;	
   ;					  work2[k++]  =byte&0xf;
   ;	
	?debug	L 516
	and	al,15
	mov	byte ptr [bp+di-76],al
	inc	di
   ;	
   ;					  work2[k++]  =(byte>>4)&0xf;
   ;	
	?debug	L 517
	mov	al,dl
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp+di-76],al
	inc	di
	?debug	L 514
	dec	si
@2@786:
	or	si,si
	jge	short @2@730
   ;	
   ;					}
   ;					num1=2*L1+1;   //numbers of bytes in work[]
   ;	
	?debug	L 519
	mov	ax,word ptr [bp+10]
	shl	ax,1
	inc	ax
	mov	word ptr [bp-6],ax
   ;	
   ;					num2=2*L2+1;
   ;	
	?debug	L 520
	mov	ax,word ptr [bp+16]
	shl	ax,1
	inc	ax
	mov	cx,ax
   ;	
   ;					if(SIGN_AL1==-1)
   ;	
	?debug	L 521
	cmp	word ptr [bp-2],-1
	jne	short @2@982
   ;	
   ;					  for(i=0; i<num1; i++) work1[i] *= -1;
   ;	
	?debug	L 522
	xor	si,si
	cmp	si,word ptr [bp-6]
	jge	short @2@982
@2@898:
	lea	ax,word ptr [bp-44]
	mov	bx,si
	add	bx,ax
	mov	di,bx
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	dx,-1
	imul	dx
	mov	byte ptr ss:[di],al
	inc	si
	cmp	si,word ptr [bp-6]
	jl	short @2@898
@2@982:
   ;	
   ;					if(SIGN_AL2==-1)
   ;	
	?debug	L 523
	cmp	word ptr [bp-4],-1
	jne	short @2@1150
   ;	
   ;					  for(i=0; i<num2; i++) work2[i] *= -1;
   ;	
	?debug	L 524
	xor	si,si
	cmp	si,cx
	jge	short @2@1150
@2@1066:
	lea	ax,word ptr [bp-76]
	mov	bx,si
	add	bx,ax
	mov	di,bx
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	dx,-1
	imul	dx
	mov	byte ptr ss:[di],al
	inc	si
	cmp	si,cx
	jl	short @2@1066
@2@1150:
   ;	
   ;	
   ;								  //add work arrays
   ;					for(i=0; i<num2; i++)
   ;	
	?debug	L 527
	xor	si,si
	cmp	si,cx
	jge	short @2@1290
@2@1206:
   ;	
   ;					 { work1[i] +=work2[i];
   ;	
	?debug	L 528
	mov	al,byte ptr [bp+si-76]
	add	byte ptr [bp+si-44],al
	?debug	L 527
	inc	si
	cmp	si,cx
	jl	short @2@1206
@2@1290:
   ;	
   ;					 }
   ;	
   ;				 //calculate and correct rezults
   ;				 number=max(num1,num2);
   ;	
	?debug	L 532
	cmp	word ptr [bp-6],cx
	jle	short @2@1346
	mov	ax,word ptr [bp-6]
	jmp	short @2@1374
@2@1346:
	mov	ax,cx
@2@1374:
	mov	cx,ax
   ;	
   ;				 for(i=0; i<number;i++)               //check for 0
   ;	
	?debug	L 533
	xor	si,si
	cmp	si,cx
	jge	short @2@1542
@2@1430:
   ;	
   ;					 if(work1[i]!=0) fZero=FALSE;
   ;	
	?debug	L 534
	cmp	byte ptr [bp+si-44],0
	je	short @2@1486
	mov	word ptr [bp-12],0
@2@1486:
	?debug	L 533
	inc	si
	cmp	si,cx
	jl	short @2@1430
@2@1542:
   ;	
   ;	
   ;				 if(SIGN_AL1 == SIGN_AL2)  //correct as addition
   ;	
	?debug	L 536
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-4]
	jne	short @2@2018
   ;	
   ;				 {
   ;					if(SIGN_AL1<0)
   ;	
	?debug	L 538
	cmp	word ptr [bp-2],0
	jge	short @2@1738
   ;	
   ;					  for(i=0; i<number; i++) work1[i] *=-1;  //positiv
   ;	
	?debug	L 539
	xor	si,si
	cmp	si,cx
	jge	short @2@1738
@2@1654:
	lea	ax,word ptr [bp-44]
	mov	bx,si
	add	bx,ax
	mov	di,bx
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	dx,-1
	imul	dx
	mov	byte ptr ss:[di],al
	inc	si
	cmp	si,cx
	jl	short @2@1654
@2@1738:
   ;	
   ;					for(i=0; i<number; i++)
   ;	
	?debug	L 540
	xor	si,si
	lea	di,word ptr [bp-44]
	cmp	si,cx
	jl short	@@38
	jmp	@2@2662
@@38:
@2@1822:
   ;	
   ;					 {if(work1[i]>=10)
   ;	
	?debug	L 541
	cmp	byte ptr ss:[di],10
	jl	short @2@1906
   ;	
   ;						 {work1[i]-=10;
   ;	
	?debug	L 542
	mov	al,byte ptr ss:[di]
	add	al,246
	mov	byte ptr ss:[di],al
   ;	
   ;						  work1[i+1]+=1;
   ;	
	?debug	L 543
	lea	ax,word ptr [bp-43]
	mov	bx,si
	add	bx,ax
	mov	dx,bx
	mov	al,byte ptr ss:[bx]
	inc	al
	mov	byte ptr ss:[bx],al
   ;	
   ;						  if(i+1==number) number++;
   ;	
	?debug	L 544
	mov	ax,si
	inc	ax
	cmp	ax,cx
	jne	short @2@1906
	inc	cx
@2@1906:
	?debug	L 540
	inc	di
	inc	si
	cmp	si,cx
	jl	short @2@1822
   ;	
   ;						 }
   ;					  }
   ;				 }
   ;	
	?debug	L 547
	jmp	@2@2662
@2@2018:
   ;	
   ;				 else               //correct as SUBTRACTion
   ;				 { fReverse =FALSE;
   ;	
	?debug	L 549
	mov	word ptr [bp-10],0
   ;	
   ;					for(i=number-1; i>=0; i--)
   ;	
	?debug	L 550
	mov	si,cx
	dec	si
	jmp	short @2@2158
@2@2046:
   ;	
   ;					 {if(work1[i]<0){fReverse =TRUE; break;}
   ;	
	?debug	L 551
	lea	ax,word ptr [bp-44]
	mov	bx,si
	add	bx,ax
	mov	di,bx
	cmp	byte ptr ss:[bx],0
	jge	short @2@2102
	mov	word ptr [bp-10],1
	jmp	short @2@2186
@2@2102:
   ;	
   ;					  if(work1[i]>0){ break;}
   ;	
	?debug	L 552
	cmp	byte ptr ss:[di],0
	jg	short @2@2186
	?debug	L 550
	dec	si
@2@2158:
	or	si,si
	jge	short @2@2046
@2@2186:
   ;	
   ;					 }
   ;					if(fReverse)
   ;	
	?debug	L 554
	cmp	word ptr [bp-10],0
	je	short @2@2354
   ;	
   ;					 for(i=0; i<number; i++)
   ;	
	?debug	L 555
	xor	si,si
	cmp	si,cx
	jge	short @2@2354
@2@2270:
   ;	
   ;						work1[i] *=(-1);
   ;	
	?debug	L 556
	lea	ax,word ptr [bp-44]
	mov	bx,si
	add	bx,ax
	mov	di,bx
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	dx,-1
	imul	dx
	mov	byte ptr ss:[di],al
	?debug	L 555
	inc	si
	cmp	si,cx
	jl	short @2@2270
@2@2354:
   ;	
   ;	
   ;					 for(i=0; i<number; i++)
   ;	
	?debug	L 558
	xor	si,si
	lea	di,word ptr [bp-44]
	cmp	si,cx
	jge	short @2@2578
@2@2438:
   ;	
   ;					  if(work1[i]<0)
   ;	
	?debug	L 559
	cmp	byte ptr ss:[di],0
	jge	short @2@2494
   ;	
   ;						{work1[i]+=10;
   ;	
	?debug	L 560
	mov	al,byte ptr ss:[di]
	add	al,10
	mov	byte ptr ss:[di],al
   ;	
   ;						 work1[i+1]-=1;
   ;	
	?debug	L 561
	lea	ax,word ptr [bp-43]
	mov	bx,si
	add	bx,ax
	mov	dx,bx
	mov	al,byte ptr ss:[bx]
	dec	al
	mov	byte ptr ss:[bx],al
@2@2494:
	?debug	L 558
	inc	di
	inc	si
	cmp	si,cx
	jl	short @2@2438
@2@2578:
   ;	
   ;						}
   ;	
   ;					if(fReverse) SIGN_AL1=-1;
   ;	
	?debug	L 564
	cmp	word ptr [bp-10],0
	je	short @2@2634
	mov	word ptr [bp-2],-1
	jmp	short @2@2662
@2@2634:
   ;	
   ;					else         SIGN_AL1=1;
   ;	
	?debug	L 565
	mov	word ptr [bp-2],1
@2@2662:
   ;	
   ;				 }
   ;	
   ;			//make PSW_SS    check overflow !!!
   ;			if(Operation !=D_COMPARE && number>num1) PSW_CC=3;  //overflow
   ;	
	?debug	L 569
	cmp	word ptr [bp+18],3
	je	short @2@2746
	cmp	cx,word ptr [bp-6]
	jle	short @2@2746
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,3
	jmp	short @2@2886
@2@2746:
   ;	
   ;			else
   ;			 {if(fZero) {PSW_CC=0; SIGN_AL1=1;}
   ;	
	?debug	L 571
	cmp	word ptr [bp-12],0
	je	short @2@2802
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	mov	word ptr [bp-2],1
	jmp	short @2@2886
@2@2802:
   ;	
   ;			  else{ if( SIGN_AL1>0) PSW_CC=2;
   ;	
	?debug	L 572
	cmp	word ptr [bp-2],0
	jle	short @2@2858
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	jmp	short @2@2886
@2@2858:
   ;	
   ;					  else            PSW_CC=1;
   ;	
	?debug	L 573
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
@2@2886:
   ;	
   ;					}
   ;			 }
   ;	
   ;			//Write results to 360
   ;			if(Operation !=D_COMPARE)
   ;	
	?debug	L 578
	cmp	word ptr [bp+18],3
	je	short @2@3110
   ;	
   ;			{ byte=(work1[0]&0x0f)<<4;
   ;	
	?debug	L 579
	mov	dl,byte ptr [bp-44]
	and	dl,15
	shl	dl,4
   ;	
   ;			  if(SIGN_AL1==1) byte|=0xc;
   ;	
	?debug	L 580
	cmp	word ptr [bp-2],1
	jne	short @2@2970
	or	dl,12
	jmp	short @2@2998
@2@2970:
   ;	
   ;			  else            byte|=0xd;
   ;	
	?debug	L 581
	or	dl,13
@2@2998:
   ;	
   ;				PUT_BYTE(ADRESS1+L1,byte);
   ;	
	?debug	L 582
	push	dx
	movsx	eax,word ptr [bp+10]
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;			  for(k=1,i=L1-1; i>=0; i--, k+=2)
   ;	
	?debug	L 583
	mov	di,1
	mov	si,word ptr [bp+10]
	dec	si
	jmp	short @2@3082
@2@3026:
   ;	
   ;				 {
   ;				  byte=((work1[k+1]&0x0f)<<4)| (work1[k]&0x0f);
   ;	
	?debug	L 585
	mov	dl,byte ptr [bp+di-43]
	and	dl,15
	shl	dl,4
	mov	al,byte ptr [bp+di-44]
	and	al,15
	or	dl,al
   ;	
   ;				  PUT_BYTE(ADRESS1+i,byte);
   ;	
	?debug	L 586
	push	dx
	movsx	eax,si
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	?debug	L 583
	dec	si
	add	di,2
@2@3082:
	or	si,si
	jge	short @2@3026
@2@3110:
   ;	
   ;	
   ;				 }
   ;			}
   ;			return(0);
   ;	
	?debug	L 590
	xor	ax,ax
   ;	
   ;	}
   ;	
	?debug	L 591
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
	?debug	C E3200020001A02
	?debug	C E3210020001A02
	?debug	C E605665A65726F0402F4FF01DA01086652657665+
	?debug	C 7273650402F6FF00056C617374320808014800E9+
	?debug	C 00040200056C617374310802F9FF000462797465+
	?debug	C 0808017D01AF04040200066E756D626572040801+
	?debug	C 9902FA03040100046E756D320408010E02990204+
	?debug	C 0100046E756D310402FAFF00016B0408015F01C9+
	?debug	C 0404070001690408016301CB0404060005776F72+
	?debug	C 6B322002B4FF0005776F726B312102D4FF000853+
	?debug	C 49474E5F414C320402FCFF01D501085349474E5F+
	?debug	C 414C310402FEFF01D50107414452455353310C0A+
	?debug	C 060000025231040A0A000007414452455353320C+
	?debug	C 0A0C0000025232040A100000094F706572617469+
	?debug	C 6F6E040A120000
	?debug	E
	?debug	E
_DecimalAdd	endp
   ;	
   ;	int DecimalDivide(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2 )
   ;	
	?debug	L 594
	assume	cs:DS360CDF_TEXT
_DecimalDivide	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,214
	push	si
	push	di
	push	ds
	mov	ax,DS360CDF_DATA
	mov	ds,ax
	?debug	C E6025232040A10000007414452455353320C0A0C+
	?debug	C 0000025231040A0A000007414452455353310C0A+
	?debug	C 060000
	?debug	B
   ;	
   ;	{int  SIGN_AL1=1, SIGN_AL2=1;
   ;	
	?debug	L 595
   ;	
   ;	 signed char  work1[32], work2[32];
   ;	 int  i,k, nz1, nz2, nRem, nRes;
   ;	 int  num1, num2;
   ;	 char byte, tens, last1, last2;
   ;	 signed char remainder[32],  differ[32], result[32], multi[32];
   ;	 int  rrr, rem, div;
   ;	 int  nzDiff;
   ;	 int  currRem=0;
   ;	
	?debug	L 603
   ;	
   ;	
   ;	
   ;		 last1 =GET_BYTE(ADRESS1+L1) & 0x0f;
   ;	
	?debug	L 606
	movsx	eax,word ptr [bp+10]
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	and	al,15
	mov	byte ptr [bp-15],al
   ;	
   ;		 last2 =GET_BYTE(ADRESS2+L2) & 0x0f;
   ;	
	?debug	L 607
	movsx	eax,word ptr [bp+16]
	mov	edx,dword ptr [bp+12]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	and	al,15
	mov	dl,al
   ;	
   ;	
   ;		 //--check data format
   ;		num1=2*L1+1;   //numbers of bytes in work[]
   ;	
	?debug	L 610
	mov	ax,word ptr [bp+10]
	shl	ax,1
	inc	ax
	mov	word ptr [bp-12],ax
   ;	
   ;		num2=2*L2+1;
   ;	
	?debug	L 611
	mov	ax,word ptr [bp+16]
	shl	ax,1
	inc	ax
	mov	word ptr [bp-14],ax
   ;	
   ;		if(num1<num2) {RQ_PRG=6; RETURN=1; return(-1);}  //!!!! illegal data
   ;	
	?debug	L 612
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-14]
	jge	short @3@86
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,6
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@3@86:
   ;	
   ;	
   ;	
   ;		if(L2>8) {RQ_PRG=6; RETURN=1; return(-1);}                //length of operand should be less then 8
   ;	
	?debug	L 615
	cmp	word ptr [bp+16],8
	jle	short @3@142
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,6
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@3@142:
   ;	
   ;	
   ;		 if(last1!=0x0c && last1!=0x0d && last1 !=0x0f)
   ;	
	?debug	L 617
	cmp	byte ptr [bp-15],12
	je	short @3@254
	cmp	byte ptr [bp-15],13
	je	short @3@254
	cmp	byte ptr [bp-15],15
	je	short @3@254
   ;	
   ;			  {RQ_PRG=7; RETURN=1; return(-1);}  //illegal data
   ;	
	?debug	L 618
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,7
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@3@254:
   ;	
   ;		 if(last2!=0x0c && last2!=0x0d && last2 !=0x0f)
   ;	
	?debug	L 619
	cmp	dl,12
	je	short @3@366
	cmp	dl,13
	je	short @3@366
	cmp	dl,15
	je	short @3@366
   ;	
   ;			  {RQ_PRG=7; RETURN=1; return(-1);}  //illegal data
   ;	
	?debug	L 620
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,7
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@3@366:
   ;	
   ;		 //----check operand's sign
   ;					if   (last1==0x0d)
   ;	
	?debug	L 622
	cmp	byte ptr [bp-15],13
	jne	short @3@422
   ;	
   ;							SIGN_AL1=-1;
   ;	
	?debug	L 623
	mov	word ptr [bp-2],-1
	jmp	short @3@450
@3@422:
   ;	
   ;					else
   ;							SIGN_AL1=1;
   ;	
	?debug	L 625
	mov	word ptr [bp-2],1
@3@450:
   ;	
   ;					if   (last2==0x0d)
   ;	
	?debug	L 626
	cmp	dl,13
	jne	short @3@506
   ;	
   ;							 SIGN_AL2=-1;
   ;	
	?debug	L 627
	mov	word ptr [bp-4],-1
	jmp	short @3@534
@3@506:
   ;	
   ;					else
   ;							 SIGN_AL2=1;
   ;	
	?debug	L 629
	mov	word ptr [bp-4],1
@3@534:
   ;	
   ;	
   ;	
   ;		 //copy operands to work arrays
   ;				  work1[0]=(GET_BYTE(ADRESS1+L1)>>4)&0xf;
   ;	
	?debug	L 633
	movsx	eax,word ptr [bp+10]
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp-54],al
   ;	
   ;				  for(k=1,i=L1-1; i>=0; i--)
   ;	
	?debug	L 634
	mov	di,1
	mov	si,word ptr [bp+10]
	dec	si
	jmp	short @3@618
@3@562:
   ;	
   ;					{ byte=GET_BYTE(ADRESS1+i);
   ;	
	?debug	L 635
	movsx	eax,si
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	cl,al
   ;	
   ;					  work1[k++]  =byte&0xf;
   ;	
	?debug	L 636
	and	al,15
	mov	byte ptr [bp+di-54],al
	inc	di
   ;	
   ;					  work1[k++]  =(byte>>4)&0xf;
   ;	
	?debug	L 637
	mov	al,cl
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp+di-54],al
	inc	di
	?debug	L 634
	dec	si
@3@618:
	or	si,si
	jge	short @3@562
   ;	
   ;					}
   ;	
   ;				  work2[0]=(GET_BYTE(ADRESS2+L2)>>4)&0xf;
   ;	
	?debug	L 640
	movsx	eax,word ptr [bp+16]
	mov	edx,dword ptr [bp+12]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp-86],al
   ;	
   ;				  for(k=1,i=L2-1; i>=0; i--)
   ;	
	?debug	L 641
	mov	di,1
	mov	si,word ptr [bp+16]
	dec	si
	jmp	short @3@730
@3@674:
   ;	
   ;					{ byte=GET_BYTE(ADRESS2+i);
   ;	
	?debug	L 642
	movsx	eax,si
	mov	edx,dword ptr [bp+12]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	cl,al
   ;	
   ;					  work2[k++]  =byte&0xf;
   ;	
	?debug	L 643
	and	al,15
	mov	byte ptr [bp+di-86],al
	inc	di
   ;	
   ;					  work2[k++]  =(byte>>4)&0xf;
   ;	
	?debug	L 644
	mov	al,cl
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp+di-86],al
	inc	di
	?debug	L 641
	dec	si
@3@730:
	or	si,si
	jge	short @3@674
   ;	
   ;					}
   ;	
   ;	
   ;				  //check length of first operand (it should be enough for result)
   ;				  for(i=num1-1,nz1=0; i>=0; i--)
   ;	
	?debug	L 649
	mov	si,word ptr [bp-12]
	dec	si
	xor	dx,dx
	jmp	short @3@870
@3@786:
   ;	
   ;					 if(work1[i]==0) nz1++;
   ;	
	?debug	L 650
	cmp	byte ptr [bp+si-54],0
	jne	short @3@898
	inc	dx
	?debug	L 649
	dec	si
@3@870:
	or	si,si
	jge	short @3@786
@3@898:
   ;	
   ;					 else  break;
   ;	
   ;				  for(i=num2-1,nz2=0; i>=0; i--)
   ;	
	?debug	L 653
	mov	si,word ptr [bp-14]
	dec	si
	mov	word ptr [bp-6],0
	jmp	short @3@1010
@3@926:
   ;	
   ;					 if(work2[i]==0) nz2++;
   ;	
	?debug	L 654
	cmp	byte ptr [bp+si-86],0
	jne	short @3@1038
	inc	word ptr [bp-6]
	?debug	L 653
	dec	si
@3@1010:
	or	si,si
	jge	short @3@926
@3@1038:
   ;	
   ;					 else  break;
   ;	
   ;				  memset(result,0,32);
   ;	
	?debug	L 657
	push	ss
	pop	es
	lea	di,word ptr [bp-182]
	xor	ax,ax
	mov	ah,al
	mov	cx,16
	rep 	stosw	
   ;	
   ;				  nRes=0;
   ;	
	?debug	L 658
	mov	word ptr [bp-10],0
   ;	
   ;					nRem=0;
   ;	
	?debug	L 659
	mov	word ptr [bp-8],0
   ;	
   ;	
   ;				  num1 -=nz1; num2 -=nz2;  //don't forgot recalculate num1, num2
   ;	
	?debug	L 661
	sub	word ptr [bp-12],dx
	mov	ax,word ptr [bp-6]
	sub	word ptr [bp-14],ax
   ;	
   ;				  if(num2==0)   //divide to ZERO !!!
   ;	
	?debug	L 662
	cmp	word ptr [bp-14],0
	jne	short @3@1094
   ;	
   ;							{RQ_PRG=0x000b; RETURN=1; return(-1);}    //append  PSW_ and RETURN !!!
   ;	
	?debug	L 663
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,11
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@3@1094:
   ;	
   ;				  if(num1==0) goto WRITE_RESULT;
   ;	
	?debug	L 664
	cmp	word ptr [bp-12],0
	jne short	@@39
	jmp	@3@3558
@@39:
   ;	
   ;	
   ;					nRem=num2;
   ;	
	?debug	L 666
	mov	ax,word ptr [bp-14]
	mov	word ptr [bp-8],ax
   ;	
   ;					for(i=0; i<num2; i++)
   ;	
	?debug	L 667
	xor	si,si
	mov	di,word ptr [bp-12]
	sub	di,word ptr [bp-14]
	lea	ax,word ptr [bp-54]
	add	di,ax
	cmp	si,word ptr [bp-14]
	jge	short @3@1318
@3@1206:
   ;	
   ;						  remainder[i] =work1[num1-nRem+i];
   ;	
	?debug	L 668
	mov	al,byte ptr ss:[di]
	mov	byte ptr [bp+si-118],al
	?debug	L 667
	inc	di
	inc	si
	cmp	si,word ptr [bp-14]
	jl	short @3@1206
@3@1318:
   ;	
   ;	
   ;	
   ;					if(num1>num2 && CmpD(remainder,work2,num2)<0)
   ;	
	?debug	L 671
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-14]
	jle	short @3@1570
	push	word ptr [bp-14]
	push	ss
	lea	ax,word ptr [bp-86]
	push	ax
	push	ss
	lea	ax,word ptr [bp-118]
	push	ax
	call	far ptr _CmpD
	add	sp,10
	or	ax,ax
	jge	short @3@1570
   ;	
   ;					 {nRem++;
   ;	
	?debug	L 672
	inc	word ptr [bp-8]
   ;	
   ;					  for(i=0; i<num2+1; i++)
   ;	
	?debug	L 673
	xor	si,si
	mov	di,word ptr [bp-12]
	sub	di,word ptr [bp-8]
	lea	ax,word ptr [bp-54]
	add	di,ax
	mov	ax,word ptr [bp-14]
	inc	ax
	mov	word ptr [bp-22],ax
	jmp	short @3@1542
@3@1458:
   ;	
   ;						  remainder[i] =work1[num1-nRem+i];
   ;	
	?debug	L 674
	mov	al,byte ptr ss:[di]
	mov	byte ptr [bp+si-118],al
	?debug	L 673
	inc	di
	inc	si
@3@1542:
	cmp	word ptr [bp-22],si
	jg	short @3@1458
@3@1570:
   ;	
   ;					 }
   ;				  currRem =nRem;
   ;	
	?debug	L 676
	mov	ax,word ptr [bp-8]
	mov	word ptr [bp-20],ax
@3@1598:
   ;	
   ;	
   ;	
   ;				  while(TRUE)
   ;				  {
   ;					  //find necessary length of remainder for operation
   ;					 if(nRem<num2 || (nRem==num2 && CmpD(remainder,work2,num2)<0)) break;
   ;	
	?debug	L 682
	mov	ax,word ptr [bp-8]
	cmp	ax,word ptr [bp-14]
	jge short	@@40
	jmp	@3@3558
@@40:
	cmp	ax,word ptr [bp-14]
	jne	short @3@1682
	push	word ptr [bp-14]
	push	ss
	lea	ax,word ptr [bp-86]
	push	ax
	push	ss
	lea	ax,word ptr [bp-118]
	push	ax
	call	far ptr _CmpD
	add	sp,10
	or	ax,ax
	jge short	@@41
	jmp	@3@3558
@@41:
@3@1682:
   ;	
   ;					 if(num2>1)
   ;	
	?debug	L 683
	cmp	word ptr [bp-14],1
	jg short	@@42
	jmp	@3@1794
@@42:
   ;	
   ;					  {div =work2[num2-1]*10+work2[num2-2];
   ;	
	?debug	L 684
	lea	ax,word ptr [bp-87]
	mov	bx,word ptr [bp-14]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	dx,10
	imul	dx
	lea	dx,word ptr [bp-88]
	mov	bx,word ptr [bp-14]
	add	bx,dx
	push	ax
	mov	al,byte ptr ss:[bx]
	cbw	
	pop	cx
	add	cx,ax
   ;	
   ;						if(nRem==num2)
   ;	
	?debug	L 685
	mov	ax,word ptr [bp-8]
	cmp	ax,word ptr [bp-14]
	jne	short @3@1766
   ;	
   ;						  rem=remainder[nRem-1]*10 +remainder[nRem-2];
   ;	
	?debug	L 686
	lea	ax,word ptr [bp-119]
	mov	bx,word ptr [bp-8]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	dx,10
	imul	dx
	lea	dx,word ptr [bp-120]
	mov	bx,word ptr [bp-8]
	add	bx,dx
	push	ax
	mov	al,byte ptr ss:[bx]
	cbw	
	pop	bx
	add	bx,ax
	jmp	@3@1878
@3@1766:
   ;	
   ;						else
   ;						  rem=remainder[nRem-1]*100 +remainder[nRem-2]*10 +remainder[nRem-3];
   ;	
	?debug	L 688
	lea	ax,word ptr [bp-119]
	mov	bx,word ptr [bp-8]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	dx,100
	imul	dx
	lea	dx,word ptr [bp-120]
	mov	bx,word ptr [bp-8]
	add	bx,dx
	push	ax
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	dx,10
	imul	dx
	pop	bx
	add	bx,ax
	lea	ax,word ptr [bp-121]
	mov	si,word ptr [bp-8]
	add	si,ax
	mov	al,byte ptr ss:[si]
	cbw	
	add	bx,ax
	jmp	short @3@1878
@3@1794:
   ;	
   ;					  }
   ;					 else
   ;					 { div=work2[num2-1];
   ;	
	?debug	L 691
	lea	ax,word ptr [bp-87]
	mov	bx,word ptr [bp-14]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	cx,ax
   ;	
   ;						if(nRem==num2)
   ;	
	?debug	L 692
	mov	ax,word ptr [bp-8]
	cmp	ax,word ptr [bp-14]
	jne	short @3@1850
   ;	
   ;						  rem=remainder[nRem-1];
   ;	
	?debug	L 693
	lea	ax,word ptr [bp-119]
	mov	bx,word ptr [bp-8]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	bx,ax
	jmp	short @3@1878
@3@1850:
   ;	
   ;						else
   ;						  rem=remainder[nRem-1]*10 +remainder[nRem-2];
   ;	
	?debug	L 695
	lea	ax,word ptr [bp-119]
	mov	bx,word ptr [bp-8]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	dx,10
	imul	dx
	lea	dx,word ptr [bp-120]
	mov	bx,word ptr [bp-8]
	add	bx,dx
	push	ax
	mov	al,byte ptr ss:[bx]
	cbw	
	pop	bx
	add	bx,ax
@3@1878:
   ;	
   ;					 }
   ;	
   ;					 rrr=rem/div;  //approximately count digit for result -high limit
   ;	
	?debug	L 698
	mov	ax,bx
	cwd	
	idiv	cx
	mov	word ptr [bp-18],ax
   ;	
   ;					 //multiply rrr to divider
   ;					 for(i=0; i<num2+1; i++)
   ;	
	?debug	L 700
	xor	si,si
	mov	ax,word ptr [bp-14]
	inc	ax
	mov	word ptr [bp-22],ax
	cmp	si,ax
	jge	short @3@2046
	mov	cx,word ptr [bp-22]
	lea	di,word ptr [bp-214]
	push	ss
	pop	es
	xor	ax,ax
	shr	cx,1
	rep 	stosw	
	jnc	short @3@2046
	stosb	
@3@2046:
   ;	
   ;						 multi[i]=0;
   ;	
   ;					 for(i=0; i<num2; i++)
   ;	
	?debug	L 703
	xor	si,si
	lea	di,word ptr [bp-214]
	cmp	si,word ptr [bp-14]
	jl short	@@43
	jmp	@3@2522
@@43:
@3@2130:
   ;	
   ;						 { multi[i] +=work2[i]*rrr;
   ;	
	?debug	L 704
	mov	al,byte ptr [bp+si-86]
	cbw	
	imul	word ptr [bp-18]
	mov	dl,byte ptr ss:[di]
	add	dl,al
	mov	byte ptr ss:[di],dl
   ;	
   ;							if(multi[i]>=10)
   ;	
	?debug	L 705
	cmp	byte ptr ss:[di],10
	jl	short @3@2186
   ;	
   ;							  {tens =multi[i]/10;
   ;	
	?debug	L 706
	mov	al,byte ptr ss:[di]
	cbw	
	mov	bx,10
	cwd	
	idiv	bx
	mov	cl,al
   ;	
   ;								multi[i+1] +=tens;
   ;	
	?debug	L 707
	lea	ax,word ptr [bp-213]
	mov	bx,si
	add	bx,ax
	mov	dx,bx
	mov	al,byte ptr ss:[bx]
	add	al,cl
	mov	byte ptr ss:[bx],al
   ;	
   ;								multi[i] -=tens*10;
   ;	
	?debug	L 708
	mov	al,cl
	mov	ah,0
	mov	dx,10
	imul	dx
	mov	dl,byte ptr ss:[di]
	sub	dl,al
	mov	byte ptr ss:[di],dl
@3@2186:
	?debug	L 703
	inc	di
	inc	si
	cmp	si,word ptr [bp-14]
	jl	short @3@2130
	jmp	short @3@2522
@3@2298:
   ;	
   ;							  }
   ;						 }
   ;					  //find koefficient
   ;					  while (CmpD(remainder,multi,nRem)<0 && rrr>0)
   ;					  {rrr--;
   ;	
	?debug	L 713
	dec	word ptr [bp-18]
   ;	
   ;						for(i=0; i<num2; i++)
   ;	
	?debug	L 714
	xor	si,si
	lea	di,word ptr [bp-214]
	cmp	si,word ptr [bp-14]
	jge	short @3@2522
@3@2382:
   ;	
   ;						{multi[i] -=work2[i];
   ;	
	?debug	L 715
	mov	al,byte ptr [bp+si-86]
	sub	byte ptr ss:[di],al
   ;	
   ;						 if(multi[i]<0)
   ;	
	?debug	L 716
	cmp	byte ptr ss:[di],0
	jge	short @3@2438
   ;	
   ;							 {multi[i]  +=10;
   ;	
	?debug	L 717
	mov	al,byte ptr ss:[di]
	add	al,10
	mov	byte ptr ss:[di],al
   ;	
   ;							  multi[i+1]-=1;
   ;	
	?debug	L 718
	lea	ax,word ptr [bp-213]
	mov	bx,si
	add	bx,ax
	mov	dx,bx
	mov	al,byte ptr ss:[bx]
	dec	al
	mov	byte ptr ss:[bx],al
@3@2438:
	?debug	L 714
	inc	di
	inc	si
	cmp	si,word ptr [bp-14]
	jl	short @3@2382
@3@2522:
	?debug	L 712
	push	word ptr [bp-8]
	push	ss
	lea	ax,word ptr [bp-214]
	push	ax
	push	ss
	lea	ax,word ptr [bp-118]
	push	ax
	call	far ptr _CmpD
	add	sp,10
	or	ax,ax
	jge	short @3@2578
	cmp	word ptr [bp-18],0
	jg	short @3@2298
@3@2578:
   ;	
   ;							 }
   ;						}
   ;					  }
   ;					 result[nRes++] =rrr;
   ;	
	?debug	L 722
	lea	ax,word ptr [bp-182]
	mov	bx,word ptr [bp-10]
	add	bx,ax
	mov	al,byte ptr [bp-18]
	mov	byte ptr ss:[bx],al
	inc	word ptr [bp-10]
   ;	
   ;	
   ;					 //find differ
   ;	
   ;					 for(i=0; i<nRem; i++)
   ;	
	?debug	L 726
	xor	si,si
	cmp	si,word ptr [bp-8]
	jge	short @3@2718
@3@2634:
   ;	
   ;					  differ[i] =remainder[i]-multi[i];
   ;	
	?debug	L 727
	mov	al,byte ptr [bp+si-118]
	sub	al,byte ptr [bp+si-214]
	mov	byte ptr [bp+si-150],al
	?debug	L 726
	inc	si
	cmp	si,word ptr [bp-8]
	jl	short @3@2634
@3@2718:
   ;	
   ;	
   ;					 for(i=0; i<nRem; i++)
   ;	
	?debug	L 729
	xor	si,si
	lea	di,word ptr [bp-150]
	cmp	si,word ptr [bp-8]
	jge	short @3@2942
@3@2802:
   ;	
   ;					  if(differ[i]<0)
   ;	
	?debug	L 730
	cmp	byte ptr ss:[di],0
	jge	short @3@2858
   ;	
   ;						 { differ[i]+=10;
   ;	
	?debug	L 731
	mov	al,byte ptr ss:[di]
	add	al,10
	mov	byte ptr ss:[di],al
   ;	
   ;							differ[i+1] -=1;
   ;	
	?debug	L 732
	lea	ax,word ptr [bp-149]
	mov	bx,si
	add	bx,ax
	mov	dx,bx
	mov	al,byte ptr ss:[bx]
	dec	al
	mov	byte ptr ss:[bx],al
@3@2858:
	?debug	L 729
	inc	di
	inc	si
	cmp	si,word ptr [bp-8]
	jl	short @3@2802
@3@2942:
   ;	
   ;						 }
   ;					 for(nzDiff=0,i=nRem-1; i>=0; i--)  //count number of zero digits
   ;	
	?debug	L 734
	xor	dx,dx
	mov	si,word ptr [bp-8]
	dec	si
	jmp	short @3@3054
@3@2970:
   ;	
   ;						if(differ[i]!=0) break;
   ;	
	?debug	L 735
	cmp	byte ptr [bp+si-150],0
	jne	short @3@3082
   ;	
   ;						else nzDiff++;
   ;	
	?debug	L 736
	inc	dx
	?debug	L 734
	dec	si
@3@3054:
	or	si,si
	jge	short @3@2970
@3@3082:
   ;	
   ;	
   ;					 //build new remainder from differ and work1:  case if differ == 0 ?
   ;	
   ;	
   ;					for(i=0; i<nRem -nzDiff; i++)
   ;	
	?debug	L 741
	xor	si,si
	mov	ax,word ptr [bp-14]
	inc	ax
	mov	ax,word ptr [bp-8]
	sub	ax,dx
	mov	cx,ax
	jmp	short @3@3194
@3@3138:
   ;	
   ;					  remainder[i] = differ[i];   //store differ in remainder
   ;	
	?debug	L 742
	mov	al,byte ptr [bp+si-150]
	mov	byte ptr [bp+si-118],al
	?debug	L 741
	inc	si
@3@3194:
	cmp	cx,si
	jg	short @3@3138
   ;	
   ;					nRem = nRem-nzDiff;
   ;	
	?debug	L 743
	mov	word ptr [bp-8],cx
@3@3250:
   ;	
   ;	
   ;					while(TRUE)
   ;					{
   ;					 if(currRem<num1)
   ;	
	?debug	L 747
	mov	ax,word ptr [bp-20]
	cmp	ax,word ptr [bp-12]
	jge	short @3@3530
   ;	
   ;					 {currRem++;
   ;	
	?debug	L 748
	inc	word ptr [bp-20]
   ;	
   ;					  for(i=nRem-1; i>=0; i--)
   ;	
	?debug	L 749
	mov	si,word ptr [bp-8]
	dec	si
	jmp	short @3@3362
@3@3306:
   ;	
   ;						 remainder[i+1]=remainder[i];
   ;	
	?debug	L 750
	mov	al,byte ptr [bp+si-118]
	mov	byte ptr [bp+si-117],al
	?debug	L 749
	dec	si
@3@3362:
	or	si,si
	jge	short @3@3306
   ;	
   ;	
   ;					  remainder[0]=work1[num1-currRem];
   ;	
	?debug	L 752
	mov	bx,word ptr [bp-12]
	sub	bx,word ptr [bp-20]
	lea	ax,word ptr [bp-54]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	mov	byte ptr [bp-118],al
   ;	
   ;					  nRem++;
   ;	
	?debug	L 753
	inc	word ptr [bp-8]
   ;	
   ;					 }
   ;	
	?debug	L 754
   ;	
   ;					 else
   ;						 break;
   ;					 if(nRem<num2 || nRem==num2 && CmpD(remainder, work2, num2)<0)
   ;	
	?debug	L 757
	mov	ax,word ptr [bp-8]
	cmp	ax,word ptr [bp-14]
	jl	short @3@3502
	cmp	ax,word ptr [bp-14]
	jne	short @3@3530
	push	word ptr [bp-14]
	push	ss
	lea	ax,word ptr [bp-86]
	push	ax
	push	ss
	lea	ax,word ptr [bp-118]
	push	ax
	call	far ptr _CmpD
	add	sp,10
	or	ax,ax
	jge	short @3@3530
@3@3502:
   ;	
   ;					 {				 //append zero to result
   ;					  result[nRes++]=0;
   ;	
	?debug	L 759
	lea	ax,word ptr [bp-182]
	mov	bx,word ptr [bp-10]
	add	bx,ax
	mov	byte ptr ss:[bx],0
	inc	word ptr [bp-10]
   ;	
   ;					 }
   ;	
	?debug	L 760
	jmp	short @3@3250
@3@3530:
   ;	
   ;					 else break;
   ;					}
   ;					if(currRem>num1)
   ;	
	?debug	L 763
	mov	ax,word ptr [bp-20]
	cmp	ax,word ptr [bp-12]
	jg short	@@44
	jmp	@3@1598
@@44:
@3@3558:
   ;	
   ;						 break;
   ;	
	?debug	L 764
   ;	
   ;	
   ;				}
   ;	
   ;	WRITE_RESULT:
   ;			//Write results to 360
   ;			  if(L2+(nRes+1)/2 > L1)
   ;	
	?debug	L 770
	mov	ax,word ptr [bp-10]
	inc	ax
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	dx,word ptr [bp+16]
	add	dx,ax
	cmp	dx,word ptr [bp+10]
	jle	short @3@3614
   ;	
   ;					{RQ_PRG=0x000b; RETURN=1; return(-1);} //incorrect decima divide !!!
   ;	
	?debug	L 771
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,11
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@3@3614:
	mov	ax,word ptr [bp+16]
	shl	ax,1
	inc	ax
	cmp	word ptr [bp-8],ax
	jge	short @3@3754
	mov	ax,word ptr [bp+16]
	shl	ax,1
	inc	ax
	sub	ax,word ptr [bp-8]
	mov	cx,ax
	lea	di,word ptr [bp-118]
	add	di,word ptr [bp-8]
	push	ss
	pop	es
	xor	ax,ax
	shr	cx,1
   ;	
   ;			  //fill necessary 0 to remainder
   ;			  for(i=nRem; i<2*L2+1; i++)
   ;	
	?debug	L 773
	rep 	stosw	
	jnc	short @3@3754
	stosb	
@3@3754:
   ;	
   ;				 remainder[i]=0;
   ;	
   ;				 //write remainder
   ;			  byte=(remainder[0]&0x0f)<<4;
   ;	
	?debug	L 777
	mov	al,byte ptr [bp-118]
	and	al,15
	shl	al,4
	mov	cl,al
   ;	
   ;			  if(SIGN_AL1==1) byte|=0xc;
   ;	
	?debug	L 778
	cmp	word ptr [bp-2],1
	jne	short @3@3810
	or	cl,12
	jmp	short @3@3838
@3@3810:
   ;	
   ;			  else            byte|=0xd;
   ;	
	?debug	L 779
	or	cl,13
@3@3838:
   ;	
   ;			  PUT_BYTE(ADRESS1+L1,byte);
   ;	
	?debug	L 780
	push	cx
	movsx	eax,word ptr [bp+10]
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;				  for(k=1,i=L1-1; i>=L1-L2; i--, k+=2)
   ;	
	?debug	L 781
	mov	di,1
	mov	si,word ptr [bp+10]
	dec	si
	jmp	short @3@3922
@3@3866:
   ;	
   ;				 {
   ;				  byte=((remainder[k+1]&0x0f)<<4)| (remainder[k]&0x0f);
   ;	
	?debug	L 783
	mov	al,byte ptr [bp+di-117]
	and	al,15
	shl	al,4
	mov	dl,byte ptr [bp+di-118]
	and	dl,15
	or	al,dl
	mov	cl,al
   ;	
   ;				  PUT_BYTE(ADRESS1+i,byte);
   ;	
	?debug	L 784
	push	ax
	movsx	eax,si
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	?debug	L 781
	dec	si
	add	di,2
@3@3922:
	mov	ax,word ptr [bp+10]
	sub	ax,word ptr [bp+16]
	cmp	ax,si
	jle	short @3@3866
   ;	
   ;				 }
   ;	
   ;	
   ;			  memset(work1, 0, 32);
   ;	
	?debug	L 788
	push	ss
	pop	es
	lea	di,word ptr [bp-54]
	xor	ax,ax
	mov	ah,al
	mov	cx,16
	rep 	stosw	
   ;	
   ;			  for(i=0; i<nRes; i++)
   ;	
	?debug	L 789
	xor	si,si
	mov	di,word ptr [bp-10]
	dec	di
	lea	ax,word ptr [bp-182]
	add	di,ax
	cmp	si,word ptr [bp-10]
	jge	short @3@4146
@3@4034:
   ;	
   ;						 work1[i]=result[nRes-1-i];  //reverse of significat digits
   ;	
	?debug	L 790
	mov	al,byte ptr ss:[di]
	mov	byte ptr [bp+si-54],al
	?debug	L 789
	dec	di
	inc	si
	cmp	si,word ptr [bp-10]
	jl	short @3@4034
@3@4146:
   ;	
   ;	
   ;			  byte=(work1[0]&0x0f)<<4;
   ;	
	?debug	L 792
	mov	al,byte ptr [bp-54]
	and	al,15
	shl	al,4
	mov	cl,al
   ;	
   ;			  SIGN_AL1 *=SIGN_AL2;
   ;	
	?debug	L 793
	mov	ax,word ptr [bp-2]
	imul	word ptr [bp-4]
	mov	word ptr [bp-2],ax
   ;	
   ;			  if(SIGN_AL1==1) byte|=0xc;
   ;	
	?debug	L 794
	cmp	word ptr [bp-2],1
	jne	short @3@4202
	or	cl,12
	jmp	short @3@4230
@3@4202:
   ;	
   ;			  else            byte|=0xd;
   ;	
	?debug	L 795
	or	cl,13
@3@4230:
   ;	
   ;			  PUT_BYTE(ADRESS1+L1-L2-1,byte);
   ;	
	?debug	L 796
	push	cx
	movsx	eax,word ptr [bp+10]
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	movsx	eax,word ptr [bp+16]
	sub	edx,eax
	dec	edx
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;			  for(k=1,i=L1-L2-2; i>=0; i--, k+=2)
   ;	
	?debug	L 797
	mov	di,1
	mov	si,word ptr [bp+10]
	sub	si,word ptr [bp+16]
	add	si,-2
	jmp	short @3@4314
@3@4258:
   ;	
   ;				 {
   ;				  byte=((work1[k+1]&0x0f)<<4)| (work1[k]&0x0f);
   ;	
	?debug	L 799
	mov	al,byte ptr [bp+di-53]
	and	al,15
	shl	al,4
	mov	dl,byte ptr [bp+di-54]
	and	dl,15
	or	al,dl
	mov	cl,al
   ;	
   ;				  PUT_BYTE(ADRESS1+i,byte);
   ;	
	?debug	L 800
	push	ax
	movsx	eax,si
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	?debug	L 797
	dec	si
	add	di,2
@3@4314:
	or	si,si
	jge	short @3@4258
   ;	
   ;				 }
   ;	
   ;	
   ;	
   ;	
   ;	 return(0);
   ;	
	?debug	L 806
	xor	ax,ax
   ;	
   ;	
   ;	}
   ;	
	?debug	L 808
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
	?debug	C E3220020001A02
	?debug	C E3230020001A02
	?debug	C E3240020001A02
	?debug	C E3250020001A02
	?debug	C E3260020001A02
	?debug	C E3270020001A02
	?debug	C E6076375727252656D0402ECFF015B02066E7A44+
	?debug	C 696666040801B005D60504020003646976040801+
	?debug	C 8C0347040401000372656D040801B90347040403+
	?debug	C 00037272720402EEFF00056D756C746922022AFF+
	?debug	C 0006726573756C7423024AFF0006646966666572+
	?debug	C 24026AFF000972656D61696E64657225028AFF00+
	?debug	C 056C6173743208080144004801040200056C6173+
	?debug	C 74310802F1FF000474656E73080801A604C40404+
	?debug	C 010004627974650808019E01F107040100046E75+
	?debug	C 6D320402F2FF00046E756D310402F4FF00046E52+
	?debug	C 65730402F6FF00046E52656D0402F8FF00036E7A+
	?debug	C 320402FAFF00036E7A3104080122027602040200+
	?debug	C 016B04080180010B08040700016904080184010D+
	?debug	C 0804060005776F726B322602AAFF0005776F726B+
	?debug	C 312702CAFF00085349474E5F414C320402FCFF01+
	?debug	C 5302085349474E5F414C310402FEFF0153020741+
	?debug	C 4452455353310C0A060000025231040A0A000007+
	?debug	C 414452455353320C0A0C0000025232040A100000
	?debug	E
	?debug	E
_DecimalDivide	endp
   ;	
   ;	int CmpD(signed char *Src, signed char *Dest, int num)
   ;	
	?debug	L 810
	assume	cs:DS360CDF_TEXT
_CmpD	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,DS360CDF_DATA
	mov	ds,ax
	?debug	C E328000400160200
	?debug	C E6036E756D040A0E00000444657374280A0A0000+
	?debug	C 03537263280A060000
	?debug	B
   ;	
   ;	{
   ;	 int i;
   ;	 for(i=num-1; i>=0; i--)
   ;	
	?debug	L 813
	mov	dx,word ptr [bp+14]
	dec	dx
	mov	di,word ptr [bp+6]
	add	di,dx
	mov	si,word ptr [bp+10]
	add	si,dx
	jmp	short @4@282
@4@86:
   ;	
   ;		{ if(Src[i]>Dest[i]) return(1);
   ;	
	?debug	L 814
	mov	es,word ptr [bp+8]
	mov	al,byte ptr es:[di]
	mov	cl,al
	mov	es,word ptr [bp+12]
	cmp	al,byte ptr es:[si]
	jle	short @4@142
	mov	ax,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@4@142:
   ;	
   ;		  if(Src[i]<Dest[i]) return(-1);
   ;	
	?debug	L 815
	mov	es,word ptr [bp+12]
	cmp	cl,byte ptr es:[si]
	jge	short @4@198
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@4@198:
	?debug	L 813
	dec	di
	dec	si
	dec	dx
@4@282:
	or	dx,dx
	jge	short @4@86
   ;	
   ;		}
   ;	  return 0;
   ;	
	?debug	L 817
	xor	ax,ax
   ;	
   ;	}
   ;	
	?debug	L 818
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
	?debug	C E601690408010F004F0004020003537263280A06+
	?debug	C 00000444657374280A0A0000036E756D040A0E00+
	?debug	C 00
	?debug	E
	?debug	E
_CmpD	endp
   ;	
   ;	void mem_set_value(char *mem, int c, int size)
   ;	
	?debug	L 819
	assume	cs:DS360CDF_TEXT
_mem_set_value	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,2
	push	di
	push	ds
	mov	ax,DS360CDF_DATA
	mov	ds,ax
	?debug	C E60473697A65040A0C00000163040A0A0000036D+
	?debug	C 656D180A060000
	mov	dx,word ptr [bp+12]
	?debug	B
   ;	
   ;	{int i;
   ;	 for(i=0; i<size; i++)
   ;	
	?debug	L 821
	mov	word ptr [bp-2],0
	cmp	word ptr [bp-2],dx
	jge	short @5@198
	mov	cx,dx
	mov	di,word ptr [bp+6]
	mov	es,word ptr [bp+8]
	mov	al,byte ptr [bp+10]
	mov	ah,al
	shr	cx,1
	rep 	stosw	
	jnc	short @5@198
	stosb	
@5@198:
   ;	
   ;			mem[i]=c;
   ;	
   ;	}
   ;	
	?debug	L 824
	pop	ds
	pop	di
	leave	
	ret	
	?debug	C E601690402FEFF00036D656D180A060000016304+
	?debug	C 0A0A00000473697A6504080110001F000C0200
	?debug	E
	?debug	E
_mem_set_value	endp
   ;	
   ;	int DecimalMultiply(unsigned long ADRESS1, int L1, unsigned long ADRESS2, int L2 )
   ;	
	?debug	L 826
	assume	cs:DS360CDF_TEXT
_DecimalMultiply	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,600
	push	si
	push	di
	push	ds
	mov	ax,DS360CDF_DATA
	mov	ds,ax
	?debug	C E6025232040A10000007414452455353320C0A0C+
	?debug	C 0000025231040A0A000007414452455353310C0A+
	?debug	C 060000
	?debug	B
   ;	
   ;	{int  SIGN_AL1=1, SIGN_AL2=1;
   ;	
	?debug	L 827
   ;	
   ;	 signed char  work1[32], work2[32];
   ;	 int  i,k, nz1, nz2;
   ;	 int  num1, num2;
   ;	 char byte, tens, last1, last2;
   ;	 signed char buff[512];     //32*16
   ;	
   ;	
   ;		 last1 =GET_BYTE(ADRESS1+L1) & 0x0f;
   ;	
	?debug	L 835
	movsx	eax,word ptr [bp+10]
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	and	al,15
	mov	byte ptr [bp-10],al
   ;	
   ;		 last2 =GET_BYTE(ADRESS2+L2) & 0x0f;
   ;	
	?debug	L 836
	movsx	eax,word ptr [bp+16]
	mov	edx,dword ptr [bp+12]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	and	al,15
	mov	dl,al
   ;	
   ;	
   ;		 //--check data format
   ;		 if(L2>8)
   ;	
	?debug	L 839
	cmp	word ptr [bp+16],8
	jle	short @6@86
   ;	
   ;			{RQ_PRG=6; RETURN=1; return(-1);}    //length of operand should be less then 8
   ;	
	?debug	L 840
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,6
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@6@86:
   ;	
   ;		 if(last1!=0x0c && last1!=0x0d && last1 !=0x0f)
   ;	
	?debug	L 841
	cmp	byte ptr [bp-10],12
	je	short @6@198
	cmp	byte ptr [bp-10],13
	je	short @6@198
	cmp	byte ptr [bp-10],15
	je	short @6@198
   ;	
   ;			 {RQ_PRG=7; RETURN=1; return(-1);}  //illegal data
   ;	
	?debug	L 842
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,7
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@6@198:
   ;	
   ;		 if(last2!=0x0c && last2!=0x0d && last2 !=0x0f)
   ;	
	?debug	L 843
	cmp	dl,12
	je	short @6@310
	cmp	dl,13
	je	short @6@310
	cmp	dl,15
	je	short @6@310
   ;	
   ;			 {RQ_PRG=7; RETURN=1; return(-1);}  //illegal data
   ;	
	?debug	L 844
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,7
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@6@310:
   ;	
   ;		 //----check operand's sign
   ;					if   (last1==0x0d)
   ;	
	?debug	L 846
	cmp	byte ptr [bp-10],13
	jne	short @6@366
   ;	
   ;							SIGN_AL1=-1;
   ;	
	?debug	L 847
	mov	word ptr [bp-2],-1
	jmp	short @6@394
@6@366:
   ;	
   ;					else
   ;							SIGN_AL1=1;
   ;	
	?debug	L 849
	mov	word ptr [bp-2],1
@6@394:
   ;	
   ;					if   (last2==0x0d)
   ;	
	?debug	L 850
	cmp	dl,13
	jne	short @6@450
   ;	
   ;							 SIGN_AL2=-1;
   ;	
	?debug	L 851
	mov	word ptr [bp-4],-1
	jmp	short @6@478
@6@450:
   ;	
   ;					else
   ;							 SIGN_AL2=1;
   ;	
	?debug	L 853
	mov	word ptr [bp-4],1
@6@478:
   ;	
   ;	
   ;	
   ;		 //copy operands to work arrays
   ;					work1[0]=(GET_BYTE(ADRESS1+L1)>>4)&0xf;
   ;	
	?debug	L 857
	movsx	eax,word ptr [bp+10]
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp-56],al
   ;	
   ;				  for(k=1,i=L1-1; i>=0; i--)
   ;	
	?debug	L 858
	mov	si,1
	mov	di,word ptr [bp+10]
	dec	di
	jmp	short @6@562
@6@506:
   ;	
   ;					{ byte=GET_BYTE(ADRESS1+i);
   ;	
	?debug	L 859
	movsx	eax,di
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	cl,al
   ;	
   ;					  work1[k++]  =byte&0xf;
   ;	
	?debug	L 860
	and	al,15
	mov	byte ptr [bp+si-56],al
	inc	si
   ;	
   ;					  work1[k++]  =(byte>>4)&0xf;
   ;	
	?debug	L 861
	mov	al,cl
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp+si-56],al
	inc	si
	?debug	L 858
	dec	di
@6@562:
	or	di,di
	jge	short @6@506
   ;	
   ;					}
   ;	
   ;				  work2[0]=(GET_BYTE(ADRESS2+L2)>>4)&0xf;
   ;	
	?debug	L 864
	movsx	eax,word ptr [bp+16]
	mov	edx,dword ptr [bp+12]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp-88],al
   ;	
   ;				  for(k=1,i=L2-1; i>=0; i--)
   ;	
	?debug	L 865
	mov	si,1
	mov	di,word ptr [bp+16]
	dec	di
	jmp	short @6@674
@6@618:
   ;	
   ;					{ byte=GET_BYTE(ADRESS2+i);
   ;	
	?debug	L 866
	movsx	eax,di
	mov	edx,dword ptr [bp+12]
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	cl,al
   ;	
   ;					  work2[k++]  =byte&0xf;
   ;	
	?debug	L 867
	and	al,15
	mov	byte ptr [bp+si-88],al
	inc	si
   ;	
   ;					  work2[k++]  =(byte>>4)&0xf;
   ;	
	?debug	L 868
	mov	al,cl
	mov	ah,0
	sar	ax,4
	and	al,15
	mov	byte ptr [bp+si-88],al
	inc	si
	?debug	L 865
	dec	di
@6@674:
	or	di,di
	jge	short @6@618
   ;	
   ;					}
   ;					num1=2*L1+1;   //numbers of bytes in work[]
   ;	
	?debug	L 870
	mov	si,word ptr [bp+10]
	shl	si,1
	inc	si
   ;	
   ;					num2=2*L2+1;
   ;	
	?debug	L 871
	mov	ax,word ptr [bp+16]
	shl	ax,1
	inc	ax
	mov	word ptr [bp-8],ax
   ;	
   ;	
   ;				  //check length of first operand (it should be enough for result)
   ;				  for(i=num1-1,nz1=0; i>=0; i--)
   ;	
	?debug	L 874
	mov	di,si
	dec	di
	xor	dx,dx
	jmp	short @6@814
@6@730:
   ;	
   ;					 if(work1[i]==0) nz1++;
   ;	
	?debug	L 875
	cmp	byte ptr [bp+di-56],0
	jne	short @6@842
	inc	dx
	?debug	L 874
	dec	di
@6@814:
	or	di,di
	jge	short @6@730
@6@842:
   ;	
   ;					 else  break;
   ;	
   ;				  for(i=num2-1,nz2=0; i>=0; i--)
   ;	
	?debug	L 878
	mov	di,word ptr [bp-8]
	dec	di
	mov	word ptr [bp-6],0
	jmp	short @6@954
@6@870:
   ;	
   ;					 if(work2[i]==0) nz2++;
   ;	
	?debug	L 879
	cmp	byte ptr [bp+di-88],0
	jne	short @6@982
	inc	word ptr [bp-6]
	?debug	L 878
	dec	di
@6@954:
	or	di,di
	jge	short @6@870
@6@982:
   ;	
   ;					 else  break;
   ;	
   ;				  if(nz1<num2-nz2)
   ;	
	?debug	L 882
	mov	ax,word ptr [bp-8]
	sub	ax,word ptr [bp-6]
	mov	word ptr [bp-20],ax
	cmp	ax,dx
	jle	short @6@1038
   ;	
   ;						{RQ_PRG=7; RETURN=1; return(-1);}  //!!!! not enough space for operation
   ;	
	?debug	L 883
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,7
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	mov	ax,-1
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@6@1038:
   ;	
   ;	
   ;				  memset(buff, 0, 512);    //work array for multiply
   ;	
	?debug	L 885
	push	ss
	pop	es
	lea	di,word ptr [bp-600]
	xor	ax,ax
	mov	ah,al
	mov	cx,256
	rep 	stosw	
   ;	
   ;				  for(i=0; i<num2-nz2; i++)
   ;	
	?debug	L 886
	xor	di,di
	mov	word ptr [bp-16],0
	mov	ax,si
	sub	ax,dx
	mov	word ptr [bp-22],ax
	jmp	@6@1486
@6@1122:
   ;	
   ;				  for(k=0; k<num1-nz1; k++)
   ;	
	?debug	L 887
	xor	si,si
	mov	ax,word ptr [bp-16]
	lea	dx,word ptr [bp-599]
	add	ax,dx
	mov	word ptr [bp-12],ax
	mov	ax,word ptr [bp-16]
	lea	dx,word ptr [bp-600]
	add	ax,dx
	mov	word ptr [bp-14],ax
	jmp	@6@1402
@6@1206:
   ;	
   ;				  {byte =work1[k]*work2[i];
   ;	
	?debug	L 888
	mov	al,byte ptr [bp+si-56]
	cbw	
	push	ax
	mov	al,byte ptr [bp+di-88]
	cbw	
	mov	dx,ax
	pop	ax
	imul	dx
	mov	cl,al
   ;	
   ;					if(byte>=10)
   ;	
	?debug	L 889
	cmp	cl,10
	jb	short @6@1262
   ;	
   ;					{tens=byte/10;
   ;	
	?debug	L 890
	mov	ah,0
	mov	bx,10
	cwd	
	idiv	bx
	mov	byte ptr [bp-9],al
   ;	
   ;					 byte -=tens*10;
   ;	
	?debug	L 891
	mov	ah,0
	mov	dx,10
	imul	dx
	sub	cl,al
   ;	
   ;					 buff[33*i+k+1] +=tens;
   ;	
	?debug	L 892
	mov	bx,word ptr [bp-12]
	mov	al,byte ptr ss:[bx]
	add	al,byte ptr [bp-9]
	mov	byte ptr ss:[bx],al
@6@1262:
   ;	
   ;					}
   ;					buff[33*i+k] +=byte;
   ;	
	?debug	L 894
	mov	bx,word ptr [bp-14]
	mov	al,byte ptr ss:[bx]
	add	al,cl
	mov	byte ptr ss:[bx],al
   ;	
   ;					if(buff[33*i+k]>=10)
   ;	
	?debug	L 895
	cmp	byte ptr ss:[bx],10
	jl	short @6@1318
   ;	
   ;					 {tens =buff[33*i+k]/10;
   ;	
	?debug	L 896
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	bx,10
	cwd	
	idiv	bx
	mov	byte ptr [bp-9],al
   ;	
   ;					  buff[33*i+k] -=tens*10;
   ;	
	?debug	L 897
	mov	ah,0
	mov	dx,10
	imul	dx
	mov	bx,word ptr [bp-14]
	mov	dl,byte ptr ss:[bx]
	sub	dl,al
	mov	byte ptr ss:[bx],dl
   ;	
   ;					  buff[33*i+k+1] +=tens;
   ;	
	?debug	L 898
	mov	bx,word ptr [bp-12]
	mov	al,byte ptr ss:[bx]
	add	al,byte ptr [bp-9]
	mov	byte ptr ss:[bx],al
@6@1318:
	?debug	L 887
	inc	word ptr [bp-12]
	inc	word ptr [bp-14]
	inc	si
@6@1402:
	cmp	word ptr [bp-22],si
	jle short	@@45
	jmp	@6@1206
@@45:
	?debug	L 886
	add	word ptr [bp-16],33
	inc	di
@6@1486:
	cmp	word ptr [bp-20],di
	jle short	@@46
	jmp	@6@1122
@@46:
   ;	
   ;					 }
   ;				  }
   ;				  //count result
   ;				  memset(work1, 0, 32);
   ;	
	?debug	L 902
	push	ss
	pop	es
	lea	di,word ptr [bp-56]
	xor	ax,ax
	mov	ah,al
	mov	cx,16
	rep 	stosw	
   ;	
   ;	
   ;				  for(k=0; k<num1-nz1+num2-nz2; k++)
   ;	
	?debug	L 904
	xor	si,si
	lea	cx,word ptr [bp-56]
	lea	ax,word ptr [bp-55]
	mov	word ptr [bp-18],ax
	mov	ax,word ptr [bp-22]
	add	ax,word ptr [bp-8]
	sub	ax,word ptr [bp-6]
	mov	word ptr [bp-24],ax
	jmp	@6@1962
@6@1598:
   ;	
   ;				  {for(i=0; i<num2-nz2; i++)
   ;	
	?debug	L 905
	xor	di,di
	mov	dx,si
	lea	ax,word ptr [bp-600]
	add	dx,ax
	jmp	short @6@1766
@6@1682:
   ;	
   ;					{
   ;					 work1[k] +=buff[32*i+k];
   ;	
	?debug	L 907
	mov	bx,dx
	mov	al,byte ptr ss:[bx]
	mov	bx,cx
	add	byte ptr ss:[bx],al
	?debug	L 905
	add	dx,32
	inc	di
@6@1766:
	cmp	word ptr [bp-20],di
	jg	short @6@1682
   ;	
   ;					}
   ;					if(work1[k]>=10)
   ;	
	?debug	L 909
	mov	bx,cx
	cmp	byte ptr ss:[bx],10
	jl	short @6@1878
   ;	
   ;					 {tens=work1[k]/10;
   ;	
	?debug	L 910
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	bx,10
	cwd	
	idiv	bx
	mov	byte ptr [bp-9],al
   ;	
   ;					  work1[k+1]+=tens;
   ;	
	?debug	L 911
	mov	bx,word ptr [bp-18]
	mov	al,byte ptr ss:[bx]
	add	al,byte ptr [bp-9]
	mov	byte ptr ss:[bx],al
   ;	
   ;					  work1[k] -=tens*10;
   ;	
	?debug	L 912
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	dx,10
	imul	dx
	mov	bx,cx
	mov	dl,byte ptr ss:[bx]
	sub	dl,al
	mov	byte ptr ss:[bx],dl
   ;	
   ;					  if(work1[k+1]>=10 )
   ;	
	?debug	L 913
	mov	bx,word ptr [bp-18]
	cmp	byte ptr ss:[bx],10
	jl	short @6@1878
   ;	
   ;					  {tens=work1[k+1]/10;
   ;	
	?debug	L 914
	mov	al,byte ptr ss:[bx]
	cbw	
	mov	bx,10
	cwd	
	idiv	bx
	mov	byte ptr [bp-9],al
   ;	
   ;						work1[k+2]+=tens;
   ;	
	?debug	L 915
	lea	ax,word ptr [bp-54]
	mov	bx,si
	add	bx,ax
	mov	di,bx
	mov	al,byte ptr ss:[bx]
	add	al,byte ptr [bp-9]
	mov	byte ptr ss:[di],al
   ;	
   ;						work1[k+1] -=tens*10;
   ;	
	?debug	L 916
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	dx,10
	imul	dx
	mov	bx,word ptr [bp-18]
	mov	dl,byte ptr ss:[bx]
	sub	dl,al
	mov	byte ptr ss:[bx],dl
@6@1878:
	?debug	L 904
	inc	cx
	inc	word ptr [bp-18]
	inc	si
@6@1962:
	cmp	word ptr [bp-24],si
	jle short	@@47
	jmp	@6@1598
@@47:
   ;	
   ;					  }
   ;					 }
   ;				  }
   ;	
   ;				SIGN_AL1 *=SIGN_AL2;
   ;	
	?debug	L 921
	mov	ax,word ptr [bp-2]
	imul	word ptr [bp-4]
	mov	word ptr [bp-2],ax
   ;	
   ;						//Write results to 360
   ;	
   ;			  byte=(work1[0]&0x0f)<<4;
   ;	
	?debug	L 924
	mov	al,byte ptr [bp-56]
	and	al,15
	shl	al,4
	mov	cl,al
   ;	
   ;			  if(SIGN_AL1==1) byte|=0xc;
   ;	
	?debug	L 925
	cmp	word ptr [bp-2],1
	jne	short @6@2046
	or	cl,12
	jmp	short @6@2074
@6@2046:
   ;	
   ;			  else            byte|=0xd;
   ;	
	?debug	L 926
	or	cl,13
@6@2074:
   ;	
   ;				PUT_BYTE(ADRESS1+L1,byte);
   ;	
	?debug	L 927
	push	cx
	movsx	eax,word ptr [bp+10]
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;			  for(k=1,i=L1-1; i>=0; i--, k+=2)
   ;	
	?debug	L 928
	mov	si,1
	mov	di,word ptr [bp+10]
	dec	di
	jmp	short @6@2158
@6@2102:
   ;	
   ;				 {
   ;				  byte=((work1[k+1]&0x0f)<<4)| (work1[k]&0x0f);
   ;	
	?debug	L 930
	mov	al,byte ptr [bp+si-55]
	and	al,15
	shl	al,4
	mov	dl,byte ptr [bp+si-56]
	and	dl,15
	or	al,dl
	mov	cl,al
   ;	
   ;				  PUT_BYTE(ADRESS1+i,byte);
   ;	
	?debug	L 931
	push	ax
	movsx	eax,di
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	?debug	L 928
	dec	di
	add	si,2
@6@2158:
	or	di,di
	jge	short @6@2102
   ;	
   ;	
   ;				 }
   ;	
   ;	 return(0);
   ;	
	?debug	L 935
	xor	ax,ax
   ;	
   ;	
   ;	}
   ;	
	?debug	L 937
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
	?debug	C E3290000021A02
	?debug	C E32A0020001A02
	?debug	C E32B0020001A02
	?debug	C E604627566662902A8FD00056C61737432080801+
	?debug	C 44000701040200056C617374310802F6FF000474+
	?debug	C 656E730802F7FF0004627974650808015D017104+
	?debug	C 040100046E756D320402F8FF00046E756D310408+
	?debug	C 01E3017602040600036E7A320402FAFF00036E7A+
	?debug	C 31040801F2017602040200016B0408013F018B04+
	?debug	C 040600016904080143018D0404070005776F726B+
	?debug	C 322A02A8FF0005776F726B312B02C8FF00085349+
	?debug	C 474E5F414C320402FCFF013B03085349474E5F41+
	?debug	C 4C310402FEFF013B0307414452455353310C0A06+
	?debug	C 0000025231040A0A000007414452455353320C0A+
	?debug	C 0C0000025232040A100000
	?debug	E
	?debug	E
_DecimalMultiply	endp
DS360CDF_TEXT	ends
DS360CDF_DATA	segment word public use16 'FAR_DATA'
NU	label	word
	db	2 dup (0)
	?debug	C E9
	?debug	C FADD030000
s@	label	byte
DS360CDF_DATA	ends
DS360CDF_TEXT	segment byte public use16 'CODE'
DS360CDF_TEXT	ends
	public	_mem_set_value
	public	_CmpD
	public	_DecimalDivide
	public	_DecimalMultiply
	public	_DecimalAdd
	public	_CODEF0
	extrn	_PUT_BYTE:far
	extrn	_GET_BYTE:far
	extrn	_T00:far
	extrn	_T:far
_NU	equ	NU
	extrn	_PSW_ADRESS:word
	extrn	_PSW_CC:byte
	extrn	_PSW_ILC:word
	extrn	_R:word
	extrn	_RQ_PRG:word
	extrn	_RETURN:word
_s@	equ	s@
	?debug	C EA010D
	?debug	C E32C00000023010400
	?debug	C EC0E5F6D656D5F7365745F76616C75652C1800
	?debug	C E32D00000023040400
	?debug	C EC055F436D70442D1800
	?debug	C E32E00000023040400
	?debug	C EC0E5F446563696D616C4469766964652E1800
	?debug	C E32F00000023040400
	?debug	C EC105F446563696D616C4D756C7469706C792F18+
	?debug	C 00
	?debug	C E33000000023040400
	?debug	C EC0B5F446563696D616C416464301800
	?debug	C E33100000023010400
	?debug	C EC075F434F44454630311800
	?debug	C E33200000023010400
	?debug	C EB095F5055545F425954453200
	?debug	C E33300000023080400
	?debug	C EB095F4745545F425954453300
	?debug	C E33400000023010400
	?debug	C EB045F5430303400
	?debug	C E33500000023010400
	?debug	C EB025F543500
	?debug	C EB0B5F5053575F4144524553530C00
	?debug	C EB075F5053575F43430800
	?debug	C EB085F5053575F494C430400
	?debug	C E3360040001A0C
	?debug	C EB025F523600
	?debug	C EB075F52515F5052470400
	?debug	C EB075F52455455524E0400
	?debug	C E6024E5504000002D4000007636C6F636B5F7406+
	?debug	C 06081C000674696D655F74060608170009707472+
	?debug	C 646966665F7406060419000777636861725F7408+
	?debug	C 06032B000666706F735F740606021F000673697A+
	?debug	C 655F740A06021A00
	end
