	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DS360CDD.C"
	?debug	C E9C7B24A220A44533336304344442E43
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
DS360CDD_TEXT	segment byte public use16 'CODE'
DS360CDD_TEXT	ends
	assume	cs:DS360CDD_TEXT,ds:DS360CDD_DATA
DS360CDD_DATA	segment word public use16 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
DS360CDD_DATA	ends
DS360CDD_TEXT	segment byte public use16 'CODE'
	?debug	C E8010A44533336304344442E43C7B24A22
   ;	
   ;	void CODEFFF(char far *COM)
   ;	
	?debug	L 13
	assume	cs:DS360CDD_TEXT
_CODEFFF	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360CDD_DATA
	mov	ds,ax
	?debug	C E318000400160800
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	 {
   ;		printf("\nIEE456A PROTECTION ERROR RE-IPL SYSTEM");
   ;	
	?debug	L 15
	push	ds
	push	offset s@
	call	far ptr _printf
	add	sp,4
   ;	
   ;	 }
   ;	
	?debug	L 16
	pop	ds
	pop	bp
	ret	
	?debug	C E603434F4D180A060000
	?debug	E
	?debug	E
_CODEFFF	endp
DS360CDD_TEXT	ends
DS360CDD_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (?)
	db	1 dup (?)
	db	2 dup (?)
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
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	4 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	1 dup (?)
	db	1 dup (?)
	db	1 dup (?)
	db	1 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	2 dup (?)
	db	240
	db	255
	db	0
	db	240
	db	2
	db	7
	db	4
	db	8
	db	3
	db	9
	db	4
	db	5
	db	9
	db	12
	db	8
	db	6
	db	5
	db	14
	db	8
	db	1
	db	8
	db	9
	db	4
	db	2
	db	5
	db	3
	db	3
	db	11
	db	6
	db	7
	db	3
	db	9
	db	12
	db	1
	db	8
	db	6
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	64 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	1 dup (0)
DS360CDD_DATA	ends
DS360CDD_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODED0(char far *COM)
   ;	
	?debug	L 19
	assume	cs:DS360CDD_TEXT
_CODED0	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,DS360CDD_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
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
   ;	 static int i,k;
   ;	 static char REZ11, REZ12, REZ21, REZ22;
   ;	 static unsigned int BYT1, BYT2, BYTZ, CF1,CF2,SIG,FLAG_EDMK,NZNULL,First_Second;
   ;	
   ;	
   ;	 static char far *BIOS_AREA=0xf000fff0;
   ;	 static char offset_count[16]={2,7,4,8,3,9,4,5,9,12,8,6,5,14,8,1};
   ;	 static char offset_count_2[16]={8,9,4,2,5,3,3,11,6,7,3,9,12,1,8,6};
   ;	 static unsigned long all_count;
   ;	 static int i_count,i_count_2;
   ;	 static char bios_32_2[64];
   ;	 static unsigned long OLD_POINT;
   ;	 static unsigned long NEW_POINT;
   ;	 static time_t TIME_WRONG;
   ;	 static time_t TIME_NOW;
   ;	 static time_t TIME_TODAY;
   ;	 static unsigned long COUNT_TIME;
   ;	 static unsigned long TIME_LIMIT;
   ;	 static char c0;
   ;	
   ;	
   ;	 GET_OPERAND_SS;
   ;	
	?debug	L 66
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
	je	short @2@310
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
	mov	dword ptr d@w+54,eax
	jmp	short @2@366
@2@310:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+54,eax
@2@366:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	test	al,240
	je	short @2@534
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
	mov	dword ptr d@w+58,eax
	jmp	short @2@590
@2@534:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+58,eax
@2@590:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 67
	mov	ax,seg _PSW_ILC
	mov	es,ax
	movsx	eax,word ptr es:_PSW_ILC
	mov	dx,seg _PSW_ADRESS
	mov	es,dx
	add	dword ptr es:_PSW_ADRESS,eax
   ;	
   ;	
   ;	
   ;	 switch(COM[0])
   ;	
	?debug	L 70
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	cl,al
	mov	ah,0
	sub	ax,208
	mov	bx,ax
	cmp	bx,15
	jbe short	@@18
	jmp	@2@3698
@@18:
	shl	bx,1
	jmp	word ptr cs:@2@C2050[bx]
@2@702:
   ;	
   ;		 {
   ;			case 0xd0:                             /*  XIO */
   ;						T00(COM[0]);
   ;	
	?debug	L 73
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;						break;
   ;	
	?debug	L 74
	pop	ds
	leave	
	ret	
@2@730:
   ;	
   ;	
   ;	
   ;			case 0xd1:
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,LL);
   ;						DtaEnd(ADRESS2,LL);
   ;	#endif
   ;						for(i=0;i<=LL;i++)               /*MVN*/
   ;	
	?debug	L 84
	mov	word ptr d@w+62,0
	jmp	short @2@814
@2@758:
   ;	
   ;						 {PUT_BYTE(ADRESS1+i,
   ;	
	?debug	L 85
   ;	
   ;											 (GET_BYTE(ADRESS1+i)&0xf0)|
   ;											 (GET_BYTE(ADRESS2+i)&0x0f)
   ;											);
   ;	
	?debug	L 88
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	and	al,240
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+58
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	and	al,15
	pop	dx
	or	dl,al
	push	dx
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	?debug	L 84
	inc	word ptr d@w+62
@2@814:
	mov	al,byte ptr d@+1
	mov	ah,0
	cmp	ax,word ptr d@w+62
	jge	short @2@758
   ;	
   ;						 }
   ;						//T();
   ;						break;
   ;	
	?debug	L 91
	pop	ds
	leave	
	ret	
@2@870:
   ;	
   ;	
   ;	
   ;	//		case 0xd2:
   ;	//					//for(i=0;i<=LL;i++)               /*MVC*/
   ;	//					//	{PUT_BYTE(ADRESS1+i,GET_BYTE(ADRESS2+i));
   ;	//					//	}
   ;	//					MOVE(ADRESS1,ADRESS2,LL+1);
   ;	//					//T();
   ;	//					break;
   ;	
   ;	
   ;			case 0xd3:
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,LL);
   ;						DtaEnd(ADRESS2,LL);
   ;	#endif
   ;	
   ;						for(i=0;i<=LL;i++)               /*MVZ*/
   ;	
	?debug	L 111
	mov	word ptr d@w+62,0
	jmp	short @2@954
@2@898:
   ;	
   ;							{PUT_BYTE(ADRESS1+i,
   ;	
	?debug	L 112
   ;	
   ;												(GET_BYTE(ADRESS1+i)&0x0f)|
   ;												(GET_BYTE(ADRESS2+i)&0xf0)
   ;											 );
   ;	
	?debug	L 115
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	and	al,15
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+58
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	and	al,240
	pop	dx
	or	dl,al
	push	dx
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	?debug	L 111
	inc	word ptr d@w+62
@2@954:
	mov	al,byte ptr d@+1
	mov	ah,0
	cmp	ax,word ptr d@w+62
	jge	short @2@898
   ;	
   ;							}
   ;						//T();
   ;						break;
   ;	
	?debug	L 118
	pop	ds
	leave	
	ret	
@2@1010:
   ;	
   ;	
   ;	
   ;			case 0xd4:
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,LL);
   ;						DtaEnd(ADRESS2,LL);
   ;	#endif
   ;	
   ;						PSW_CC=0;
   ;	
	?debug	L 129
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;						for(i=0;i<=LL;i++)              /* NC */
   ;	
	?debug	L 130
	mov	word ptr d@w+62,0
	jmp	short @2@1122
@2@1038:
   ;	
   ;							{BYT1=GET_BYTE(ADRESS1+i)&GET_BYTE(ADRESS2+i);
   ;	
	?debug	L 131
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+58
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	pop	dx
	and	dl,al
	mov	dh,0
	mov	word ptr d@w+70,dx
   ;	
   ;							 PUT_BYTE(ADRESS1+i,BYT1);
   ;	
	?debug	L 132
	mov	al,byte ptr d@w+70
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;							 if (BYT1) PSW_CC=1;
   ;	
	?debug	L 133
	cmp	word ptr d@w+70,0
	je	short @2@1094
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
@2@1094:
	?debug	L 130
	inc	word ptr d@w+62
@2@1122:
	mov	al,byte ptr d@+1
	mov	ah,0
	cmp	ax,word ptr d@w+62
	jge	short @2@1038
   ;	
   ;							}
   ;						//XCNCOC(ADRESS1,ADRESS2,LL,NC_OPERATION);
   ;						//T();
   ;						break;
   ;	
	?debug	L 137
	pop	ds
	leave	
	ret	
@2@1178:
   ;	
   ;	
   ;	
   ;			case 0xd5://PSW_CC=0;
   ;	//					//for(i=0;i<=LL;i++)              /* CLC */
   ;	//					//	{BYT1=GET_BYTE(ADRESS1+i);
   ;	//					//	 BYT2=GET_BYTE(ADRESS2+i);
   ;	//					//	 if (BYT1==BYT2) continue;
   ;	//					//	 else
   ;	//					//		 {if (BYT1<BYT2) PSW_CC=1; else PSW_CC=2;
   ;	//					//			break;
   ;	//					//		 }
   ;	//					//	}
   ;	//					COMPE(ADRESS1,ADRESS2,LL+1);
   ;	//					//T();
   ;						break;
   ;	
   ;	
   ;			case 0xd6:
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,LL);
   ;						DtaEnd(ADRESS2,LL);
   ;	#endif
   ;	
   ;	
   ;						PSW_CC=0;
   ;	
	?debug	L 164
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;						for(i=0;i<=LL;i++)              /* OC */
   ;	
	?debug	L 165
	mov	word ptr d@w+62,0
	jmp	short @2@1290
@2@1206:
   ;	
   ;							{BYT1=GET_BYTE(ADRESS1+i)|GET_BYTE(ADRESS2+i);
   ;	
	?debug	L 166
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+58
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	pop	dx
	or	dl,al
	mov	dh,0
	mov	word ptr d@w+70,dx
   ;	
   ;							 PUT_BYTE(ADRESS1+i,BYT1);
   ;	
	?debug	L 167
	mov	al,byte ptr d@w+70
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;							 if (BYT1) PSW_CC=1;
   ;	
	?debug	L 168
	cmp	word ptr d@w+70,0
	je	short @2@1262
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
@2@1262:
	?debug	L 165
	inc	word ptr d@w+62
@2@1290:
	mov	al,byte ptr d@+1
	mov	ah,0
	cmp	ax,word ptr d@w+62
	jge	short @2@1206
   ;	
   ;							}
   ;						//T();
   ;						//XCNCOC(ADRESS1,ADRESS2,LL,OC_OPERATION);
   ;						break;
   ;	
	?debug	L 172
	pop	ds
	leave	
	ret	
@2@1346:
   ;	
   ;	
   ;	
   ;			case 0xd7:
   ;	
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,LL);
   ;						DtaEnd(ADRESS2,LL);
   ;	#endif
   ;	
   ;						PSW_CC=0;
   ;	
	?debug	L 184
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;						for(i=0;i<=LL;i++)              /* XC */
   ;	
	?debug	L 185
	mov	word ptr d@w+62,0
	jmp	short @2@1458
@2@1374:
   ;	
   ;							{BYT1=GET_BYTE(ADRESS1+i)^GET_BYTE(ADRESS2+i);
   ;	
	?debug	L 186
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+58
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	pop	dx
	xor	dl,al
	mov	dh,0
	mov	word ptr d@w+70,dx
   ;	
   ;							 PUT_BYTE(ADRESS1+i,BYT1);
   ;	
	?debug	L 187
	mov	al,byte ptr d@w+70
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;							 if (BYT1) PSW_CC=1;
   ;	
	?debug	L 188
	cmp	word ptr d@w+70,0
	je	short @2@1430
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
@2@1430:
	?debug	L 185
	inc	word ptr d@w+62
@2@1458:
	mov	al,byte ptr d@+1
	mov	ah,0
	cmp	ax,word ptr d@w+62
	jge	short @2@1374
   ;	
   ;							}
   ;						//XCNCOC(ADRESS1,ADRESS2,LL,XC_OPERATION);
   ;						//T();
   ;						break;
   ;	
	?debug	L 192
	pop	ds
	leave	
	ret	
@2@1514:
   ;	
   ;	
   ;	
   ;			case 0xd8:
   ;						T00(COM[0]);
   ;	
	?debug	L 196
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;						break;
   ;	
	?debug	L 197
	pop	ds
	leave	
	ret	
@2@1542:
   ;	
   ;			case 0xd9:
   ;						T00(COM[0]);
   ;	
	?debug	L 199
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;						break;
   ;	
	?debug	L 200
	pop	ds
	leave	
	ret	
@2@1570:
   ;	
   ;			case 0xda:
   ;						T00(COM[0]);
   ;	
	?debug	L 202
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;						break;
   ;	
	?debug	L 203
	pop	ds
	leave	
	ret	
@2@1598:
   ;	
   ;			case 0xdb:
   ;						T00(COM[0]);
   ;	
	?debug	L 205
	push	cx
	call	far ptr _T00
	add	sp,2
   ;	
   ;						break;
   ;	
	?debug	L 206
	pop	ds
	leave	
	ret	
@2@1626:
   ;	
   ;			case 0xdc:                            /* TR */
   ;	
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,LL);
   ;						DtaEnd(ADRESS2,255);
   ;	#endif
   ;	
   ;						for(i=0;i<=LL;i++)
   ;	
	?debug	L 216
	mov	word ptr d@w+62,0
	jmp	short @2@1710
@2@1654:
   ;	
   ;							 {PUT_BYTE(ADRESS1+i,
   ;	
	?debug	L 217
   ;	
   ;												 GET_BYTE(ADRESS2+(unsigned long)GET_BYTE(ADRESS1+i))
   ;												);
   ;	
	?debug	L 219
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	mov	edx,dword ptr d@w+58
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	?debug	L 216
	inc	word ptr d@w+62
@2@1710:
	mov	al,byte ptr d@+1
	mov	ah,0
	cmp	ax,word ptr d@w+62
	jge	short @2@1654
   ;	
   ;							 }
   ;						//T();
   ;						break;
   ;	
	?debug	L 222
	pop	ds
	leave	
	ret	
@2@1766:
   ;	
   ;			case 0xdd:                             /* TRT */
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,LL);
   ;						DtaEnd(ADRESS2,255);
   ;	#endif
   ;	
   ;						PSW_CC=0;
   ;	
	?debug	L 231
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;						for(i=0;i<=LL;i++)
   ;	
	?debug	L 232
	mov	word ptr d@w+62,0
	jmp	@2@1934
@2@1794:
   ;	
   ;							 {if (GET_BYTE(ADRESS2+(unsigned long)GET_BYTE(ADRESS1+i)))
   ;	
	?debug	L 233
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	mov	edx,dword ptr d@w+58
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	or	al,al
	jne short	@@19
	jmp	@2@1906
@@19:
   ;	
   ;									{R[1]=(0xff000000&(R[1]))|(ADRESS1+i)&0xffffff;
   ;	
	?debug	L 234
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	mov	dword ptr [bp-4],edx
	and	edx,large 000FFFFFFh
	mov	ax,seg _R
	mov	ebx,large 0FF000000h
	mov	es,ax
	and	ebx,dword ptr es:_R+4
	or	ebx,edx
	mov	es,ax
	mov	dword ptr es:_R+4,ebx
   ;	
   ;									 R[2]=(0xffffff00&(R[2]))|GET_BYTE(ADRESS2+(unsigned long)GET_BYTE(ADRESS1+i));
   ;	
	?debug	L 235
	push	dword ptr [bp-4]
	call	far ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	mov	edx,dword ptr d@w+58
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	mov	dx,seg _R
	mov	ebx,large -256
	mov	es,dx
	and	ebx,dword ptr es:_R+8
	or	ebx,eax
	mov	ax,seg _R
	mov	es,ax
	mov	dword ptr es:_R+8,ebx
   ;	
   ;									 if (i==LL) PSW_CC=2;
   ;	
	?debug	L 236
	mov	al,byte ptr d@+1
	mov	ah,0
	cmp	ax,word ptr d@w+62
	jne	short @2@1878
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
	pop	ds
	leave	
	ret	
@2@1878:
   ;	
   ;									 else PSW_CC=1;
   ;	
	?debug	L 237
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
	pop	ds
	leave	
	ret	
@2@1906:
	?debug	L 232
	inc	word ptr d@w+62
@2@1934:
	mov	al,byte ptr d@+1
	mov	ah,0
	cmp	ax,word ptr d@w+62
	jl short	@@20
	jmp	@2@1794
@@20:
   ;	
   ;									 break;
   ;									}
   ;							 }
   ;						//T();
   ;						break;
   ;	
	?debug	L 242
	pop	ds
	leave	
	ret	
@2@1990:
   ;	
   ;			case 0xde:                            /* ED */
   ;	
   ;						FLAG_EDMK=0;
   ;	
	?debug	L 245
	mov	word ptr d@w+82,0
@2@2018:
   ;	
   ;	EDED:
   ;	#ifdef DTA_370
   ;						DtaEnd(ADRESS1,0);
   ;						DtaEnd(ADRESS2,0);
   ;						DtaEnd(ADRESS1,LL);
   ;						DtaEnd(ADRESS2,LL);
   ;	#endif
   ;	
   ;						PSW_CC=0;
   ;	
	?debug	L 254
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;						for(First_Second=0,i=0,k=0,NZNULL=0,SIG=0,CF2=0;i<=LL;i++)
   ;	
	?debug	L 255
	mov	word ptr d@w+86,0
	mov	word ptr d@w+62,0
	mov	word ptr d@w+64,0
	mov	word ptr d@w+84,0
	mov	word ptr d@w+80,0
	mov	word ptr d@w+78,0
	jmp	@2@3614
@2@2046:
   ;	
   ;							{BYT1=GET_BYTE(ADRESS1+(unsigned long)i);
   ;	
	?debug	L 256
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	mov	word ptr d@w+70,ax
   ;	
   ;							 if (i==0) BYTZ=BYT1;
   ;	
	?debug	L 257
	cmp	word ptr d@w+62,0
	jne	short @2@2102
	mov	word ptr d@w+74,ax
@2@2102:
   ;	
   ;									switch(BYT1)
   ;	
	?debug	L 258
	mov	ax,word ptr d@w+70
	cmp	ax,32
	je	short @2@2242
	cmp	ax,33
	jne short	@@21
	jmp	@2@2830
@@21:
	cmp	ax,34
	jne short	@@22
	jmp	@2@3334
@@22:
	jmp	@2@3362
@2@2242:
   ;	
   ;									 {
   ;										case 0x20: /* выбор цифры*/
   ;													 if (First_Second==0)
   ;	
	?debug	L 261
	cmp	word ptr d@w+86,0
	je short	@@23
	jmp	@2@2494
@@23:
   ;	
   ;														 {
   ;															BYT2=GET_BYTE(ADRESS2+(unsigned long)k);
   ;	
	?debug	L 263
	movsx	eax,word ptr d@w+64
	mov	edx,dword ptr d@w+58
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	mov	word ptr d@w+72,ax
   ;	
   ;															CF1=BYT2>>4;
   ;	
	?debug	L 264
	shr	ax,4
	mov	word ptr d@w+76,ax
   ;	
   ;															if (CF1>0x09)
   ;	
	?debug	L 265
	cmp	word ptr d@w+76,9
	jbe	short @2@2326
   ;	
   ;																 {RQ_PRG=0x0007;RETURN=1;return;
   ;	
	?debug	L 266
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,7
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	pop	ds
	leave	
	ret	
@2@2326:
   ;	
   ;																 }
   ;															First_Second=1;k++;
   ;	
	?debug	L 268
	mov	word ptr d@w+86,1
	inc	word ptr d@w+64
   ;	
   ;															CF2=BYT2&0x000f;
   ;	
	?debug	L 269
	mov	ax,word ptr d@w+72
	and	ax,15
	mov	word ptr d@w+78,ax
   ;	
   ;															if (CF2>0x09)
   ;	
	?debug	L 270
	cmp	word ptr d@w+78,9
	jbe	short @2@2522
   ;	
   ;																 {if ((CF2==0x0d) || (CF2==0x0b)) SIG=1;
   ;	
	?debug	L 271
	cmp	word ptr d@w+78,13
	je	short @2@2410
	cmp	word ptr d@w+78,11
	jne	short @2@2438
@2@2410:
	mov	word ptr d@w+80,1
	jmp	short @2@2466
@2@2438:
   ;	
   ;																	else SIG=2;
   ;	
	?debug	L 272
	mov	word ptr d@w+80,2
@2@2466:
   ;	
   ;																	First_Second=0;
   ;	
	?debug	L 273
	mov	word ptr d@w+86,0
	jmp	short @2@2522
@2@2494:
   ;	
   ;																 }
   ;														 }
   ;													 else
   ;														 {CF1=BYT2&0x000f;
   ;	
	?debug	L 277
	mov	ax,word ptr d@w+72
	and	ax,15
	mov	word ptr d@w+76,ax
   ;	
   ;															First_Second=0;
   ;	
	?debug	L 278
	mov	word ptr d@w+86,0
@2@2522:
   ;	
   ;														 }
   ;													 if (NZNULL==0)
   ;	
	?debug	L 280
	cmp	word ptr d@w+84,0
	je short	@@24
	jmp	@2@2662
@@24:
   ;	
   ;														 {
   ;															if (CF1==0) PUT_BYTE(ADRESS1+(unsigned long)i,
   ;	
	?debug	L 282
	cmp	word ptr d@w+76,0
	jne	short @2@2606
   ;	
   ;																									 (unsigned char)BYTZ);
   ;	
	?debug	L 283
	mov	al,byte ptr d@w+74
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	jmp	@2@2718
@2@2606:
   ;	
   ;															else
   ;																{NZNULL=1;PSW_CC=2;
   ;	
	?debug	L 285
	mov	word ptr d@w+84,1
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
   ;	
   ;																 PUT_BYTE(ADRESS1+(unsigned long)i,
   ;	
	?debug	L 286
   ;	
   ;																					(unsigned char)(CF1+0xf0)
   ;																				 );
   ;	
	?debug	L 288
	mov	al,byte ptr d@w+76
	add	al,240
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;																 if (FLAG_EDMK)
   ;	
	?debug	L 289
	cmp	word ptr d@w+82,0
	je	short @2@2718
   ;	
   ;																	 {
   ;																		R[1]=(R[1]&0xff000000)|
   ;	
	?debug	L 291
   ;	
   ;																				 (0x00ffffff&(ADRESS1+(unsigned long)i));
   ;	
	?debug	L 292
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	mov	eax,large 000FFFFFFh
	and	eax,edx
	mov	dx,seg _R
	mov	es,dx
	mov	edx,dword ptr es:_R+4
	and	edx,large 0FF000000h
	or	edx,eax
	mov	ax,seg _R
	mov	es,ax
	mov	dword ptr es:_R+4,edx
	jmp	short @2@2718
@2@2662:
   ;	
   ;																	 }
   ;																}
   ;														 }
   ;													 else
   ;														 {PUT_BYTE(ADRESS1+(unsigned long)i,
   ;	
	?debug	L 297
   ;	
   ;																			 (unsigned char)(CF1+0xf0)
   ;																			);
   ;	
	?debug	L 299
	mov	al,byte ptr d@w+76
	add	al,240
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;															if (CF1!=0) PSW_CC=2;
   ;	
	?debug	L 300
	cmp	word ptr d@w+76,0
	je	short @2@2718
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
@2@2718:
   ;	
   ;	
   ;														 }
   ;													 if (SIG)
   ;	
	?debug	L 303
	cmp	word ptr d@w+80,0
	jne short	@@25
	jmp	@2@3446
@@25:
   ;	
   ;														 {if (SIG==2) NZNULL=0;
   ;	
	?debug	L 304
	cmp	word ptr d@w+80,2
	jne	short @2@2802
	mov	word ptr d@w+84,0
@2@2802:
   ;	
   ;															SIG=0;
   ;	
	?debug	L 305
	mov	word ptr d@w+80,0
	jmp	@2@3446
@2@2830:
   ;	
   ;														 }
   ;													 break;
   ;										case 0x21: /* начало значимости */
   ;													 NZNULL=1;
   ;	
	?debug	L 309
	mov	word ptr d@w+84,1
   ;	
   ;													 if (First_Second==0)
   ;	
	?debug	L 310
	cmp	word ptr d@w+86,0
	je short	@@26
	jmp	@2@3082
@@26:
   ;	
   ;														 {
   ;															BYT2=GET_BYTE(ADRESS2+(unsigned long)k);
   ;	
	?debug	L 312
	movsx	eax,word ptr d@w+64
	mov	edx,dword ptr d@w+58
	add	edx,eax
	push	edx
	call	far ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	mov	word ptr d@w+72,ax
   ;	
   ;															CF1=BYT2>>4;
   ;	
	?debug	L 313
	shr	ax,4
	mov	word ptr d@w+76,ax
   ;	
   ;															if (CF1>0x09)
   ;	
	?debug	L 314
	cmp	word ptr d@w+76,9
	jbe	short @2@2914
   ;	
   ;																 {RQ_PRG=0x0007;RETURN=1;return;
   ;	
	?debug	L 315
	mov	ax,seg _RQ_PRG
	mov	es,ax
	mov	word ptr es:_RQ_PRG,7
	mov	ax,seg _RETURN
	mov	es,ax
	mov	word ptr es:_RETURN,1
	pop	ds
	leave	
	ret	
@2@2914:
   ;	
   ;																 }
   ;															First_Second=1;k++;
   ;	
	?debug	L 317
	mov	word ptr d@w+86,1
	inc	word ptr d@w+64
   ;	
   ;															CF2=BYT2&0x000f;
   ;	
	?debug	L 318
	mov	ax,word ptr d@w+72
	and	ax,15
	mov	word ptr d@w+78,ax
   ;	
   ;															if (CF2>0x09)
   ;	
	?debug	L 319
	cmp	word ptr d@w+78,9
	jbe	short @2@3110
   ;	
   ;																 {if ((CF2==0x0d) || (CF2==0x0b)) SIG=1;
   ;	
	?debug	L 320
	cmp	word ptr d@w+78,13
	je	short @2@2998
	cmp	word ptr d@w+78,11
	jne	short @2@3026
@2@2998:
	mov	word ptr d@w+80,1
	jmp	short @2@3054
@2@3026:
   ;	
   ;																	else SIG=2;
   ;	
	?debug	L 321
	mov	word ptr d@w+80,2
@2@3054:
   ;	
   ;																	First_Second=0;
   ;	
	?debug	L 322
	mov	word ptr d@w+86,0
	jmp	short @2@3110
@2@3082:
   ;	
   ;																 }
   ;														 }
   ;													 else
   ;														 {CF1=BYT2&0x000f;
   ;	
	?debug	L 326
	mov	ax,word ptr d@w+72
	and	ax,15
	mov	word ptr d@w+76,ax
   ;	
   ;															First_Second=0;
   ;	
	?debug	L 327
	mov	word ptr d@w+86,0
@2@3110:
   ;	
   ;														 }
   ;													 PUT_BYTE(ADRESS1+(unsigned long)i,
   ;	
	?debug	L 329
   ;	
   ;																			 (unsigned char)(CF1+0xf0)
   ;																			);
   ;	
	?debug	L 331
	mov	al,byte ptr d@w+76
	add	al,240
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;													 if (CF1!=0) PSW_CC=2;
   ;	
	?debug	L 332
	cmp	word ptr d@w+76,0
	je	short @2@3166
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,2
@2@3166:
   ;	
   ;													 if (SIG)
   ;	
	?debug	L 333
	cmp	word ptr d@w+80,0
	je	short @2@3278
   ;	
   ;														 {if (SIG==2) NZNULL=0;
   ;	
	?debug	L 334
	cmp	word ptr d@w+80,2
	jne	short @2@3250
	mov	word ptr d@w+84,0
@2@3250:
   ;	
   ;															SIG=0;
   ;	
	?debug	L 335
	mov	word ptr d@w+80,0
@2@3278:
   ;	
   ;														 }
   ;													 if (FLAG_EDMK)
   ;	
	?debug	L 337
	cmp	word ptr d@w+82,0
	jne short	@@27
	jmp	@2@3446
@@27:
   ;	
   ;																	 {
   ;																		R[1]=(R[1]&0xff000000)|
   ;	
	?debug	L 339
   ;	
   ;																				 (0x00ffffff&(ADRESS1+(unsigned long)i));
   ;	
	?debug	L 340
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	mov	eax,large 000FFFFFFh
	and	eax,edx
	mov	dx,seg _R
	mov	es,dx
	mov	edx,dword ptr es:_R+4
	and	edx,large 0FF000000h
	or	edx,eax
	mov	ax,seg _R
	mov	es,ax
	mov	dword ptr es:_R+4,edx
	jmp	short @2@3446
@2@3334:
   ;	
   ;																	 }
   ;													 break;
   ;										case 0x22: /* разделение полей */
   ;													 NZNULL=0;PSW_CC=0;
   ;	
	?debug	L 344
	mov	word ptr d@w+84,0
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,0
   ;	
   ;													 PUT_BYTE(ADRESS1+(unsigned long)i,
   ;	
	?debug	L 345
   ;	
   ;																			 (unsigned char)(BYTZ)
   ;																			);
   ;	
	?debug	L 347
	mov	al,byte ptr d@w+74
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
   ;	
   ;													 break;
   ;	
	?debug	L 348
	jmp	short @2@3446
@2@3362:
   ;	
   ;										default:   /* символ сообщения */
   ;													 if (NZNULL==0)
   ;	
	?debug	L 350
	cmp	word ptr d@w+84,0
	jne	short @2@3418
   ;	
   ;														 PUT_BYTE(ADRESS1+(unsigned long)i,
   ;	
	?debug	L 351
   ;	
   ;																			 (unsigned char)(BYTZ)
   ;																			);
   ;	
	?debug	L 353
	mov	al,byte ptr d@w+74
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
	jmp	short @2@3446
@2@3418:
   ;	
   ;													 else
   ;														 PUT_BYTE(ADRESS1+(unsigned long)i,
   ;	
	?debug	L 355
   ;	
   ;																			 (unsigned char)(BYT1)
   ;																			);
   ;	
	?debug	L 357
	mov	al,byte ptr d@w+70
	push	ax
	movsx	eax,word ptr d@w+62
	mov	edx,dword ptr d@w+54
	add	edx,eax
	push	edx
	call	far ptr _PUT_BYTE
	add	sp,6
@2@3446:
   ;	
   ;													 break;
   ;									 }
   ;	
   ;	
   ;							 if (i==LL)
   ;	
	?debug	L 362
	mov	al,byte ptr d@+1
	mov	ah,0
	cmp	ax,word ptr d@w+62
	jne	short @2@3586
   ;	
   ;								 {
   ;									if (PSW_CC!=0)
   ;	
	?debug	L 364
	mov	ax,seg _PSW_CC
	mov	es,ax
	cmp	byte ptr es:_PSW_CC,0
	je	short @2@3586
   ;	
   ;										{
   ;										 if ((CF2==0x0d) || (CF2==0x0b)) PSW_CC=1;
   ;	
	?debug	L 366
	cmp	word ptr d@w+78,13
	je	short @2@3558
	cmp	word ptr d@w+78,11
	jne	short @2@3586
@2@3558:
	mov	ax,seg _PSW_CC
	mov	es,ax
	mov	byte ptr es:_PSW_CC,1
@2@3586:
	?debug	L 255
	inc	word ptr d@w+62
@2@3614:
	mov	al,byte ptr d@+1
	mov	ah,0
	cmp	ax,word ptr d@w+62
	jl short	@@28
	jmp	@2@2046
@@28:
   ;	
   ;										}
   ;								 }
   ;							}
   ;						//T();
   ;						break;
   ;	
	?debug	L 371
	pop	ds
	leave	
	ret	
@2@3670:
   ;	
   ;			case 0xdf:                            /* EDMK */
   ;						FLAG_EDMK=1;
   ;	
	?debug	L 373
	mov	word ptr d@w+82,1
   ;	
   ;	//#include "ds360ch0.c"
   ;	
   ;						goto EDED;
   ;	
	?debug	L 376
	jmp	@2@2018
@2@3698:
   ;	
   ;						//T();
   ;						break;
   ;		 }
   ;	}
   ;	
	?debug	L 380
	pop	ds
	leave	
	ret	
	?debug	C E3190040001A08
	?debug	C E31A0010001A08
	?debug	C E31B0010001A08
	?debug	C E31C000400160C00
	?debug	C E31D000400160600
	?debug	C E602633008000002E000013F000A54494D455F4C+
	?debug	C 494D49540C000002DC00013E000A434F554E545F+
	?debug	C 54494D450C000002D800013D000A54494D455F54+
	?debug	C 4F44415906000002D400013C000854494D455F4E+
	?debug	C 4F5706000002D000013B000A54494D455F57524F+
	?debug	C 4E4706000002CC00013A00094E45575F504F494E+
	?debug	C 540C000002C800013900094F4C445F504F494E54+
	?debug	C 0C000002C4000138000962696F735F33325F3219+
	?debug	C 000002840001370009695F636F756E745F320400+
	?debug	C 0002820001360007695F636F756E740400000280+
	?debug	C 0001360009616C6C5F636F756E740C0000027C00+
	?debug	C 0135000E6F66667365745F636F756E745F321A00+
	?debug	C 00026C000134000C6F66667365745F636F756E74+
	?debug	C 1B0000025C000133000942494F535F4152454118+
	?debug	C 00000258000132000C46697273745F5365636F6E+
	?debug	C 640A0000025600012F00064E5A4E554C4C0A0000+
	?debug	C 025400012F0009464C41475F45444D4B0A000002+
	?debug	C 5200012F00035349470A0000025000012F000343+
	?debug	C 46320A0000024E00012F00034346310A0000024C+
	?debug	C 00012F00044259545A0A0000024A00012F000442+
	?debug	C 5954320A0000024800012F0004425954310A0000+
	?debug	C 024600012F000552455A3232080000024500012E+
	?debug	C 000552455A3231080000024400012E000552455A+
	?debug	C 3132080000024300012E000552455A3131080000+
	?debug	C 024200012E00016B040000024000012D00016904+
	?debug	C 0000023E00012D0007414452455353320C000002+
	?debug	C 3A00012C0007414452455353310C000002360001+
	?debug	C 2C00034144520C0000023200012C000444444432+
	?debug	C 0A0000023000012A0004444444310A0000022E00+
	?debug	C 012A00034C454E040000022C0001290006414452+
	?debug	C 4553530C000002280001250004555252321C0000+
	?debug	C 02240001240004555252311C0000022000012300+
	?debug	C 045252455A060000021C000121000352455A1D00+
	?debug	C 00021800012000035252321D0000021400011F00+
	?debug	C 035252311D0000021000011E00034444440A0000+
	?debug	C 020E00011C00024444080000020D00011B000242+
	?debug	C 44080000020C00011A00024953040000020A0001+
	?debug	C 1700024232040000020800011700024231040000+
	?debug	C 0206000117000252320400000204000117000252+
	?debug	C 3104000002020001170002525808000002010001+
	?debug	C 160002525208000002000001150003434F4D180A+
	?debug	C 060000
	?debug	E
	?debug	E
_CODED0	endp
@2@C2050	label	word
	dw	@2@702
	dw	@2@730
	dw	@2@3698
	dw	@2@870
	dw	@2@1010
	dw	@2@3698
	dw	@2@1178
	dw	@2@1346
	dw	@2@1514
	dw	@2@1542
	dw	@2@1570
	dw	@2@1598
	dw	@2@1626
	dw	@2@1766
	dw	@2@1990
	dw	@2@3670
DS360CDD_TEXT	ends
DS360CDD_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
_IPL_adr	label	word
	db	2 dup (0)
NU	label	word
	db	2 dup (0)
	?debug	C E9
	?debug	C FA01000000
s@	label	byte
	db	10
	db	'IEE456A PROTECTION ERROR RE-IPL SYSTEM'
	db	0
DS360CDD_DATA	ends
DS360CDD_TEXT	segment byte public use16 'CODE'
DS360CDD_TEXT	ends
	public	_IPL_adr
	public	_CODEFFF
	public	_CODED0
	extrn	_PUT_BYTE:far
	extrn	_GET_BYTE:far
	extrn	_T00:far
_NU	equ	NU
	extrn	_PSW_ADRESS:word
	extrn	_PSW_CC:byte
	extrn	_PSW_ILC:word
	extrn	_R:word
	extrn	_RQ_PRG:word
	extrn	_RETURN:word
	extrn	_printf:far
_s@	equ	s@
	?debug	C EA010D
	?debug	C EC085F49504C5F6164720400011100
	?debug	C E31E00000023010400
	?debug	C EC085F434F44454646461E1800
	?debug	C E31F00000023010400
	?debug	C EC075F434F444544301F1800
	?debug	C E32000000023010400
	?debug	C EB095F5055545F425954452000
	?debug	C E32100000023080400
	?debug	C EB095F4745545F425954452100
	?debug	C E32200000023010400
	?debug	C EB045F5430302200
	?debug	C EB0B5F5053575F4144524553530C00
	?debug	C EB075F5053575F43430800
	?debug	C EB085F5053575F494C430400
	?debug	C E3230040001A0C
	?debug	C EB025F522300
	?debug	C EB075F52515F5052470400
	?debug	C EB075F52455455524E0400
	?debug	C E32400000023040401
	?debug	C EB075F7072696E74662400
	?debug	C E6024E5504000002E4000007636C6F636B5F7406+
	?debug	C 06061C000674696D655F7406060617000666706F+
	?debug	C 735F740606021F000673697A655F740A06021A00
	end
