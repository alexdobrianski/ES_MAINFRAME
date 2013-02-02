	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DS360CDB.C"
	?debug	C E917A229230A44533336304344422E43
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
	?debug	C E94019CA181A433A5C424F524C414E44435C494E434C5544455C54+
	?debug	C 494D452E48
	?debug	C E9F8803A1E0A44533336305053572E48
	?debug	C E952BB30230A445333363044464E2E48
DS360CDB_TEXT	segment byte public use16 'CODE'
DS360CDB_TEXT	ends
	assume	cs:DS360CDB_TEXT,ds:DS360CDB_DATA
DS360CDB_DATA	segment word public use16 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
	db	1 dup (?)
	db	1 dup (?)
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
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	8 dup (0)
	db	2 dup (0)
	db	4 dup (0)
DS360CDB_DATA	ends
DS360CDB_TEXT	segment byte public use16 'CODE'
	?debug	C E8010A44533336304344422E4317A22923
   ;	
   ;	 CODEB0(char far *COM)
   ;	
	?debug	L 11
	assume	cs:DS360CDB_TEXT
_CODEB0	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	ds
	mov	ax,DS360CDB_DATA
	mov	ds,ax
	?debug	C E318000400160800
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
   ;	 static char RX;
   ;	 static char is;
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
   ;	 static unsigned long ADRESS;
   ;	
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 static unsigned long ADR;
   ;	 static int i,j,k,l,m,c;
   ;	 static unsigned long OPR1,OPR2;
   ;	 time_t TIME_TIME;
   ;	 static double F_TIME_TIME=0.0;
   ;	 static double F_TIME_TIME2;
   ;	 static unsigned int DtaAdress;
   ;	 static unsigned long Adress;
   ;	 GET_OPERAND_SI;
   ;	
	?debug	L 41
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+1,al
 	ror	 ax,4
	mov	byte ptr d@w+4,al
 	shr	 ax,12
	mov	byte ptr d@w+6,al
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
	mov	dword ptr d@w+32,eax
	jmp	short @1@366
@1@310:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+32,eax
@1@366:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 42
	mov	ax,seg _PSW_ILC
	mov	es,ax
	movsx	eax,word ptr es:_PSW_ILC
	mov	dx,seg _PSW_ADRESS
	mov	es,dx
	add	dword ptr es:_PSW_ADRESS,eax
   ;	
   ;	 switch(COM[0])
   ;	
	?debug	L 43
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	dl,al
	mov	ah,0
	sub	ax,176
	mov	bx,ax
	cmp	bx,15
	jbe short	@@14
	jmp	@1@2746
@@14:
	shl	bx,1
	jmp	word ptr cs:@1@C2514[bx]
@1@478:
   ;	
   ;		 {
   ;			case 0xb0:
   ;								T00(COM[0]);
   ;	
	?debug	L 46
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 47
	pop	ds
	leave	
	ret	
@1@506:
   ;	
   ;			case 0xb1:            /*  LRA
   ;														§ £àã§ª  ¤¥©áâ¢¨â¥«ì­®£®  ¤à¥á 
   ;														*/
   ;	#ifdef DTA_370
   ;								GET_OPERAND_RX;
   ;								if (PSW_AMWP&0x08) /*  EC */
   ;									{if (PSW_EC_MASK&0x4)  /* DTA */
   ;										{
   ;											 {i=TLB_SET(ADRESS);
   ;												switch (i)
   ;													{case 0:Adress=(((unsigned long)TLB[DtaAdress])<<11)+((ADRESS)&0x000007ff);
   ;																	PSW_CC=0;
   ;																	break;
   ;													 case 1:case 2:case 3: Adress=ADRESS_DTA;PSW_CC=i;
   ;																	break;
   ;													 default: PSW_CC=3;Adress=ADRESS;
   ;																	break;
   ;													}
   ;	
   ;											 }
   ;										 R[R1]=Adress;
   ;										}
   ;									}
   ;								T();
   ;	
   ;	#else
   ;								T00(COM[0]);
   ;	
	?debug	L 74
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;	#endif
   ;								T();
   ;	
	?debug	L 76
	call	far ptr _T
   ;	
   ;								break;
   ;	
	?debug	L 77
	pop	ds
	leave	
	ret	
@1@534:
   ;	
   ;			case 0xb2:            /* LMC
   ;														§ £àã§ª  £àã¯¯®¢ ï à¥£¨áâà®¢ ã¯à ¢«¥­¨ï
   ;														*/
   ;								switch(RX)
   ;	
	?debug	L 81
	mov	al,byte ptr d@+1
	mov	ah,0
	sub	ax,2
	mov	bx,ax
	cmp	bx,17
	jbe short	@@15
	jmp	@1@1318
@@15:
	shl	bx,1
	jmp	word ptr cs:@1@C2658[bx]
@1@618:
   ;	
   ;									 {
   ;										case 0x02:PUT_WORD(ADRESS,  0x00100220);
   ;	
	?debug	L 83
	push	large 000100220h
	push	dword ptr d@w+32
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;															PUT_WORD(ADRESS+4,0x10450000);/*T();*/break; /*STIDP*/
   ;	
	?debug	L 84
	push	large 010450000h
	mov	eax,dword ptr d@w+32
	add	eax,large 4
	push	eax
	call	far ptr _PUT_WORD
	add	sp,8
	pop	ds
	leave	
	ret	
@1@646:
   ;	
   ;										case 0x03:    /* STIDC*/
   ;												switch(ADRESS&0xf00)
   ;	
	?debug	L 86
	mov	eax,dword ptr d@w+32
	and	eax,large 3840
	mov	dword ptr [bp-8],eax
	mov	cx,4
	mov	bx,offset @1@C2434
@1@702:
	mov	eax,dword ptr cs:[bx]
	cmp	eax,dword ptr [bp-8]
	je	short @1@786
	add	bx,4
	loop	short @1@702
	jmp	@1@926
@1@786:
	add	cx,cx
	add	bx,cx
	jmp	word ptr cs:[bx+8]
@1@814:
   ;	
   ;														{
   ;														 case 0x000:PUT_WORD(0xa8l,0x10010000l);
   ;	
	?debug	L 88
	push	large 010010000h
	push	large 168
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;																				PSW_CC=0;
   ;	
	?debug	L 89
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;																				break;
   ;	
	?debug	L 90
	pop	ds
	leave	
	ret	
@1@842:
   ;	
   ;														 case 0x100:PUT_WORD(0xa8l,0x20020000l);
   ;	
	?debug	L 91
	push	large 020020000h
	push	large 168
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;																				PSW_CC=0;
   ;	
	?debug	L 92
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;																				break;
   ;	
	?debug	L 93
	pop	ds
	leave	
	ret	
@1@870:
   ;	
   ;														 case 0x200:PUT_WORD(0xa8l,0x20020000l);
   ;	
	?debug	L 94
	push	large 020020000h
	push	large 168
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;																				PSW_CC=0;
   ;	
	?debug	L 95
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;																				break;
   ;	
	?debug	L 96
	pop	ds
	leave	
	ret	
@1@898:
   ;	
   ;														 case 0x300:PUT_WORD(0xa8l,0x20020000l);
   ;	
	?debug	L 97
	push	large 020020000h
	push	large 168
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;																				PSW_CC=0;
   ;	
	?debug	L 98
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;																				break;
   ;	
	?debug	L 99
	pop	ds
	leave	
	ret	
@1@926:
   ;	
   ;														 default:PSW_CC=3;
   ;	
	?debug	L 100
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,3
   ;	
   ;																				break;
   ;	
	?debug	L 101
	pop	ds
	leave	
	ret	
@1@954:
   ;	
   ;														}
   ;											 //T();
   ;											 break;
   ;	
   ;										case 0x04:PSW_CC=0; /*SCK 3*/ /*DTA ??????????*/
   ;	
	?debug	L 106
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;											 CLOCK1=GET_WORD(ADRESS);
   ;	
	?debug	L 107
	push	dword ptr d@w+32
	call	far ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dx,seg _CLOCK1
	mov	es,dx
	mov	dword ptr es:_CLOCK1,eax
   ;	
   ;											 CLOCK2=GET_WORD(ADRESS+4);
   ;	
	?debug	L 108
	mov	eax,dword ptr d@w+32
	add	eax,large 4
	push	eax
	call	far ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dx,seg _CLOCK2
	mov	es,dx
	mov	dword ptr es:_CLOCK2,eax
   ;	
   ;											 REAL_TIME=time(NULL);
   ;	
	?debug	L 109
	push	large 0
	call	far ptr _time
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dx,seg _REAL_TIME
	mov	es,dx
	mov	dword ptr es:_REAL_TIME,eax
   ;	
   ;											 //T();
   ;											 break;
   ;	
	?debug	L 111
	pop	ds
	leave	
	ret	
@1@982:
   ;	
   ;										case 0x05:
   ;											 PSW_CC=0;  /*STCK  2*/     /*DTA ??????????*/
   ;	
	?debug	L 113
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;	
   ;											 TIME_TIME=time(NULL);
   ;	
	?debug	L 115
	push	large 0
	call	far ptr _time
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr [bp-4],eax
   ;	
   ;											 CLOCK2+=0x00100000l;
   ;	
	?debug	L 116
	mov	ax,seg _CLOCK2
	mov	es,ax
	add	dword ptr es:_CLOCK2,large 000100000h
   ;	
   ;											 PUT_WORD(ADRESS,(CLOCK1+(TIME_TIME-REAL_TIME)));
   ;	
	?debug	L 117
	mov	ax,seg _REAL_TIME
	mov	edx,dword ptr [bp-4]
	mov	es,ax
	sub	edx,dword ptr es:_REAL_TIME
	mov	ax,seg _CLOCK1
	mov	es,ax
	mov	eax,dword ptr es:_CLOCK1
	add	eax,edx
	push	eax
	push	dword ptr d@w+32
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;											 PUT_WORD(ADRESS+4,CLOCK2);
   ;	
	?debug	L 118
	mov	ax,seg _CLOCK2
	mov	es,ax
	push	dword ptr es:_CLOCK2
	mov	eax,dword ptr d@w+32
	add	eax,large 4
	push	eax
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;											 //T();
   ;											 break;
   ;	
	?debug	L 120
	pop	ds
	leave	
	ret	
@1@1010:
   ;	
   ;										case 0x06:    /* SCKC  “‘’€Ž‚ˆ’œ ŠŽŒ€€’Ž */
   ;											 CLOCK1_COMP=GET_WORD(ADRESS);
   ;	
	?debug	L 122
	push	dword ptr d@w+32
	call	far ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dx,seg _CLOCK1_COMP
	mov	es,dx
	mov	dword ptr es:_CLOCK1_COMP,eax
   ;	
   ;											 CLOCK2_COMP=GET_WORD(ADRESS+4);
   ;	
	?debug	L 123
	mov	eax,dword ptr d@w+32
	add	eax,large 4
	push	eax
	call	far ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dx,seg _CLOCK2_COMP
	mov	es,dx
	mov	dword ptr es:_CLOCK2_COMP,eax
   ;	
   ;											 REAL_TIME_COMP=time(NULL);
   ;	
	?debug	L 124
	push	large 0
	call	far ptr _time
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dx,seg _REAL_TIME_COMP
	mov	es,dx
	mov	dword ptr es:_REAL_TIME_COMP,eax
   ;	
   ;											 break;
   ;	
	?debug	L 125
	pop	ds
	leave	
	ret	
@1@1038:
   ;	
   ;										case 0x07:    /*  STCKC ‡€ˆ‘œ ‚ €ŒŸ’œ ŠŽŒ€€’Ž€ */
   ;											 TIME_TIME=time(NULL);
   ;	
	?debug	L 127
	push	large 0
	call	far ptr _time
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr [bp-4],eax
   ;	
   ;											 PUT_WORD(ADRESS,(CLOCK1_COMP+(TIME_TIME-REAL_TIME_COMP)));
   ;	
	?debug	L 128
	mov	ax,seg _REAL_TIME_COMP
	mov	edx,dword ptr [bp-4]
	mov	es,ax
	sub	edx,dword ptr es:_REAL_TIME_COMP
	mov	ax,seg _CLOCK1_COMP
	mov	es,ax
	mov	eax,dword ptr es:_CLOCK1_COMP
	add	eax,edx
	push	eax
	push	dword ptr d@w+32
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;											 PUT_WORD(ADRESS+4,CLOCK2_COMP);
   ;	
	?debug	L 129
	mov	ax,seg _CLOCK2_COMP
	mov	es,ax
	push	dword ptr es:_CLOCK2_COMP
	mov	eax,dword ptr d@w+32
	add	eax,large 4
	push	eax
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;											 break;
   ;	
	?debug	L 130
	pop	ds
	leave	
	ret	
@1@1066:
   ;	
   ;										case 0x08:    /* SPT  “‘’€Ž‚ˆ’œ ’€‰Œ… CPU */
   ;											 CLOCK1_CPU=GET_WORD(ADRESS);
   ;	
	?debug	L 132
	push	dword ptr d@w+32
	call	far ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dx,seg _CLOCK1_CPU
	mov	es,dx
	mov	dword ptr es:_CLOCK1_CPU,eax
   ;	
   ;											 CLOCK2_CPU=GET_WORD(ADRESS+4);
   ;	
	?debug	L 133
	mov	eax,dword ptr d@w+32
	add	eax,large 4
	push	eax
	call	far ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dx,seg _CLOCK2_CPU
	mov	es,dx
	mov	dword ptr es:_CLOCK2_CPU,eax
   ;	
   ;	
   ;											 REAL_TIME_CPU=time(NULL);
   ;	
	?debug	L 135
	push	large 0
	call	far ptr _time
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dx,seg _REAL_TIME_CPU
	mov	es,dx
	mov	dword ptr es:_REAL_TIME_CPU,eax
   ;	
   ;											 break;
   ;	
	?debug	L 136
	pop	ds
	leave	
	ret	
@1@1094:
   ;	
   ;										case 0x09:    /* STPT ‡€ˆ‘€’œ ‚ €ŒŸ’œ ’€‰Œ… CPU */
   ;											 TIME_TIME=time(NULL);
   ;	
	?debug	L 138
	push	large 0
	call	far ptr _time
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr [bp-4],eax
   ;	
   ;											 PUT_WORD(ADRESS,(CLOCK1_CPU+(TIME_TIME-REAL_TIME_CPU)));
   ;	
	?debug	L 139
	mov	ax,seg _REAL_TIME_CPU
	mov	edx,dword ptr [bp-4]
	mov	es,ax
	sub	edx,dword ptr es:_REAL_TIME_CPU
	mov	ax,seg _CLOCK1_CPU
	mov	es,ax
	mov	eax,dword ptr es:_CLOCK1_CPU
	add	eax,edx
	push	eax
	push	dword ptr d@w+32
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;											 PUT_WORD(ADRESS+4,CLOCK2_CPU);
   ;	
	?debug	L 140
	mov	ax,seg _CLOCK2_CPU
	mov	es,ax
	push	dword ptr es:_CLOCK2_CPU
	mov	eax,dword ptr d@w+32
	add	eax,large 4
	push	eax
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;											 break;
   ;	
	?debug	L 141
	pop	ds
	leave	
	ret	
@1@1122:
   ;	
   ;										case 0x0a:  /* SPKA */
   ;											 PSW_KEY=(0x000000f0&ADRESS)>>4;
   ;	
	?debug	L 143
	mov	eax,large 240
	and	eax,dword ptr d@w+32
	shr	eax,4
	mov	dx,seg _PSW_KEY
	mov	es,dx
	mov	byte ptr es:_PSW_KEY,al
   ;	
   ;											 break;
   ;	
	?debug	L 144
	pop	ds
	leave	
	ret	
@1@1150:
   ;	
   ;										case 0x0b: /* IPK */
   ;											 R[2]=(R[2]&0xffffff00)|(PSW_KEY<<4);
   ;	
	?debug	L 146
	mov	ax,seg _PSW_KEY
	mov	es,ax
	mov	al,byte ptr es:_PSW_KEY
	mov	ah,0
	shl	ax,4
	movsx	eax,ax
	mov	dx,seg _R
	mov	es,dx
	mov	edx,dword ptr es:_R+8
	and	edx,large -256
	or	edx,eax
	mov	ax,seg _R
	mov	es,ax
	mov	dword ptr es:_R+8,edx
   ;	
   ;											 T();
   ;	
	?debug	L 147
	call	far ptr _T
   ;	
   ;											 break;
   ;	
	?debug	L 148
	pop	ds
	leave	
	ret	
@1@1178:
   ;	
   ;										case 0x0d: /* PTLB */
   ;											 TLB_RESET();
   ;	
	?debug	L 150
	call	far ptr _TLB_RESET
   ;	
   ;											 T();
   ;	
	?debug	L 151
	call	far ptr _T
   ;	
   ;											 break;
   ;	
	?debug	L 152
	pop	ds
	leave	
	ret	
@1@1206:
   ;	
   ;										case 0x10: /* SPX  */
   ;											 OPR1=GET_WORD(ADRESS);
   ;	
	?debug	L 154
	push	dword ptr d@w+32
	call	far ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+52,eax
   ;	
   ;											 Dtaret;
   ;											 PREFIX_PR=OPR1;
   ;	
	?debug	L 156
	mov	ax,seg _PREFIX_PR
	mov	edx,dword ptr d@w+52
	mov	es,ax
	mov	dword ptr es:_PREFIX_PR,edx
   ;	
   ;											 T();
   ;	
	?debug	L 157
	call	far ptr _T
   ;	
   ;											 break;
   ;	
	?debug	L 158
	pop	ds
	leave	
	ret	
@1@1234:
   ;	
   ;										case 0x11: /* STPX */
   ;											 PUT_WORD(ADRESS,PREFIX_PR);
   ;	
	?debug	L 160
	mov	ax,seg _PREFIX_PR
	mov	es,ax
	push	dword ptr es:_PREFIX_PR
	push	dword ptr d@w+32
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;											 T();
   ;	
	?debug	L 161
	call	far ptr _T
   ;	
   ;											 break;
   ;	
	?debug	L 162
	pop	ds
	leave	
	ret	
@1@1262:
   ;	
   ;										case 0x12: /* STAP */
   ;											 T();
   ;	
	?debug	L 164
	call	far ptr _T
   ;	
   ;											 break;
   ;	
	?debug	L 165
	pop	ds
	leave	
	ret	
@1@1290:
   ;	
   ;										case 0x13: /* RRB */
   ;											 PSW_CC=3;
   ;	
	?debug	L 167
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,3
   ;	
   ;											 T();
   ;	
	?debug	L 168
	call	far ptr _T
   ;	
   ;											 break;
   ;	
	?debug	L 169
	pop	ds
	leave	
	ret	
@1@1318:
   ;	
   ;										default:
   ;											 //T();
   ;											 T00(COM[0]);
   ;	
	?debug	L 172
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;											 RQ_PRG=1;
   ;	
	?debug	L 173
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,1
   ;	
   ;											 RETURN=1;
   ;	
	?debug	L 174
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
   ;	
   ;											 T();
   ;	
	?debug	L 175
	call	far ptr _T
   ;	
   ;										break;
   ;	
	?debug	L 176
	pop	ds
	leave	
	ret	
@1@1346:
   ;	
   ;									 }
   ;								//T();
   ;								break;
   ;			case 0xb3:
   ;								T00(COM[0]);
   ;	
	?debug	L 181
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 182
	pop	ds
	leave	
	ret	
@1@1374:
   ;	
   ;			case 0xb4:
   ;								T00(COM[0]);
   ;	
	?debug	L 184
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 185
	pop	ds
	leave	
	ret	
@1@1402:
   ;	
   ;			case 0xb5:
   ;								T00(COM[0]);
   ;	
	?debug	L 187
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 188
	pop	ds
	leave	
	ret	
@1@1430:
   ;	
   ;			case 0xb6:  /*STCTL*/
   ;								i=R1;
   ;	
	?debug	L 190
	mov	ax,word ptr d@w+4
	mov	word ptr d@w+40,ax
@1@1458:
   ;	
   ;	#ifdef DTA_370
   ;								DtaEnd(ADRESS,0);
   ;								DtaEnd(ADRESS,63);
   ;	#endif
   ;	
   ;	PUT_STORE:
   ;								PUT_WORD(ADRESS,R370[i]);
   ;	
	?debug	L 197
	mov	bx,word ptr d@w+40
	shl	bx,2
	mov	ax,seg _R370
	mov	es,ax
	push	dword ptr es:_R370[bx]
	push	dword ptr d@w+32
	call	far ptr _PUT_WORD
	add	sp,8
   ;	
   ;								ADRESS+=4;
   ;	
	?debug	L 198
	add	dword ptr d@w+32,large 4
   ;	
   ;								if (i==R2) goto END_STORE;
   ;	
	?debug	L 199
	mov	ax,word ptr d@w+40
	cmp	ax,word ptr d@w+6
	jne	short @1@1514
	pop	ds
	leave	
	ret	
@1@1514:
   ;	
   ;								i++;
   ;	
	?debug	L 200
	inc	word ptr d@w+40
   ;	
   ;								if (i>=16) i=0;
   ;	
	?debug	L 201
	cmp	word ptr d@w+40,16
	jl	short @1@1458
	mov	word ptr d@w+40,0
	jmp	short @1@1458
@1@1570:
   ;	
   ;								goto PUT_STORE;
   ;	END_STORE:    ;
   ;								//T();
   ;								break;
   ;			case 0xb7:
   ;								i=R1;
   ;	
	?debug	L 207
	mov	ax,word ptr d@w+4
	mov	word ptr d@w+40,ax
@1@1598:
   ;	
   ;	#ifdef DTA_370
   ;								DtaEnd(ADRESS,0);
   ;								DtaEnd(ADRESS,63);
   ;	#endif
   ;	
   ;	GET_LM:
   ;								R370[i]=GET_WORD(ADRESS);
   ;	
	?debug	L 214
	push	dword ptr d@w+32
	call	far ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	bx,word ptr d@w+40
	shl	bx,2
	mov	dx,seg _R370
	mov	es,dx
	mov	dword ptr es:_R370[bx],eax
   ;	
   ;								if (i==R2) goto END_LM;
   ;	
	?debug	L 215
	mov	ax,word ptr d@w+40
	cmp	ax,word ptr d@w+6
	jne	short @1@1654
	pop	ds
	leave	
	ret	
@1@1654:
   ;	
   ;								i++;
   ;	
	?debug	L 216
	inc	word ptr d@w+40
   ;	
   ;								ADRESS+=4;
   ;	
	?debug	L 217
	add	dword ptr d@w+32,large 4
   ;	
   ;								if (i>=16) i=0;
   ;	
	?debug	L 218
	cmp	word ptr d@w+40,16
	jl	short @1@1598
	mov	word ptr d@w+40,0
	jmp	short @1@1598
@1@1710:
   ;	
   ;								goto GET_LM;
   ;	END_LM:
   ;								//T();
   ;								break;
   ;			case 0xb8:
   ;								T00(COM[0]);
   ;	
	?debug	L 224
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 225
	pop	ds
	leave	
	ret	
@1@1738:
   ;	
   ;			case 0xb9:
   ;								T00(COM[0]);
   ;	
	?debug	L 227
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 228
	pop	ds
	leave	
	ret	
@1@1766:
   ;	
   ;			case 0xba:
   ;								//RQ_PRG=1;
   ;								//RETURN=1;
   ;								T();
   ;	
	?debug	L 232
	call	far ptr _T
   ;	
   ;								break;
   ;	
	?debug	L 233
	pop	ds
	leave	
	ret	
@1@1794:
   ;	
   ;			case 0xbb:
   ;								//RQ_PRG=1;
   ;								//RETURN=1;
   ;								T();
   ;	
	?debug	L 237
	call	far ptr _T
   ;	
   ;								break;
   ;	
	?debug	L 238
	pop	ds
	leave	
	ret	
@1@1822:
   ;	
   ;			case 0xbc:
   ;								T00(COM[0]);
   ;	
	?debug	L 240
	push	dx
	call	far ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 241
	pop	ds
	leave	
	ret	
@1@1850:
   ;	
   ;			case 0xbd:              /* CLM */
   ;								if (X2==0) {PSW_CC=0;break;}
   ;	
	?debug	L 243
	cmp	word ptr d@w+6,0
	jne	short @1@1906
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	leave	
	ret	
@1@1906:
   ;	
   ;								OPR1=0l;OPR2=0l;
   ;	
	?debug	L 244
	mov	dword ptr d@w+52,large 0
	mov	dword ptr d@w+56,large 0
   ;	
   ;								for (l=0,k=24,m=0x8,i=0,j=0;i<4;i++,m>>=1,k-=8)
   ;	
	?debug	L 245
	mov	word ptr d@w+46,0
	mov	word ptr d@w+44,24
	mov	word ptr d@w+48,8
	mov	word ptr d@w+40,0
	mov	word ptr d@w+42,0
	jmp	short @1@2018
@1@1934:
   ;	
   ;									{
   ;									 if (X2&m)
   ;	
	?debug	L 247
	mov	ax,word ptr d@w+48
	test	word ptr d@w+6,ax
	je	short @1@1990
   ;	
   ;										 {OPR1|=R[R1]&(0x000000ffl<<k);
   ;	
	?debug	L 248
	mov	eax,large 255
	mov	cl,byte ptr d@w+44
	shl	eax,cl
	mov	bx,word ptr d@w+4
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	mov	edx,dword ptr es:_R[bx]
	and	edx,eax
	or	dword ptr d@w+52,edx
   ;	
   ;											OPR2|=( ((unsigned long)GET_BYTE(ADRESS+(j++)) ) <<k);
   ;	
	?debug	L 249
	mov	ax,word ptr d@w+42
	inc	word ptr d@w+42
	movsx	eax,ax
	mov	edx,dword ptr d@w+32
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	mov	cl,byte ptr d@w+44
	shl	eax,cl
	or	dword ptr d@w+56,eax
@1@1990:
	?debug	L 245
	inc	word ptr d@w+40
	sar	word ptr d@w+48,1
	sub	word ptr d@w+44,8
@1@2018:
	cmp	word ptr d@w+40,4
	jl	short @1@1934
   ;	
   ;										 }
   ;									}
   ;								Dtaret;
   ;								if (OPR1==OPR2) PSW_CC=0;
   ;	
	?debug	L 253
	mov	eax,dword ptr d@w+52
	cmp	eax,dword ptr d@w+56
	jne	short @1@2102
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
	pop	ds
	leave	
	ret	
@1@2102:
   ;	
   ;								else if (OPR1<OPR2) PSW_CC=1;
   ;	
	?debug	L 254
	mov	eax,dword ptr d@w+52
	cmp	eax,dword ptr d@w+56
	jae	short @1@2158
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	leave	
	ret	
@1@2158:
   ;	
   ;										 else PSW_CC=2;
   ;	
	?debug	L 255
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	leave	
	ret	
@1@2186:
   ;	
   ;								//RQ_PRG=1;
   ;								//RETURN=1;
   ;								//T();
   ;								break;
   ;			case 0xbe:							/* STCM */
   ;	#ifdef DTA_370
   ;								DtaEnd(ADRESS,0);
   ;								DtaEnd(ADRESS,3);
   ;	#endif
   ;	
   ;								for (l=0,k=24,m=0x8,i=0,j=0;i<4;i++,m>>=1,k-=8)
   ;	
	?debug	L 266
	mov	word ptr d@w+46,0
	mov	word ptr d@w+44,24
	mov	word ptr d@w+48,8
	mov	word ptr d@w+40,0
	mov	word ptr d@w+42,0
	jmp	short @1@2298
@1@2214:
   ;	
   ;									{
   ;									 if (X2&m) PUT_BYTE(ADRESS+(j++),( (R[R1]>>k)&0xff ));
   ;	
	?debug	L 268
	mov	ax,word ptr d@w+48
	test	word ptr d@w+6,ax
	je	short @1@2270
	mov	bx,word ptr d@w+4
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	mov	eax,dword ptr es:_R[bx]
	mov	cl,byte ptr d@w+44
	shr	eax,cl
	and	al,255
	push	ax
	mov	ax,word ptr d@w+42
	inc	word ptr d@w+42
	movsx	eax,ax
	mov	edx,dword ptr d@w+32
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
@1@2270:
	?debug	L 266
	inc	word ptr d@w+40
	sar	word ptr d@w+48,1
	sub	word ptr d@w+44,8
@1@2298:
	cmp	word ptr d@w+40,4
	jl	short @1@2214
   ;	
   ;									}
   ;								//RQ_PRG=1;
   ;								//RETURN=1;
   ;								//T();
   ;								break;
   ;	
	?debug	L 273
	pop	ds
	leave	
	ret	
@1@2354:
   ;	
   ;			case 0xbf:
   ;	#ifdef DTA_370
   ;								DtaEnd(ADRESS,0);
   ;								DtaEnd(ADRESS,3);
   ;	#endif
   ;								PSW_CC=0;       /* ICM */
   ;	
	?debug	L 279
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;								if (X2==0) break;
   ;	
	?debug	L 280
	cmp	word ptr d@w+6,0
	jne	short @1@2410
	pop	ds
	leave	
	ret	
@1@2410:
   ;	
   ;								for (l=0,k=24,m=0x8,i=0,j=0;i<4;i++,m>>=1,k-=8)
   ;	
	?debug	L 281
	mov	word ptr d@w+46,0
	mov	word ptr d@w+44,24
	mov	word ptr d@w+48,8
	mov	word ptr d@w+40,0
	mov	word ptr d@w+42,0
	jmp	@1@2718
@1@2438:
   ;	
   ;									{
   ;									 if (X2&m)
   ;	
	?debug	L 283
	mov	ax,word ptr d@w+48
	test	word ptr d@w+6,ax
	jne short	@@16
	jmp	@1@2690
@@16:
   ;	
   ;										 {R[R1]&=0xffffffffl^(0x000000ffl<<k);
   ;	
	?debug	L 284
	mov	eax,large 255
	mov	cl,byte ptr d@w+44
	shl	eax,cl
	mov	edx,large -1
	xor	edx,eax
	mov	bx,word ptr d@w+4
	shl	bx,2
	mov	ax,seg _R
	mov	es,ax
	and	dword ptr es:_R[bx],edx
   ;	
   ;											c=GET_BYTE(ADRESS+j);
   ;	
	?debug	L 285
	movsx	eax,word ptr d@w+42
	mov	edx,dword ptr d@w+32
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	mov	word ptr d@w+50,ax
   ;	
   ;											R[R1]|=( ((unsigned long)c) <<k);
   ;	
	?debug	L 286
	movsx	eax,word ptr d@w+50
	mov	cl,byte ptr d@w+44
	shl	eax,cl
	mov	bx,word ptr d@w+4
	shl	bx,2
	mov	dx,seg _R
	mov	es,dx
	or	dword ptr es:_R[bx],eax
   ;	
   ;											if (l==0)
   ;	
	?debug	L 287
	cmp	word ptr d@w+46,0
	jne	short @1@2578
   ;	
   ;												{if (c&0x80) PSW_CC=1;
   ;	
	?debug	L 288
	test	word ptr d@w+50,128
	je	short @1@2550
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
@1@2550:
   ;	
   ;												 l=1;
   ;	
	?debug	L 289
	mov	word ptr d@w+46,1
@1@2578:
   ;	
   ;												}
   ;											if (PSW_CC==0)
   ;	
	?debug	L 291
	mov	ax,seg _PSW_CC
	mov	es,ax
	cmp	byte ptr es:_PSW_CC,0
	jne	short @1@2662
   ;	
   ;												{if (c) PSW_CC=2;
   ;	
	?debug	L 292
	cmp	word ptr d@w+50,0
	je	short @1@2662
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
@1@2662:
   ;	
   ;												}
   ;											j++;
   ;	
	?debug	L 294
	inc	word ptr d@w+42
@1@2690:
	?debug	L 281
	inc	word ptr d@w+40
	sar	word ptr d@w+48,1
	sub	word ptr d@w+44,8
@1@2718:
	cmp	word ptr d@w+40,4
	jge short	@@17
	jmp	@1@2438
@@17:
@1@2746:
   ;	
   ;										 }
   ;	
   ;									}
   ;								//RQ_PRG=1;
   ;								//RETURN=1;
   ;								//T();
   ;								break;
   ;	
	?debug	L 301
   ;	
   ;		 }
   ;	}
   ;	
	?debug	L 303
	pop	ds
	leave	
	ret	
	?debug	C E319000400160600
	?debug	C E6064164726573730C0000024E00012800094474+
	?debug	C 614164726573730A0000024C000127000C465F54+
	?debug	C 494D455F54494D45320F00000244000126000B46+
	?debug	C 5F54494D455F54494D450F0000023C0001250009+
	?debug	C 54494D455F54494D450602FCFF00044F5052320C+
	?debug	C 0000023800012300044F5052310C000002340001+
	?debug	C 23000163040000023200012200016D0400000230+
	?debug	C 00012200016C040000022E00012200016B040000+
	?debug	C 022C00012200016A040000022A00012200016904+
	?debug	C 0000022800012200034144520C00000224000121+
	?debug	C 00064144524553530C0000022000011B00045252+
	?debug	C 455A060000021C00011A000352455A1900000218+
	?debug	C 0001190003525232190000021400011800035252+
	?debug	C 31190000021000011700034444440A0000020E00+
	?debug	C 011500024444080000020D000114000242440800+
	?debug	C 00020C00011300024953040000020A0001100002+
	?debug	C 4232040000020800011000025232040000020600+
	?debug	C 0110000252310400000204000110000269730800+
	?debug	C 00020200010F00025258080000020100010E0002+
	?debug	C 5252080000020000010D0003434F4D180A060000
	?debug	E
	?debug	E
_CODEB0	endp
	db	1 dup (?)
@1@C2434	label	word
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	3
	db	0
	db	0
	dw	@1@814
	dw	@1@842
	dw	@1@870
	dw	@1@898
@1@C2658	label	word
	dw	@1@618
	dw	@1@646
	dw	@1@954
	dw	@1@982
	dw	@1@1010
	dw	@1@1038
	dw	@1@1066
	dw	@1@1094
	dw	@1@1122
	dw	@1@1150
	dw	@1@1318
	dw	@1@1178
	dw	@1@1318
	dw	@1@1318
	dw	@1@1206
	dw	@1@1234
	dw	@1@1262
	dw	@1@1290
@1@C2514	label	word
	dw	@1@478
	dw	@1@506
	dw	@1@534
	dw	@1@1346
	dw	@1@1374
	dw	@1@1402
	dw	@1@1430
	dw	@1@1570
	dw	@1@1710
	dw	@1@1738
	dw	@1@1766
	dw	@1@1794
	dw	@1@1822
	dw	@1@1850
	dw	@1@2186
	dw	@1@2354
DS360CDB_TEXT	ends
DS360CDB_DATA	segment word public use16 'FAR_DATA'
NU	label	word
	db	2 dup (0)
	?debug	C E9
	?debug	C FA01000000
s@	label	byte
DS360CDB_DATA	ends
DS360CDB_TEXT	segment byte public use16 'CODE'
DS360CDB_TEXT	ends
	extrn	_TLB_RESET:far
	public	_CODEB0
	extrn	_PUT_WORD:far
	extrn	_GET_WORD:far
	extrn	_PUT_BYTE:far
	extrn	_GET_BYTE:far
	extrn	_T00:far
	extrn	_T:far
_NU	equ	NU
	extrn	_PREFIX_PR:word
	extrn	_PSW_ADRESS:word
	extrn	_PSW_CC:byte
	extrn	_PSW_ILC:word
	extrn	_PSW_KEY:byte
	extrn	_R:word
	extrn	_R370:word
	extrn	_REAL_TIME:word
	extrn	_CLOCK2:word
	extrn	_CLOCK1:word
	extrn	_REAL_TIME_COMP:word
	extrn	_CLOCK2_COMP:word
	extrn	_CLOCK1_COMP:word
	extrn	_REAL_TIME_CPU:word
	extrn	_CLOCK2_CPU:word
	extrn	_CLOCK1_CPU:word
	extrn	_RQ_PRG:word
	extrn	_RETURN:word
	extrn	_time:far
_s@	equ	s@
	?debug	C EA010D
	?debug	C E31A00000023010400
	?debug	C EB0A5F544C425F52455345541A00
	?debug	C E31B00000023010400
	?debug	C EC075F434F444542301B1800
	?debug	C E31C00000023010400
	?debug	C EB095F5055545F574F52441C00
	?debug	C E31D000000230C0400
	?debug	C EB095F4745545F574F52441D00
	?debug	C E31E00000023010400
	?debug	C EB095F5055545F425954451E00
	?debug	C E31F00000023080400
	?debug	C EB095F4745545F425954451F00
	?debug	C E32000000023010400
	?debug	C EB045F5430302000
	?debug	C E32100000023010400
	?debug	C EB025F542100
	?debug	C EB0A5F5052454649585F50520C00
	?debug	C EB0B5F5053575F4144524553530C00
	?debug	C EB075F5053575F43430800
	?debug	C EB085F5053575F494C430400
	?debug	C EB085F5053575F4B45590800
	?debug	C E3220040001A0C
	?debug	C EB025F522200
	?debug	C E3230040001A0C
	?debug	C EB055F523337302300
	?debug	C EB0A5F5245414C5F54494D450C00
	?debug	C EB075F434C4F434B320C00
	?debug	C EB075F434C4F434B310C00
	?debug	C EB0F5F5245414C5F54494D455F434F4D500C00
	?debug	C EB0C5F434C4F434B325F434F4D500C00
	?debug	C EB0C5F434C4F434B315F434F4D500C00
	?debug	C EB0E5F5245414C5F54494D455F4350550C00
	?debug	C EB0B5F434C4F434B325F4350550C00
	?debug	C EB0B5F434C4F434B315F4350550C00
	?debug	C EB075F52515F5052470400
	?debug	C EB075F52455455524E0400
	?debug	C E32400000023060400
	?debug	C EB055F74696D652400
	?debug	C E6024E550400000252000007636C6F636B5F7406+
	?debug	C 06061C000674696D655F7406060617000666706F+
	?debug	C 735F740606021F000673697A655F740A06021A00
	end
