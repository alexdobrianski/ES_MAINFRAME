	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "DS360WK1.C"
	?debug	C E97BB329230A4453333630574B312E43
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
	?debug	C E94019CA1819433A5C424F524C414E44435C494E434C5544455C4D+
	?debug	C 454D2E48
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C53+
	?debug	C 5452494E472E48
	?debug	C E9382921230A445333363044464E2E48
	?debug	C E9A874961A07584D5349462E48
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C53+
	?debug	C 49474E414C2E48
	?debug	C E94019CA181D433A5C424F524C414E44435C494E434C5544455C50+
	?debug	C 524F434553532E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C41+
	?debug	C 4C4C4F432E48
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C53+
	?debug	C 54444C49422E48
DS360WK1_TEXT	segment byte public use16 'CODE'
DS360WK1_TEXT	ends
	assume	cs:DS360WK1_TEXT,ds:DS360WK1_DATA
DS360WK1_DATA	segment word public use16 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
MAX_BLOCK_MEMORY	label	word
	db	0
	db	2
MAX_BLOCK_BUF	label	word
	db	50
	db	0
NEXT_BLOCK_BUF	label	word
	db	0
	db	0
NUMBER_BLOCK_LONG	label	word
	db	0
	db	0
	db	0
	db	0
	?debug	C E9382921230A445333363044464E2E48
ILC	label	byte
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	2
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	4
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
	db	6
_POINT	label	dword
	dd	_CODE00
	dd	_CODE00
	dd	_CODE00
	dd	_CODE00
	dd	_CODE00
	dd	_CODE05
	dd	_CODE06
	dd	_CODE07
	dd	_CODE00
	dd	_CODE00
	dd	_CODE00
	dd	_CODE00
	dd	_CODE00
	dd	_CODE00
	dd	_CODE00
	dd	_CODE00
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE18
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE10
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE20
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE30
	dd	_CODE40
	dd	_CODE41
	dd	_CODE40
	dd	_CODE40
	dd	_CODE40
	dd	_CODE45
	dd	_CODE40
	dd	_CODE47
	dd	_CODE48
	dd	_CODE40
	dd	_CODE40
	dd	_CODE40
	dd	_CODE40
	dd	_CODE40
	dd	_CODE40
	dd	_CODE40
	dd	_CODE5G
	dd	_CODE50
	dd	_CODE50
	dd	_CODE50
	dd	_CODE50
	dd	_CODE50
	dd	_CODE50
	dd	_CODE50
	dd	_CODE58
	dd	_CODE50
	dd	_CODE50
	dd	_CODE50
	dd	_CODE50
	dd	_CODE50
	dd	_CODE50
	dd	_CODE50
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE60
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE70
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE80
	dd	_CODE90
	dd	_CODE91
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODE90
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEA0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEB0
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODED0
	dd	_CODED0
	dd	_CODED2
	dd	_CODED0
	dd	_CODED7
	dd	_CODED5
	dd	_CODED7
	dd	_CODED7
	dd	_CODED0
	dd	_CODED0
	dd	_CODED0
	dd	_CODED0
	dd	_CODED0
	dd	_CODED0
	dd	_CODED0
	dd	_CODED0
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEGG
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
	dd	_CODEF0
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
	?debug	C E8010A4453333630574B312E437BB32923
   ;	
   ;	void Catcher(void)
   ;	
	?debug	L 276
	assume	cs:DS360WK1_TEXT
_Catcher	proc	far
	?debug	B
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	{
   ;		signal(SIGFPE, (fptr)Catcher);  //  ******reinstall signal handler
   ;	
	?debug	L 278
	push	seg _Catcher
	push	offset _Catcher
	push	8
	call	far ptr _signal
	add	sp,6
   ;	
   ;		if (PSW_PRG_MASK&0x01)
   ;	
	?debug	L 279
	test	byte ptr _PSW_PRG_MASK,1
	je	short @1@86
   ;	
   ;		 {
   ;		  RQ_PRG=0x000e;
   ;	
	?debug	L 281
	mov	word ptr _RQ_PRG,14
   ;	
   ;			RETURN=1;
   ;	
	?debug	L 282
	mov	word ptr _RETURN,1
@1@86:
   ;	
   ;		 }
   ;	
   ;	}
   ;	
	?debug	L 285
	pop	ds
	ret	
	?debug	E
	?debug	E
_Catcher	endp
   ;	
   ;	void C_SSK(unsigned long RR1,unsigned long RR2)
   ;	
	?debug	L 292
	assume	cs:DS360WK1_TEXT
_C_SSK	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6035252320C0A0A0000035252310C0A060000
	?debug	B
   ;	
   ;	{
   ;	
   ;	 if ( ((RR2&0x00ffffff) >>11) >= MAX_BLOCK_MEMORY)
   ;	
	?debug	L 295
	mov	eax,dword ptr [bp+10]
	and	eax,large 000FFFFFFh
	shr	eax,11
	mov	dword ptr [bp-4],eax
	movsx	edx,word ptr MAX_BLOCK_MEMORY
	cmp	eax,edx
	jb	short @2@86
   ;	
   ;			 {HELPHELP("#1MAX MEMORY BLOCK (command SSK)");
   ;	
	?debug	L 296
	push	ds
	push	offset s@
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;				PR();/*RQ_TRACE=1;*/RETURN=1;
   ;	
	?debug	L 297
	call	far ptr _PR
	mov	word ptr _RETURN,1
   ;	
   ;				RQ_PRG=5;
   ;	
	?debug	L 298
	mov	word ptr _RQ_PRG,5
   ;	
   ;				return;
   ;	
	?debug	L 299
	pop	ds
	leave	
	ret	
@2@86:
   ;	
   ;			 }
   ;	 else MEMORY_KEY[((RR2&0x00ffffff)>>11)]=(0x000000f0&RR1) >> 4;
   ;	
	?debug	L 301
	mov	eax,large 240
	and	eax,dword ptr [bp+6]
	shr	eax,4
	mov	ebx,dword ptr [bp-4]
	mov	byte ptr MEMORY_KEY[bx],al
   ;	
   ;	}
   ;	
	?debug	L 302
	pop	ds
	leave	
	ret	
	?debug	C E6035252310C0A060000035252320C0A0A0000
	?debug	E
	?debug	E
_C_SSK	endp
   ;	
   ;	unsigned long C_ISK(unsigned long RR2)
   ;	
	?debug	L 306
	assume	cs:DS360WK1_TEXT
_C_ISK	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6035252320C0A060000
	?debug	B
   ;	
   ;	{if (PSW_AMWP&0x08)  /* EC */
   ;	
	?debug	L 307
	test	byte ptr _PSW_AMWP,8
	je	short @3@86
   ;	
   ;		 return( (((unsigned long)MEMORY_KEY[((RR2&0x00ffffff)>>11)])<<4)|0x6l );
   ;	
	?debug	L 308
	mov	eax,dword ptr [bp+6]
	and	eax,large 000FFFFFFh
	shr	eax,11
	mov	ebx,eax
	movzx	eax,byte ptr MEMORY_KEY[bx]
	shl	eax,4
	or	eax,large 6
	shld	edx,eax,16
	pop	ds
	pop	bp
	ret	
@3@86:
   ;	
   ;	 else
   ;		 return( ((unsigned long)MEMORY_KEY[((RR2&0x00ffffff)>>11)])<<4 );
   ;	
	?debug	L 310
	mov	eax,dword ptr [bp+6]
	and	eax,large 000FFFFFFh
	shr	eax,11
	mov	ebx,eax
	movzx	eax,byte ptr MEMORY_KEY[bx]
	shl	eax,4
	shld	edx,eax,16
   ;	
   ;	}
   ;	
	?debug	L 311
	pop	ds
	pop	bp
	ret	
	?debug	C E6035252320C0A060000
	?debug	E
	?debug	E
_C_ISK	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	int INIT_MEMORY(void)
   ;	
	?debug	L 321
	assume	cs:DS360WK1_TEXT
_INIT_MEMORY	proc	far
	?debug	B
	push	si
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	{
   ;	 static int i;
   ;	 MEM=farmalloc(102400L);//printf(" %p ",MEM);
   ;	
	?debug	L 324
	push	large 000019000h
	call	far ptr _farmalloc
	add	sp,4
	mov	word ptr MEM+2,dx
	mov	word ptr MEM,ax
   ;	
   ;	 if (MEM==NULL) {HELPHELP("##НЕДОСТАТОЧНО ПАМЯТИ");return(1);}
   ;	
	?debug	L 325
	cmp	dword ptr MEM,large 0
	jne	short @4@86
	push	ds
	push	offset s@+33
	call	far ptr _HELPHELP
	add	sp,4
	mov	ax,1
	pop	ds
	pop	si
	ret	
@4@86:
   ;	
   ;	 for(i=0;i<MAX_BLOCK_MEMORY;i++) {MEMORY[i]=NULL;MEMORY_TO_BLOCK[i]=-1;}
   ;	
	?debug	L 326
	mov	word ptr d@w+1290,0
	xor	dx,dx
	shl	dx,2
	add	dx,offset MEMORY
	xor	si,si
	shl	si,1
	add	si,offset MEMORY_TO_BLOCK
	mov	ax,word ptr d@w+1290
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jge	short @4@310
@4@170:
	mov	bx,dx
	mov	word ptr [bx+2],0
	mov	word ptr [bx],0
	mov	word ptr [si],-1
	add	dx,4
	add	si,2
	inc	word ptr d@w+1290
	mov	ax,word ptr d@w+1290
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl	short @4@170
@4@310:
   ;	
   ;	 for(i=0;i<MAX_BLOCK_BUF;i++) {MEMORY_USE[i]=-1;MEMORY_BLOCK[i]=-1;}
   ;	
	?debug	L 327
	mov	word ptr d@w+1290,0
	xor	si,si
	shl	si,1
	mov	ax,word ptr d@w+1290
	cmp	ax,word ptr MAX_BLOCK_BUF
	jge	short @4@506
@4@394:
	mov	word ptr MEMORY_USE[si],-1
	mov	word ptr MEMORY_BLOCK[si],-1
	add	si,2
	inc	word ptr d@w+1290
	mov	ax,word ptr d@w+1290
	cmp	ax,word ptr MAX_BLOCK_BUF
	jl	short @4@394
@4@506:
   ;	
   ;	 MEMORY_FILE=open("MEMORY",O_RDWR|O_BINARY|O_CREAT,S_IREAD|S_IWRITE);
   ;	
	?debug	L 328
	push	large 001808104h
	push	ds
	push	offset s@+55
	call	far ptr _open
	add	sp,8
	mov	word ptr MEMORY_FILE,ax
   ;	
   ;	 STATUS_FILE=open("STATUS",O_RDWR|O_BINARY|O_CREAT,S_IREAD|S_IWRITE);
   ;	
	?debug	L 329
	push	large 001808104h
	push	ds
	push	offset s@+62
	call	far ptr _open
	add	sp,8
	mov	word ptr STATUS_FILE,ax
   ;	
   ;	 if (STATUS_FILE>0)
   ;	
	?debug	L 330
	cmp	word ptr STATUS_FILE,0
	jg short	@@109
	jmp	@4@674
@@109:
   ;	
   ;		{
   ;		 read(STATUS_FILE,&R[0],16*4);
   ;	
	?debug	L 332
	push	64
	push	ds
	push	offset _R
	push	ax
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&PSW_MASK,1);
   ;	
	?debug	L 333
	push	1
	push	ds
	push	offset _PSW_MASK
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&PSW_KEY,1);
   ;	
	?debug	L 334
	push	1
	push	ds
	push	offset _PSW_KEY
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&PSW_AMWP,1);
   ;	
	?debug	L 335
	push	1
	push	ds
	push	offset _PSW_AMWP
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&PSW_COD_INT,2);
   ;	
	?debug	L 336
	push	2
	push	ds
	push	offset _PSW_COD_INT
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 PSW_ILC=0;
   ;	
	?debug	L 337
	mov	word ptr _PSW_ILC,0
   ;	
   ;		 read(STATUS_FILE,&PSW_ILC,1);
   ;	
	?debug	L 338
	push	1
	push	ds
	push	offset _PSW_ILC
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&PSW_CC,1);
   ;	
	?debug	L 339
	push	1
	push	ds
	push	offset _PSW_CC
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&PSW_PRG_MASK,1);
   ;	
	?debug	L 340
	push	1
	push	ds
	push	offset _PSW_PRG_MASK
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&PSW_ADRESS,4);
   ;	
	?debug	L 341
	push	4
	push	ds
	push	offset _PSW_ADRESS
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&RQ_TRACE,2);
   ;	
	?debug	L 342
	push	2
	push	ds
	push	offset _RQ_TRACE
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;	
   ;		 read(STATUS_FILE,&RETURN,2);
   ;	
	?debug	L 344
	push	2
	push	ds
	push	offset _RETURN
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&RQ_SVC,2);
   ;	
	?debug	L 345
	push	2
	push	ds
	push	offset _RQ_SVC
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&RQ_PRG,2);
   ;	
	?debug	L 346
	push	2
	push	ds
	push	offset _RQ_PRG
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&RQ_IPL,2);
   ;	
	?debug	L 347
	push	2
	push	ds
	push	offset _RQ_IPL
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&RQ_TIMER,2);
   ;	
	?debug	L 348
	push	2
	push	ds
	push	offset _RQ_TIMER
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,R_FLOAT,8*10);
   ;	
	?debug	L 349
	push	80
	push	ds
	push	offset _R_FLOAT
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 for(i=0;i<max_block_memory;i++)
   ;	
	?debug	L 350
	mov	word ptr d@w+1290,0
@4@562:
   ;	
   ;			 {read(STATUS_FILE,&MEMORY_KEY[i],1);
   ;	
	?debug	L 351
	push	1
	push	ds
	mov	ax,word ptr d@w+1290
	add	ax,offset MEMORY_KEY
	push	ax
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
	?debug	L 350
	inc	word ptr d@w+1290
	cmp	word ptr d@w+1290,512
	jl	short @4@562
   ;	
   ;			 }
   ;		 read(STATUS_FILE,&R370[0],16*4);
   ;	
	?debug	L 353
	push	64
	push	ds
	push	offset _R370
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&CLOCK1,4);
   ;	
	?debug	L 354
	push	4
	push	ds
	push	offset _CLOCK1
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&CLOCK2,4);
   ;	
	?debug	L 355
	push	4
	push	ds
	push	offset _CLOCK2
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&REAL_TIME,4);
   ;	
	?debug	L 356
	push	4
	push	ds
	push	offset _REAL_TIME
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&IPL_adr,2);
   ;	
	?debug	L 357
	push	2
	push	seg _IPL_adr
	push	offset _IPL_adr
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&PSW_EC_MASK,1);
   ;	
	?debug	L 358
	push	1
	push	ds
	push	offset _PSW_EC_MASK
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,TLB,8192);
   ;	
	?debug	L 359
	push	8192
	push	ds
	push	offset _TLB
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&CLOCK1_CPU,4);
   ;	
	?debug	L 360
	push	4
	push	ds
	push	offset _CLOCK1_CPU
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&CLOCK2_CPU,4);
   ;	
	?debug	L 361
	push	4
	push	ds
	push	offset _CLOCK2_CPU
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&REAL_TIME_CPU,4);
   ;	
	?debug	L 362
	push	4
	push	ds
	push	offset _REAL_TIME_CPU
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&COUNT_CPU,4);
   ;	
	?debug	L 363
	push	4
	push	ds
	push	offset _COUNT_CPU
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&CLOCK1_COMP,4);
   ;	
	?debug	L 364
	push	4
	push	ds
	push	offset _CLOCK1_COMP
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&CLOCK2_COMP,4);
   ;	
	?debug	L 365
	push	4
	push	ds
	push	offset _CLOCK2_COMP
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&REAL_TIME_COMP,4);
   ;	
	?debug	L 366
	push	4
	push	ds
	push	offset _REAL_TIME_COMP
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&COUNT_COMP,4);
   ;	
	?debug	L 367
	push	4
	push	ds
	push	offset _COUNT_COMP
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;		 read(STATUS_FILE,&PREFIX_PR,4);
   ;	
	?debug	L 368
	push	4
	push	ds
	push	offset _PREFIX_PR
	push	word ptr STATUS_FILE
	call	far ptr _read
	add	sp,8
@4@674:
   ;	
   ;		}
   ;	#ifdef FORXMS
   ;	XMS_status = XMMlibinit();
   ;	
	?debug	L 371
	call	far ptr _XMMlibinit
	mov	word ptr XMS_status,ax
   ;	
   ;	if (XMS_status==0)    /* YES XMS */
   ;	
	?debug	L 372
	cmp	word ptr XMS_status,0
	je short	@@110
	jmp	@4@954
@@110:
   ;	
   ;		{XMS_BLOCK_SIZE=XMMcoreleft();
   ;	
	?debug	L 373
	call	far ptr _XMMcoreleft
	shl	eax,16
	shrd	eax,edx,16
	mov	dword ptr XMS_BLOCK_SIZE,eax
   ;	
   ;		 if (XMS_BLOCK_SIZE<2048L*((unsigned long)max_block_memory))
   ;	
	?debug	L 374
	cmp	dword ptr XMS_BLOCK_SIZE,large 000100000h
	jae	short @4@758
   ;	
   ;			 {
   ;				HELPHELP("## NOT ENOUGT MEMORY IN XMS");
   ;	
	?debug	L 376
	push	ds
	push	offset s@+69
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;				return(1);
   ;	
	?debug	L 377
	mov	ax,1
	pop	ds
	pop	si
	ret	
@4@758:
   ;	
   ;			 }
   ;		 XMS_ALLOC_HANDLER=XMMalloc(((unsigned long)max_block_memory)*2048L);
   ;	
	?debug	L 379
	push	large 000100000h
	call	far ptr _XMMalloc
	add	sp,4
	mov	word ptr XMS_ALLOC_HANDLER,ax
   ;	
   ;		 XMS_OFFSET=0;
   ;	
	?debug	L 380
	mov	dword ptr XMS_OFFSET,large 0
   ;	
   ;		 HELPHELP("##INITIALISATION XMS:");
   ;	
	?debug	L 381
	push	ds
	push	offset s@+97
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;		 for(i=0;i<max_block_memory;i++)
   ;	
	?debug	L 382
	mov	word ptr d@w+1290,0
@4@786:
   ;	
   ;			 {//printf("X");
   ;				read(MEMORY_FILE,(char far*)MEM,2048);
   ;	
	?debug	L 384
	push	2048
	push	dword ptr MEM
	push	word ptr MEMORY_FILE
	call	far ptr _read
	add	sp,8
   ;	
   ;				XMS_POINTER_STR=MEM;
   ;	
	?debug	L 385
	mov	eax,dword ptr MEM
	mov	dword ptr XMS_POINTER_STR,eax
   ;	
   ;				XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
   ;	
	?debug	L 386
	mov	dword ptr XMS_P_STR,eax
   ;	
   ;				XMS_status=_XMMcopy(2048,0,XMS_P_STR,XMS_ALLOC_HANDLER,XMS_OFFSET);
   ;	
	?debug	L 387
	push	dword ptr XMS_OFFSET
	push	word ptr XMS_ALLOC_HANDLER
	push	eax
	push	0
	push	large 2048
	call	far ptr __XMMcopy
	add	sp,16
	mov	word ptr XMS_status,ax
   ;	
   ;	
   ;				if (XMS_status!=0)
   ;	
	?debug	L 389
	cmp	word ptr XMS_status,0
	je	short @4@842
   ;	
   ;					 {
   ;						HELPHELP("##ERROR in XMS INITIALISATION");
   ;	
	?debug	L 391
	push	ds
	push	offset s@+119
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;						return(1);
   ;	
	?debug	L 392
	mov	ax,1
	pop	ds
	pop	si
	ret	
@4@842:
   ;	
   ;					 }
   ;				XMS_OFFSET+=2048L;
   ;	
	?debug	L 394
	add	dword ptr XMS_OFFSET,large 2048
	?debug	L 382
	inc	word ptr d@w+1290
	cmp	word ptr d@w+1290,512
	jl	short @4@786
   ;	
   ;			 }
   ;		 HELPHELP("##END-OFF-INITIALISATION XMS.");
   ;	
	?debug	L 396
	push	ds
	push	offset s@+149
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;		}
   ;	
	?debug	L 397
	jmp	short @4@982
@4@954:
   ;	
   ;	else
   ;		{HELPHELP("## NO XMS !!! check the XMS drive");
   ;	
	?debug	L 399
	push	ds
	push	offset s@+179
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;		 return(1);
   ;	
	?debug	L 400
	mov	ax,1
	pop	ds
	pop	si
	ret	
@4@982:
   ;	
   ;		}
   ;	#endif
   ;	
   ;	 NUMBER_BLOCK=0xffff;
   ;	
	?debug	L 404
	mov	word ptr NUMBER_BLOCK,-1
   ;	
   ;	 NUMBER_BLOCK_LONG=0xffffffff;
   ;	
	?debug	L 405
	mov	dword ptr NUMBER_BLOCK_LONG,large -1
   ;	
   ;	 return(0);
   ;	
	?debug	L 406
	xor	ax,ax
   ;	
   ;	}
   ;	
	?debug	L 407
	pop	ds
	pop	si
	ret	
	?debug	C E60169040000020A05014301
	?debug	E
	?debug	E
_INIT_MEMORY	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CLOSE_MEMORY(void)
   ;	
	?debug	L 421
	assume	cs:DS360WK1_TEXT
_CLOSE_MEMORY	proc	far
	?debug	B
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	
   ;	{
   ;	 static int i;
   ;	 static unsigned long NUMBER_BLOCK_LONG;
   ;	 for(i=0;i<MAX_BLOCK_BUF;i++)
   ;	
	?debug	L 426
	mov	word ptr d@w+1292,0
	mov	ax,word ptr d@w+1292
	cmp	ax,word ptr MAX_BLOCK_BUF
	jl short	@@111
	jmp	@5@198
@@111:
@5@86:
   ;	
   ;		 {
   ;			if (MEMORY_USE[i]==-1)
   ;	
	?debug	L 428
	mov	bx,word ptr d@w+1292
	shl	bx,1
	cmp	word ptr MEMORY_USE[bx],-1
	je	short @5@142
   ;	
   ;				{
   ;				}
   ;			else
   ;				{NUMBER_BLOCK_LONG=MEMORY_BLOCK[i];
   ;	
	?debug	L 432
	mov	bx,word ptr d@w+1292
	shl	bx,1
	movsx	eax,word ptr MEMORY_BLOCK[bx]
	mov	dword ptr d@w+1294,eax
   ;	
   ;				 NUMBER_BLOCK_LONG<<=11;
   ;	
	?debug	L 433
	shl	eax,11
	mov	dword ptr d@w+1294,eax
   ;	
   ;	#ifdef FORXMS
   ;				 XMS_POINTER_STR=(char huge*)(((char huge*)MEM)+(((unsigned long)i)<<11));
   ;	
	?debug	L 435
	mov	ax,word ptr d@w+1292
	cwd	
	mov	cl,11
	call	far ptr F_LXLSH@
	push	ax
	push	dx
	mov	dx,word ptr MEM+2
	mov	ax,word ptr MEM
	pop	cx
	pop	bx
	call	far ptr F_PADD@
	mov	word ptr XMS_POINTER_STR+2,dx
	mov	word ptr XMS_POINTER_STR,ax
   ;	
   ;				 XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
   ;	
	?debug	L 436
	mov	eax,dword ptr XMS_POINTER_STR
	mov	dword ptr XMS_P_STR,eax
   ;	
   ;				 XMS_status=_XMMcopy(2048,0,XMS_P_STR,XMS_ALLOC_HANDLER,NUMBER_BLOCK_LONG);
   ;	
	?debug	L 437
	push	dword ptr d@w+1294
	push	word ptr XMS_ALLOC_HANDLER
	push	eax
	push	0
	push	large 2048
	call	far ptr __XMMcopy
	add	sp,16
	mov	word ptr XMS_status,ax
@5@142:
	?debug	L 426
	inc	word ptr d@w+1292
	mov	ax,word ptr d@w+1292
	cmp	ax,word ptr MAX_BLOCK_BUF
	jge short	@@112
	jmp	@5@86
@@112:
@5@198:
   ;	
   ;	#else
   ;				 lseek(MEMORY_FILE,NUMBER_BLOCK_LONG,SEEK_SET);
   ;				 write(MEMORY_FILE,(char huge*)(((char huge*)MEM)+(((unsigned long)i)<<11)),2048);
   ;	#endif
   ;				}
   ;		 }
   ;	
   ;	#ifdef FORXMS
   ;	 XMS_OFFSET=0;
   ;	
	?debug	L 446
	mov	dword ptr XMS_OFFSET,large 0
   ;	
   ;	 lseek(MEMORY_FILE,0l,SEEK_SET);
   ;	
	?debug	L 447
	push	0
	push	large 0
	push	word ptr MEMORY_FILE
	call	far ptr _lseek
	add	sp,8
   ;	
   ;	 HELPHELP("##STORING XMS:");
   ;	
	?debug	L 448
	push	ds
	push	offset s@+213
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;	 for(i=0;i<max_block_memory;i++)
   ;	
	?debug	L 449
	mov	word ptr d@w+1292,0
@5@226:
   ;	
   ;		 {//printf("X");
   ;			XMS_POINTER_STR=MEM;
   ;	
	?debug	L 451
	mov	eax,dword ptr MEM
	mov	dword ptr XMS_POINTER_STR,eax
   ;	
   ;			XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
   ;	
	?debug	L 452
	mov	dword ptr XMS_P_STR,eax
   ;	
   ;			XMS_status=_XMMcopy(2048,XMS_ALLOC_HANDLER,XMS_OFFSET,0,XMS_P_STR);
   ;	
	?debug	L 453
	push	eax
	push	0
	push	dword ptr XMS_OFFSET
	push	word ptr XMS_ALLOC_HANDLER
	push	large 2048
	call	far ptr __XMMcopy
	add	sp,16
	mov	word ptr XMS_status,ax
   ;	
   ;			write(MEMORY_FILE,MEM,2048);
   ;	
	?debug	L 454
	push	2048
	push	dword ptr MEM
	push	word ptr MEMORY_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;			XMS_OFFSET+=2048l;
   ;	
	?debug	L 455
	add	dword ptr XMS_OFFSET,large 2048
	?debug	L 449
	inc	word ptr d@w+1292
	cmp	word ptr d@w+1292,512
	jl	short @5@226
   ;	
   ;		 }
   ;	 HELPHELP("##END-OFF-STORING XMS.");
   ;	
	?debug	L 457
	push	ds
	push	offset s@+228
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;	 XMMfree(XMS_ALLOC_HANDLER);
   ;	
	?debug	L 458
	push	word ptr XMS_ALLOC_HANDLER
	call	far ptr _XMMfree
	add	sp,2
   ;	
   ;	#endif
   ;	 close(MEMORY_FILE);
   ;	
	?debug	L 460
	push	word ptr MEMORY_FILE
	call	far ptr _close
	add	sp,2
   ;	
   ;	 lseek(STATUS_FILE,0l,SEEK_SET);
   ;	
	?debug	L 461
	push	0
	push	large 0
	push	word ptr STATUS_FILE
	call	far ptr _lseek
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&R[0],16*4);
   ;	
	?debug	L 462
	push	64
	push	ds
	push	offset _R
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&PSW_MASK,1);
   ;	
	?debug	L 463
	push	1
	push	ds
	push	offset _PSW_MASK
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&PSW_KEY,1);
   ;	
	?debug	L 464
	push	1
	push	ds
	push	offset _PSW_KEY
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&PSW_AMWP,1);
   ;	
	?debug	L 465
	push	1
	push	ds
	push	offset _PSW_AMWP
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&PSW_COD_INT,2);
   ;	
	?debug	L 466
	push	2
	push	ds
	push	offset _PSW_COD_INT
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&PSW_ILC,1);
   ;	
	?debug	L 467
	push	1
	push	ds
	push	offset _PSW_ILC
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&PSW_CC,1);
   ;	
	?debug	L 468
	push	1
	push	ds
	push	offset _PSW_CC
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&PSW_PRG_MASK,1);
   ;	
	?debug	L 469
	push	1
	push	ds
	push	offset _PSW_PRG_MASK
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&PSW_ADRESS,4);
   ;	
	?debug	L 470
	push	4
	push	ds
	push	offset _PSW_ADRESS
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&RQ_TRACE,2);
   ;	
	?debug	L 471
	push	2
	push	ds
	push	offset _RQ_TRACE
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	
   ;	 write(STATUS_FILE,&RETURN,2);
   ;	
	?debug	L 473
	push	2
	push	ds
	push	offset _RETURN
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&RQ_SVC,2);
   ;	
	?debug	L 474
	push	2
	push	ds
	push	offset _RQ_SVC
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&RQ_PRG,2);
   ;	
	?debug	L 475
	push	2
	push	ds
	push	offset _RQ_PRG
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&RQ_IPL,2);
   ;	
	?debug	L 476
	push	2
	push	ds
	push	offset _RQ_IPL
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&RQ_TIMER,2);
   ;	
	?debug	L 477
	push	2
	push	ds
	push	offset _RQ_TIMER
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,R_FLOAT,8*10);
   ;	
	?debug	L 478
	push	80
	push	ds
	push	offset _R_FLOAT
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	
   ;	 for(i=0;i<max_block_memory;i++)
   ;	
	?debug	L 480
	mov	word ptr d@w+1292,0
@5@338:
   ;	
   ;			 {write(STATUS_FILE,&MEMORY_KEY[i],1);
   ;	
	?debug	L 481
	push	1
	push	ds
	mov	ax,word ptr d@w+1292
	add	ax,offset MEMORY_KEY
	push	ax
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
	?debug	L 480
	inc	word ptr d@w+1292
	cmp	word ptr d@w+1292,512
	jl	short @5@338
   ;	
   ;			 }
   ;	 write(STATUS_FILE,&R370[0],16*4);
   ;	
	?debug	L 483
	push	64
	push	ds
	push	offset _R370
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&CLOCK1,4);
   ;	
	?debug	L 484
	push	4
	push	ds
	push	offset _CLOCK1
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&CLOCK2,4);
   ;	
	?debug	L 485
	push	4
	push	ds
	push	offset _CLOCK2
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&REAL_TIME,4);
   ;	
	?debug	L 486
	push	4
	push	ds
	push	offset _REAL_TIME
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&IPL_adr,2);
   ;	
	?debug	L 487
	push	2
	push	seg _IPL_adr
	push	offset _IPL_adr
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&PSW_EC_MASK,1);
   ;	
	?debug	L 488
	push	1
	push	ds
	push	offset _PSW_EC_MASK
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,TLB,8192);
   ;	
	?debug	L 489
	push	8192
	push	ds
	push	offset _TLB
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&CLOCK1_CPU,4);
   ;	
	?debug	L 490
	push	4
	push	ds
	push	offset _CLOCK1_CPU
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&CLOCK2_CPU,4);
   ;	
	?debug	L 491
	push	4
	push	ds
	push	offset _CLOCK2_CPU
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&REAL_TIME_CPU,4);
   ;	
	?debug	L 492
	push	4
	push	ds
	push	offset _REAL_TIME_CPU
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&COUNT_CPU,4);
   ;	
	?debug	L 493
	push	4
	push	ds
	push	offset _COUNT_CPU
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&CLOCK1_COMP,4);
   ;	
	?debug	L 494
	push	4
	push	ds
	push	offset _CLOCK1_COMP
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&CLOCK2_COMP,4);
   ;	
	?debug	L 495
	push	4
	push	ds
	push	offset _CLOCK2_COMP
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&REAL_TIME_COMP,4);
   ;	
	?debug	L 496
	push	4
	push	ds
	push	offset _REAL_TIME_COMP
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&COUNT_COMP,4);
   ;	
	?debug	L 497
	push	4
	push	ds
	push	offset _COUNT_COMP
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 write(STATUS_FILE,&PREFIX_PR,4);
   ;	
	?debug	L 498
	push	4
	push	ds
	push	offset _PREFIX_PR
	push	word ptr STATUS_FILE
	call	far ptr _write
	add	sp,8
   ;	
   ;	 close(STATUS_FILE);
   ;	
	?debug	L 499
	push	word ptr STATUS_FILE
	call	far ptr _close
	add	sp,2
   ;	
   ;	}
   ;	
	?debug	L 500
	pop	ds
	ret	
	?debug	C E6114E554D4245525F424C4F434B5F4C4F4E470C+
	?debug	C 0000020E0501A9010169040000020C0501A801
	?debug	E
	?debug	E
_CLOSE_MEMORY	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	char GET_BYTE(unsigned long ADRESS)
   ;	
	?debug	L 534
	assume	cs:DS360WK1_TEXT
_GET_BYTE	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6064144524553530C0A060000
	?debug	B
   ;	
   ;	{static int i,MIN;
   ;	#ifdef OPT003
   ;	 register int Number_block;
   ;	#else
   ;	 static int Number_block;
   ;	#endif
   ;	 static int DtaAdress;
   ;	 Dta(ADRESS);
   ;	
   ;	 if ((Number_block=((ADRESS<<8)>>19))>= MAX_BLOCK_MEMORY)
   ;	
	?debug	L 544
	mov	eax,dword ptr [bp+6]
	shl	eax,8
	shr	eax,19
	mov	si,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl	short @6@86
   ;	
   ;			 {HELPHELP("#1MAX BLOCK MEMORY (GET BYTE)");printf("= %08lx %x ",ADRESS,i);
   ;	
	?debug	L 545
	push	ds
	push	offset s@+251
	call	far ptr _HELPHELP
	add	sp,4
	push	word ptr d@w+1298
	push	dword ptr [bp+6]
	push	ds
	push	offset s@+281
	call	far ptr _printf
	add	sp,10
   ;	
   ;				PR();/*RQ_TRACE=1;*/RETURN=1;
   ;	
	?debug	L 546
	call	far ptr _PR
	mov	word ptr _RETURN,1
   ;	
   ;				RQ_PRG=5;
   ;	
	?debug	L 547
	mov	word ptr _RQ_PRG,5
   ;	
   ;				return(0);
   ;	
	?debug	L 548
	mov	al,0
	pop	ds
	pop	si
	pop	bp
	ret	
@6@86:
   ;	
   ;			 }
   ;	 if (MEMORY[Number_block]==NULL)
   ;	
	?debug	L 550
	mov	bx,si
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	je short	@@113
	jmp	@6@310
@@113:
   ;	
   ;		 {
   ;			MIN=NEXT_BLOCK_BUF;
   ;	
	?debug	L 552
	mov	ax,word ptr NEXT_BLOCK_BUF
	mov	word ptr d@w+1300,ax
   ;	
   ;			if (++NEXT_BLOCK_BUF>=MAX_BLOCK_BUF) NEXT_BLOCK_BUF=1;
   ;	
	?debug	L 553
	inc	word ptr NEXT_BLOCK_BUF
	mov	ax,word ptr NEXT_BLOCK_BUF
	cmp	ax,word ptr MAX_BLOCK_BUF
	jl	short @6@170
	mov	word ptr NEXT_BLOCK_BUF,1
@6@170:
   ;	
   ;			if (MEMORY_USE[MIN]>0)
   ;	
	?debug	L 554
	mov	bx,word ptr d@w+1300
	shl	bx,1
	cmp	word ptr MEMORY_USE[bx],0
	jle	short @6@226
   ;	
   ;				{NUMBER_BLOCK_LONG=MEMORY_BLOCK[MIN];NUMBER_BLOCK_LONG<<=11;
   ;	
	?debug	L 555
	mov	bx,word ptr d@w+1300
	shl	bx,1
	movsx	eax,word ptr MEMORY_BLOCK[bx]
	mov	dword ptr NUMBER_BLOCK_LONG,eax
	shl	eax,11
	mov	dword ptr NUMBER_BLOCK_LONG,eax
   ;	
   ;	#ifdef FORXMS
   ;				 XMS_POINTER_STR=(char huge *)(((char huge*)MEM)+
   ;	
	?debug	L 557
   ;	
   ;												 (((unsigned long)MIN)<<11));
   ;	
	?debug	L 558
	mov	ax,word ptr d@w+1300
	cwd	
	mov	cl,11
	call	far ptr F_LXLSH@
	push	ax
	push	dx
	mov	dx,word ptr MEM+2
	mov	ax,word ptr MEM
	pop	cx
	pop	bx
	call	far ptr F_PADD@
	mov	word ptr XMS_POINTER_STR+2,dx
	mov	word ptr XMS_POINTER_STR,ax
   ;	
   ;				 XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
   ;	
	?debug	L 559
	mov	eax,dword ptr XMS_POINTER_STR
	mov	dword ptr XMS_P_STR,eax
   ;	
   ;				 XMS_status=_XMMcopy(2048,0,XMS_P_STR,XMS_ALLOC_HANDLER,NUMBER_BLOCK_LONG);
   ;	
	?debug	L 560
	push	dword ptr NUMBER_BLOCK_LONG
	push	word ptr XMS_ALLOC_HANDLER
	push	eax
	push	0
	push	large 2048
	call	far ptr __XMMcopy
	add	sp,16
	mov	word ptr XMS_status,ax
@6@226:
   ;	
   ;	#else
   ;				 lseek(MEMORY_FILE,NUMBER_BLOCK_LONG,SEEK_SET);
   ;				 write(MEMORY_FILE,(char huge *)(((char huge*)MEM)+(((unsigned long)MIN)<<11)),2048);
   ;	#endif
   ;				}
   ;			if (MEMORY_BLOCK[MIN]>=0) MEMORY[MEMORY_BLOCK[MIN]]=NULL;
   ;	
	?debug	L 566
	mov	bx,word ptr d@w+1300
	shl	bx,1
	cmp	word ptr MEMORY_BLOCK[bx],0
	jl	short @6@282
	mov	bx,word ptr d@w+1300
	shl	bx,1
	mov	bx,word ptr MEMORY_BLOCK[bx]
	shl	bx,2
	mov	word ptr MEMORY[bx+2],0
	mov	word ptr MEMORY[bx],0
@6@282:
   ;	
   ;			MEMORY[Number_block]=(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11));
   ;	
	?debug	L 567
	mov	ax,word ptr d@w+1300
	cwd	
	mov	cl,11
	call	far ptr F_LXLSH@
	push	ax
	push	dx
	mov	dx,word ptr MEM+2
	mov	ax,word ptr MEM
	pop	cx
	pop	bx
	call	far ptr F_PADD@
	mov	bx,si
	shl	bx,2
	mov	word ptr MEMORY[bx+2],dx
	mov	word ptr MEMORY[bx],ax
   ;	
   ;			MEMORY_TO_BLOCK[Number_block]=MIN;
   ;	
	?debug	L 568
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr d@w+1300
	mov	word ptr MEMORY_TO_BLOCK[bx],ax
   ;	
   ;			MEMORY_BLOCK[MIN]=Number_block;
   ;	
	?debug	L 569
	mov	bx,word ptr d@w+1300
	shl	bx,1
	mov	word ptr MEMORY_BLOCK[bx],si
   ;	
   ;			MEMORY_USE[MIN]=0;
   ;	
	?debug	L 570
	mov	bx,word ptr d@w+1300
	shl	bx,1
	mov	word ptr MEMORY_USE[bx],0
   ;	
   ;			NUMBER_BLOCK_LONG=Number_block;NUMBER_BLOCK_LONG<<=11;
   ;	
	?debug	L 571
	movsx	eax,si
	mov	dword ptr NUMBER_BLOCK_LONG,eax
	shl	eax,11
	mov	dword ptr NUMBER_BLOCK_LONG,eax
   ;	
   ;	#ifdef FORXMS
   ;			XMS_POINTER_STR=(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11));
   ;	
	?debug	L 573
	mov	ax,word ptr d@w+1300
	cwd	
	mov	cl,11
	call	far ptr F_LXLSH@
	push	ax
	push	dx
	mov	dx,word ptr MEM+2
	mov	ax,word ptr MEM
	pop	cx
	pop	bx
	call	far ptr F_PADD@
	mov	word ptr XMS_POINTER_STR+2,dx
	mov	word ptr XMS_POINTER_STR,ax
   ;	
   ;			XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
   ;	
	?debug	L 574
	mov	eax,dword ptr XMS_POINTER_STR
	mov	dword ptr XMS_P_STR,eax
   ;	
   ;			XMS_status=_XMMcopy(2048,XMS_ALLOC_HANDLER,NUMBER_BLOCK_LONG,0,XMS_P_STR);
   ;	
	?debug	L 575
	push	eax
	push	0
	push	dword ptr NUMBER_BLOCK_LONG
	push	word ptr XMS_ALLOC_HANDLER
	push	large 2048
	call	far ptr __XMMcopy
	add	sp,16
	mov	word ptr XMS_status,ax
@6@310:
   ;	
   ;	#else
   ;			lseek(MEMORY_FILE,NUMBER_BLOCK_LONG,SEEK_SET);
   ;			read(MEMORY_FILE,(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11)),2048);
   ;	#endif
   ;		 }
   ;	 return(*(POINTER_T=MEMORY[Number_block]+(((unsigned int)ADRESS)&0x07ff)));
   ;	
	?debug	L 581
	mov	ax,word ptr [bp+6]
	and	ax,2047
	mov	bx,si
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr _POINTER_T+2,dx
	mov	es,dx
	mov	word ptr _POINTER_T,bx
	mov	al,byte ptr es:[bx]
   ;	
   ;	
   ;	
   ;	}
   ;	
	?debug	L 584
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E609447461416472657373040000021605011D02+
	?debug	C 0C4E756D6265725F626C6F636B04080118000202+
	?debug	C 040600034D494E04000002140501170201690400+
	?debug	C 00021205011702064144524553530C0A060000
	?debug	E
	?debug	E
_GET_BYTE	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void PUT_BYTE(unsigned long ADRESS,char BYTE_PUT)
   ;	
	?debug	L 613
	assume	cs:DS360WK1_TEXT
_PUT_BYTE	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E608425954455F505554080A0A00000641445245+
	?debug	C 53530C0A060000
	?debug	B
   ;	
   ;	{static int i,MIN;
   ;	#ifdef OPT003
   ;	 register int Number_block;
   ;	#else
   ;	 static int Number_block;
   ;	#endif
   ;	 static int DtaAdress;
   ;	 Dta(ADRESS);
   ;	
   ;	
   ;	 if ((Number_block=((ADRESS<<8)>>19)) >= MAX_BLOCK_MEMORY)
   ;	
	?debug	L 624
	mov	eax,dword ptr [bp+6]
	shl	eax,8
	shr	eax,19
	mov	si,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl	short @7@86
   ;	
   ;			{i=Number_block;
   ;	
	?debug	L 625
	mov	word ptr d@w+1304,si
   ;	
   ;			 HELPHELP("#1MAX BLOCK MEMORY (PUT BYTE)");printf("= %08lx %x value=%x",ADRESS,i,BYTE_PUT);
   ;	
	?debug	L 626
	push	ds
	push	offset s@+293
	call	far ptr _HELPHELP
	add	sp,4
	mov	al,byte ptr [bp+10]
	mov	ah,0
	push	ax
	push	word ptr d@w+1304
	push	dword ptr [bp+6]
	push	ds
	push	offset s@+323
	call	far ptr _printf
	add	sp,12
   ;	
   ;			 PR();/*RQ_TRACE=1;*/RETURN=1;
   ;	
	?debug	L 627
	call	far ptr _PR
	mov	word ptr _RETURN,1
   ;	
   ;			 RQ_PRG=5;
   ;	
	?debug	L 628
	mov	word ptr _RQ_PRG,5
   ;	
   ;			 return;}
   ;	
	?debug	L 629
	pop	ds
	pop	si
	pop	bp
	ret	
@7@86:
   ;	
   ;	 if (MEMORY[Number_block]==NULL)
   ;	
	?debug	L 630
	mov	bx,si
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	je short	@@114
	jmp	@7@310
@@114:
   ;	
   ;		 {
   ;			MIN=NEXT_BLOCK_BUF;
   ;	
	?debug	L 632
	mov	ax,word ptr NEXT_BLOCK_BUF
	mov	word ptr d@w+1306,ax
   ;	
   ;			if (++NEXT_BLOCK_BUF>=MAX_BLOCK_BUF) NEXT_BLOCK_BUF=1;
   ;	
	?debug	L 633
	inc	word ptr NEXT_BLOCK_BUF
	mov	ax,word ptr NEXT_BLOCK_BUF
	cmp	ax,word ptr MAX_BLOCK_BUF
	jl	short @7@170
	mov	word ptr NEXT_BLOCK_BUF,1
@7@170:
   ;	
   ;	
   ;			if (MEMORY_USE[MIN]>0)
   ;	
	?debug	L 635
	mov	bx,word ptr d@w+1306
	shl	bx,1
	cmp	word ptr MEMORY_USE[bx],0
	jle	short @7@226
   ;	
   ;				{NUMBER_BLOCK_LONG=MEMORY_BLOCK[MIN];NUMBER_BLOCK_LONG<<=11;
   ;	
	?debug	L 636
	mov	bx,word ptr d@w+1306
	shl	bx,1
	movsx	eax,word ptr MEMORY_BLOCK[bx]
	mov	dword ptr NUMBER_BLOCK_LONG,eax
	shl	eax,11
	mov	dword ptr NUMBER_BLOCK_LONG,eax
   ;	
   ;	#ifdef FORXMS
   ;				 XMS_POINTER_STR=(char huge *)(((char huge*)MEM)+(((unsigned long)MIN)<<11));
   ;	
	?debug	L 638
	mov	ax,word ptr d@w+1306
	cwd	
	mov	cl,11
	call	far ptr F_LXLSH@
	push	ax
	push	dx
	mov	dx,word ptr MEM+2
	mov	ax,word ptr MEM
	pop	cx
	pop	bx
	call	far ptr F_PADD@
	mov	word ptr XMS_POINTER_STR+2,dx
	mov	word ptr XMS_POINTER_STR,ax
   ;	
   ;				 XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
   ;	
	?debug	L 639
	mov	eax,dword ptr XMS_POINTER_STR
	mov	dword ptr XMS_P_STR,eax
   ;	
   ;				 XMS_status=_XMMcopy(2048,0,XMS_P_STR,XMS_ALLOC_HANDLER,NUMBER_BLOCK_LONG);
   ;	
	?debug	L 640
	push	dword ptr NUMBER_BLOCK_LONG
	push	word ptr XMS_ALLOC_HANDLER
	push	eax
	push	0
	push	large 2048
	call	far ptr __XMMcopy
	add	sp,16
	mov	word ptr XMS_status,ax
@7@226:
   ;	
   ;	#else
   ;				 lseek(MEMORY_FILE,NUMBER_BLOCK_LONG,SEEK_SET);
   ;				 write(MEMORY_FILE,(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11)),2048);
   ;	#endif
   ;				}
   ;			if (MEMORY_BLOCK[MIN]>=0) MEMORY[MEMORY_BLOCK[MIN]]=NULL;
   ;	
	?debug	L 646
	mov	bx,word ptr d@w+1306
	shl	bx,1
	cmp	word ptr MEMORY_BLOCK[bx],0
	jl	short @7@282
	mov	bx,word ptr d@w+1306
	shl	bx,1
	mov	bx,word ptr MEMORY_BLOCK[bx]
	shl	bx,2
	mov	word ptr MEMORY[bx+2],0
	mov	word ptr MEMORY[bx],0
@7@282:
   ;	
   ;			MEMORY[Number_block]=(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11));
   ;	
	?debug	L 647
	mov	ax,word ptr d@w+1306
	cwd	
	mov	cl,11
	call	far ptr F_LXLSH@
	push	ax
	push	dx
	mov	dx,word ptr MEM+2
	mov	ax,word ptr MEM
	pop	cx
	pop	bx
	call	far ptr F_PADD@
	mov	bx,si
	shl	bx,2
	mov	word ptr MEMORY[bx+2],dx
	mov	word ptr MEMORY[bx],ax
   ;	
   ;			MEMORY_BLOCK[MIN]=Number_block;
   ;	
	?debug	L 648
	mov	bx,word ptr d@w+1306
	shl	bx,1
	mov	word ptr MEMORY_BLOCK[bx],si
   ;	
   ;			MEMORY_USE[MIN]=0;
   ;	
	?debug	L 649
	mov	bx,word ptr d@w+1306
	shl	bx,1
	mov	word ptr MEMORY_USE[bx],0
   ;	
   ;			MEMORY_TO_BLOCK[Number_block]=MIN;
   ;	
	?debug	L 650
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr d@w+1306
	mov	word ptr MEMORY_TO_BLOCK[bx],ax
   ;	
   ;			NUMBER_BLOCK_LONG=Number_block;NUMBER_BLOCK_LONG<<=11;
   ;	
	?debug	L 651
	movsx	eax,si
	mov	dword ptr NUMBER_BLOCK_LONG,eax
	shl	eax,11
	mov	dword ptr NUMBER_BLOCK_LONG,eax
   ;	
   ;	#ifdef FORXMS
   ;			XMS_POINTER_STR=(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11));
   ;	
	?debug	L 653
	mov	ax,word ptr d@w+1306
	cwd	
	mov	cl,11
	call	far ptr F_LXLSH@
	push	ax
	push	dx
	mov	dx,word ptr MEM+2
	mov	ax,word ptr MEM
	pop	cx
	pop	bx
	call	far ptr F_PADD@
	mov	word ptr XMS_POINTER_STR+2,dx
	mov	word ptr XMS_POINTER_STR,ax
   ;	
   ;			XMS_P_STR=(unsigned long int)XMS_POINTER_STR;
   ;	
	?debug	L 654
	mov	eax,dword ptr XMS_POINTER_STR
	mov	dword ptr XMS_P_STR,eax
   ;	
   ;			XMS_status=_XMMcopy(2048,XMS_ALLOC_HANDLER,NUMBER_BLOCK_LONG,0,XMS_P_STR);
   ;	
	?debug	L 655
	push	eax
	push	0
	push	dword ptr NUMBER_BLOCK_LONG
	push	word ptr XMS_ALLOC_HANDLER
	push	large 2048
	call	far ptr __XMMcopy
	add	sp,16
	mov	word ptr XMS_status,ax
@7@310:
   ;	
   ;	#else
   ;			lseek(MEMORY_FILE,NUMBER_BLOCK_LONG,SEEK_SET);
   ;			read(MEMORY_FILE,(char huge*)(((char huge*)MEM)+(((unsigned long)MIN)<<11)),2048);
   ;	#endif
   ;		 }
   ;	 if (PSW_KEY)
   ;	
	?debug	L 661
	cmp	byte ptr _PSW_KEY,0
	je	short @7@394
   ;	
   ;	 if (PSW_KEY!=MEMORY_KEY[Number_block])
   ;	
	?debug	L 662
	mov	al,byte ptr MEMORY_KEY[si]
	cmp	al,byte ptr _PSW_KEY
	je	short @7@394
   ;	
   ;		 {HELPHELP("#1KEY PUT_BYTE_2");RQ_PRG=0x0004;/*RQ_TRACE=1;*/RETURN=2;return;
   ;	
	?debug	L 663
	push	ds
	push	offset s@+343
	call	far ptr _HELPHELP
	add	sp,4
	mov	word ptr _RQ_PRG,4
	mov	word ptr _RETURN,2
	pop	ds
	pop	si
	pop	bp
	ret	
@7@394:
   ;	
   ;		 }
   ;	 MEMORY_USE[MEMORY_TO_BLOCK[Number_block]]=10;
   ;	
	?debug	L 665
	mov	bx,si
	shl	bx,1
	mov	bx,word ptr MEMORY_TO_BLOCK[bx]
	shl	bx,1
	mov	word ptr MEMORY_USE[bx],10
   ;	
   ;	 *(POINTER_T=MEMORY[Number_block]+(((unsigned int)ADRESS)&0x07ff))=BYTE_PUT;
   ;	
	?debug	L 666
	mov	ax,word ptr [bp+6]
	and	ax,2047
	mov	bx,si
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr _POINTER_T+2,dx
	mov	es,dx
	mov	word ptr _POINTER_T,bx
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx],al
   ;	
   ;	}
   ;	
	?debug	L 667
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E609447461416472657373040000021C05016C02+
	?debug	C 0C4E756D6265725F626C6F636B04080118005502+
	?debug	C 040600034D494E040000021A0501660201690400+
	?debug	C 00021805016602064144524553530C0A06000008+
	?debug	C 425954455F505554080A0A0000
	?debug	E
	?debug	E
_PUT_BYTE	endp
   ;	
   ;	char GET_SECOND_BYTE(void)
   ;	
	?debug	L 680
	assume	cs:DS360WK1_TEXT
_GET_SECOND_BYTE	proc	far
	?debug	B
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	{return(*(POINTER_T+1));
   ;	
	?debug	L 681
	les	bx,dword ptr _POINTER_T
	mov	al,byte ptr es:[bx+1]
   ;	
   ;	}
   ;	
	?debug	L 682
	pop	ds
	ret	
	?debug	E
	?debug	E
_GET_SECOND_BYTE	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void MOVE_360_TO_MEM(unsigned long FROM,char far* TO,int LEN)
   ;	
	?debug	L 688
	assume	cs:DS360WK1_TEXT
_MOVE_360_TO_MEM	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E318000400160800
	?debug	C E6034C454E040A0E000002544F180A0A00000446+
	?debug	C 524F4D0C0A060000
	?debug	B
   ;	
   ;	{
   ;	 static unsigned long From;
   ;	 static char far *to_to;
   ;	 static char far *from_from;
   ;	 static int len_len;
   ;	 static int i;
   ;	 static int DtaAdress;
   ;	
   ;	 to_to=TO;
   ;	
	?debug	L 697
	mov	eax,dword ptr [bp+10]
	mov	dword ptr d@w+1314,eax
   ;	
   ;	 len_len=LEN;
   ;	
	?debug	L 698
	mov	ax,word ptr [bp+14]
	mov	word ptr d@w+1322,ax
   ;	
   ;	
   ;	#ifdef DTA_370
   ;	 From=FROM;
   ;	 DtaEnd(FROM,len_len);
   ;	 Dta(FROM);
   ;	#endif
   ;	
   ;	#ifdef FOR386
   ;	 if (LEN==0) return;
   ;	
	?debug	L 707
	cmp	word ptr [bp+14],0
	jne short	@@115
	jmp	@9@534
@@115:
   ;	
   ;	 if ( ( ((len_len+(unsigned int)FROM)^(unsigned int)FROM)&0xf800)==0 )
   ;	
	?debug	L 708
	mov	ax,word ptr d@w+1322
	add	ax,word ptr [bp+6]
	xor	ax,word ptr [bp+6]
	test	ax,00000F800h
	jne	short @9@394
   ;	
   ;		 {
   ;	
   ;	#ifdef DTA_370
   ;			FROM=From;
   ;	#endif
   ;	
   ;			*to_to=GET_BYTE(FROM);
   ;	
	?debug	L 715
	push	dword ptr [bp+6]
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	les	bx,dword ptr d@w+1314
	mov	byte ptr es:[bx],al
   ;	
   ;			if (RQ_PRG==5) return;
   ;	
	?debug	L 716
	cmp	word ptr _RQ_PRG,5
	jne short	@@116
	jmp	@9@534
@@116:
   ;	
   ;			if (LEN<2) return;
   ;	
	?debug	L 717
	cmp	word ptr [bp+14],2
	jl	short @9@534
   ;	
   ;			from_from=POINTER_T;
   ;	
	?debug	L 718
	mov	eax,dword ptr _POINTER_T
	mov	dword ptr d@w+1318,eax
   ;	
   ;			asm push ds;
   ;	
	?debug	L 719
 	push	 ds
   ;	
   ;			asm mov cx,len_len;
   ;	
	?debug	L 720
 	mov	 cx,d@w+1322
   ;	
   ;			asm les di,to_to;
   ;	
	?debug	L 721
 	les	 di,d@w+1314
   ;	
   ;			asm lds si,from_from;
   ;	
	?debug	L 722
 	lds	 si,d@w+1318
   ;	
   ;			asm cld;
   ;	
	?debug	L 723
 	cld	
   ;	
   ;			asm rep movsb;
   ;	
	?debug	L 724
 	rep movsb	
   ;	
   ;			asm pop ds;
   ;	
	?debug	L 725
 	pop	 ds
   ;	
   ;		 }
   ;	
	?debug	L 726
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@9@394:
   ;	
   ;	 else
   ;	#endif
   ;		 {
   ;	#ifdef DTA_370
   ;			FROM=From;
   ;	#endif
   ;	
   ;			for(i=0;i<len_len;i++) *to_to++=GET_BYTE(FROM+i);
   ;	
	?debug	L 734
	mov	word ptr d@w+1324,0
	mov	ax,word ptr d@w+1324
	cmp	ax,word ptr d@w+1322
	jge	short @9@534
@9@450:
	movsx	eax,word ptr d@w+1324
	mov	edx,dword ptr [bp+6]
	add	edx,eax
	push	edx
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	les	bx,dword ptr d@w+1314
	mov	byte ptr es:[bx],al
	inc	word ptr d@w+1314
	inc	word ptr d@w+1324
	mov	ax,word ptr d@w+1324
	cmp	ax,word ptr d@w+1322
	jl	short @9@450
@9@534:
   ;	
   ;		 }
   ;	
   ;	}
   ;	
	?debug	L 737
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
	?debug	C E609447461416472657373040000022E0501B702+
	?debug	C 0169040000022C0501B602076C656E5F6C656E04+
	?debug	C 0000022A0501B5020966726F6D5F66726F6D1800+
	?debug	C 0002260501B40205746F5F746F18000002220501+
	?debug	C B3020446726F6D0C0000021E0501B2020446524F+
	?debug	C 4D0C0A06000002544F180A0A0000034C454E040A+
	?debug	C 0E0000
	?debug	E
	?debug	E
_MOVE_360_TO_MEM	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void MOVE_MEM_TO_360(char far* FROM,unsigned long TO,int LEN)
   ;	
	?debug	L 770
	assume	cs:DS360WK1_TEXT
_MOVE_MEM_TO_360	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6034C454E040A0E000002544F0C0A0A00000446+
	?debug	C 524F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static unsigned long To;
   ;	 static char far *to_to;
   ;	 static char far *from_from;
   ;	 static unsigned int len_len;
   ;	 static int i;
   ;	 static int DtaAdress;
   ;	
   ;	 from_from=FROM;
   ;	
	?debug	L 779
	mov	eax,dword ptr [bp+6]
	mov	dword ptr d@w+1336,eax
   ;	
   ;	 len_len=LEN;
   ;	
	?debug	L 780
	mov	ax,word ptr [bp+14]
	mov	word ptr d@w+1340,ax
   ;	
   ;	
   ;	#ifdef DTA_370
   ;	 To=TO;
   ;	 DtaEnd(TO,len_len);
   ;	 Dta(TO);
   ;	#endif
   ;	
   ;	
   ;	#ifdef FOR386
   ;	 if (LEN==0) return;
   ;	
	?debug	L 790
	cmp	word ptr [bp+14],0
	jne short	@@117
	jmp	@10@534
@@117:
   ;	
   ;	 if  ( ( ((len_len+(unsigned int)TO)^(unsigned int)TO) & 0xf800 )==0 )
   ;	
	?debug	L 791
	mov	ax,word ptr d@w+1340
	add	ax,word ptr [bp+10]
	xor	ax,word ptr [bp+10]
	test	ax,00000F800h
	jne	short @10@394
   ;	
   ;		 {
   ;	
   ;	#ifdef DTA_370
   ;			TO=To;
   ;	#endif
   ;	
   ;			PUT_BYTE(TO,*from_from);
   ;	
	?debug	L 798
	les	bx,dword ptr d@w+1336
	mov	al,byte ptr es:[bx]
	push	ax
	push	dword ptr [bp+10]
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;			if (RQ_PRG==5) return;
   ;	
	?debug	L 799
	cmp	word ptr _RQ_PRG,5
	jne short	@@118
	jmp	@10@534
@@118:
   ;	
   ;			if (LEN<2) return;
   ;	
	?debug	L 800
	cmp	word ptr [bp+14],2
	jl	short @10@534
   ;	
   ;			to_to=POINTER_T;
   ;	
	?debug	L 801
	mov	eax,dword ptr _POINTER_T
	mov	dword ptr d@w+1332,eax
   ;	
   ;			asm push ds;
   ;	
	?debug	L 802
 	push	 ds
   ;	
   ;			asm mov cx,len_len;
   ;	
	?debug	L 803
 	mov	 cx,d@w+1340
   ;	
   ;			asm les di,to_to;
   ;	
	?debug	L 804
 	les	 di,d@w+1332
   ;	
   ;			asm lds si,from_from;
   ;	
	?debug	L 805
 	lds	 si,d@w+1336
   ;	
   ;			asm cld;
   ;	
	?debug	L 806
 	cld	
   ;	
   ;			asm rep movsb;
   ;	
	?debug	L 807
 	rep movsb	
   ;	
   ;			asm pop ds;
   ;	
	?debug	L 808
 	pop	 ds
   ;	
   ;		 }
   ;	
	?debug	L 809
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@10@394:
   ;	
   ;	 else
   ;	#endif
   ;		 {
   ;	
   ;	#ifdef DTA_370
   ;			TO=To;
   ;	#endif
   ;	
   ;			for(i=0;i<len_len;i++) PUT_BYTE(TO+i,*(from_from++));
   ;	
	?debug	L 818
	mov	word ptr d@w+1342,0
	mov	ax,word ptr d@w+1342
	cmp	ax,word ptr d@w+1340
	jae	short @10@534
@10@450:
	les	bx,dword ptr d@w+1336
	inc	word ptr d@w+1336
	mov	al,byte ptr es:[bx]
	push	ax
	movsx	eax,word ptr d@w+1342
	mov	edx,dword ptr [bp+10]
	add	edx,eax
	push	edx
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
	inc	word ptr d@w+1342
	mov	ax,word ptr d@w+1342
	cmp	ax,word ptr d@w+1340
	jb	short @10@450
@10@534:
   ;	
   ;		 }
   ;	}
   ;	
	?debug	L 820
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
	?debug	C E609447461416472657373040000024005010903+
	?debug	C 0169040000023E05010803076C656E5F6C656E0A+
	?debug	C 0000023C050107030966726F6D5F66726F6D1800+
	?debug	C 0002380501060305746F5F746F18000002340501+
	?debug	C 050302546F0C00000230050104030446524F4D18+
	?debug	C 0A06000002544F0C0A0A0000034C454E040A0E00+
	?debug	C 00
	?debug	E
	?debug	E
_MOVE_MEM_TO_360	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
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
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODED2(char far *COM)     /*  MVC */
   ;	
	?debug	L 850
	assume	cs:DS360WK1_TEXT
_CODED2	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,DS360WK1_DATA
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
   ;	#define LL RX
   ;	#define L1 R1
   ;	#define L2 R2
   ;	 static int LEN;
   ;	 static unsigned int DDD1,DDD2;
   ;	
   ;	 static unsigned long ADR, ADRESS1,ADRESS2;
   ;	 static unsigned long Adress1,Adress2;
   ;	 static int i,k;
   ;	 static int len_len;
   ;	 static int number_block_dest,number_block_src;
   ;	 static char cccc;
   ;	 static char far *to_to;
   ;	 static char far *from_from;
   ;	 static int DtaAdress;
   ;	
   ;	
   ;	 GET_OPERAND_SS;
   ;	
	?debug	L 878
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+1347,al
 	ror	 ax,4
	mov	byte ptr d@w+1348,al
 	shr	 ax,12
	mov	byte ptr d@w+1350,al
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @11@310
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+1372,eax
	jmp	short @11@366
@11@310:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+1372,eax
@11@366:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	test	al,240
	je	short @11@534
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+1376,eax
	jmp	short @11@590
@11@534:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+1376,eax
@11@590:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 879
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 len_len=(int)LL+1;
   ;	
	?debug	L 880
	mov	al,byte ptr d@+1347
	mov	ah,0
	inc	ax
	mov	word ptr d@w+1392,ax
   ;	
   ;	
   ;	#ifdef DTA_370
   ;			Adress1=ADRESS1;
   ;			Adress2=ADRESS2;
   ;			DtaEnd(ADRESS1,len_len);
   ;			DtaEnd(ADRESS2,len_len);
   ;			Dta(ADRESS1);
   ;			Dta(ADRESS2);
   ;	#endif
   ;	
   ;	
   ;	#ifdef FOR386
   ;	 //goto MOVE_B;
   ;	 if (len_len>2)
   ;	
	?debug	L 894
	cmp	word ptr d@w+1392,2
	jg short	@@119
	jmp	@11@1206
@@119:
   ;	
   ;		 {
   ;			if ( ( ((len_len+(unsigned int)ADRESS1)^(unsigned int)ADRESS1)&0xf800 )==0 )
   ;	
	?debug	L 896
	add	ax,word ptr d@w+1372
	xor	ax,word ptr d@w+1372
	test	ax,00000F800h
	je short	@@120
	jmp	@11@1206
@@120:
   ;	
   ;				{if ( ( ((len_len+(unsigned int)ADRESS2)^(unsigned int)ADRESS2)&0xf800 )==0 )
   ;	
	?debug	L 897
	mov	ax,word ptr d@w+1392
	add	ax,word ptr d@w+1376
	xor	ax,word ptr d@w+1376
	test	ax,00000F800h
	je short	@@121
	jmp	@11@1206
@@121:
   ;	
   ;	
   ;					 {
   ;						if ((number_block_dest=((ADRESS1<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
   ;	
	?debug	L 900
	mov	eax,dword ptr d@w+1372
	shl	eax,8
	shr	eax,19
	mov	word ptr d@w+1394,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl short	@@122
	jmp	@11@1178
@@122:
   ;	
   ;						if ((number_block_src=((ADRESS2<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
   ;	
	?debug	L 901
	mov	eax,dword ptr d@w+1376
	shl	eax,8
	shr	eax,19
	mov	word ptr d@w+1396,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl short	@@123
	jmp	@11@1178
@@123:
   ;	
   ;						if (MEMORY[number_block_dest]!=NULL &&
   ;	
	?debug	L 902
   ;	
   ;								MEMORY[number_block_src] !=NULL)
   ;	
	?debug	L 903
	mov	bx,word ptr d@w+1394
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	jne short	@@124
	jmp	@11@870
@@124:
	mov	bx,word ptr d@w+1396
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	jne short	@@125
	jmp	@11@870
@@125:
   ;	
   ;							{to_to=MEMORY[number_block_dest]+(((unsigned int)ADRESS1)&0x07ff);
   ;	
	?debug	L 904
	mov	ax,word ptr d@w+1372
	and	ax,2047
	mov	bx,word ptr d@w+1394
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr d@w+1400+2,dx
	mov	word ptr d@w+1400,bx
   ;	
   ;							 from_from=MEMORY[number_block_src]+(((unsigned int)ADRESS2)&0x000007ff);
   ;	
	?debug	L 905
	mov	ax,word ptr d@w+1376
	and	ax,2047
	mov	bx,word ptr d@w+1396
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr d@w+1404+2,dx
	mov	word ptr d@w+1404,bx
   ;	
   ;							 MEMORY_USE[MEMORY_TO_BLOCK[number_block_dest]]=10;
   ;	
	?debug	L 906
	mov	bx,word ptr d@w+1394
	shl	bx,1
	mov	bx,word ptr MEMORY_TO_BLOCK[bx]
	shl	bx,1
	mov	word ptr MEMORY_USE[bx],10
   ;	
   ;							 if (PSW_KEY)
   ;	
	?debug	L 907
	cmp	byte ptr _PSW_KEY,0
	jne short	@@126
	jmp	@11@954
@@126:
   ;	
   ;								 if (PSW_KEY!=MEMORY_KEY[number_block_dest])
   ;	
	?debug	L 908
	mov	bx,word ptr d@w+1394
	mov	al,byte ptr MEMORY_KEY[bx]
	cmp	al,byte ptr _PSW_KEY
	jne short	@@127
	jmp	@11@954
@@127:
   ;	
   ;									 {printf("KEY PSW=%d KEY MEMORY=%d MVC PSW=%06x ADRESS=%06x",
   ;	
	?debug	L 909
   ;	
   ;													 PSW_KEY,
   ;													 MEMORY_KEY[number_block_dest],PSW_ADRESS,ADRESS1);
   ;	
	?debug	L 911
	push	dword ptr d@w+1372
	push	dword ptr _PSW_ADRESS
	mov	ah,0
	push	ax
	mov	al,byte ptr _PSW_KEY
	mov	ah,0
	push	ax
	push	ds
	push	offset s@+360
	call	far ptr _printf
	add	sp,16
   ;	
   ;										RQ_PRG=0x0004;RQ_TRACE=1;RETURN=1;return;
   ;	
	?debug	L 912
	mov	word ptr _RQ_PRG,4
	mov	word ptr _RQ_TRACE,1
	mov	word ptr _RETURN,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@11@870:
   ;	
   ;									 }
   ;							 goto MOVE_M;
   ;							}
   ;	
   ;	#ifdef DTA_370
   ;						ADRESS1=Adress1;
   ;						ADRESS2=Adress2;
   ;	#endif
   ;	
   ;						cccc=GET_BYTE(ADRESS2);
   ;	
	?debug	L 922
	push	dword ptr d@w+1376
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+1398,al
   ;	
   ;						if (RETURN) return;
   ;	
	?debug	L 923
	cmp	word ptr _RETURN,0
	je short	@@128
	jmp	@11@1346
@@128:
   ;	
   ;						PUT_BYTE(ADRESS1,cccc);
   ;	
	?debug	L 924
	mov	al,byte ptr d@+1398
	push	ax
	push	dword ptr d@w+1372
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;						if (RETURN) return;
   ;	
	?debug	L 925
	cmp	word ptr _RETURN,0
	je short	@@129
	jmp	@11@1346
@@129:
   ;	
   ;						to_to=POINTER_T;
   ;	
	?debug	L 926
	mov	eax,dword ptr _POINTER_T
	mov	dword ptr d@w+1400,eax
   ;	
   ;						cccc=GET_BYTE(ADRESS2);
   ;	
	?debug	L 927
	push	dword ptr d@w+1376
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+1398,al
   ;	
   ;						from_from=POINTER_T;
   ;	
	?debug	L 928
	mov	eax,dword ptr _POINTER_T
	mov	dword ptr d@w+1404,eax
@11@954:
   ;	
   ;	
   ;	MOVE_M:
   ;	
   ;							{
   ;							 asm push ds;
   ;	
	?debug	L 933
 	push	 ds
   ;	
   ;							 asm mov cx,len_len;
   ;	
	?debug	L 934
 	mov	 cx,d@w+1392
   ;	
   ;							 asm les di,to_to;
   ;	
	?debug	L 935
 	les	 di,d@w+1400
   ;	
   ;							 asm lds si,from_from;
   ;	
	?debug	L 936
 	lds	 si,d@w+1404
   ;	
   ;							 asm cld;
   ;	
	?debug	L 937
 	cld	
   ;	
   ;							 asm rep movsb;
   ;	
	?debug	L 938
 	rep movsb	
   ;	
   ;							 asm pop ds;
   ;	
	?debug	L 939
 	pop	 ds
   ;	
   ;							 return;
   ;	
	?debug	L 940
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@11@1178:
   ;	
   ;							}
   ;	ERROR_B:
   ;	
   ;	#ifdef DTA_370
   ;						ADRESS1=Adress1;
   ;						ADRESS2=Adress2;
   ;	#endif
   ;	
   ;						PUT_BYTE(ADRESS1,GET_BYTE(ADRESS2));
   ;	
	?debug	L 949
	push	dword ptr d@w+1376
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	push	ax
	push	dword ptr d@w+1372
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;						return;
   ;	
	?debug	L 950
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@11@1206:
   ;	
   ;	
   ;	
   ;					 }
   ;	
   ;				}
   ;		 }
   ;	#endif
   ;	MOVE_B:
   ;	
   ;	#ifdef DTA_370
   ;	 ADRESS1=Adress1;
   ;	 ADRESS2=Adress2;
   ;	#endif
   ;	
   ;	 for(i=0;i<len_len;i++) PUT_BYTE(ADRESS1++,GET_BYTE(ADRESS2++));
   ;	
	?debug	L 965
	mov	word ptr d@w+1388,0
	mov	ax,word ptr d@w+1388
	cmp	ax,word ptr d@w+1392
	jge	short @11@1346
@11@1262:
	mov	eax,dword ptr d@w+1376
	inc	dword ptr d@w+1376
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	push	ax
	mov	eax,dword ptr d@w+1372
	inc	dword ptr d@w+1372
	push	eax
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
	inc	word ptr d@w+1388
	mov	ax,word ptr d@w+1388
	cmp	ax,word ptr d@w+1392
	jl	short @11@1262
@11@1346:
   ;	
   ;	
   ;	}
   ;	
	?debug	L 967
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
	?debug	C E609447461416472657373040000028005016B03+
	?debug	C 0966726F6D5F66726F6D180000027C05016A0305+
	?debug	C 746F5F746F180000027805016903046363636308+
	?debug	C 0000027605016803106E756D6265725F626C6F63+
	?debug	C 6B5F737263040000027405016703116E756D6265+
	?debug	C 725F626C6F636B5F646573740400000272050167+
	?debug	C 03076C656E5F6C656E040000027005016603016B+
	?debug	C 040000026E050165030169040000026C05016503+
	?debug	C 07416472657373320C0000026805016403074164+
	?debug	C 72657373310C0000026405016403074144524553+
	?debug	C 53320C000002600501630307414452455353310C+
	?debug	C 0000025C05016303034144520C00000258050163+
	?debug	C 0304444444320A00000256050161030444444431+
	?debug	C 0A0000025405016103034C454E04000002520501+
	?debug	C 6003034444440A0000025005015B030244440800+
	?debug	C 00024F05015A03024244080000024E0501590302+
	?debug	C 4953040000024C05015603024232040000024A05+
	?debug	C 0156030242310400000248050156030252320400+
	?debug	C 0002460501560302523104000002440501560302+
	?debug	C 5258080000024305015503025252080000024205+
	?debug	C 01540303434F4D180A060000
	?debug	E
	?debug	E
_CODED2	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
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
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void MOVE(unsigned long ADRESS1,unsigned long ADRESS2,int LLL)     /*  MVC */
   ;	
	?debug	L 970
	assume	cs:DS360WK1_TEXT
_MOVE	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6034C4C4C040A0E000007414452455353320C0A+
	?debug	C 0A000007414452455353310C0A060000
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
   ;	#define LL RX
   ;	#define L1 R1
   ;	#define L2 R2
   ;	 static int LEN;
   ;	 static unsigned int DDD1,DDD2;
   ;	
   ;	 static unsigned long ADR;
   ;	 static unsigned long Adress1,Adress2;
   ;	 static int i,k;
   ;	 static int len_len;
   ;	 static int number_block_dest,number_block_src;
   ;	 static char cccc;
   ;	 static char far *to_to;
   ;	 static char far *from_from;
   ;	 static int DtaAdress;
   ;	
   ;	
   ;	 len_len=(int)LLL;
   ;	
	?debug	L 998
	mov	ax,word ptr [bp+14]
	mov	word ptr d@w+1448,ax
   ;	
   ;	
   ;	#ifdef DTA_370
   ;			Adress1=ADRESS1;
   ;			Adress2=ADRESS2;
   ;			DtaEnd(ADRESS1,len_len);
   ;			DtaEnd(ADRESS2,len_len);
   ;			Dta(ADRESS1);
   ;			Dta(ADRESS2);
   ;	#endif
   ;	
   ;	
   ;	#ifdef FOR386
   ;	 //goto MOVE_B;
   ;	 if (len_len>2)
   ;	
	?debug	L 1012
	cmp	word ptr [bp+14],2
	jg short	@@130
	jmp	@12@646
@@130:
   ;	
   ;		 {
   ;			if ( ( ((len_len+(unsigned int)ADRESS1)^(unsigned int)ADRESS1)&0xf800 )==0 )
   ;	
	?debug	L 1014
	add	ax,word ptr [bp+6]
	xor	ax,word ptr [bp+6]
	test	ax,00000F800h
	je short	@@131
	jmp	@12@646
@@131:
   ;	
   ;				{if ( ( ((len_len+(unsigned int)ADRESS2)^(unsigned int)ADRESS2)&0xf800 )==0 )
   ;	
	?debug	L 1015
	mov	ax,word ptr [bp+14]
	add	ax,word ptr [bp+10]
	xor	ax,word ptr [bp+10]
	test	ax,00000F800h
	je short	@@132
	jmp	@12@646
@@132:
   ;	
   ;	
   ;					 {
   ;						if ((number_block_dest=((ADRESS1<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
   ;	
	?debug	L 1018
	mov	eax,dword ptr [bp+6]
	shl	eax,8
	shr	eax,19
	mov	word ptr d@w+1450,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl short	@@133
	jmp	@12@618
@@133:
   ;	
   ;						if ((number_block_src=((ADRESS2<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
   ;	
	?debug	L 1019
	mov	eax,dword ptr [bp+10]
	shl	eax,8
	shr	eax,19
	mov	word ptr d@w+1452,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl short	@@134
	jmp	@12@618
@@134:
   ;	
   ;						if (MEMORY[number_block_dest]!=NULL &&
   ;	
	?debug	L 1020
   ;	
   ;								MEMORY[number_block_src] !=NULL)
   ;	
	?debug	L 1021
	mov	bx,word ptr d@w+1450
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	jne short	@@135
	jmp	@12@310
@@135:
	mov	bx,word ptr d@w+1452
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	jne short	@@136
	jmp	@12@310
@@136:
   ;	
   ;							{to_to=MEMORY[number_block_dest]+(((unsigned int)ADRESS1)&0x07ff);
   ;	
	?debug	L 1022
	mov	ax,word ptr [bp+6]
	and	ax,2047
	mov	bx,word ptr d@w+1450
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr d@w+1456+2,dx
	mov	word ptr d@w+1456,bx
   ;	
   ;							 from_from=MEMORY[number_block_src]+(((unsigned int)ADRESS2)&0x000007ff);
   ;	
	?debug	L 1023
	mov	ax,word ptr [bp+10]
	and	ax,2047
	mov	bx,word ptr d@w+1452
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr d@w+1460+2,dx
	mov	word ptr d@w+1460,bx
   ;	
   ;							 MEMORY_USE[MEMORY_TO_BLOCK[number_block_dest]]=10;
   ;	
	?debug	L 1024
	mov	bx,word ptr d@w+1450
	shl	bx,1
	mov	bx,word ptr MEMORY_TO_BLOCK[bx]
	shl	bx,1
	mov	word ptr MEMORY_USE[bx],10
   ;	
   ;							 if (PSW_KEY)
   ;	
	?debug	L 1025
	cmp	byte ptr _PSW_KEY,0
	jne short	@@137
	jmp	@12@394
@@137:
   ;	
   ;								 if (PSW_KEY!=MEMORY_KEY[number_block_dest])
   ;	
	?debug	L 1026
	mov	bx,word ptr d@w+1450
	mov	al,byte ptr MEMORY_KEY[bx]
	cmp	al,byte ptr _PSW_KEY
	jne short	@@138
	jmp	@12@394
@@138:
   ;	
   ;									 {printf("KEY=%d KEY MEMORY=%d MVCL PSW=%06x ADRESS=%06x",
   ;	
	?debug	L 1027
   ;	
   ;													 PSW_KEY,MEMORY_KEY[number_block_dest],
   ;													 PSW_ADRESS,ADRESS1);
   ;	
	?debug	L 1029
	push	dword ptr [bp+6]
	push	dword ptr _PSW_ADRESS
	mov	ah,0
	push	ax
	mov	al,byte ptr _PSW_KEY
	mov	ah,0
	push	ax
	push	ds
	push	offset s@+410
	call	far ptr _printf
	add	sp,16
   ;	
   ;										RQ_PRG=0x0004;RQ_TRACE=1;RETURN=1;return;
   ;	
	?debug	L 1030
	mov	word ptr _RQ_PRG,4
	mov	word ptr _RQ_TRACE,1
	mov	word ptr _RETURN,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@12@310:
   ;	
   ;									 }
   ;							 goto MOVE_M;
   ;							}
   ;	
   ;	#ifdef DTA_370
   ;						ADRESS1=Adress1;
   ;						ADRESS2=Adress2;
   ;	#endif
   ;	
   ;						cccc=GET_BYTE(ADRESS2);
   ;	
	?debug	L 1040
	push	dword ptr [bp+10]
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+1454,al
   ;	
   ;						if (RETURN) return;
   ;	
	?debug	L 1041
	cmp	word ptr _RETURN,0
	je short	@@139
	jmp	@12@786
@@139:
   ;	
   ;						PUT_BYTE(ADRESS1,cccc);
   ;	
	?debug	L 1042
	mov	al,byte ptr d@+1454
	push	ax
	push	dword ptr [bp+6]
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;						if (RETURN) return;
   ;	
	?debug	L 1043
	cmp	word ptr _RETURN,0
	je short	@@140
	jmp	@12@786
@@140:
   ;	
   ;						to_to=POINTER_T;
   ;	
	?debug	L 1044
	mov	eax,dword ptr _POINTER_T
	mov	dword ptr d@w+1456,eax
   ;	
   ;						cccc=GET_BYTE(ADRESS2);
   ;	
	?debug	L 1045
	push	dword ptr [bp+10]
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+1454,al
   ;	
   ;						from_from=POINTER_T;
   ;	
	?debug	L 1046
	mov	eax,dword ptr _POINTER_T
	mov	dword ptr d@w+1460,eax
@12@394:
   ;	
   ;	
   ;	MOVE_M:
   ;	
   ;							{
   ;							 asm push ds;
   ;	
	?debug	L 1051
 	push	 ds
   ;	
   ;							 asm mov cx,len_len;
   ;	
	?debug	L 1052
 	mov	 cx,d@w+1448
   ;	
   ;							 asm les di,to_to;
   ;	
	?debug	L 1053
 	les	 di,d@w+1456
   ;	
   ;							 asm lds si,from_from;
   ;	
	?debug	L 1054
 	lds	 si,d@w+1460
   ;	
   ;							 asm cld;
   ;	
	?debug	L 1055
 	cld	
   ;	
   ;							 asm rep movsb;
   ;	
	?debug	L 1056
 	rep movsb	
   ;	
   ;							 asm pop ds;
   ;	
	?debug	L 1057
 	pop	 ds
   ;	
   ;							 return;
   ;	
	?debug	L 1058
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@12@618:
   ;	
   ;							}
   ;	ERROR_B:
   ;	
   ;	#ifdef DTA_370
   ;						ADRESS1=Adress1;
   ;						ADRESS2=Adress2;
   ;	#endif
   ;	
   ;						PUT_BYTE(ADRESS1,GET_BYTE(ADRESS2));
   ;	
	?debug	L 1067
	push	dword ptr [bp+10]
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	push	ax
	push	dword ptr [bp+6]
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;						return;
   ;	
	?debug	L 1068
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@12@646:
   ;	
   ;	
   ;	
   ;					 }
   ;	
   ;				}
   ;		 }
   ;	#endif
   ;	MOVE_B:
   ;	
   ;	#ifdef DTA_370
   ;	 ADRESS1=Adress1;
   ;	 ADRESS2=Adress2;
   ;	#endif
   ;	
   ;	 for(i=0;i<len_len;i++) PUT_BYTE(ADRESS1++,GET_BYTE(ADRESS2++));
   ;	
	?debug	L 1083
	mov	word ptr d@w+1444,0
	mov	ax,word ptr d@w+1444
	cmp	ax,word ptr d@w+1448
	jge	short @12@786
@12@702:
	mov	eax,dword ptr [bp+10]
	inc	dword ptr [bp+10]
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	push	ax
	mov	eax,dword ptr [bp+6]
	inc	dword ptr [bp+6]
	push	eax
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
	inc	word ptr d@w+1444
	mov	ax,word ptr d@w+1444
	cmp	ax,word ptr d@w+1448
	jl	short @12@702
@12@786:
   ;	
   ;	
   ;	}
   ;	
	?debug	L 1085
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
	?debug	C E60944746141647265737304000002B80501E303+
	?debug	C 0966726F6D5F66726F6D18000002B40501E20305+
	?debug	C 746F5F746F18000002B00501E103046363636308+
	?debug	C 000002AE0501E003106E756D6265725F626C6F63+
	?debug	C 6B5F73726304000002AC0501DF03116E756D6265+
	?debug	C 725F626C6F636B5F6465737404000002AA0501DF+
	?debug	C 03076C656E5F6C656E04000002A80501DE03016B+
	?debug	C 04000002A60501DD03016904000002A40501DD03+
	?debug	C 07416472657373320C000002A00501DC03074164+
	?debug	C 72657373310C0000029C0501DC03034144520C00+
	?debug	C 0002980501DB0304444444320A000002960501D9+
	?debug	C 0304444444310A000002940501D903034C454E04+
	?debug	C 000002920501D803034444440A000002900501D3+
	?debug	C 03024444080000028F0501D20302424408000002+
	?debug	C 8E0501D103024953040000028C0501CE03024232+
	?debug	C 040000028A0501CE0302423104000002880501CE+
	?debug	C 0302523204000002860501CE0302523104000002+
	?debug	C 840501CE0302525808000002830501CD03025252+
	?debug	C 08000002820501CC0307414452455353310C0A06+
	?debug	C 000007414452455353320C0A0A0000034C4C4C04+
	?debug	C 0A0E0000
	?debug	E
	?debug	E
_MOVE	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
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
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODED5(char far *COM)     /*  CLC */
   ;	
	?debug	L 1091
	assume	cs:DS360WK1_TEXT
_CODED5	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,DS360WK1_DATA
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
   ;	#define LL RX
   ;	#define L1 R1
   ;	#define L2 R2
   ;	 static int LEN;
   ;	 static unsigned int DDD1,DDD2;
   ;	
   ;	 static unsigned long ADR, ADRESS1,ADRESS2;
   ;	 static unsigned long Adress1,Adress2;
   ;	 static int i,k;
   ;	 static unsigned int len_len;
   ;	 static int number_block_dest,number_block_src;
   ;	 static unsigned long dest;
   ;	 static unsigned long src;
   ;	 static unsigned char cccc,cccc2;
   ;	 static char far *to_to;
   ;	 static char far *from_from;
   ;	 static int FLA;
   ;	 static unsigned char BYT1,BYT2;
   ;	 static int DtaAdress;
   ;	 GET_OPERAND_SS;
   ;	
	?debug	L 1121
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+1467,al
 	ror	 ax,4
	mov	byte ptr d@w+1468,al
 	shr	 ax,12
	mov	byte ptr d@w+1470,al
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @13@310
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+1492,eax
	jmp	short @13@366
@13@310:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+1492,eax
@13@366:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	test	al,240
	je	short @13@534
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+1496,eax
	jmp	short @13@590
@13@534:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+1496,eax
@13@590:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 1122
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 len_len=(int)LL+1;
   ;	
	?debug	L 1123
	mov	al,byte ptr d@+1467
	mov	ah,0
	inc	ax
	mov	word ptr d@w+1512,ax
   ;	
   ;	
   ;	#ifdef DTA_370
   ;			Adress1=ADRESS1;
   ;			Adress2=ADRESS2;
   ;			DtaEnd(ADRESS1,len_len);
   ;			DtaEnd(ADRESS2,len_len);
   ;			Dta(ADRESS1);
   ;			Dta(ADRESS2);
   ;	#endif
   ;	
   ;	
   ;	#ifdef FOR386
   ;	 //goto MOVE_B;
   ;	 if (len_len>2)
   ;	
	?debug	L 1137
	cmp	word ptr d@w+1512,2
	ja short	@@141
	jmp	@13@1598
@@141:
   ;	
   ;		 {
   ;			if ( ( ((len_len+(unsigned int)ADRESS1)^(unsigned int)ADRESS1)&0xf800 )==0 )
   ;	
	?debug	L 1139
	add	ax,word ptr d@w+1492
	xor	ax,word ptr d@w+1492
	test	ax,00000F800h
	je short	@@142
	jmp	@13@1598
@@142:
   ;	
   ;				{if ( ( ((len_len+(unsigned int)ADRESS2)^(unsigned int)ADRESS2)&0xf800 )==0 )
   ;	
	?debug	L 1140
	mov	ax,word ptr d@w+1512
	add	ax,word ptr d@w+1496
	xor	ax,word ptr d@w+1496
	test	ax,00000F800h
	je short	@@143
	jmp	@13@1598
@@143:
   ;	
   ;	
   ;					 {
   ;						if ((number_block_dest=((ADRESS1<<8)>>19))>= MAX_BLOCK_MEMORY)
   ;	
	?debug	L 1143
	mov	eax,dword ptr d@w+1492
	shl	eax,8
	shr	eax,19
	mov	word ptr d@w+1514,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl	short @13@730
   ;	
   ;							 {HELPHELP("#1MAX BLOCK MEMORY (CLC BYTE)");
   ;	
	?debug	L 1144
	push	ds
	push	offset s@+457
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;								PR();RQ_TRACE=1;RETURN=1;
   ;	
	?debug	L 1145
	call	far ptr _PR
	mov	word ptr _RQ_TRACE,1
	mov	word ptr _RETURN,1
   ;	
   ;								RQ_PRG=5;
   ;	
	?debug	L 1146
	mov	word ptr _RQ_PRG,5
   ;	
   ;								return;
   ;	
	?debug	L 1147
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@13@730:
   ;	
   ;							 }
   ;						if ((number_block_src=((ADRESS2<<8)>>19))>= MAX_BLOCK_MEMORY)
   ;	
	?debug	L 1149
	mov	eax,dword ptr d@w+1496
	shl	eax,8
	shr	eax,19
	mov	word ptr d@w+1516,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl	short @13@786
   ;	
   ;							 {HELPHELP("#1MAX BLOCK MEMORY (CLC BYTE)");
   ;	
	?debug	L 1150
	push	ds
	push	offset s@+457
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;								PR();RQ_TRACE=1;RETURN=1;
   ;	
	?debug	L 1151
	call	far ptr _PR
	mov	word ptr _RQ_TRACE,1
	mov	word ptr _RETURN,1
   ;	
   ;								RQ_PRG=5;
   ;	
	?debug	L 1152
	mov	word ptr _RQ_PRG,5
   ;	
   ;								return;
   ;	
	?debug	L 1153
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@13@786:
   ;	
   ;							 }
   ;						if (MEMORY[number_block_dest]!=NULL &&
   ;	
	?debug	L 1155
   ;	
   ;								MEMORY[number_block_src] !=NULL)
   ;	
	?debug	L 1156
	mov	bx,word ptr d@w+1514
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	je	short @13@870
	mov	bx,word ptr d@w+1516
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	je	short @13@870
   ;	
   ;							{to_to=MEMORY[number_block_dest]+(((unsigned int)ADRESS1)&0x000007ff);
   ;	
	?debug	L 1157
	mov	ax,word ptr d@w+1492
	and	ax,2047
	mov	bx,word ptr d@w+1514
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr d@w+1528+2,dx
	mov	word ptr d@w+1528,bx
   ;	
   ;							 from_from=MEMORY[number_block_src]+(((unsigned int)ADRESS2)&0x000007ff);
   ;	
	?debug	L 1158
	mov	ax,word ptr d@w+1496
	and	ax,2047
	mov	bx,word ptr d@w+1516
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr d@w+1532+2,dx
	mov	word ptr d@w+1532,bx
   ;	
   ;							 goto CLCM;
   ;	
	?debug	L 1159
	jmp	@13@1066
@13@870:
   ;	
   ;							}
   ;	
   ;	#ifdef DTA_370
   ;						ADRESS1=Adress1;
   ;						ADRESS2=Adress2;
   ;	#endif
   ;	
   ;	
   ;	
   ;						BYT2=GET_BYTE(ADRESS2);
   ;	
	?debug	L 1169
	push	dword ptr d@w+1496
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+1539,al
   ;	
   ;						if (RETURN) return;
   ;	
	?debug	L 1170
	cmp	word ptr _RETURN,0
	je short	@@144
	jmp	@13@1794
@@144:
   ;	
   ;						BYT1=GET_BYTE(ADRESS1);
   ;	
	?debug	L 1171
	push	dword ptr d@w+1492
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+1538,al
   ;	
   ;						if (RETURN) return;
   ;	
	?debug	L 1172
	cmp	word ptr _RETURN,0
	je short	@@145
	jmp	@13@1794
@@145:
   ;	
   ;						if (BYT1!=BYT2)
   ;	
	?debug	L 1173
	mov	al,byte ptr d@+1538
	cmp	al,byte ptr d@+1539
	je	short @13@1038
   ;	
   ;							{if (BYT1<BYT2) PSW_CC=1;
   ;	
	?debug	L 1174
	cmp	al,byte ptr d@+1539
	jae	short @13@1010
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@13@1010:
   ;	
   ;							 else PSW_CC=2;
   ;	
	?debug	L 1175
	mov	byte ptr _PSW_CC,2
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@13@1038:
   ;	
   ;							 return;
   ;							}
   ;						to_to=POINTER_T;
   ;	
	?debug	L 1178
	mov	eax,dword ptr _POINTER_T
	mov	dword ptr d@w+1528,eax
   ;	
   ;						cccc=GET_BYTE(ADRESS2);
   ;	
	?debug	L 1179
	push	dword ptr d@w+1496
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+1526,al
   ;	
   ;						from_from=POINTER_T;
   ;	
	?debug	L 1180
	mov	eax,dword ptr _POINTER_T
	mov	dword ptr d@w+1532,eax
@13@1066:
   ;	
   ;	CLCM:
   ;							{
   ;							 asm push ds;
   ;	
	?debug	L 1183
 	push	 ds
   ;	
   ;							 asm mov cx,len_len;
   ;	
	?debug	L 1184
 	mov	 cx,d@w+1512
   ;	
   ;							 asm les di,to_to;
   ;	
	?debug	L 1185
 	les	 di,d@w+1528
   ;	
   ;							 asm lds si,from_from;
   ;	
	?debug	L 1186
 	lds	 si,d@w+1532
   ;	
   ;							 asm cld;
   ;	
	?debug	L 1187
 	cld	
   ;	
   ;							 asm repe cmpsb;
   ;	
	?debug	L 1188
 	repe cmpsb	
   ;	
   ;							 asm je CLCZERO;
   ;	
	?debug	L 1189
	je	short @13@1486
   ;	
   ;							 asm mov al,es:[di-1];
   ;	
	?debug	L 1190
 	mov	 al,es:[di-1]
   ;	
   ;							 asm mov cl,ds:[si-1];
   ;	
	?debug	L 1191
 	mov	 cl,ds:[si-1]
   ;	
   ;							 asm xor ch,ch;
   ;	
	?debug	L 1192
 	xor	 ch,ch
   ;	
   ;							 asm xor ah,ah;
   ;	
	?debug	L 1193
 	xor	 ah,ah
   ;	
   ;							 asm sub ax,cx;
   ;	
	?debug	L 1194
 	sub	 ax,cx
   ;	
   ;							 asm js CLC_FS_LT_SD;
   ;	
	?debug	L 1195
	js	short @13@1542
   ;	
   ;							 asm pop ds;
   ;	
	?debug	L 1196
 	pop	 ds
   ;	
   ;							 PSW_CC=2;
   ;	
	?debug	L 1197
	mov	byte ptr _PSW_CC,2
   ;	
   ;							 return;
   ;	
	?debug	L 1198
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@13@1486:
   ;	
   ;	CLCZERO:     asm pop ds;
   ;	
	?debug	L 1199
 	pop	 ds
   ;	
   ;							 PSW_CC=0;
   ;	
	?debug	L 1200
	mov	byte ptr _PSW_CC,0
   ;	
   ;							 return;
   ;	
	?debug	L 1201
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@13@1542:
   ;	
   ;	CLC_FS_LT_SD:asm pop ds;
   ;	
	?debug	L 1202
 	pop	 ds
   ;	
   ;							 PSW_CC=1;
   ;	
	?debug	L 1203
	mov	byte ptr _PSW_CC,1
   ;	
   ;							 return;
   ;	
	?debug	L 1204
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@13@1598:
   ;	
   ;	
   ;							}
   ;					 }
   ;	
   ;				}
   ;		 }
   ;	#endif
   ;	MOVE_B:
   ;	
   ;	#ifdef DTA_370
   ;		 ADRESS1=Adress1;
   ;		 ADRESS2=Adress2;
   ;	#endif
   ;	
   ;		 PSW_CC=0;
   ;	
	?debug	L 1219
	mov	byte ptr _PSW_CC,0
   ;	
   ;		 for(i=0;i<len_len;i++)              /* CLC */
   ;	
	?debug	L 1220
	mov	word ptr d@w+1508,0
	jmp	short @13@1766
@13@1626:
   ;	
   ;			 {BYT1=GET_BYTE(ADRESS1++);
   ;	
	?debug	L 1221
	mov	eax,dword ptr d@w+1492
	inc	dword ptr d@w+1492
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+1538,al
   ;	
   ;				BYT2=GET_BYTE(ADRESS2++);
   ;	
	?debug	L 1222
	mov	eax,dword ptr d@w+1496
	inc	dword ptr d@w+1496
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+1539,al
   ;	
   ;				if (BYT1==BYT2) continue;
   ;	
	?debug	L 1223
	mov	al,byte ptr d@+1538
	cmp	al,byte ptr d@+1539
	je	short @13@1738
   ;	
   ;				else
   ;					{if (BYT1<BYT2) PSW_CC=1; else PSW_CC=2;
   ;	
	?debug	L 1225
	mov	al,byte ptr d@+1538
	cmp	al,byte ptr d@+1539
	jae	short @13@1710
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@13@1710:
	mov	byte ptr _PSW_CC,2
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@13@1738:
	?debug	L 1220
	inc	word ptr d@w+1508
@13@1766:
	mov	ax,word ptr d@w+1508
	cmp	ax,word ptr d@w+1512
	jb	short @13@1626
@13@1794:
   ;	
   ;					 break;
   ;					}
   ;			 }
   ;	
   ;	}
   ;	
	?debug	L 1230
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
	?debug	C E609447461416472657373040000020406016004+
	?debug	C 0442595432080000020306015F04044259543108+
	?debug	C 0000020206015F0403464C41040000020006015E+
	?debug	C 040966726F6D5F66726F6D18000002FC05015D04+
	?debug	C 05746F5F746F18000002F805015C040563636363+
	?debug	C 3208000002F705015B04046363636308000002F6+
	?debug	C 05015B04037372630C000002F205015A04046465+
	?debug	C 73740C000002EE05015904106E756D6265725F62+
	?debug	C 6C6F636B5F73726304000002EC05015804116E75+
	?debug	C 6D6265725F626C6F636B5F6465737404000002EA+
	?debug	C 05015804076C656E5F6C656E0A000002E8050157+
	?debug	C 04016B04000002E605015604016904000002E405+
	?debug	C 01560407416472657373320C000002E005015504+
	?debug	C 07416472657373310C000002DC05015504074144+
	?debug	C 52455353320C000002D805015404074144524553+
	?debug	C 53310C000002D405015404034144520C000002D0+
	?debug	C 0501540404444444320A000002CE050152040444+
	?debug	C 4444310A000002CC05015204034C454E04000002+
	?debug	C CA05015104034444440A000002C805014C040244+
	?debug	C 4408000002C705014B0402424408000002C60501+
	?debug	C 4A0402495304000002C405014704024232040000+
	?debug	C 02C20501470402423104000002C0050147040252+
	?debug	C 3204000002BE0501470402523104000002BC0501+
	?debug	C 470402525808000002BB05014604025252080000+
	?debug	C 02BA0501450403434F4D180A060000
	?debug	E
	?debug	E
_CODED5	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
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
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODED7(char far *COM)     /*   */
   ;	
	?debug	L 1236
	assume	cs:DS360WK1_TEXT
_CODED7	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,DS360WK1_DATA
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
   ;	#define LL RX
   ;	#define L1 R1
   ;	#define L2 R2
   ;	 static int LEN;
   ;	 static unsigned int DDD1,DDD2;
   ;	
   ;	 static unsigned long ADR, ADRESS1,ADRESS2;
   ;	 static unsigned long Adress1,Adress2;
   ;	 static int i,k;
   ;	 static unsigned int len_len;
   ;	 static int number_block_dest,number_block_src;
   ;	 static unsigned long dest;
   ;	 static unsigned long src;
   ;	 static unsigned char cccc,cccc2;
   ;	 static char far *to_to;
   ;	 static char far *from_from;
   ;	 static int FLA;
   ;	 static unsigned char BYT1,BYT2;
   ;	 static int DtaAdress;
   ;	 GET_OPERAND_SS;
   ;	
	?debug	L 1266
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+1543,al
 	ror	 ax,4
	mov	byte ptr d@w+1544,al
 	shr	 ax,12
	mov	byte ptr d@w+1546,al
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @14@310
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+1568,eax
	jmp	short @14@366
@14@310:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+1568,eax
@14@366:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	test	al,240
	je	short @14@534
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+1572,eax
	jmp	short @14@590
@14@534:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+1572,eax
@14@590:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 1267
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 len_len=(int)LL+1;
   ;	
	?debug	L 1268
	mov	al,byte ptr d@+1543
	mov	ah,0
	inc	ax
	mov	word ptr d@w+1588,ax
   ;	
   ;	
   ;	#ifdef DTA_370
   ;	 Adress1=ADRESS1;
   ;	 Adress2=ADRESS2;
   ;	 DtaEnd(ADRESS1,len_len);
   ;	 DtaEnd(ADRESS2,len_len);
   ;	 Dta(ADRESS1);
   ;	 Dta(ADRESS2);
   ;	#endif
   ;	
   ;	
   ;	 //goto MOVE_B;
   ;	#ifdef FOR386
   ;	 if (len_len>2)
   ;	
	?debug	L 1282
	cmp	word ptr d@w+1588,2
	ja short	@@146
	jmp	@14@2438
@@146:
   ;	
   ;		 {
   ;			if ( ( ((len_len+(unsigned int)ADRESS1)^(unsigned int)ADRESS1)&0xf800 )==0 )
   ;	
	?debug	L 1284
	add	ax,word ptr d@w+1568
	xor	ax,word ptr d@w+1568
	test	ax,00000F800h
	je short	@@147
	jmp	@14@2438
@@147:
   ;	
   ;				{if ( ( ((len_len+(unsigned int)ADRESS2)^(unsigned int)ADRESS2)&0xf800 )==0 )
   ;	
	?debug	L 1285
	mov	ax,word ptr d@w+1588
	add	ax,word ptr d@w+1572
	xor	ax,word ptr d@w+1572
	test	ax,00000F800h
	je short	@@148
	jmp	@14@2438
@@148:
   ;	
   ;	
   ;					 {
   ;						if ((number_block_dest=((ADRESS1<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
   ;	
	?debug	L 1288
	mov	eax,dword ptr d@w+1568
	shl	eax,8
	shr	eax,19
	mov	word ptr d@w+1590,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl short	@@149
	jmp	@14@2410
@@149:
   ;	
   ;						if ((number_block_src=((ADRESS2<<8)>>19))>= MAX_BLOCK_MEMORY) goto ERROR_B;
   ;	
	?debug	L 1289
	mov	eax,dword ptr d@w+1572
	shl	eax,8
	shr	eax,19
	mov	word ptr d@w+1592,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jl short	@@150
	jmp	@14@2410
@@150:
   ;	
   ;						if (MEMORY[number_block_dest]!=NULL &&
   ;	
	?debug	L 1290
   ;	
   ;								MEMORY[number_block_src] !=NULL)
   ;	
	?debug	L 1291
	mov	bx,word ptr d@w+1590
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	jne short	@@151
	jmp	@14@870
@@151:
	mov	bx,word ptr d@w+1592
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	jne short	@@152
	jmp	@14@870
@@152:
   ;	
   ;							{to_to=MEMORY[number_block_dest]+(((unsigned int)ADRESS1)&0x07ff);
   ;	
	?debug	L 1292
	mov	ax,word ptr d@w+1568
	and	ax,2047
	mov	bx,word ptr d@w+1590
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr d@w+1604+2,dx
	mov	word ptr d@w+1604,bx
   ;	
   ;							 from_from=MEMORY[number_block_src]+(((unsigned int)ADRESS2)&0x000007ff);
   ;	
	?debug	L 1293
	mov	ax,word ptr d@w+1572
	and	ax,2047
	mov	bx,word ptr d@w+1592
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr d@w+1608+2,dx
	mov	word ptr d@w+1608,bx
   ;	
   ;							 MEMORY_USE[MEMORY_TO_BLOCK[number_block_dest]]=10;
   ;	
	?debug	L 1294
	mov	bx,word ptr d@w+1590
	shl	bx,1
	mov	bx,word ptr MEMORY_TO_BLOCK[bx]
	shl	bx,1
	mov	word ptr MEMORY_USE[bx],10
   ;	
   ;							 if (PSW_KEY)
   ;	
	?debug	L 1295
	cmp	byte ptr _PSW_KEY,0
	jne short	@@153
	jmp	@14@954
@@153:
   ;	
   ;								 if (PSW_KEY!=MEMORY_KEY[number_block_dest])
   ;	
	?debug	L 1296
	mov	bx,word ptr d@w+1590
	mov	al,byte ptr MEMORY_KEY[bx]
	cmp	al,byte ptr _PSW_KEY
	jne short	@@154
	jmp	@14@954
@@154:
   ;	
   ;									 {printf("KEY XC OC NC PSW=%06x ADRESS=%06x",PSW_ADRESS,ADRESS1);
   ;	
	?debug	L 1297
	push	dword ptr d@w+1568
	push	dword ptr _PSW_ADRESS
	push	ds
	push	offset s@+487
	call	far ptr _printf
	add	sp,12
   ;	
   ;										RQ_PRG=0x0004;RQ_TRACE=1;RETURN=1;return;
   ;	
	?debug	L 1298
	mov	word ptr _RQ_PRG,4
	mov	word ptr _RQ_TRACE,1
	mov	word ptr _RETURN,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@14@870:
   ;	
   ;									 }
   ;							 goto MOVE_M;
   ;							}
   ;	#ifdef DTA_370
   ;						ADRESS1=Adress1;
   ;						ADRESS2=Adress2;
   ;	#endif
   ;	
   ;						GET_BYTE(ADRESS2);
   ;	
	?debug	L 1307
	push	dword ptr d@w+1572
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
   ;	
   ;						if (RETURN) return;
   ;	
	?debug	L 1308
	cmp	word ptr _RETURN,0
	je short	@@155
	jmp	@14@3110
@@155:
   ;	
   ;						PUT_BYTE(ADRESS1,GET_BYTE(ADRESS1));
   ;	
	?debug	L 1309
	push	dword ptr d@w+1568
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	push	ax
	push	dword ptr d@w+1568
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;						if (RETURN) return;
   ;	
	?debug	L 1310
	cmp	word ptr _RETURN,0
	je short	@@156
	jmp	@14@3110
@@156:
   ;	
   ;						to_to=POINTER_T;
   ;	
	?debug	L 1311
	mov	eax,dword ptr _POINTER_T
	mov	dword ptr d@w+1604,eax
   ;	
   ;						GET_BYTE(ADRESS2);
   ;	
	?debug	L 1312
	push	dword ptr d@w+1572
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
   ;	
   ;						from_from=POINTER_T;
   ;	
	?debug	L 1313
	mov	eax,dword ptr _POINTER_T
	mov	dword ptr d@w+1608,eax
@14@954:
   ;	
   ;	MOVE_M:
   ;	 switch(COM[0])
   ;	
	?debug	L 1315
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,212
	jne short	@@157
	jmp	@14@1962
@@157:
	cmp	ax,214
	je	short @14@1514
	cmp	ax,215
	je short	@@158
	jmp	@14@2410
@@158:
   ;	
   ;		 {case 0xd7:
   ;							{
   ;							 asm push ds;
   ;	
	?debug	L 1318
 	push	 ds
   ;	
   ;							 asm mov cx,len_len;
   ;	
	?debug	L 1319
 	mov	 cx,d@w+1588
   ;	
   ;							 asm les di,to_to;
   ;	
	?debug	L 1320
 	les	 di,d@w+1604
   ;	
   ;							 asm lds si,from_from;
   ;	
	?debug	L 1321
 	lds	 si,d@w+1608
   ;	
   ;							 asm cld;
   ;	
	?debug	L 1322
 	cld	
   ;	
   ;							 asm xor ah,ah;
   ;	
	?debug	L 1323
 	xor	 ah,ah
@14@1234:
   ;	
   ;	XOR:
   ;							 asm lodsb;
   ;	
	?debug	L 1325
 	lodsb	
   ;	
   ;							 asm xor al,es:[di];
   ;	
	?debug	L 1326
 	xor	 al,es:[di]
   ;	
   ;							 asm or ah,al;
   ;	
	?debug	L 1327
 	or	 ah,al
   ;	
   ;							 asm stosb;
   ;	
	?debug	L 1328
 	stosb	
   ;	
   ;							 asm loop XOR;
   ;	
	?debug	L 1329
	loop	short @14@1234
   ;	
   ;							 asm pop ds;
   ;	
	?debug	L 1330
 	pop	 ds
   ;	
   ;							 asm shr ax,8;
   ;	
	?debug	L 1331
 	shr	 ax,8
   ;	
   ;							 if (_AX)  /*!=0*/   PSW_CC=1;
   ;	
	?debug	L 1332
	or	ax,ax
	je	short @14@1486
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@14@1486:
   ;	
   ;							 else                PSW_CC=0;
   ;	
	?debug	L 1333
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@14@1514:
   ;	
   ;							 return;
   ;							}
   ;							break;
   ;			case 0xd6:
   ;							{
   ;							 asm push ds;
   ;	
	?debug	L 1339
 	push	 ds
   ;	
   ;							 asm mov cx,len_len;
   ;	
	?debug	L 1340
 	mov	 cx,d@w+1588
   ;	
   ;							 asm les di,to_to;
   ;	
	?debug	L 1341
 	les	 di,d@w+1604
   ;	
   ;							 asm lds si,from_from;
   ;	
	?debug	L 1342
 	lds	 si,d@w+1608
   ;	
   ;							 asm cld;
   ;	
	?debug	L 1343
 	cld	
   ;	
   ;							 asm xor ah,ah;
   ;	
	?debug	L 1344
 	xor	 ah,ah
@14@1682:
   ;	
   ;	OR:
   ;							 asm lodsb;
   ;	
	?debug	L 1346
 	lodsb	
   ;	
   ;							 asm or al,es:[di];
   ;	
	?debug	L 1347
 	or	 al,es:[di]
   ;	
   ;							 asm or ah,al;
   ;	
	?debug	L 1348
 	or	 ah,al
   ;	
   ;							 asm stosb;
   ;	
	?debug	L 1349
 	stosb	
   ;	
   ;							 asm loop OR;
   ;	
	?debug	L 1350
	loop	short @14@1682
   ;	
   ;							 asm pop ds;
   ;	
	?debug	L 1351
 	pop	 ds
   ;	
   ;							 asm shr ax,8;
   ;	
	?debug	L 1352
 	shr	 ax,8
   ;	
   ;							 if (_AX)  /*!=0*/   PSW_CC=1;
   ;	
	?debug	L 1353
	or	ax,ax
	je	short @14@1934
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@14@1934:
   ;	
   ;							 else                PSW_CC=0;
   ;	
	?debug	L 1354
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@14@1962:
   ;	
   ;							 return;
   ;							}
   ;							break;
   ;			case 0xd4:
   ;							{
   ;							 asm push ds;
   ;	
	?debug	L 1360
 	push	 ds
   ;	
   ;							 asm mov cx,len_len;
   ;	
	?debug	L 1361
 	mov	 cx,d@w+1588
   ;	
   ;							 asm les di,to_to;
   ;	
	?debug	L 1362
 	les	 di,d@w+1604
   ;	
   ;							 asm lds si,from_from;
   ;	
	?debug	L 1363
 	lds	 si,d@w+1608
   ;	
   ;							 asm cld;
   ;	
	?debug	L 1364
 	cld	
   ;	
   ;							 asm xor ah,ah;
   ;	
	?debug	L 1365
 	xor	 ah,ah
@14@2130:
   ;	
   ;	AND:
   ;							 asm lodsb;
   ;	
	?debug	L 1367
 	lodsb	
   ;	
   ;							 asm and al,es:[di];
   ;	
	?debug	L 1368
 	and	 al,es:[di]
   ;	
   ;							 asm or ah,al;
   ;	
	?debug	L 1369
 	or	 ah,al
   ;	
   ;							 asm stosb;
   ;	
	?debug	L 1370
 	stosb	
   ;	
   ;							 asm loop AND;
   ;	
	?debug	L 1371
	loop	short @14@2130
   ;	
   ;							 asm pop ds;
   ;	
	?debug	L 1372
 	pop	 ds
   ;	
   ;							 asm shr ax,8;
   ;	
	?debug	L 1373
 	shr	 ax,8
   ;	
   ;							 if (_AX)  /*!=0*/   PSW_CC=1;
   ;	
	?debug	L 1374
	or	ax,ax
	je	short @14@2382
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@14@2382:
   ;	
   ;							 else                PSW_CC=0;
   ;	
	?debug	L 1375
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@14@2410:
   ;	
   ;							 return;
   ;							}
   ;							break;
   ;						}
   ;	ERROR_B:
   ;	
   ;	#ifdef DTA_370
   ;						ADRESS1=Adress1;
   ;						ADRESS2=Adress2;
   ;	#endif
   ;	
   ;	
   ;						PUT_BYTE(ADRESS1,GET_BYTE(ADRESS1));
   ;	
	?debug	L 1388
	push	dword ptr d@w+1568
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	push	ax
	push	dword ptr d@w+1568
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;						return;
   ;	
	?debug	L 1389
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@14@2438:
   ;	
   ;	
   ;					 }
   ;	
   ;				}
   ;		 }
   ;	#endif
   ;	MOVE_B:
   ;	
   ;	#ifdef DTA_370
   ;						ADRESS1=Adress1;
   ;						ADRESS2=Adress2;
   ;	#endif
   ;	
   ;	
   ;	switch(COM[0])
   ;	
	?debug	L 1404
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,212
	jne short	@@159
	jmp	@14@2746
@@159:
	cmp	ax,214
	jne short	@@160
	jmp	@14@2942
@@160:
	cmp	ax,215
	je short	@@161
	jmp	@14@3110
@@161:
   ;	
   ;	 {case 0xd7:PSW_CC=0;
   ;	
	?debug	L 1405
	mov	byte ptr _PSW_CC,0
   ;	
   ;						for(i=0;i<len_len;i++)              /* XC */
   ;	
	?debug	L 1406
	mov	word ptr d@w+1584,0
	mov	ax,word ptr d@w+1584
	cmp	ax,word ptr d@w+1588
	jb short	@@162
	jmp	@14@3110
@@162:
@14@2606:
   ;	
   ;							{BYT1=GET_BYTE(ADRESS1)^GET_BYTE(ADRESS2++);
   ;	
	?debug	L 1407
	push	dword ptr d@w+1568
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	push	ax
	mov	eax,dword ptr d@w+1572
	inc	dword ptr d@w+1572
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	pop	dx
	xor	dl,al
	mov	byte ptr d@+1614,dl
   ;	
   ;							 PUT_BYTE(ADRESS1++,BYT1);
   ;	
	?debug	L 1408
	mov	al,byte ptr d@+1614
	push	ax
	mov	eax,dword ptr d@w+1568
	inc	dword ptr d@w+1568
	push	eax
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;							 if (BYT1) PSW_CC=1;
   ;	
	?debug	L 1409
	cmp	byte ptr d@+1614,0
	je	short @14@2662
	mov	byte ptr _PSW_CC,1
@14@2662:
	?debug	L 1406
	inc	word ptr d@w+1584
	mov	ax,word ptr d@w+1584
	cmp	ax,word ptr d@w+1588
	jb	short @14@2606
   ;	
   ;							}
   ;	
   ;						break;
   ;	
	?debug	L 1412
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@14@2746:
   ;	
   ;		case 0xd4:PSW_CC=0;
   ;	
	?debug	L 1413
	mov	byte ptr _PSW_CC,0
   ;	
   ;						for(i=0;i<len_len;i++)              /* NC */
   ;	
	?debug	L 1414
	mov	word ptr d@w+1584,0
	mov	ax,word ptr d@w+1584
	cmp	ax,word ptr d@w+1588
	jb short	@@163
	jmp	@14@3110
@@163:
@14@2802:
   ;	
   ;							{BYT1=GET_BYTE(ADRESS1)&GET_BYTE(ADRESS2++);
   ;	
	?debug	L 1415
	push	dword ptr d@w+1568
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	push	ax
	mov	eax,dword ptr d@w+1572
	inc	dword ptr d@w+1572
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	pop	dx
	and	dl,al
	mov	byte ptr d@+1614,dl
   ;	
   ;							 PUT_BYTE(ADRESS1++,BYT1);
   ;	
	?debug	L 1416
	mov	al,byte ptr d@+1614
	push	ax
	mov	eax,dword ptr d@w+1568
	inc	dword ptr d@w+1568
	push	eax
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;							 if (BYT1) PSW_CC=1;
   ;	
	?debug	L 1417
	cmp	byte ptr d@+1614,0
	je	short @14@2858
	mov	byte ptr _PSW_CC,1
@14@2858:
	?debug	L 1414
	inc	word ptr d@w+1584
	mov	ax,word ptr d@w+1584
	cmp	ax,word ptr d@w+1588
	jb	short @14@2802
   ;	
   ;							}
   ;						break;
   ;	
	?debug	L 1419
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
@14@2942:
   ;	
   ;		case 0xd6:PSW_CC=0;
   ;	
	?debug	L 1420
	mov	byte ptr _PSW_CC,0
   ;	
   ;						for(i=0;i<len_len;i++)              /* OC */
   ;	
	?debug	L 1421
	mov	word ptr d@w+1584,0
	mov	ax,word ptr d@w+1584
	cmp	ax,word ptr d@w+1588
	jae	short @14@3110
@14@2998:
   ;	
   ;							{BYT1=GET_BYTE(ADRESS1)|GET_BYTE(ADRESS2++);
   ;	
	?debug	L 1422
	push	dword ptr d@w+1568
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	push	ax
	mov	eax,dword ptr d@w+1572
	inc	dword ptr d@w+1572
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	pop	dx
	or	dl,al
	mov	byte ptr d@+1614,dl
   ;	
   ;							 PUT_BYTE(ADRESS1++,BYT1);
   ;	
	?debug	L 1423
	mov	al,byte ptr d@+1614
	push	ax
	mov	eax,dword ptr d@w+1568
	inc	dword ptr d@w+1568
	push	eax
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;							 if (BYT1) PSW_CC=1;
   ;	
	?debug	L 1424
	cmp	byte ptr d@+1614,0
	je	short @14@3054
	mov	byte ptr _PSW_CC,1
@14@3054:
	?debug	L 1421
	inc	word ptr d@w+1584
	mov	ax,word ptr d@w+1584
	cmp	ax,word ptr d@w+1588
	jb	short @14@2998
@14@3110:
   ;	
   ;							}
   ;						break;
   ;	
	?debug	L 1426
   ;	
   ;	
   ;	 }
   ;	}
   ;	
	?debug	L 1429
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
	?debug	C E60944746141647265737304000002500601F104+
	?debug	C 0442595432080000024F0601F004044259543108+
	?debug	C 0000024E0601F00403464C41040000024C0601EF+
	?debug	C 040966726F6D5F66726F6D18000002480601EE04+
	?debug	C 05746F5F746F18000002440601ED040563636363+
	?debug	C 3208000002430601EC0404636363630800000242+
	?debug	C 0601EC04037372630C0000023E0601EB04046465+
	?debug	C 73740C0000023A0601EA04106E756D6265725F62+
	?debug	C 6C6F636B5F73726304000002380601E904116E75+
	?debug	C 6D6265725F626C6F636B5F646573740400000236+
	?debug	C 0601E904076C656E5F6C656E0A000002340601E8+
	?debug	C 04016B04000002320601E7040169040000023006+
	?debug	C 01E70407416472657373320C0000022C0601E604+
	?debug	C 07416472657373310C000002280601E604074144+
	?debug	C 52455353320C000002240601E504074144524553+
	?debug	C 53310C000002200601E504034144520C0000021C+
	?debug	C 0601E50404444444320A0000021A0601E3040444+
	?debug	C 4444310A000002180601E304034C454E04000002+
	?debug	C 160601E204034444440A000002140601DD040244+
	?debug	C 4408000002130601DC0402424408000002120601+
	?debug	C DB0402495304000002100601D804024232040000+
	?debug	C 020E0601D804024231040000020C0601D8040252+
	?debug	C 32040000020A0601D80402523104000002080601+
	?debug	C D80402525808000002070601D704025252080000+
	?debug	C 02060601D60403434F4D180A060000
	?debug	E
	?debug	E
_CODED7	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	unsigned long GET_WORD(unsigned long ADRESS)
   ;	
	?debug	L 1447
	assume	cs:DS360WK1_TEXT
_GET_WORD	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6064144524553530C0A060000
	?debug	B
   ;	
   ;	{
   ;	 static char BYTE0,BYTE1,BYTE2,BYTE3;
   ;	 static unsigned int HW1,HW2;
   ;	 static unsigned long OPERAND;
   ;	 static char far *POINTER_OPERAND;
   ;	#ifdef OPT003
   ;	 register int Number_block;
   ;	#else
   ;	 static int Number_block;
   ;	#endif
   ;	#ifdef DTA_370
   ;	 unsigned long Adress;
   ;	#endif
   ;	 static int DtaAdress;
   ;	
   ;	#ifdef FOR386
   ;	
   ;	#ifdef DTA_370
   ;	 Adress=ADRESS;
   ;	 Dta(ADRESS);
   ;	#endif
   ;	
   ;	 if ((Number_block=((ADRESS<<8)>>19))>= MAX_BLOCK_MEMORY) goto GET_B;
   ;	
	?debug	L 1470
	mov	eax,dword ptr [bp+6]
	shl	eax,8
	shr	eax,19
	mov	si,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jge	short @15@114
   ;	
   ;	 if (MEMORY[Number_block]!=NULL)
   ;	
	?debug	L 1471
	mov	bx,si
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	je	short @15@114
   ;	
   ;		 {
   ;			OPERAND=*( (unsigned long*)(MEMORY[Number_block]+(((unsigned int)ADRESS)&0x07fc)) );
   ;	
	?debug	L 1473
	mov	ax,word ptr [bp+6]
	and	ax,2044
	mov	bx,si
	shl	bx,2
	les	bx,dword ptr MEMORY[bx]
	add	bx,ax
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+1626,eax
   ;	
   ;			goto END_GET_B;
   ;	
	?debug	L 1474
	jmp	short @15@142
@15@114:
   ;	
   ;		 }
   ;	GET_B:
   ;	
   ;	#ifdef DTA_370
   ;	 ADRESS=Adress;
   ;	#endif
   ;	
   ;	 GET_BYTE(ADRESS);
   ;	
	?debug	L 1482
	push	dword ptr [bp+6]
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
   ;	
   ;	 Dtaret;
   ;	 OPERAND=*((unsigned long*)POINTER_T);
   ;	
	?debug	L 1484
	les	bx,dword ptr _POINTER_T
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+1626,eax
@15@142:
   ;	
   ;	END_GET_B:
   ;	 #ifdef FOR486
   ;		asm {
   ;				 db 0x66    //
   ;				 db 0x0f    //    BSWAP
   ;				 db 0xc8    //
   ;				 db 0x66
   ;				 mov [OFFSET OPERAND],ax
   ;				}
   ;	 #else
   ;		asm {
   ;				xchg ah,al
   ;	
	?debug	L 1496
	xchg	 ah,al
   ;	
   ;				mov [OFFSET OPERAND+2],ax
   ;	
	?debug	L 1497
	mov	 [OFFSET d@w+1626+2],ax
   ;	
   ;				db 0x66
   ;	
	?debug	L 1498
	db	 066H
   ;	
   ;				shr ax,16
   ;	
	?debug	L 1499
	shr	 ax,16
   ;	
   ;				xchg ah,al
   ;	
	?debug	L 1500
	xchg	 ah,al
   ;	
   ;				mov [OFFSET OPERAND],ax
   ;	
	?debug	L 1501
	mov	 [OFFSET d@w+1626],ax
   ;	
   ;			 }
   ;	 #endif
   ;	#else
   ;	 OPERAND=GET_BYTE(ADRESS);
   ;	 POINTER_OPERAND=POINTER_T+1;
   ;	 OPERAND<<=8;
   ;	 OPERAND+=*POINTER_OPERAND++;
   ;	 OPERAND<<=8;
   ;	 OPERAND+=*POINTER_OPERAND++;
   ;	 OPERAND<<=8;
   ;	 OPERAND+=*POINTER_OPERAND;
   ;	#endif
   ;	 return(OPERAND);
   ;	
	?debug	L 1514
	mov	eax,dword ptr d@w+1626
	shld	edx,eax,16
   ;	
   ;	}
   ;	
	?debug	L 1515
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E60944746141647265737304000002620601B505+
	?debug	C 0C4E756D6265725F626C6F636B04080118004000+
	?debug	C 0406000F504F494E5445525F4F504552414E4418+
	?debug	C 0000025E0601AC05074F504552414E440C000002+
	?debug	C 5A0601AB05034857320A000002580601AA050348+
	?debug	C 57310A000002560601AA05054259544533080000+
	?debug	C 02550601A90505425954453208000002540601A9+
	?debug	C 0505425954453108000002530601A90505425954+
	?debug	C 453008000002520601A905064144524553530C0A+
	?debug	C 060000
	?debug	E
	?debug	E
_GET_WORD	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void PUT_WORD(unsigned long ADRESS,unsigned long OP)
   ;	
	?debug	L 1532
	assume	cs:DS360WK1_TEXT
_PUT_WORD	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6024F500C0A0A0000064144524553530C0A0600+
	?debug	C 00
	?debug	B
   ;	
   ;	{
   ;	
   ;	 static unsigned long OPERAND;
   ;	 static char far *POINTER_OPERAND;
   ;	#ifdef OPT003
   ;	 register int Number_block;
   ;	#else
   ;	 static int Number_block;
   ;	#endif
   ;	 static unsigned long Adress;
   ;	 static int DtaAdress;
   ;	
   ;	#ifdef DTA_370
   ;	 Adress=ADRESS;
   ;	 Dta(ADRESS);
   ;	#endif
   ;	
   ;	
   ;	
   ;	 OPERAND=OP;
   ;	
	?debug	L 1552
	mov	eax,dword ptr [bp+10]
	mov	dword ptr d@w+1636,eax
   ;	
   ;	#ifdef FOR386
   ;	
   ;	
   ;	 #ifdef FOR486
   ;		asm {
   ;				 db 0x66    //
   ;				 db 0x0f    //    BSWAP
   ;				 db 0xc8    //
   ;				 db 0x66
   ;				 mov [OFFSET OPERAND],ax
   ;				}
   ;	 #else
   ;	 asm {
   ;				xchg ah,al
   ;	
	?debug	L 1566
	xchg	 ah,al
   ;	
   ;				mov [OFFSET OPERAND+2],ax
   ;	
	?debug	L 1567
	mov	 [OFFSET d@w+1636+2],ax
   ;	
   ;				db 0x66
   ;	
	?debug	L 1568
	db	 066H
   ;	
   ;				shr ax,16
   ;	
	?debug	L 1569
	shr	 ax,16
   ;	
   ;				xchg ah,al
   ;	
	?debug	L 1570
	xchg	 ah,al
   ;	
   ;				mov [OFFSET OPERAND],ax
   ;	
	?debug	L 1571
	mov	 [OFFSET d@w+1636],ax
   ;	
   ;			 }
   ;	 #endif
   ;	 if ((Number_block= ((ADRESS<<8)>>19) )>= MAX_BLOCK_MEMORY) goto PUT_B;
   ;	
	?debug	L 1574
	mov	eax,dword ptr [bp+6]
	shl	eax,8
	shr	eax,19
	mov	si,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jge	short @16@394
   ;	
   ;	 if (MEMORY[Number_block]!=NULL)
   ;	
	?debug	L 1575
	mov	bx,si
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	je	short @16@394
   ;	
   ;		 {if (PSW_KEY)
   ;	
	?debug	L 1576
	cmp	byte ptr _PSW_KEY,0
	je	short @16@366
   ;	
   ;			if (PSW_KEY!=MEMORY_KEY[Number_block])
   ;	
	?debug	L 1577
	mov	al,byte ptr MEMORY_KEY[si]
	cmp	al,byte ptr _PSW_KEY
	je	short @16@366
   ;	
   ;						 {printf("KEY PUT_WORD PSW=%06x ADRESS=%06x",PSW_ADRESS,ADRESS);RQ_PRG=0x0004;/*RQ_TRACE=1;*/RETURN=1;return;
   ;	
	?debug	L 1578
	push	dword ptr [bp+6]
	push	dword ptr _PSW_ADRESS
	push	ds
	push	offset s@+521
	call	far ptr _printf
	add	sp,12
	mov	word ptr _RQ_PRG,4
	mov	word ptr _RETURN,1
	pop	ds
	pop	si
	pop	bp
	ret	
@16@366:
   ;	
   ;						 }
   ;			*( (unsigned long*)(MEMORY[Number_block]+(((unsigned int)ADRESS)&0x07fc)) )=OPERAND;
   ;	
	?debug	L 1580
	mov	ax,word ptr [bp+6]
	and	ax,2044
	mov	bx,si
	shl	bx,2
	les	bx,dword ptr MEMORY[bx]
	add	bx,ax
	mov	eax,dword ptr d@w+1636
	mov	dword ptr es:[bx],eax
   ;	
   ;			MEMORY_USE[MEMORY_TO_BLOCK[Number_block]]=10;
   ;	
	?debug	L 1581
	mov	bx,si
	shl	bx,1
	mov	bx,word ptr MEMORY_TO_BLOCK[bx]
	shl	bx,1
	mov	word ptr MEMORY_USE[bx],10
   ;	
   ;			goto END_PUT_B;
   ;	
	?debug	L 1582
	pop	ds
	pop	si
	pop	bp
	ret	
@16@394:
   ;	
   ;		 }
   ;	PUT_B:
   ;	#ifdef DTA_370
   ;	 ADRESS=Adress;
   ;	#endif
   ;	
   ;	 GET_BYTE(ADRESS);
   ;	
	?debug	L 1589
	push	dword ptr [bp+6]
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
   ;	
   ;	 if (RETURN) return;
   ;	
	?debug	L 1590
	cmp	word ptr _RETURN,0
	jne	short @16@534
   ;	
   ;	 if (PSW_KEY)
   ;	
	?debug	L 1591
	cmp	byte ptr _PSW_KEY,0
	je	short @16@506
   ;	
   ;			if (PSW_KEY!=MEMORY_KEY[Number_block])
   ;	
	?debug	L 1592
	mov	al,byte ptr MEMORY_KEY[si]
	cmp	al,byte ptr _PSW_KEY
	je	short @16@506
   ;	
   ;				 {printf("KEY PUT_WORD PSW=%06x ADRESS=%06x",PSW_ADRESS,ADRESS);RQ_PRG=0x0004;/*RQ_TRACE=1;*/RETURN=1;return;
   ;	
	?debug	L 1593
	push	dword ptr [bp+6]
	push	dword ptr _PSW_ADRESS
	push	ds
	push	offset s@+521
	call	far ptr _printf
	add	sp,12
	mov	word ptr _RQ_PRG,4
	mov	word ptr _RETURN,1
	pop	ds
	pop	si
	pop	bp
	ret	
@16@506:
   ;	
   ;				 }
   ;	 MEMORY_USE[MEMORY_TO_BLOCK[Number_block]]=10;
   ;	
	?debug	L 1595
	mov	bx,si
	shl	bx,1
	mov	bx,word ptr MEMORY_TO_BLOCK[bx]
	shl	bx,1
	mov	word ptr MEMORY_USE[bx],10
   ;	
   ;	 *((unsigned long*)POINTER_T)=OPERAND;
   ;	
	?debug	L 1596
	les	bx,dword ptr _POINTER_T
	mov	eax,dword ptr d@w+1636
	mov	dword ptr es:[bx],eax
@16@534:
   ;	
   ;	END_PUT_B:
   ;	#else
   ;	 GET_BYTE(ADRESS);
   ;	 if (RETURN) return;
   ;	
   ;	 POINTER_OPERAND=(POINTER_T+3);
   ;	 *POINTER_OPERAND--=OPERAND&0x000000ff;
   ;	 OPERAND>>=8;
   ;	 *POINTER_OPERAND--=OPERAND&0x000000ff;
   ;	 OPERAND>>=8;
   ;	 *POINTER_OPERAND--=OPERAND&0x000000ff;
   ;	 OPERAND>>=8;
   ;	 *POINTER_OPERAND=OPERAND&0x000000ff;
   ;	 if (++MEMORY_USE[MEMORY_TO_BLOCK[NUMBER_BLOCK]]>6000)
   ;									 MEMORY_USE[MEMORY_TO_BLOCK[NUMBER_BLOCK]]=10;
   ;	#endif
   ;	}
   ;	
	?debug	L 1613
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E609447461416472657373040000027006010706+
	?debug	C 064164726573730C0000026C060106060C4E756D+
	?debug	C 6265725F626C6F636B04080145002C010406000F+
	?debug	C 504F494E5445525F4F504552414E441800000268+
	?debug	C 06010006074F504552414E440C000002640601FF+
	?debug	C 05064144524553530C0A060000024F500C0A0A00+
	?debug	C 00
	?debug	E
	?debug	E
_PUT_WORD	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	4 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void LOAD_PSW(unsigned long ADRESS)
   ;	
	?debug	L 1625
	assume	cs:DS360WK1_TEXT
_LOAD_PSW	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6064144524553530C0A060000
	?debug	B
   ;	
   ;	{
   ;	 static unsigned long WORD1,WORD2;
   ;	 WORD1=GET_WORD(ADRESS);
   ;	
	?debug	L 1628
	push	dword ptr [bp+6]
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+1650,eax
   ;	
   ;	 Dtaret;
   ;	 WORD2=GET_WORD(ADRESS+4);
   ;	
	?debug	L 1630
	mov	eax,dword ptr [bp+6]
	add	eax,large 4
	push	eax
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+1654,eax
   ;	
   ;	 Dtaret;
   ;	#ifdef DTA_370
   ;		PSW_AMWP=(unsigned char)     ((WORD1&0x000f0000)>>16);
   ;		if (PSW_AMWP&0x8)  /* EC PSW */
   ;			{
   ;			 PSW_EC_MASK=(unsigned char)  ((WORD1&0xff000000)>>24);
   ;			 PSW_KEY= (unsigned char)     ((WORD1&0x00f00000)>>20);
   ;			 PSW_AMWP=(unsigned char)     ((WORD1&0x000f0000)>>16);
   ;			 PSW_CC = (unsigned char)     ((WORD1&0x00003000)>>12);
   ;			 PSW_PRG_MASK=(unsigned char) ((WORD1&0x00000f00)>> 8);
   ;	
   ;			 PSW_ADRESS=                  ((WORD2&0x00ffffff));
   ;			 if (PSW_EC_MASK&0x04)
   ;				 {DINTRADR=1;
   ;				 }
   ;			}
   ;		else
   ;			{
   ;	#endif
   ;			 PSW_MASK=(unsigned char)     ((WORD1&0xff000000)>>24);
   ;	
	?debug	L 1650
	mov	eax,dword ptr d@w+1650
	and	eax,large 0FF000000h
	shr	eax,24
	mov	byte ptr _PSW_MASK,al
   ;	
   ;			 PSW_KEY= (unsigned char)     ((WORD1&0x00f00000)>>20);
   ;	
	?debug	L 1651
	mov	eax,dword ptr d@w+1650
	and	eax,large 000F00000h
	shr	eax,20
	mov	byte ptr _PSW_KEY,al
   ;	
   ;			 PSW_AMWP=(unsigned char)     ((WORD1&0x000f0000)>>16);
   ;	
	?debug	L 1652
	mov	eax,dword ptr d@w+1650
	and	eax,large 0000F0000h
	shr	eax,16
	mov	byte ptr _PSW_AMWP,al
   ;	
   ;			 PSW_COD_INT=(unsigned int)   ((WORD1&0x0000ffff));
   ;	
	?debug	L 1653
	mov	ax,word ptr d@w+1650
	mov	word ptr _PSW_COD_INT,ax
   ;	
   ;	
   ;			 PSW_ILC= (unsigned char)     ((WORD2&0xc0000000)>>29);
   ;	
	?debug	L 1655
	mov	eax,dword ptr d@w+1654
	and	eax,large 0C0000000h
	shr	eax,29
	mov	ah,0
	mov	word ptr _PSW_ILC,ax
   ;	
   ;			 PSW_CC = (unsigned char)     ((WORD2&0x30000000)>>28);
   ;	
	?debug	L 1656
	mov	eax,dword ptr d@w+1654
	and	eax,large 030000000h
	shr	eax,28
	mov	byte ptr _PSW_CC,al
   ;	
   ;			 PSW_PRG_MASK=(unsigned char) ((WORD2&0x0f000000)>>24);
   ;	
	?debug	L 1657
	mov	eax,dword ptr d@w+1654
	and	eax,large 00F000000h
	shr	eax,24
	mov	byte ptr _PSW_PRG_MASK,al
   ;	
   ;			 PSW_ADRESS=                  ((WORD2&0x00ffffff));
   ;	
	?debug	L 1658
	mov	eax,dword ptr d@w+1654
	and	eax,large 000FFFFFFh
	mov	dword ptr _PSW_ADRESS,eax
   ;	
   ;	#ifdef DTA_370
   ;			}
   ;	#endif
   ;	
   ;	 if (PSW_AMWP&0x02) RETURN=1;
   ;	
	?debug	L 1663
	test	byte ptr _PSW_AMWP,2
	je	short @17@86
	mov	word ptr _RETURN,1
@17@86:
   ;	
   ;	}
   ;	
	?debug	L 1664
	pop	ds
	pop	bp
	ret	
	?debug	C E605574F5244320C0000027606015B0605574F52+
	?debug	C 44310C0000027206015B06064144524553530C0A+
	?debug	C 060000
	?debug	E
	?debug	E
_LOAD_PSW	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	4 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void STORE_PSW(unsigned long ADRESS)
   ;	
	?debug	L 1670
	assume	cs:DS360WK1_TEXT
_STORE_PSW	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6064144524553530C0A060000
	?debug	B
   ;	
   ;	{
   ;	 static char OLD_PSW_KEY;
   ;	 static unsigned long WORD1,WORD2;
   ;	 OLD_PSW_KEY=PSW_KEY;
   ;	
	?debug	L 1674
	mov	al,byte ptr _PSW_KEY
	mov	byte ptr d@+1658,al
   ;	
   ;	 PSW_KEY=0;
   ;	
	?debug	L 1675
	mov	byte ptr _PSW_KEY,0
   ;	
   ;	#ifdef DTA_370
   ;	 if (PSW_AMWP&0x8)  /* EC PSW */
   ;			{
   ;			 WORD1= (((unsigned long)PSW_EC_MASK)<<24)+
   ;					(((unsigned long)OLD_PSW_KEY)<<20)+
   ;					(((unsigned long)PSW_AMWP)<<16)+
   ;					(((unsigned long)PSW_CC)<<12)+
   ;					(((unsigned long)PSW_PRG_MASK)<<8);
   ;	
   ;			 WORD2=(PSW_ADRESS&0xffffff);
   ;			 PUT_WORD(ADRESS,WORD1);
   ;			 Dtaret;
   ;			 PUT_WORD(ADRESS+4,WORD2);
   ;			 Dtaret;
   ;			}
   ;	 else               /* BC PSW */
   ;			{
   ;	#endif
   ;			 WORD1= (((unsigned long)PSW_MASK)<<24)+
   ;	
	?debug	L 1694
   ;	
   ;					(((unsigned long)OLD_PSW_KEY)<<20)+
   ;					(((unsigned long)PSW_AMWP)<<16)+
   ;					((unsigned long)PSW_COD_INT);
   ;	
	?debug	L 1697
	movzx	eax,byte ptr _PSW_MASK
	shl	eax,24
	movzx	edx,byte ptr d@+1658
	shl	edx,20
	add	eax,edx
	movzx	edx,byte ptr _PSW_AMWP
	shl	edx,16
	add	eax,edx
	movzx	edx,word ptr _PSW_COD_INT
	add	eax,edx
	mov	dword ptr d@w+1660,eax
   ;	
   ;	
   ;			 WORD2= (((unsigned long)PSW_ILC)<<29)+
   ;	
	?debug	L 1699
   ;	
   ;					(((unsigned long)PSW_CC)<<28)+
   ;					(((unsigned long)PSW_PRG_MASK)<<24)+
   ;									(PSW_ADRESS&0xffffff);
   ;	
	?debug	L 1702
	movsx	eax,word ptr _PSW_ILC
	shl	eax,29
	movzx	edx,byte ptr _PSW_CC
	shl	edx,28
	add	eax,edx
	movzx	edx,byte ptr _PSW_PRG_MASK
	shl	edx,24
	add	eax,edx
	mov	edx,dword ptr _PSW_ADRESS
	and	edx,large 000FFFFFFh
	add	eax,edx
	mov	dword ptr d@w+1664,eax
   ;	
   ;			 PUT_WORD(ADRESS,WORD1);
   ;	
	?debug	L 1703
	push	dword ptr d@w+1660
	push	dword ptr [bp+6]
	push	cs
	call	near ptr _PUT_WORD
	add	sp,8
   ;	
   ;			 Dtaret;
   ;			 PUT_WORD(ADRESS+4,WORD2);
   ;	
	?debug	L 1705
	push	dword ptr d@w+1664
	mov	eax,dword ptr [bp+6]
	add	eax,large 4
	push	eax
	push	cs
	call	near ptr _PUT_WORD
	add	sp,8
   ;	
   ;			 Dtaret;
   ;	#ifdef DTA_370
   ;			}
   ;	#endif
   ;	 PSW_KEY=OLD_PSW_KEY;
   ;	
	?debug	L 1710
	mov	al,byte ptr d@+1658
	mov	byte ptr _PSW_KEY,al
   ;	
   ;	
   ;	}
   ;	
	?debug	L 1712
	pop	ds
	pop	bp
	ret	
	?debug	C E605574F5244320C000002800601890605574F52+
	?debug	C 44310C0000027C060189060B4F4C445F5053575F+
	?debug	C 4B4559080000027A06018806064144524553530C+
	?debug	C 0A060000
	?debug	E
	?debug	E
_STORE_PSW	endp
   ;	
   ;	void FORW_PSW(void)
   ;	
	?debug	L 1719
	assume	cs:DS360WK1_TEXT
_FORW_PSW	proc	far
	?debug	B
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	{PSW_ADRESS+=PSW_ILC;
   ;	
	?debug	L 1720
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	}
   ;	
	?debug	L 1721
	pop	ds
	ret	
	?debug	E
	?debug	E
_FORW_PSW	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void PR(void)
   ;	
	?debug	L 1728
	assume	cs:DS360WK1_TEXT
_PR	proc	far
	?debug	B
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	{
   ;	 static int i;
   ;	 static long adr;
   ;	 printf("%lx : ",PSW_ADRESS-PSW_ILC);
   ;	
	?debug	L 1732
	movsx	eax,word ptr _PSW_ILC
	mov	edx,dword ptr _PSW_ADRESS
	sub	edx,eax
	push	edx
	push	ds
	push	offset s@+555
	call	far ptr _printf
	add	sp,8
   ;	
   ;	 adr=PSW_ADRESS-PSW_ILC;
   ;	
	?debug	L 1733
	movsx	eax,word ptr _PSW_ILC
	mov	edx,dword ptr _PSW_ADRESS
	sub	edx,eax
	mov	dword ptr d@w+1670,edx
   ;	
   ;	 if (adr>0)
   ;	
	?debug	L 1734
	cmp	dword ptr d@w+1670,large 0
	jle	short @20@170
   ;	
   ;	 for (i=0;i<6;i++,adr++)
   ;	
	?debug	L 1735
	mov	word ptr d@w+1668,0
@20@86:
   ;	
   ;					 {printf("%02x",GET_BYTE(adr));}
   ;	
	?debug	L 1736
	push	dword ptr d@w+1670
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	push	ax
	push	ds
	push	offset s@+562
	call	far ptr _printf
	add	sp,6
	?debug	L 1735
	inc	word ptr d@w+1668
	inc	dword ptr d@w+1670
	cmp	word ptr d@w+1668,6
	jl	short @20@86
@20@170:
   ;	
   ;	
   ;	}
   ;	
	?debug	L 1738
	pop	ds
	ret	
	?debug	C E60361647206000002860601C306016904000002+
	?debug	C 840601C206
	?debug	E
	?debug	E
_PR	endp
   ;	
   ;	void T(void)
   ;	
	?debug	L 1744
	assume	cs:DS360WK1_TEXT
_T	proc	far
	?debug	B
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	{
   ;	 HELPHELP("##CHECK COD OPERATION=");
   ;	
	?debug	L 1746
	push	ds
	push	offset s@+567
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;	 PR();
   ;	
	?debug	L 1747
	push	cs
	call	near ptr _PR
   ;	
   ;	 RQ_TRACE=1;
   ;	
	?debug	L 1748
	mov	word ptr _RQ_TRACE,1
   ;	
   ;	}
   ;	
	?debug	L 1749
	pop	ds
	ret	
	?debug	E
	?debug	E
_T	endp
   ;	
   ;	void T00(char C)
   ;	
	?debug	L 1751
	assume	cs:DS360WK1_TEXT
_T00	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E60143080A060000
	?debug	B
   ;	
   ;	{
   ;	 RQ_PRG=0x0001;
   ;	
	?debug	L 1753
	mov	word ptr _RQ_PRG,1
   ;	
   ;	 printf("\nWRONG CODE %x ",C);
   ;	
	?debug	L 1754
	mov	al,byte ptr [bp+6]
	mov	ah,0
	push	ax
	push	ds
	push	offset s@+590
	call	far ptr _printf
	add	sp,6
   ;	
   ;	 printf(": %lx : ",PSW_ADRESS-PSW_ILC);
   ;	
	?debug	L 1755
	movsx	eax,word ptr _PSW_ILC
	mov	edx,dword ptr _PSW_ADRESS
	sub	edx,eax
	push	edx
	push	ds
	push	offset s@+606
	call	far ptr _printf
	add	sp,8
   ;	
   ;	 RETURN=1;
   ;	
	?debug	L 1756
	mov	word ptr _RETURN,1
   ;	
   ;	}
   ;	
	?debug	L 1757
	pop	ds
	pop	bp
	ret	
	?debug	C E60143080A060000
	?debug	E
	?debug	E
_T00	endp
   ;	
   ;	void tt(int cikl_unit)
   ;	
	?debug	L 1763
	assume	cs:DS360WK1_TEXT
_tt	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E60963696B6C5F756E6974040A060000
	mov	si,word ptr [bp+6]
	?debug	B
   ;	
   ;	{
   ;	 printf ("\nCHECK I/O COMMAND:");
   ;	
	?debug	L 1765
	push	ds
	push	offset s@+615
	call	far ptr _printf
	add	sp,4
   ;	
   ;	 PR();
   ;	
	?debug	L 1766
	push	cs
	call	near ptr _PR
   ;	
   ;	 printf("\nUNIT=%03x %06lx=> %02x %06lx %02x %02x %04x ",
   ;	
	?debug	L 1767
   ;	
   ;							 ADRESS_IO_DEVICE[cikl_unit],
   ;							 CSW_CAW[cikl_unit],
   ;							 CSW_COD[cikl_unit],
   ;							 CSW_ADRESS[cikl_unit],
   ;							 CSW_MOD[cikl_unit],
   ;							 CSW_TP[cikl_unit],
   ;							 CSW_COUNT[cikl_unit]);
   ;	
	?debug	L 1774
	mov	bx,si
	shl	bx,2
	push	dword ptr _CSW_COUNT[bx]
	mov	al,byte ptr _CSW_TP[si]
	mov	ah,0
	push	ax
	mov	al,byte ptr _CSW_MOD[si]
	mov	ah,0
	push	ax
	mov	bx,si
	shl	bx,2
	push	dword ptr _CSW_ADRESS[bx]
	mov	al,byte ptr _CSW_COD[si]
	mov	ah,0
	push	ax
	mov	bx,si
	shl	bx,2
	push	dword ptr _CSW_CAW[bx]
	mov	bx,si
	shl	bx,1
	push	word ptr _ADRESS_IO_DEVICE[bx]
	push	ds
	push	offset s@+635
	call	far ptr _printf
	add	sp,24
   ;	
   ;	 RQ_TRACE=1;
   ;	
	?debug	L 1775
	mov	word ptr _RQ_TRACE,1
   ;	
   ;	}
   ;	
	?debug	L 1776
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E60963696B6C5F756E69740408010D0061000C06+
	?debug	C 00
	?debug	E
	?debug	E
_tt	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	2 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void SPECIAL_INT(unsigned long ADRESS)
   ;	
	?debug	L 1778
	assume	cs:DS360WK1_TEXT
_SPECIAL_INT	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6064144524553530C0A060000
	?debug	B
   ;	
   ;	{
   ;	 static int OLD_PSW_KEY;
   ;	 static int OLD_DINTRADR;
   ;	 OLD_PSW_KEY=PSW_KEY;
   ;	
	?debug	L 1782
	mov	al,byte ptr _PSW_KEY
	mov	ah,0
	mov	word ptr d@w+1674,ax
   ;	
   ;	 PSW_KEY=0;
   ;	
	?debug	L 1783
	mov	byte ptr _PSW_KEY,0
   ;	
   ;	 OLD_DINTRADR=DINTRADR;
   ;	
	?debug	L 1784
	mov	ax,word ptr _DINTRADR
	mov	word ptr d@w+1676,ax
   ;	
   ;	 DINTRADR=0;
   ;	
	?debug	L 1785
	mov	word ptr _DINTRADR,0
   ;	
   ;	 PUT_WORD(144l,0x00ffffff&ADRESS);
   ;	
	?debug	L 1786
	mov	eax,large 000FFFFFFh
	and	eax,dword ptr [bp+6]
	push	eax
	push	large 144
	push	cs
	call	near ptr _PUT_WORD
	add	sp,8
   ;	
   ;	 DINTRADR=OLD_DINTRADR;
   ;	
	?debug	L 1787
	mov	ax,word ptr d@w+1676
	mov	word ptr _DINTRADR,ax
   ;	
   ;	 PSW_KEY=OLD_PSW_KEY;
   ;	
	?debug	L 1788
	mov	al,byte ptr d@w+1674
	mov	byte ptr _PSW_KEY,al
   ;	
   ;	}
   ;	
	?debug	L 1789
	pop	ds
	pop	bp
	ret	
	?debug	C E60C4F4C445F44494E5452414452040000028C06+
	?debug	C 01F5060B4F4C445F5053575F4B4559040000028A+
	?debug	C 0601F406064144524553530C0A060000
	?debug	E
	?debug	E
_SPECIAL_INT	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	4 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	int TLB_SET(unsigned long ADRESS)
   ;	
	?debug	L 1791
	assume	cs:DS360WK1_TEXT
_TLB_SET	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6064144524553530C0A060000
	?debug	B
   ;	
   ;	{
   ;	 static unsigned long adress;
   ;	 static int LEN_T_SEG;
   ;	 static unsigned long ADRESS_SEG;
   ;	 static int LEN_T_PAGES;
   ;	 static unsigned int ADRESS_PAGE;
   ;	 static int L_PAGES,L_SEGS;
   ;	 static unsigned int OFF_IN_SEGS,OFF_IN_PAGES;
   ;	 static int OLD_DINTRADR;
   ;	 static int OLD_PSW_KEY;
   ;	 static int retu;
   ;	 //printf(" adres=%lx ",ADRESS);getch();
   ;	 adress=ADRESS;
   ;	
	?debug	L 1804
	mov	eax,dword ptr [bp+6]
	mov	dword ptr d@w+1678,eax
   ;	
   ;	 switch(R370[0]&0x00c00000)
   ;	
	?debug	L 1805
	mov	eax,dword ptr _R370
	and	eax,large 000C00000h
	mov	dword ptr [bp-4],eax
	mov	cx,2
	mov	bx,offset @25@C1394
@25@114:
	mov	eax,dword ptr cs:[bx]
	cmp	eax,dword ptr [bp-4]
	je	short @25@198
	add	bx,4
	loop	short @25@114
	jmp	short @25@282
@25@198:
	add	cx,cx
	add	bx,cx
	jmp	word ptr cs:[bx+4]
@25@226:
   ;	
   ;		 {
   ;			case 0x00400000:  /* LEN PAGE =2048K */
   ;					 L_PAGES=LEN_PAGE_2048K;
   ;	
	?debug	L 1808
	mov	word ptr d@w+1692,0
   ;	
   ;					 break;
   ;	
	?debug	L 1809
	jmp	short @25@310
@25@254:
   ;	
   ;			case 0x00800000:  /* LEN PAGE =4096K */
   ;					 L_PAGES=LEN_PAGE_4096K;
   ;	
	?debug	L 1811
	mov	word ptr d@w+1692,1
   ;	
   ;					 break;
   ;	
	?debug	L 1812
	jmp	short @25@310
@25@282:
   ;	
   ;			default:
   ;					 SPECIAL_INT(adress);
   ;	
	?debug	L 1814
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;					 RQ_PRG=0x0012;
   ;	
	?debug	L 1815
	mov	word ptr _RQ_PRG,18
   ;	
   ;					 return(4);
   ;	
	?debug	L 1816
	mov	ax,4
	pop	ds
	pop	si
	leave	
	ret	
@25@310:
   ;	
   ;		 }
   ;	 switch(R370[0]&0x00180000)
   ;	
	?debug	L 1818
	mov	eax,dword ptr _R370
	and	eax,large 000180000h
	mov	dword ptr [bp-8],eax
	mov	cx,2
	mov	bx,offset @25@C1554
@25@366:
	mov	eax,dword ptr cs:[bx]
	cmp	eax,dword ptr [bp-8]
	je	short @25@450
	add	bx,4
	loop	short @25@366
	jmp	short @25@534
@25@450:
	add	cx,cx
	add	bx,cx
	jmp	word ptr cs:[bx+4]
@25@478:
   ;	
   ;		 {
   ;			case 0x00000000:  /* LEN SEGS =64K */
   ;					 L_SEGS=LEN_SEGS_64K;
   ;	
	?debug	L 1821
	mov	word ptr d@w+1694,0
   ;	
   ;					 break;
   ;	
	?debug	L 1822
	jmp	short @25@562
@25@506:
   ;	
   ;			case 0x00180000:  /* LEN SEGS =1M */
   ;					 L_SEGS=LEN_SEGS_1M;
   ;	
	?debug	L 1824
	mov	word ptr d@w+1694,1
   ;	
   ;					 break;
   ;	
	?debug	L 1825
	jmp	short @25@562
@25@534:
   ;	
   ;			default:
   ;					 SPECIAL_INT(adress);
   ;	
	?debug	L 1827
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;					 RQ_PRG=0x0012;
   ;	
	?debug	L 1828
	mov	word ptr _RQ_PRG,18
   ;	
   ;					 return(4);
   ;	
	?debug	L 1829
	mov	ax,4
	pop	ds
	pop	si
	leave	
	ret	
@25@562:
   ;	
   ;		 }
   ;	 LEN_T_SEG=(R370[1])>>24;
   ;	
	?debug	L 1831
	mov	eax,dword ptr _R370+4
	shr	eax,24
	mov	word ptr d@w+1682,ax
   ;	
   ;	 LEN_T_SEG<<=16;
   ;	
	?debug	L 1832
	shl	word ptr d@w+1682,16
   ;	
   ;	 //printf(" L_SEG=%d L_P=%d LEN=%d ",L_SEGS,L_PAGES,LEN_T_SEG);getch();
   ;	 switch(L_SEGS)
   ;	
	?debug	L 1834
	mov	ax,word ptr d@w+1694
	or	ax,ax
	je	short @25@702
	cmp	ax,1
	je	short @25@730
	jmp	short @25@758
@25@702:
   ;	
   ;		{
   ;		 case LEN_SEGS_64K:
   ;					OFF_IN_SEGS=((adress<<8)>>24);
   ;	
	?debug	L 1837
	mov	eax,dword ptr d@w+1678
	shl	eax,8
	shr	eax,24
	mov	word ptr d@w+1696,ax
   ;	
   ;					break;
   ;	
	?debug	L 1838
	jmp	short @25@758
@25@730:
   ;	
   ;		 case LEN_SEGS_1M :
   ;					OFF_IN_SEGS=((adress<<8)>>28);
   ;	
	?debug	L 1840
	mov	eax,dword ptr d@w+1678
	shl	eax,8
	shr	eax,28
	mov	word ptr d@w+1696,ax
   ;	
   ;					break;
   ;	
	?debug	L 1841
@25@758:
   ;	
   ;		}
   ;	 if (OFF_IN_SEGS>LEN_T_SEG)
   ;	
	?debug	L 1843
	mov	ax,word ptr d@w+1696
	cmp	ax,word ptr d@w+1682
	jbe	short @25@814
   ;	
   ;		{
   ;		 SPECIAL_INT(adress);
   ;	
	?debug	L 1845
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;		 RQ_PRG=0x0010;
   ;	
	?debug	L 1846
	mov	word ptr _RQ_PRG,16
   ;	
   ;		 ADRESS_DTA=(R370[1]&0x00ffffc0)+(OFF_IN_SEGS<<2);
   ;	
	?debug	L 1847
	mov	ax,word ptr d@w+1696
	shl	ax,2
	movzx	eax,ax
	mov	edx,dword ptr _R370+4
	and	edx,large 000FFFFC0h
	add	edx,eax
	mov	dword ptr _ADRESS_DTA,edx
   ;	
   ;		 return(3);
   ;	
	?debug	L 1848
	mov	ax,3
	pop	ds
	pop	si
	leave	
	ret	
@25@814:
   ;	
   ;		}
   ;	 //printf(" OFF_IN_SEG =%d ",OFF_IN_SEGS);getch();
   ;	 OLD_DINTRADR=DINTRADR;
   ;	
	?debug	L 1851
	mov	ax,word ptr _DINTRADR
	mov	word ptr d@w+1700,ax
   ;	
   ;	 DINTRADR=0;
   ;	
	?debug	L 1852
	mov	word ptr _DINTRADR,0
   ;	
   ;	 ADRESS_SEG=GET_WORD((R370[1]&0x00ffffc0)+(OFF_IN_SEGS<<2));
   ;	
	?debug	L 1853
	mov	ax,word ptr d@w+1696
	shl	ax,2
	movzx	eax,ax
	mov	edx,dword ptr _R370+4
	and	edx,large 000FFFFC0h
	add	edx,eax
	push	edx
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+1684,eax
   ;	
   ;	 //printf("A=%lx ",ADRESS_SEG);getch();
   ;	 DINTRADR=OLD_DINTRADR;
   ;	
	?debug	L 1855
	mov	ax,word ptr d@w+1700
	mov	word ptr _DINTRADR,ax
   ;	
   ;	 if (RETURN)
   ;	
	?debug	L 1856
	cmp	word ptr _RETURN,0
	je	short @25@870
   ;	
   ;		 {
   ;			SPECIAL_INT(adress);
   ;	
	?debug	L 1858
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;			RQ_PRG=0x0012;
   ;	
	?debug	L 1859
	mov	word ptr _RQ_PRG,18
   ;	
   ;			return(4);
   ;	
	?debug	L 1860
	mov	ax,4
	pop	ds
	pop	si
	leave	
	ret	
@25@870:
   ;	
   ;		 }
   ;	 if (ADRESS_SEG&0x00000001)
   ;	
	?debug	L 1862
	test	dword ptr d@w+1684,large 1
	je	short @25@926
   ;	
   ;		{
   ;		 SPECIAL_INT(adress);
   ;	
	?debug	L 1864
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;		 RQ_PRG=0x0010;
   ;	
	?debug	L 1865
	mov	word ptr _RQ_PRG,16
   ;	
   ;		 ADRESS_DTA=(R370[1]&0x00ffffc0)+(OFF_IN_SEGS<<2);
   ;	
	?debug	L 1866
	mov	ax,word ptr d@w+1696
	shl	ax,2
	movzx	eax,ax
	mov	edx,dword ptr _R370+4
	and	edx,large 000FFFFC0h
	add	edx,eax
	mov	dword ptr _ADRESS_DTA,edx
   ;	
   ;		 return(1);
   ;	
	?debug	L 1867
	mov	ax,1
	pop	ds
	pop	si
	leave	
	ret	
@25@926:
   ;	
   ;		}
   ;	 LEN_T_PAGES=(ADRESS_SEG)>>28;
   ;	
	?debug	L 1869
	mov	eax,dword ptr d@w+1684
	shr	eax,28
	mov	word ptr d@w+1688,ax
   ;	
   ;	 ADRESS_SEG&=0x00fffff8;
   ;	
	?debug	L 1870
	and	dword ptr d@w+1684,large 000FFFFF8h
   ;	
   ;	
   ;	 switch(L_PAGES)
   ;	
	?debug	L 1872
	mov	ax,word ptr d@w+1692
	or	ax,ax
	je	short @25@1066
	cmp	ax,1
	jne short	@@164
	jmp	@25@1290
@@164:
	jmp	@25@1514
@25@1066:
   ;	
   ;		{
   ;		 case LEN_PAGE_2048K:
   ;					switch(L_SEGS)
   ;	
	?debug	L 1875
	mov	ax,word ptr d@w+1694
	or	ax,ax
	je	short @25@1178
	cmp	ax,1
	je	short @25@1234
	jmp	@25@1514
@25@1178:
   ;	
   ;						 {
   ;							case LEN_SEGS_64K:
   ;									 OFF_IN_PAGES=(adress&0x0000ffff)>>11;
   ;	
	?debug	L 1878
	mov	eax,dword ptr d@w+1678
	and	eax,large 00000FFFFh
	shr	eax,11
	mov	word ptr d@w+1698,ax
   ;	
   ;									 if (LEN_T_PAGES<(OFF_IN_PAGES>>1))
   ;	
	?debug	L 1879
	shr	ax,1
	cmp	ax,word ptr d@w+1688
	ja short	@@165
	jmp	@25@1514
@@165:
   ;	
   ;											{
   ;											 SPECIAL_INT(adress);
   ;	
	?debug	L 1881
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;											 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
   ;	
	?debug	L 1882
	mov	ax,word ptr d@w+1698
	shl	ax,1
	movzx	eax,ax
	mov	edx,dword ptr d@w+1684
	add	edx,eax
	mov	dword ptr _ADRESS_DTA,edx
   ;	
   ;											 RQ_PRG=0x0011;
   ;	
	?debug	L 1883
	mov	word ptr _RQ_PRG,17
   ;	
   ;											 return(3);
   ;	
	?debug	L 1884
	mov	ax,3
	pop	ds
	pop	si
	leave	
	ret	
@25@1234:
   ;	
   ;											}
   ;									 break;
   ;							case LEN_SEGS_1M :
   ;									 OFF_IN_PAGES=(adress&0x000fffff)>>11;
   ;	
	?debug	L 1888
	mov	eax,dword ptr d@w+1678
	and	eax,large 0000FFFFFh
	shr	eax,11
	mov	word ptr d@w+1698,ax
   ;	
   ;									 if (LEN_T_PAGES<(OFF_IN_PAGES>>5))
   ;	
	?debug	L 1889
	shr	ax,5
	cmp	ax,word ptr d@w+1688
	ja short	@@166
	jmp	@25@1514
@@166:
   ;	
   ;											{
   ;											 SPECIAL_INT(adress);
   ;	
	?debug	L 1891
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;											 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
   ;	
	?debug	L 1892
	mov	ax,word ptr d@w+1698
	shl	ax,1
	movzx	eax,ax
	mov	edx,dword ptr d@w+1684
	add	edx,eax
	mov	dword ptr _ADRESS_DTA,edx
   ;	
   ;											 RQ_PRG=0x0011;
   ;	
	?debug	L 1893
	mov	word ptr _RQ_PRG,17
   ;	
   ;											 return(3);
   ;	
	?debug	L 1894
	mov	ax,3
	pop	ds
	pop	si
	leave	
	ret	
@25@1290:
   ;	
   ;											}
   ;									 break;
   ;						 }
   ;					break;
   ;		 case LEN_PAGE_4096K:
   ;					switch(L_SEGS)
   ;	
	?debug	L 1900
	mov	ax,word ptr d@w+1694
	or	ax,ax
	je	short @25@1402
	cmp	ax,1
	je	short @25@1458
	jmp	@25@1514
@25@1402:
   ;	
   ;						 {
   ;							case LEN_SEGS_64K:
   ;									 OFF_IN_PAGES=(adress&0x0000ffff)>>12;
   ;	
	?debug	L 1903
	mov	eax,dword ptr d@w+1678
	and	eax,large 00000FFFFh
	shr	eax,12
	mov	word ptr d@w+1698,ax
   ;	
   ;									 if (LEN_T_PAGES<(OFF_IN_PAGES))
   ;	
	?debug	L 1904
	mov	ax,word ptr d@w+1688
	cmp	ax,word ptr d@w+1698
	jae	short @25@1514
   ;	
   ;											{
   ;											 SPECIAL_INT(adress);
   ;	
	?debug	L 1906
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;											 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
   ;	
	?debug	L 1907
	mov	ax,word ptr d@w+1698
	shl	ax,1
	movzx	eax,ax
	mov	edx,dword ptr d@w+1684
	add	edx,eax
	mov	dword ptr _ADRESS_DTA,edx
   ;	
   ;											 RQ_PRG=0x0011;
   ;	
	?debug	L 1908
	mov	word ptr _RQ_PRG,17
   ;	
   ;											 return(3);
   ;	
	?debug	L 1909
	mov	ax,3
	pop	ds
	pop	si
	leave	
	ret	
@25@1458:
   ;	
   ;											}
   ;									 break;
   ;							case LEN_SEGS_1M :
   ;									 OFF_IN_PAGES=(adress&0x000fffff)>>12;
   ;	
	?debug	L 1913
	mov	eax,dword ptr d@w+1678
	and	eax,large 0000FFFFFh
	shr	eax,12
	mov	word ptr d@w+1698,ax
   ;	
   ;									 if (LEN_T_PAGES<(OFF_IN_PAGES>>4))
   ;	
	?debug	L 1914
	shr	ax,4
	cmp	ax,word ptr d@w+1688
	jbe	short @25@1514
   ;	
   ;											{
   ;											 SPECIAL_INT(adress);
   ;	
	?debug	L 1916
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;											 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
   ;	
	?debug	L 1917
	mov	ax,word ptr d@w+1698
	shl	ax,1
	movzx	eax,ax
	mov	edx,dword ptr d@w+1684
	add	edx,eax
	mov	dword ptr _ADRESS_DTA,edx
   ;	
   ;											 RQ_PRG=0x0011;
   ;	
	?debug	L 1918
	mov	word ptr _RQ_PRG,17
   ;	
   ;											 return(3);
   ;	
	?debug	L 1919
	mov	ax,3
	pop	ds
	pop	si
	leave	
	ret	
@25@1514:
   ;	
   ;											}
   ;									 break;
   ;						 }
   ;					break;
   ;		}
   ;	
   ;	 //printf(" Ok =%x",OFF_IN_PAGES);getch();
   ;	 OLD_DINTRADR=DINTRADR;
   ;	
	?debug	L 1927
	mov	ax,word ptr _DINTRADR
	mov	word ptr d@w+1700,ax
   ;	
   ;	 DINTRADR=0;
   ;	
	?debug	L 1928
	mov	word ptr _DINTRADR,0
   ;	
   ;	 ADRESS_PAGE=(((unsigned int)GET_BYTE((ADRESS_SEG)+(OFF_IN_PAGES<<1)))<<8)+
   ;	
	?debug	L 1929
   ;	
   ;							 ((unsigned int)GET_BYTE((ADRESS_SEG)+1+(OFF_IN_PAGES<<1)))	;
   ;	
	?debug	L 1930
	mov	ax,word ptr d@w+1698
	shl	ax,1
	movzx	eax,ax
	mov	edx,dword ptr d@w+1684
	add	edx,eax
	push	edx
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	shl	ax,8
	push	ax
	mov	ax,word ptr d@w+1698
	shl	ax,1
	movzx	eax,ax
	mov	edx,dword ptr d@w+1684
	add	edx,eax
	inc	edx
	push	edx
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	pop	dx
	add	dx,ax
	mov	word ptr d@w+1690,dx
   ;	
   ;	 //printf("ADRESS_PAGE=%x ",ADRESS_PAGE);getch();
   ;	 DINTRADR=OLD_DINTRADR;
   ;	
	?debug	L 1932
	mov	ax,word ptr d@w+1700
	mov	word ptr _DINTRADR,ax
   ;	
   ;	 if (RETURN)
   ;	
	?debug	L 1933
	cmp	word ptr _RETURN,0
	je	short @25@1570
   ;	
   ;		 {
   ;			SPECIAL_INT(adress);
   ;	
	?debug	L 1935
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;			RQ_PRG=0x0012;
   ;	
	?debug	L 1936
	mov	word ptr _RQ_PRG,18
   ;	
   ;			return(4);
   ;	
	?debug	L 1937
	mov	ax,4
	pop	ds
	pop	si
	leave	
	ret	
@25@1570:
   ;	
   ;		 }
   ;	 switch(L_PAGES)
   ;	
	?debug	L 1939
	mov	ax,word ptr d@w+1692
	or	ax,ax
	je	short @25@1682
	cmp	ax,1
	je	short @25@1766
	jmp	@25@1850
@25@1682:
   ;	
   ;		{
   ;		 case LEN_PAGE_2048K:
   ;					if (ADRESS_PAGE&0x0004)
   ;	
	?debug	L 1942
	test	word ptr d@w+1690,4
	je	short @25@1738
   ;	
   ;						{
   ;						 SPECIAL_INT(adress);
   ;	
	?debug	L 1944
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;						 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
   ;	
	?debug	L 1945
	mov	ax,word ptr d@w+1698
	shl	ax,1
	movzx	eax,ax
	mov	edx,dword ptr d@w+1684
	add	edx,eax
	mov	dword ptr _ADRESS_DTA,edx
   ;	
   ;						 RQ_PRG=0x0011;
   ;	
	?debug	L 1946
	mov	word ptr _RQ_PRG,17
   ;	
   ;						 return(2);
   ;	
	?debug	L 1947
	mov	ax,2
	pop	ds
	pop	si
	leave	
	ret	
@25@1738:
   ;	
   ;						}
   ;					ADRESS_PAGE>>=3;
   ;	
	?debug	L 1949
	shr	word ptr d@w+1690,3
   ;	
   ;					break;
   ;	
	?debug	L 1950
	jmp	short @25@1850
@25@1766:
   ;	
   ;		 case LEN_PAGE_4096K:
   ;					if (ADRESS_PAGE&0x0008)
   ;	
	?debug	L 1952
	test	word ptr d@w+1690,8
	je	short @25@1822
   ;	
   ;						{
   ;						 SPECIAL_INT(adress);
   ;	
	?debug	L 1954
	push	dword ptr d@w+1678
	push	cs
	call	near ptr _SPECIAL_INT
	add	sp,4
   ;	
   ;						 ADRESS_DTA=(ADRESS_SEG)+(OFF_IN_PAGES<<1);
   ;	
	?debug	L 1955
	mov	ax,word ptr d@w+1698
	shl	ax,1
	movzx	eax,ax
	mov	edx,dword ptr d@w+1684
	add	edx,eax
	mov	dword ptr _ADRESS_DTA,edx
   ;	
   ;						 RQ_PRG=0x0011;
   ;	
	?debug	L 1956
	mov	word ptr _RQ_PRG,17
   ;	
   ;						 return(2);
   ;	
	?debug	L 1957
	mov	ax,2
	pop	ds
	pop	si
	leave	
	ret	
@25@1822:
   ;	
   ;						}
   ;					ADRESS_PAGE>>=4;
   ;	
	?debug	L 1959
	shr	word ptr d@w+1690,4
   ;	
   ;					break;
   ;	
	?debug	L 1960
@25@1850:
   ;	
   ;		}
   ;	 //	printf("ADRESS_PAGE=%x ",ADRESS_PAGE);getch();
   ;	 switch(L_SEGS)
   ;	
	?debug	L 1963
	mov	ax,word ptr d@w+1694
	or	ax,ax
	je	short @25@1962
	cmp	ax,1
	je	short @25@2130
	jmp	@25@2298
@25@1962:
   ;	
   ;		{
   ;		 case LEN_SEGS_64K:
   ;					switch(L_PAGES)
   ;	
	?debug	L 1966
	mov	ax,word ptr d@w+1692
	or	ax,ax
	je	short @25@2074
	cmp	ax,1
	je	short @25@2102
	jmp	@25@2298
@25@2074:
   ;	
   ;						{
   ;						 case LEN_PAGE_2048K:
   ;									TLB[(adress&0x00ffffff)>>11]=(OFF_IN_SEGS<<5)+ADRESS_PAGE;
   ;	
	?debug	L 1969
	mov	eax,dword ptr d@w+1678
	and	eax,large 000FFFFFFh
	shr	eax,11
	shl	ax,1
	mov	dx,word ptr d@w+1696
	shl	dx,5
	add	dx,word ptr d@w+1690
	mov	bx,ax
	mov	word ptr _TLB[bx],dx
   ;	
   ;									break;
   ;	
	?debug	L 1970
	jmp	@25@2298
@25@2102:
   ;	
   ;						 case LEN_PAGE_4096K:
   ;									TLB[(adress&0x00ffffff)>>11]=(OFF_IN_SEGS<<4)+ADRESS_PAGE;
   ;	
	?debug	L 1972
	mov	eax,dword ptr d@w+1678
	and	eax,large 000FFFFFFh
	shr	eax,11
	shl	ax,1
	mov	si,ax
	mov	dx,word ptr d@w+1696
	shl	dx,4
	add	dx,word ptr d@w+1690
	mov	bx,ax
	mov	word ptr _TLB[bx],dx
   ;	
   ;									TLB[((adress&0x00ffffff)>>11)+1]=(OFF_IN_SEGS<<4)+ADRESS_PAGE+1;
   ;	
	?debug	L 1973
	mov	ax,word ptr d@w+1696
	shl	ax,4
	add	ax,word ptr d@w+1690
	inc	ax
	mov	word ptr _TLB[si+2],ax
   ;	
   ;									break;
   ;	
	?debug	L 1974
	jmp	short @25@2298
@25@2130:
   ;	
   ;						}
   ;					break;
   ;		 case LEN_SEGS_1M :
   ;					switch(L_PAGES)
   ;	
	?debug	L 1978
	mov	ax,word ptr d@w+1692
	or	ax,ax
	je	short @25@2242
	cmp	ax,1
	je	short @25@2270
	jmp	short @25@2298
@25@2242:
   ;	
   ;						{
   ;						 case LEN_PAGE_2048K:
   ;									TLB[(adress&0x00ffffff)>>11]=(OFF_IN_SEGS<<9)+ADRESS_PAGE;
   ;	
	?debug	L 1981
	mov	eax,dword ptr d@w+1678
	and	eax,large 000FFFFFFh
	shr	eax,11
	shl	ax,1
	mov	dx,word ptr d@w+1696
	shl	dx,9
	add	dx,word ptr d@w+1690
	mov	bx,ax
	mov	word ptr _TLB[bx],dx
   ;	
   ;									break;
   ;	
	?debug	L 1982
	jmp	short @25@2298
@25@2270:
   ;	
   ;						 case LEN_PAGE_4096K:
   ;									TLB[(adress&0x00ffffff)>>11]=(OFF_IN_SEGS<<8)+ADRESS_PAGE;
   ;	
	?debug	L 1984
	mov	eax,dword ptr d@w+1678
	and	eax,large 000FFFFFFh
	shr	eax,11
	shl	ax,1
	mov	si,ax
	mov	dx,word ptr d@w+1696
	shl	dx,8
	add	dx,word ptr d@w+1690
	mov	bx,ax
	mov	word ptr _TLB[bx],dx
   ;	
   ;									TLB[((adress&0x00ffffff)>>11)+1]=(OFF_IN_SEGS<<8)+ADRESS_PAGE+1;
   ;	
	?debug	L 1985
	mov	ax,word ptr d@w+1696
	shl	ax,8
	add	ax,word ptr d@w+1690
	inc	ax
	mov	word ptr _TLB[si+2],ax
   ;	
   ;									break;
   ;	
	?debug	L 1986
@25@2298:
   ;	
   ;	
   ;						}
   ;					break;
   ;		}
   ;	 //printf(" [%x]=%x %x %x ",(unsigned int)((adress&0x00ffffff)>>11),
   ;	 //						 TLB[(adress&0x00ffffff)>>11],
   ;	 //						 ADRESS_PAGE,
   ;	 //						 (OFF_IN_SEGS<<9)+ADRESS_PAGE
   ;	 //						 );
   ;	 //getch();
   ;	 return(0);
   ;	
	?debug	L 1997
	xor	ax,ax
   ;	
   ;	}
   ;	
	?debug	L 1998
	pop	ds
	pop	si
	leave	
	ret	
	?debug	C E6047265747504000002A806010A070B4F4C445F+
	?debug	C 5053575F4B455904000002A6060109070C4F4C44+
	?debug	C 5F44494E545241445204000002A4060108070C4F+
	?debug	C 46465F494E5F50414745530A000002A206010707+
	?debug	C 0B4F46465F494E5F534547530A000002A0060107+
	?debug	C 07064C5F53454753040000029E06010607074C5F+
	?debug	C 5041474553040000029C060106070B4144524553+
	?debug	C 535F504147450A0000029A060105070B4C454E5F+
	?debug	C 545F50414745530400000298060104070A414452+
	?debug	C 4553535F5345470C0000029406010307094C454E+
	?debug	C 5F545F5345470400000292060102070661647265+
	?debug	C 73730C0000028E06010107064144524553530C0A+
	?debug	C 060000
	?debug	E
	?debug	E
_TLB_SET	endp
@25@C1554	label	word
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	24
	db	0
	dw	@25@478
	dw	@25@506
@25@C1394	label	word
	db	0
	db	0
	db	64
	db	0
	db	0
	db	0
	db	128
	db	0
	dw	@25@226
	dw	@25@254
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void TLB_RESET(void)
   ;	
	?debug	L 2000
	assume	cs:DS360WK1_TEXT
_TLB_RESET	proc	far
	?debug	B
	push	di
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	{
   ;	 static int i;
   ;	 for(i=0;i<4096;i++) TLB[i]=0xffff;
   ;	
	?debug	L 2003
	mov	cx,4096
	mov	di,offset _TLB
	push	ds
	pop	es
	mov	ax,00000FFFFh
	rep 	stosw	
	mov	word ptr d@w+1706,4096
   ;	
   ;	}
   ;	
	?debug	L 2004
	pop	ds
	pop	di
	ret	
	?debug	C E6016904000002AA0601D207
	?debug	E
	?debug	E
_TLB_RESET	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	8 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	1 dup (0)
	db	1 dup (0)
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
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	158
	db	0
	db	0
	db	184
	db	1 dup (0)
	db	1 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void RUN_COMMAND(void)
   ;	
	?debug	L 2008
	assume	cs:DS360WK1_TEXT
_RUN_COMMAND	proc	far
	?debug	B
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	
   ;	{static char COMMAND[8];
   ;	 static int COUNT,COUNT2;
   ;	 static time_t t1,t2;
   ;	 static char RR;
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
   ;	 static long SRREZ;
   ;	 static unsigned long ADRESS;
   ;	 static char far*Command;
   ;	 static unsigned long OLD_PSW_ADRESS;
   ;	 static unsigned long Psw_adress;
   ;	 static int DtaAdress;
   ;	 static signed long Const_timer;
   ;	 static char far *EEGGAA=0xb800009e;
   ;	
   ;	
   ;	
   ;	#ifdef OPT003
   ;	 register int Number_block;
   ;	#else
   ;	 static int Number_block;
   ;	#endif
   ;	
   ;	
   ;	 static char OLD_PSW_KEY;
   ;	 static char OLD_DINTRADR;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 RETURN=0;
   ;	
	?debug	L 2051
	mov	word ptr _RETURN,0
   ;	
   ;	 //t1=time(NULL);
   ;	 if (PSW_AMWP&0x02)
   ;	
	?debug	L 2053
	test	byte ptr _PSW_AMWP,2
	je	short @27@114
   ;	
   ;		 {
   ;			Const_timer=CONST_TIMER_WAIT;
   ;	
	?debug	L 2055
	mov	dword ptr d@w+1784,large 10
   ;	
   ;			if (SHOW_SHOW) *EEGGAA='W';
   ;	
	?debug	L 2056
	mov	ax,seg _SHOW_SHOW
	mov	es,ax
	cmp	word ptr es:_SHOW_SHOW,0
	jne short	@@167
	jmp	@27@618
@@167:
	les	bx,dword ptr d@w+1788
	mov	byte ptr es:[bx],87
	jmp	@27@618
@27@114:
   ;	
   ;	    goto END_CIKL;
   ;		 }
   ;	 if (SHOW_SHOW) *EEGGAA=' ';
   ;	
	?debug	L 2059
	mov	ax,seg _SHOW_SHOW
	mov	es,ax
	cmp	word ptr es:_SHOW_SHOW,0
	je	short @27@170
	les	bx,dword ptr d@w+1788
	mov	byte ptr es:[bx],32
@27@170:
   ;	
   ;	 Const_timer=CONST_TIMER;
   ;	
	?debug	L 2060
	mov	dword ptr d@w+1784,large 1280
   ;	
   ;	 if (RQ_TRACE)
   ;	
	?debug	L 2061
	cmp	word ptr _RQ_TRACE,0
	je	short @27@226
   ;	
   ;		 {
   ;			Const_timer=CONST_TIMER_WAIT;
   ;	
	?debug	L 2063
	mov	dword ptr d@w+1784,large 10
   ;	
   ;			COUNT_1000=1;
   ;	
	?debug	L 2064
	mov	word ptr _COUNT_1000,1
@27@226:
   ;	
   ;		 }
   ;	//for (COUNT2=0;COUNT2<10000;COUNT2++)
   ;	for(COUNT=0;COUNT<COUNT_1000;COUNT++)
   ;	
	?debug	L 2067
	mov	word ptr d@w+1716,0
	mov	ax,word ptr d@w+1716
	cmp	ax,word ptr _COUNT_1000
	jl short	@@168
	jmp	@27@618
@@168:
@27@282:
   ;	
   ;		{
   ;	#define DEBUG_BP 1
   ;	#ifdef DEBUG_BP
   ;	   if ((PSW_ADRESS&0xffffff) == DEBUG_PSW_ADRESS)
   ;	
	?debug	L 2071
	mov	eax,dword ptr _PSW_ADRESS
	and	eax,large 000FFFFFFh
	cmp	eax,dword ptr _DEBUG_PSW_ADRESS
	jne	short @27@338
   ;	
   ;	     {
   ;	      RQ_TRACE=0x11;TRACE_UNIT=0;
   ;	
	?debug	L 2073
	mov	word ptr _RQ_TRACE,17
	mov	word ptr _TRACE_UNIT,0
   ;	
   ;	      COUNT_1000=1;
   ;	
	?debug	L 2074
	mov	word ptr _COUNT_1000,1
   ;	
   ;	      printf("\n BP ");
   ;	
	?debug	L 2075
	push	ds
	push	offset s@+681
	call	far ptr _printf
	add	sp,4
@27@338:
   ;	
   ;	
   ;	     }
   ;	#endif
   ;		 if (((unsigned int)PSW_ADRESS)&0x0001)
   ;	
	?debug	L 2079
	test	word ptr _PSW_ADRESS,1
	je	short @27@394
   ;	
   ;			 {
   ;				RQ_TRACE=1;
   ;	
	?debug	L 2081
	mov	word ptr _RQ_TRACE,1
   ;	
   ;	
   ;				RQ_PRG=6;
   ;	
	?debug	L 2083
	mov	word ptr _RQ_PRG,6
   ;	
   ;				goto END_CIKL;
   ;	
	?debug	L 2084
	jmp	@27@618
@27@394:
   ;	
   ;			 }
   ;	
   ;	#ifdef DTA_370
   ;		 OLD_PSW_ADRESS=PSW_ADRESS;
   ;		 Psw_adress=PSW_ADRESS;
   ;		 Dta(PSW_ADRESS);
   ;	#endif
   ;	
   ;		 if ( ( ((6+(unsigned int)PSW_ADRESS)^(unsigned int)PSW_ADRESS) & 0xf800 )==0 )
   ;	
	?debug	L 2093
	mov	ax,word ptr _PSW_ADRESS
	add	ax,6
	xor	ax,word ptr _PSW_ADRESS
	test	ax,00000F800h
	jne	short @27@506
   ;	
   ;			 {
   ;				if ((Number_block=(PSW_ADRESS>>11))>= MAX_BLOCK_MEMORY) goto MOVE_C;
   ;	
	?debug	L 2095
	mov	eax,dword ptr _PSW_ADRESS
	shr	eax,11
	mov	dx,ax
	cmp	ax,word ptr MAX_BLOCK_MEMORY
	jge	short @27@506
   ;	
   ;				if (MEMORY[Number_block]!=NULL)
   ;	
	?debug	L 2096
	mov	bx,dx
	shl	bx,2
	mov	ax,word ptr MEMORY[bx]
	or	ax,word ptr MEMORY[bx+2]
	je	short @27@506
   ;	
   ;					{
   ;					 Command=MEMORY[Number_block]+(((unsigned int)PSW_ADRESS)&0x07ff);
   ;	
	?debug	L 2098
	mov	ax,word ptr _PSW_ADRESS
	and	ax,2047
	mov	bx,dx
	shl	bx,2
	mov	dx,word ptr MEMORY[bx+2]
	mov	bx,word ptr MEMORY[bx]
	add	bx,ax
	mov	word ptr d@w+1770+2,dx
	mov	word ptr d@w+1770,bx
   ;	
   ;					 goto END_MOVE_C;
   ;	
	?debug	L 2099
	jmp	short @27@534
@27@506:
   ;	
   ;					}
   ;			 }
   ;	MOVE_C:
   ;	
   ;	
   ;	#ifdef DTA_370
   ;				PSW_ADRESS=Psw_adress;
   ;	#endif
   ;	
   ;				MOVE_360_TO_MEM(PSW_ADRESS,COMMAND,6);/* байт команды                  */
   ;	
	?debug	L 2109
	push	6
	push	ds
	push	offset d@w+1708
	push	dword ptr _PSW_ADRESS
	push	cs
	call	near ptr _MOVE_360_TO_MEM
	add	sp,10
   ;	
   ;				Command=COMMAND;
   ;	
	?debug	L 2110
	mov	word ptr d@w+1770+2,ds
	mov	word ptr d@w+1770,offset d@w+1708
   ;	
   ;		 if (RETURN) return;                   /* может быть ошибка             */
   ;	
	?debug	L 2111
	cmp	word ptr _RETURN,0
	je short	@@169
	jmp	@27@730
@@169:
@27@534:
   ;	
   ;	END_MOVE_C:
   ;	
   ;			#ifdef OPT002
   ;					 _SI=(PSW_ILC=ILC[Command[0]]);              /*  длина команды                */_AL;
   ;			#else
   ;					 PSW_ILC=ILC[Command[0]];              /*  длина команды                */
   ;	
	?debug	L 2117
	les	bx,dword ptr d@w+1770
	mov	al,byte ptr es:[bx]
	mov	ah,0
	mov	bx,ax
	mov	al,byte ptr ILC[bx]
	mov	ah,0
	mov	word ptr _PSW_ILC,ax
   ;	
   ;			#endif
   ;	
   ;			#ifdef DTA_370
   ;					 PSW_ADRESS=Psw_adress;
   ;			#endif
   ;	
   ;					 #ifdef COM_STAT
   ;							 COMMAND_STAT[Command[0]]++;
   ;					 #endif
   ;	
   ;			debug_com;     // включается в DFN: DEBUG_COM
   ;	
   ;		 (*POINT[Command[0]])(Command);
   ;	
	?debug	L 2130
	push	dword ptr d@w+1770
	mov	bx,word ptr d@w+1770
	mov	al,byte ptr es:[bx]
	mov	ah,0
	shl	ax,2
	mov	bx,ax
	call	dword ptr _POINT[bx]
	add	sp,4
   ;	
   ;	#ifdef DTA_370
   ;		 if (RETURN)
   ;			 {
   ;				if (((RQ_PRG&0xff7f)==0x0010) ||
   ;						((RQ_PRG&0xff7f)==0x0011)
   ;					 )
   ;					{
   ;					 PSW_ADRESS=OLD_PSW_ADRESS;
   ;					}
   ;				goto END_CIKL;
   ;			 }
   ;	#else
   ;		 if (RETURN) goto END_CIKL;                   /* некоторые команды могут запросить*/
   ;	
	?debug	L 2143
	cmp	word ptr _RETURN,0
	jne	short @27@618
	?debug	L 2067
	inc	word ptr d@w+1716
	mov	ax,word ptr d@w+1716
	cmp	ax,word ptr _COUNT_1000
	jge short	@@170
	jmp	@27@282
@@170:
@27@618:
   ;	
   ;	#endif
   ;																					 /* прерывание                    */
   ;		}
   ;	
   ;	END_CIKL:
   ;		//t2=time(NULL);
   ;		//printf("\n time=%ld" ,t2-t1);
   ;	RET:
   ;		OLD_PSW_KEY=PSW_KEY;
   ;	
	?debug	L 2152
	mov	al,byte ptr _PSW_KEY
	mov	byte ptr d@+1792,al
   ;	
   ;		PSW_KEY=0;
   ;	
	?debug	L 2153
	mov	byte ptr _PSW_KEY,0
   ;	
   ;	
   ;	#ifdef DTA_370
   ;		OLD_DINTRADR=DINTRADR;
   ;		DINTRADR=0;
   ;	#endif
   ;	
   ;		SRREZ=GET_WORD(0x50l);
   ;	
	?debug	L 2160
	push	large 80
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+1762,eax
   ;	
   ;		if ((SRREZ>=0l)&&((SRREZ-Const_timer)<0l))
   ;	
	?debug	L 2161
	cmp	dword ptr d@w+1762,large 0
	jl	short @27@702
	sub	eax,dword ptr d@w+1784
	jge	short @27@702
   ;	
   ;			{RQ_TIMER=1;
   ;	
	?debug	L 2162
	mov	word ptr _RQ_TIMER,1
@27@702:
   ;	
   ;			}
   ;		SRREZ=SRREZ-Const_timer;
   ;	
	?debug	L 2164
	mov	eax,dword ptr d@w+1762
	sub	eax,dword ptr d@w+1784
	mov	dword ptr d@w+1762,eax
   ;	
   ;		PUT_WORD(0x50l,SRREZ);
   ;	
	?debug	L 2165
	push	eax
	push	large 80
	push	cs
	call	near ptr _PUT_WORD
	add	sp,8
   ;	
   ;	
   ;	#ifdef DTA_370
   ;		DINTRADR=OLD_DINTRADR;
   ;	#endif
   ;	
   ;		PSW_KEY=OLD_PSW_KEY;
   ;	
	?debug	L 2171
	mov	al,byte ptr d@+1792
	mov	byte ptr _PSW_KEY,al
@27@730:
   ;	
   ;	
   ;	
   ;	#ifdef TIMER_CPU
   ;	
   ;	#endif
   ;	}
   ;	
	?debug	L 2177
	pop	ds
	ret	
	?debug	C E319000400160600
	?debug	C E31A0008001A08
	?debug	C E60C4F4C445F44494E5452414452080000020107+
	?debug	C 01FE070B4F4C445F5053575F4B45590800000200+
	?debug	C 0701FD070C4E756D6265725F626C6F636B040801+
	?debug	C F6001F010402000645454747414118000002FC06+
	?debug	C 01F2070B436F6E73745F74696D657206000002F8+
	?debug	C 0601F1070944746141647265737304000002F606+
	?debug	C 01F0070A5073775F6164726573730C000002F206+
	?debug	C 01EF070E4F4C445F5053575F4144524553530C00+
	?debug	C 0002EE0601EE0707436F6D6D616E6418000002EA+
	?debug	C 0601ED07064144524553530C000002E60601EC07+
	?debug	C 05535252455A06000002E20601EB070555525245+
	?debug	C 5A0C000002DE0601EA07045252455A06000002DA+
	?debug	C 0601E9070352455A19000002D60601E807035252+
	?debug	C 3219000002D20601E7070352523119000002CE06+
	?debug	C 01E607034444440A000002CC0601E40702444408+
	?debug	C 000002CB0601E30702424408000002CA0601E207+
	?debug	C 02495304000002C80601DF0702423204000002C6+
	?debug	C 0601DF0702523204000002C40601DF0702523104+
	?debug	C 000002C20601DF0702525808000002C10601DE07+
	?debug	C 02525208000002C00601DD0702743206000002BC+
	?debug	C 0601DC0702743106000002B80601DC0706434F55+
	?debug	C 4E543204000002B60601DB0705434F554E540400+
	?debug	C 0002B40601DB0707434F4D4D414E441A000002AC+
	?debug	C 0601DA07
	?debug	E
	?debug	E
_RUN_COMMAND	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	4 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	1 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void DO_ALL_WORK(void)
   ;	
	?debug	L 2185
	assume	cs:DS360WK1_TEXT
_DO_ALL_WORK	proc	far
	?debug	B
	push	si
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
@28@30:
	?debug	B
   ;	
   ;	{
   ;	 static int i;
   ;	 static char CCC;
   ;	 static long WW;
   ;	 static char MASK_TEST;
   ;	 static char OLD_PSW_KEY;
   ;	 static char OLD_DINTRADR;
   ;	RUN:
   ;	 if (RQ_7920)
   ;	
	?debug	L 2194
	cmp	word ptr _RQ_7920,0
	je	short @28@86
   ;	
   ;		 {
   ;			RUN_COMMAND();
   ;	
	?debug	L 2196
	push	cs
	call	near ptr _RUN_COMMAND
   ;	
   ;			RQ_TRACE=0;
   ;	
	?debug	L 2197
	mov	word ptr _RQ_TRACE,0
   ;	
   ;			RQ_7920=RUN_EDIT(RQ_7920);
   ;	
	?debug	L 2198
	push	word ptr _RQ_7920
	call	far ptr _RUN_EDIT
	add	sp,2
	mov	word ptr _RQ_7920,ax
   ;	
   ;		 }
   ;	
	?debug	L 2199
	jmp	short @28@310
@28@86:
   ;	
   ;	 else if (RQ_CONSOLE)
   ;	
	?debug	L 2200
	cmp	word ptr _RQ_CONSOLE,0
	je	short @28@142
   ;	
   ;					{
   ;					 RUN_COMMAND();
   ;	
	?debug	L 2202
	push	cs
	call	near ptr _RUN_COMMAND
   ;	
   ;					 RQ_TRACE=0;
   ;	
	?debug	L 2203
	mov	word ptr _RQ_TRACE,0
   ;	
   ;					 RQ_CONSOLE=RUN_EDIT_CONSOLE(RQ_7920);
   ;	
	?debug	L 2204
	push	word ptr _RQ_7920
	call	far ptr _RUN_EDIT_CONSOLE
	add	sp,2
	mov	word ptr _RQ_CONSOLE,ax
   ;	
   ;					}
   ;	
	?debug	L 2205
	jmp	short @28@310
@28@142:
   ;	
   ;				else if (RQ_TRACE&0x05)                       /*если есть трасса               */
   ;	
	?debug	L 2206
	test	word ptr _RQ_TRACE,5
	je	short @28@226
   ;	
   ;	
   ;							 {
   ;								if (RUN_OPERATOR()) return;     /*     то выполнить работу пульта*/
   ;	
	?debug	L 2209
	call	far ptr _RUN_OPERATOR
	or	ax,ax
	je short	@@171
	jmp	@28@1542
@@171:
   ;	
   ;								RUN_COMMAND();
   ;	
	?debug	L 2210
	push	cs
	call	near ptr _RUN_COMMAND
   ;	
   ;							 }
   ;	
	?debug	L 2211
	jmp	short @28@310
@28@226:
   ;	
   ;						 else                                /*если нет трассы                */
   ;							 {if (kbhit())                    /*     то проверить запрос на пульт*/
   ;	
	?debug	L 2213
	call	far ptr _kbhit
	or	ax,ax
	je	short @28@282
   ;	
   ;									{
   ;									 if (RUN_OPERATOR()) return;  /*        выполнить работу пульта */
   ;	
	?debug	L 2215
	call	far ptr _RUN_OPERATOR
	or	ax,ax
	je short	@@172
	jmp	@28@1542
@@172:
@28@282:
   ;	
   ;									}
   ;								RUN_COMMAND();                  /*и затем команды                 */
   ;	
	?debug	L 2217
	push	cs
	call	near ptr _RUN_COMMAND
@28@310:
   ;	
   ;							 }
   ;	 if (FLAG_OPEN_CONNECTION) RUN_EDIT_NET(FLAG_OPEN_CONNECTION);
   ;	
	?debug	L 2219
	mov	ax,seg _FLAG_OPEN_CONNECTION
	mov	es,ax
	cmp	word ptr es:_FLAG_OPEN_CONNECTION,0
	je	short @28@366
	mov	es,ax
	push	word ptr es:_FLAG_OPEN_CONNECTION
	call	far ptr _RUN_EDIT_NET
	add	sp,2
@28@366:
   ;	
   ;	 RETURN=0;
   ;	
	?debug	L 2220
	mov	word ptr _RETURN,0
   ;	
   ;	 if (RQ_PRG)                      /*    запрос на программное прерывание*/
   ;	
	?debug	L 2221
	cmp	word ptr _RQ_PRG,0
	je	short @28@478
   ;	
   ;			{
   ;			 debug_print;
   ;			 if (RQ_PRG==0x0007) T();
   ;	
	?debug	L 2224
	cmp	word ptr _RQ_PRG,7
	jne	short @28@450
	push	cs
	call	near ptr _T
@28@450:
   ;	
   ;			 PSW_COD_INT=RQ_PRG;
   ;	
	?debug	L 2225
	mov	ax,word ptr _RQ_PRG
	mov	word ptr _PSW_COD_INT,ax
   ;	
   ;			 STORE_PSW(0x28l);
   ;	
	?debug	L 2226
	push	large 40
	push	cs
	call	near ptr _STORE_PSW
	add	sp,4
   ;	
   ;			 printf("RQ PRG");
   ;	
	?debug	L 2227
	push	ds
	push	offset s@+687
	call	far ptr _printf
	add	sp,4
   ;	
   ;			 #ifdef DTA_370
   ;			 if (PSW_AMWP&0x8)  /* EC */
   ;				 {
   ;					OLD_PSW_KEY=PSW_KEY;
   ;					PSW_KEY=0;
   ;					PUT_WORD(140l,(((unsigned long)PSW_ILC)<<16)+(unsigned long)PSW_COD_INT);
   ;					PSW_KEY=OLD_PSW_KEY;
   ;				 }
   ;			 #endif
   ;			 LOAD_PSW(0x68l);
   ;	
	?debug	L 2237
	push	large 104
	push	cs
	call	near ptr _LOAD_PSW
	add	sp,4
   ;	
   ;			 RQ_PRG=0;
   ;	
	?debug	L 2238
	mov	word ptr _RQ_PRG,0
   ;	
   ;			 RQ_SVC=0;
   ;	
	?debug	L 2239
	mov	word ptr _RQ_SVC,0
   ;	
   ;			 COUNT_1000=1;
   ;	
	?debug	L 2240
	mov	word ptr _COUNT_1000,1
   ;	
   ;			 goto RUN;
   ;	
	?debug	L 2241
	jmp	@28@30
@28@478:
   ;	
   ;			}
   ;	 if (RQ_SVC)                      /*   запрос на SVC      */
   ;	
	?debug	L 2243
	cmp	word ptr _RQ_SVC,0
	je	short @28@590
   ;	
   ;			{if (RQ_SVC==0x100) RQ_SVC=0;
   ;	
	?debug	L 2244
	cmp	word ptr _RQ_SVC,256
	jne	short @28@562
	mov	word ptr _RQ_SVC,0
@28@562:
   ;	
   ;			 PSW_COD_INT=RQ_SVC;
   ;	
	?debug	L 2245
	mov	ax,word ptr _RQ_SVC
	mov	word ptr _PSW_COD_INT,ax
   ;	
   ;			 STORE_PSW(0x20l);
   ;	
	?debug	L 2246
	push	large 32
	push	cs
	call	near ptr _STORE_PSW
	add	sp,4
   ;	
   ;			 #ifdef DTA_370
   ;			 if (PSW_AMWP&0x8)  /* EC */
   ;				 {
   ;					OLD_PSW_KEY=PSW_KEY;
   ;					PSW_KEY=0;
   ;					PUT_WORD(136l,(((unsigned long)PSW_ILC)<<16)+(unsigned long)PSW_COD_INT);
   ;					PSW_KEY=OLD_PSW_KEY;
   ;				 }
   ;			 #endif
   ;			 LOAD_PSW(0x60l);
   ;	
	?debug	L 2256
	push	large 96
	push	cs
	call	near ptr _LOAD_PSW
	add	sp,4
   ;	
   ;			 RQ_SVC=0;
   ;	
	?debug	L 2257
	mov	word ptr _RQ_SVC,0
   ;	
   ;			 COUNT_1000=1;
   ;	
	?debug	L 2258
	mov	word ptr _COUNT_1000,1
   ;	
   ;			 goto RUN;
   ;	
	?debug	L 2259
	jmp	@28@30
@28@590:
   ;	
   ;			}
   ;	 OLD_PSW_KEY=PSW_KEY;
   ;	
	?debug	L 2261
	mov	al,byte ptr _PSW_KEY
	mov	byte ptr d@+1803,al
   ;	
   ;	 PSW_KEY=0;
   ;	
	?debug	L 2262
	mov	byte ptr _PSW_KEY,0
   ;	
   ;	 COUNT_1000=1000;
   ;	
	?debug	L 2263
	mov	word ptr _COUNT_1000,1000
   ;	
   ;	
   ;	#ifdef DTA_370
   ;	 OLD_DINTRADR=DINTRADR;
   ;	 DINTRADR=0;
   ;	#endif
   ;	
   ;	 RUN_CHANEL();
   ;	
	?debug	L 2270
	call	far ptr _RUN_CHANEL
   ;	
   ;	
   ;	#ifdef DTA_370
   ;	 DINTRADR=OLD_DINTRADR;
   ;	#endif
   ;	
   ;	 PSW_KEY=OLD_PSW_KEY;
   ;	
	?debug	L 2276
	mov	al,byte ptr d@+1803
	mov	byte ptr _PSW_KEY,al
   ;	
   ;	
   ;	 if (RQ_EXIT)          /* запрос на выход */
   ;	
	?debug	L 2278
	cmp	word ptr _RQ_EXIT,0
	jne short	@@173
	jmp	@28@1038
@@173:
   ;	
   ;		 {RQ_EXIT=1;
   ;	
	?debug	L 2279
	mov	word ptr _RQ_EXIT,1
   ;	
   ;			HELPHELP("##НАЖАТА КЛАВИША ESC - ЗАПРОС НА ВЫХОД");
   ;	
	?debug	L 2280
	push	ds
	push	offset s@+694
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;			for(i=0;i<NUMBER_IO;i++)             /* проверить по всем устройствам*/
   ;	
	?debug	L 2281
	mov	word ptr d@w+1794,0
	mov	ax,word ptr d@w+1794
	cmp	ax,word ptr _NUMBER_IO
	jl short	@@174
	jmp	@28@1010
@@174:
@28@674:
   ;	
   ;			 {if ( (FLAG_IO_DEVICE[i]&(RQ_INT|RQ_PCI)) ||
   ;	
	?debug	L 2282
   ;	
   ;						 (FLAG_IO_DEVICE[i]&RQ_WORK)
   ;					 )     /* запрос на прерывание или работу устройства*/
   ;	
	?debug	L 2284
	mov	bx,word ptr d@w+1794
	test	byte ptr _FLAG_IO_DEVICE[bx],5
	jne	short @28@730
	test	byte ptr _FLAG_IO_DEVICE[bx],2
	je	short @28@758
@28@730:
   ;	
   ;					{RQ_EXIT=2;
   ;	
	?debug	L 2285
	mov	word ptr _RQ_EXIT,2
   ;	
   ;					 printf("\033[u UNIT %x IS BUSY                                 ",ADRESS_IO_DEVICE[i]);
   ;	
	?debug	L 2286
	mov	bx,word ptr d@w+1794
	shl	bx,1
	push	word ptr _ADRESS_IO_DEVICE[bx]
	push	ds
	push	offset s@+733
	call	far ptr _printf
	add	sp,6
@28@758:
   ;	
   ;					}
   ;				if ((IO_STATUS[i][2]!=0) || (IO_STATUS[i][3]!=0))
   ;	
	?debug	L 2288
	mov	bx,word ptr d@w+1794
	shl	bx,4
	cmp	byte ptr _IO_STATUS[bx+2],0
	jne	short @28@814
	mov	bx,word ptr d@w+1794
	shl	bx,4
	cmp	byte ptr _IO_STATUS[bx+3],0
	je	short @28@954
@28@814:
   ;	
   ;					{
   ;					 if ((IO_STATUS[i][3]==0x48) && ((TYPE_IO_DEVICE[i]=='T') ||
   ;	
	?debug	L 2290
   ;	
   ;							 (TYPE_IO_DEVICE[i]=='5')) )
   ;	
	?debug	L 2291
	mov	bx,word ptr d@w+1794
	shl	bx,4
	cmp	byte ptr _IO_STATUS[bx+3],72
	jne	short @28@926
	mov	bx,word ptr d@w+1794
	cmp	byte ptr _TYPE_IO_DEVICE[bx],84
	je	short @28@898
	cmp	byte ptr _TYPE_IO_DEVICE[bx],53
	jne	short @28@926
@28@898:
   ;	
   ;								RQ_EXIT=1;
   ;	
	?debug	L 2292
	mov	word ptr _RQ_EXIT,1
	jmp	short @28@954
@28@926:
   ;	
   ;					 else
   ;						 {
   ;							RQ_EXIT=2;
   ;	
	?debug	L 2295
	mov	word ptr _RQ_EXIT,2
   ;	
   ;							printf("\033[u UNIT %x KEEPING INTERRUPT REQUEST            ",ADRESS_IO_DEVICE[i]);
   ;	
	?debug	L 2296
	mov	bx,word ptr d@w+1794
	shl	bx,1
	push	word ptr _ADRESS_IO_DEVICE[bx]
	push	ds
	push	offset s@+786
	call	far ptr _printf
	add	sp,6
@28@954:
	?debug	L 2281
	inc	word ptr d@w+1794
	mov	ax,word ptr d@w+1794
	cmp	ax,word ptr _NUMBER_IO
	jge short	@@175
	jmp	@28@674
@@175:
@28@1010:
   ;	
   ;						 }
   ;					}
   ;			 }
   ;	
   ;			if (RQ_EXIT==1) return;
   ;	
	?debug	L 2301
	cmp	word ptr _RQ_EXIT,1
	jne short	@@176
	jmp	@28@1542
@@176:
@28@1038:
   ;	
   ;	
   ;		 }
   ;	#ifdef DTA_370
   ;	 OLD_DINTRADR=DINTRADR;
   ;	 DINTRADR=0;
   ;	#endif
   ;	
   ;	 for(i=0;i<NUMBER_IO;i++)             /* проверить по всем устройствам*/
   ;	
	?debug	L 2309
	mov	word ptr d@w+1794,0
	xor	si,si
	shl	si,1
	add	si,offset _ADRESS_IO_DEVICE
	mov	ax,word ptr d@w+1794
	cmp	ax,word ptr _NUMBER_IO
	jl short	@@177
	jmp	@28@1458
@@177:
@28@1122:
   ;	
   ;		 {if (FLAG_IO_DEVICE[i]&(RQ_INT|RQ_PCI))     /* запрос на прерывание от устройства*/
   ;	
	?debug	L 2310
	mov	bx,word ptr d@w+1794
	test	byte ptr _FLAG_IO_DEVICE[bx],5
	jne short	@@178
	jmp	@28@1374
@@178:
   ;	
   ;			{
   ;			 if (RQ_IPL)                      /* для случая первоначальной загрузки*/
   ;	
	?debug	L 2312
	cmp	word ptr _RQ_IPL,0
	je	short @28@1206
   ;	
   ;				 {
   ;					/*FLAG_IO_DEVICE[i]=0;*/             /* сбросить запрос                 */
   ;					LOAD_PSW(0l);
   ;	
	?debug	L 2315
	push	large 0
	push	cs
	call	near ptr _LOAD_PSW
	add	sp,4
   ;	
   ;					WW=GET_WORD(0l);
   ;	
	?debug	L 2316
	push	large 0
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+1798,eax
   ;	
   ;					WW&=0xffff0000l;
   ;	
	?debug	L 2317
	and	dword ptr d@w+1798,large 0FFFF0000h
   ;	
   ;					WW+=ADRESS_IO_DEVICE[i];
   ;	
	?debug	L 2318
	mov	bx,word ptr d@w+1794
	shl	bx,1
	movsx	eax,word ptr _ADRESS_IO_DEVICE[bx]
	add	dword ptr d@w+1798,eax
   ;	
   ;					PUT_WORD(0l,WW);
   ;	
	?debug	L 2319
	push	dword ptr d@w+1798
	push	large 0
	push	cs
	call	near ptr _PUT_WORD
	add	sp,8
   ;	
   ;					RQ_IPL=0;
   ;	
	?debug	L 2320
	mov	word ptr _RQ_IPL,0
   ;	
   ;					goto RUN;
   ;	
	?debug	L 2321
	jmp	@28@30
@28@1206:
   ;	
   ;				 }
   ;			 #ifdef DTA_370
   ;			 if (PSW_AMWP&0x8)  /* EC */
   ;				 {
   ;					if (PSW_EC_MASK&0x02) ;
   ;					else continue;
   ;					MASK_TEST=(ADRESS_IO_DEVICE[i])>>8;
   ;					MASK_TEST=0x80>>MASK_TEST;
   ;					if ((((unsigned long)MASK_TEST)<<24)&R370[2]) ;
   ;					else continue;
   ;				 }
   ;			 else               /* BC */
   ;				 {
   ;			 #endif
   ;					MASK_TEST=(ADRESS_IO_DEVICE[i])>>8;
   ;	
	?debug	L 2336
	mov	ax,word ptr [si]
	sar	ax,8
	mov	byte ptr d@+1802,al
   ;	
   ;					MASK_TEST=0x80>>MASK_TEST;
   ;	
	?debug	L 2337
	mov	ax,128
	mov	cl,byte ptr d@+1802
	sar	ax,cl
	mov	byte ptr d@+1802,al
   ;	
   ;					if (MASK_TEST&PSW_MASK) ;
   ;	
	?debug	L 2338
	mov	al,byte ptr _PSW_MASK
	test	byte ptr d@+1802,al
	jne short	@@179
	jmp	@28@1374
@@179:
   ;	
   ;					else continue;
   ;			 #ifdef DTA_370
   ;				 }
   ;			 #endif
   ;	     if (TraceOut)
   ;	
	?debug	L 2343
	mov	ax,seg _TraceOut
	mov	es,ax
	cmp	dword ptr es:_TraceOut,large 0
	je	short @28@1290
   ;	
   ;	      {
   ;	       fprintf(TraceOut,"\n STORE CSW %06lx %02x %02x %04lx ",CSW_CAW[i],IO_STATUS[i][1],
   ;	
	?debug	L 2345
   ;	
   ;						 IO_STATUS[i][0],CSW_COUNT[i]);
   ;	
	?debug	L 2346
	mov	bx,word ptr d@w+1794
	shl	bx,2
	push	dword ptr _CSW_COUNT[bx]
	mov	bx,word ptr d@w+1794
	shl	bx,4
	mov	al,byte ptr _IO_STATUS[bx]
	mov	ah,0
	push	ax
	mov	bx,word ptr d@w+1794
	shl	bx,4
	mov	al,byte ptr _IO_STATUS[bx+1]
	mov	ah,0
	push	ax
	mov	bx,word ptr d@w+1794
	shl	bx,2
	push	dword ptr _CSW_CAW[bx]
	push	ds
	push	offset s@+836
	mov	ax,seg _TraceOut
	mov	es,ax
	push	dword ptr es:_TraceOut
	call	far ptr _fprintf
	add	sp,20
@28@1290:
   ;	
   ;	      }
   ;	
   ;			 if (RQ_TRACE)
   ;	
	?debug	L 2349
	cmp	word ptr _RQ_TRACE,0
	je	short @28@1346
   ;	
   ;	     {
   ;	
   ;	       printf("\n STORE CSW %06lx %02x %02x %04lx ",CSW_CAW[i],IO_STATUS[i][1],
   ;	
	?debug	L 2352
   ;	
   ;						 IO_STATUS[i][0],CSW_COUNT[i]);
   ;	
	?debug	L 2353
	mov	bx,word ptr d@w+1794
	shl	bx,2
	push	dword ptr _CSW_COUNT[bx]
	mov	bx,word ptr d@w+1794
	shl	bx,4
	mov	al,byte ptr _IO_STATUS[bx]
	mov	ah,0
	push	ax
	mov	bx,word ptr d@w+1794
	shl	bx,4
	mov	al,byte ptr _IO_STATUS[bx+1]
	mov	ah,0
	push	ax
	mov	bx,word ptr d@w+1794
	shl	bx,2
	push	dword ptr _CSW_CAW[bx]
	push	ds
	push	offset s@+836
	call	far ptr _printf
	add	sp,16
@28@1346:
   ;	
   ;	
   ;	     }
   ;			 STORE_CSW(i);
   ;	
	?debug	L 2356
	push	word ptr d@w+1794
	call	far ptr _STORE_CSW
	add	sp,2
   ;	
   ;			 PSW_COD_INT=ADRESS_IO_DEVICE[i];
   ;	
	?debug	L 2357
	mov	bx,word ptr d@w+1794
	shl	bx,1
	mov	ax,word ptr _ADRESS_IO_DEVICE[bx]
	mov	word ptr _PSW_COD_INT,ax
   ;	
   ;			 STORE_PSW(0x38l);
   ;	
	?debug	L 2358
	push	large 56
	push	cs
	call	near ptr _STORE_PSW
	add	sp,4
   ;	
   ;			 #ifdef DTA_370
   ;			 if (PSW_AMWP&0x8)  /* EC */
   ;				 {
   ;					OLD_PSW_KEY=PSW_KEY;
   ;					PSW_KEY=0;
   ;					PUT_WORD(184l,(((unsigned long)GET_BYTE(184l))<<24)+
   ;												((unsigned long)PSW_COD_INT) );
   ;					PSW_KEY=OLD_PSW_KEY;
   ;				 }
   ;			 #endif
   ;			 LOAD_PSW(0x78l);
   ;	
	?debug	L 2369
	push	large 120
	push	cs
	call	near ptr _LOAD_PSW
	add	sp,4
   ;	
   ;			 FLAG_IO_DEVICE[i]=0;             /* сбросить запрос                 */
   ;	
	?debug	L 2370
	mov	bx,word ptr d@w+1794
	mov	byte ptr _FLAG_IO_DEVICE[bx],0
   ;	
   ;	#ifdef DTA_370
   ;			 DINTRADR=OLD_DINTRADR;
   ;	#endif
   ;			 goto RUN;
   ;	
	?debug	L 2374
	jmp	@28@30
@28@1374:
	?debug	L 2309
	add	si,2
	inc	word ptr d@w+1794
	mov	ax,word ptr d@w+1794
	cmp	ax,word ptr _NUMBER_IO
	jge short	@@180
	jmp	@28@1122
@@180:
@28@1458:
   ;	
   ;			}
   ;		 }
   ;	#ifdef DTA_370
   ;	 DINTRADR=OLD_DINTRADR;
   ;	#endif
   ;	
   ;	 if (RQ_TIMER)
   ;	
	?debug	L 2381
	cmp	word ptr _RQ_TIMER,0
	jne short	@@181
	jmp	@28@30
@@181:
   ;	
   ;			{
   ;	
   ;			 #ifdef DTA_370
   ;			 if (PSW_AMWP&0x8)  /* EC */
   ;				 {
   ;					if (PSW_EC_MASK&0x01)
   ;						{if (R370[0]&0x00000080)
   ;							 {
   ;								PSW_COD_INT=0x0080;
   ;								STORE_PSW(0x18l);
   ;								OLD_PSW_KEY=PSW_KEY;
   ;								PSW_KEY=0;
   ;								PUT_WORD(132l,(unsigned long)PSW_COD_INT);
   ;								PSW_KEY=OLD_PSW_KEY;
   ;								LOAD_PSW(0x58l);
   ;								RQ_TIMER=0;
   ;							 }
   ;						}
   ;				 }
   ;			 else
   ;			 #endif
   ;			 if (PSW_MASK&0x01)
   ;	
	?debug	L 2403
	test	byte ptr _PSW_MASK,1
	jne short	@@182
	jmp	@28@30
@@182:
   ;	
   ;				 {
   ;					PSW_COD_INT=0x0080;
   ;	
	?debug	L 2405
	mov	word ptr _PSW_COD_INT,128
   ;	
   ;					STORE_PSW(0x18l);
   ;	
	?debug	L 2406
	push	large 24
	push	cs
	call	near ptr _STORE_PSW
	add	sp,4
   ;	
   ;					LOAD_PSW(0x58l);
   ;	
	?debug	L 2407
	push	large 88
	push	cs
	call	near ptr _LOAD_PSW
	add	sp,4
   ;	
   ;					RQ_TIMER=0;
   ;	
	?debug	L 2408
	mov	word ptr _RQ_TIMER,0
	jmp	@28@30
@28@1542:
   ;	
   ;				 }
   ;			 goto RUN;
   ;			}
   ;	#ifdef TIMER_CPU
   ;		if (RQ_TIMER_CPU)
   ;			{
   ;	
   ;			 #ifdef DTA_370
   ;			 if (PSW_AMWP&0x8)  /* EC */
   ;				 {
   ;					if (PSW_EC_MASK&0x01)
   ;						{if (R370[0]&0x00000400)
   ;							 {
   ;								PSW_COD_INT=0x1005;
   ;								STORE_PSW(0x18l);
   ;								OLD_PSW_KEY=PSW_KEY;
   ;								PSW_KEY=0;
   ;								PUT_WORD(132l,(unsigned long)PSW_COD_INT);
   ;								PSW_KEY=OLD_PSW_KEY;
   ;								LOAD_PSW(0x58l);
   ;								RQ_TIMER_CPU=0;
   ;							 }
   ;						}
   ;				 }
   ;			 else
   ;			 #endif
   ;			 if (PSW_MASK&0x01)
   ;				 {
   ;					if (R370[0]&0x00000400)
   ;						{
   ;						 PSW_COD_INT=0x1005;
   ;						 STORE_PSW(0x18l);
   ;						 LOAD_PSW(0x58l);
   ;						 RQ_TIMER_CPU=0;
   ;						}
   ;				 }
   ;			 goto RUN;
   ;			}
   ;		if (RQ_COMP)
   ;			{
   ;	
   ;			 #ifdef DTA_370
   ;			 if (PSW_AMWP&0x8)  /* EC */
   ;				 {
   ;					if (PSW_EC_MASK&0x01)
   ;						{if (R370[0]&0x00000800)
   ;							 {
   ;								PSW_COD_INT=0x1004;
   ;								STORE_PSW(0x18l);
   ;								OLD_PSW_KEY=PSW_KEY;
   ;								PSW_KEY=0;
   ;								PUT_WORD(132l,(unsigned long)PSW_COD_INT);
   ;								PSW_KEY=OLD_PSW_KEY;
   ;								LOAD_PSW(0x58l);
   ;								RQ_COMP=0;
   ;							 }
   ;						}
   ;				 }
   ;			 else
   ;			 #endif
   ;			 if (PSW_MASK&0x01)
   ;				 {
   ;					if (R370[0]&0x00000800)
   ;						{
   ;						 PSW_COD_INT=0x1004;
   ;						 STORE_PSW(0x18l);
   ;						 LOAD_PSW(0x58l);
   ;						 RQ_COMP=0;
   ;						}
   ;				 }
   ;			 goto RUN;
   ;			}
   ;	#endif
   ;	
   ;	 goto RUN;
   ;	}
   ;	
	?debug	L 2484
	pop	ds
	pop	si
	ret	
	?debug	C E60C4F4C445F44494E5452414452080000020C07+
	?debug	C 0190080B4F4C445F5053575F4B4559080000020B+
	?debug	C 07018F08094D41534B5F54455354080000020A07+
	?debug	C 018E08025757060000020607018D080343434308+
	?debug	C 0000020407018C080169040000020207018B08
	?debug	E
	?debug	E
_DO_ALL_WORK	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	240
	db	255
	db	0
	db	240
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	64 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void  main(argc,argv)
   ;	
	?debug	L 2487
	assume	cs:DS360WK1_TEXT
_main	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	 char **argv;
   ;	 int argc;
   ;	
   ;	{
   ;	 static time_t T1,T2;
   ;	 static unsigned long int ADD;
   ;	 static int ii,i,j;
   ;	
   ;	 static char far *BIOS_AREA=0xf000fff0;
   ;	 static unsigned long all_count;
   ;	 static int i_count,i_count_2;
   ;	 static char bios_32_2[64];
   ;	
   ;	 TraceOut=NULL;
   ;	
	?debug	L 2501
	mov	ax,seg _TraceOut
	mov	es,ax
	mov	dword ptr es:_TraceOut,large 0
   ;	
   ;	 TraceOutCmd=NULL;
   ;	
	?debug	L 2502
	mov	dword ptr _TraceOutCmd,large 0
   ;	
   ;	 NUMBER_IO_CUR=0;
   ;	
	?debug	L 2503
	mov	word ptr _NUMBER_IO_CUR,0
   ;	
   ;	 DEBUG_PSW_ADRESS = 0xff000000;
   ;	
	?debug	L 2504
	mov	dword ptr _DEBUG_PSW_ADRESS,large 0FF000000h
   ;	
   ;	 if (argc==1)
   ;	
	?debug	L 2505
	cmp	word ptr [bp+6],1
	jne	short @29@86
   ;	
   ;		 {
   ;			HELPHELP("## DST360P /<?/H/I/>");
   ;	
	?debug	L 2507
	push	ds
	push	offset s@+871
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;			return;
   ;	
	?debug	L 2508
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@29@86:
   ;	
   ;		 }
   ;	 if ((argv[1][0]=='/' || argv[1][0]=='-')
   ;	
	?debug	L 2510
   ;	
   ;	      &&(argv[1][1]=='h' || argv[1][1]=='H' || argv[1][1]=='?'))
   ;	
	?debug	L 2511
	les	bx,dword ptr [bp+8]
	les	bx,dword ptr es:[bx+4]
	cmp	byte ptr es:[bx],47
	je	short @29@142
	cmp	byte ptr es:[bx],45
	jne	short @29@254
@29@142:
	les	bx,dword ptr [bp+8]
	les	bx,dword ptr es:[bx+4]
	cmp	byte ptr es:[bx+1],104
	je	short @29@226
	cmp	byte ptr es:[bx+1],72
	je	short @29@226
	cmp	byte ptr es:[bx+1],63
	jne	short @29@254
@29@226:
   ;	
   ;		 {
   ;			HELPHELP("## DST360P /<?/H/I/>");
   ;	
	?debug	L 2513
	push	ds
	push	offset s@+871
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;			return;
   ;	
	?debug	L 2514
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
@29@254:
   ;	
   ;		 }
   ;	
   ;	
   ;	
   ;	 if (INIT_MEMORY()!=0) return;
   ;	
	?debug	L 2519
	push	cs
	call	near ptr _INIT_MEMORY
	or	ax,ax
	je short	@@183
	jmp	@29@1038
@@183:
   ;	
   ;	 RQ_TIMER=0;
   ;	
	?debug	L 2520
	mov	word ptr _RQ_TIMER,0
   ;	
   ;	 RQ_EXIT=0;
   ;	
	?debug	L 2521
	mov	word ptr _RQ_EXIT,0
   ;	
   ;	 RQ_CONSOLE=0;
   ;	
	?debug	L 2522
	mov	word ptr _RQ_CONSOLE,0
   ;	
   ;	 RQ_7920=0;
   ;	
	?debug	L 2523
	mov	word ptr _RQ_7920,0
   ;	
   ;	#ifdef COM_STAT
   ;	 for (i=0;i<256;i++) COMMAND_STAT[i]=0;
   ;	#endif
   ;	
   ;	 if (INIT_CHANEL()!=0) return;
   ;	
	?debug	L 2528
	call	far ptr _INIT_CHANEL
	or	ax,ax
	je short	@@184
	jmp	@29@1038
@@184:
   ;	
   ;	
   ;	 DEFAULT_RDR_STRING[0]=0;
   ;	
	?debug	L 2530
	mov	byte ptr _DEFAULT_RDR_STRING,0
   ;	
   ;	
   ;	 if (argv[1][0]=='/' && (argv[1][1]=='i' || argv[1][1]=='I'))
   ;	
	?debug	L 2532
	les	bx,dword ptr [bp+8]
	les	bx,dword ptr es:[bx+4]
	cmp	byte ptr es:[bx],47
	je short	@@185
	jmp	@29@534
@@185:
	cmp	byte ptr es:[bx+1],105
	je	short @29@394
	cmp	byte ptr es:[bx+1],73
	je short	@@186
	jmp	@29@534
@@186:
@29@394:
   ;	
   ;		{
   ;	
   ;			for(ADD=0;ADD<max_block_memory*2048l;ADD++)
   ;	
	?debug	L 2535
	mov	dword ptr d@w+1814,large 0
	jmp	short @29@478
@29@422:
   ;	
   ;	    {
   ;	     PUT_BYTE(ADD,0);
   ;	
	?debug	L 2537
	push	0
	push	dword ptr d@w+1814
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
	?debug	L 2535
	inc	dword ptr d@w+1814
@29@478:
	cmp	dword ptr d@w+1814,large 000100000h
	jb	short @29@422
   ;	
   ;	    }
   ;			R370[0]=0x00000007;
   ;	
	?debug	L 2539
	mov	dword ptr _R370,large 7
   ;	
   ;			R370[1]=0;
   ;	
	?debug	L 2540
	mov	dword ptr _R370+4,large 0
   ;	
   ;			R370[2]=0xe0000000;
   ;	
	?debug	L 2541
	mov	dword ptr _R370+8,large 0E0000000h
   ;	
   ;			R370[4]=0;
   ;	
	?debug	L 2542
	mov	dword ptr _R370+16,large 0
   ;	
   ;			R370[5]=0;
   ;	
	?debug	L 2543
	mov	dword ptr _R370+20,large 0
   ;	
   ;			R370[6]=0;
   ;	
	?debug	L 2544
	mov	dword ptr _R370+24,large 0
   ;	
   ;			R370[7]=0;
   ;	
	?debug	L 2545
	mov	dword ptr _R370+28,large 0
   ;	
   ;			R370[8]=0;
   ;	
	?debug	L 2546
	mov	dword ptr _R370+32,large 0
   ;	
   ;			R370[9]=0;
   ;	
	?debug	L 2547
	mov	dword ptr _R370+36,large 0
   ;	
   ;			R370[10]=0;
   ;	
	?debug	L 2548
	mov	dword ptr _R370+40,large 0
   ;	
   ;			R370[11]=0;
   ;	
	?debug	L 2549
	mov	dword ptr _R370+44,large 0
   ;	
   ;			R370[12]=0;
   ;	
	?debug	L 2550
	mov	dword ptr _R370+48,large 0
   ;	
   ;			R370[13]=0;
   ;	
	?debug	L 2551
	mov	dword ptr _R370+52,large 0
   ;	
   ;			R370[14]=0xc2000000;
   ;	
	?debug	L 2552
	mov	dword ptr _R370+56,large 0C2000000h
   ;	
   ;			R370[15]=0x00000100;
   ;	
	?debug	L 2553
	mov	dword ptr _R370+60,large 256
   ;	
   ;	    PSW_MASK=0;
   ;	
	?debug	L 2554
	mov	byte ptr _PSW_MASK,0
   ;	
   ;	    PSW_KEY=0;
   ;	
	?debug	L 2555
	mov	byte ptr _PSW_KEY,0
   ;	
   ;	    PSW_AMWP=0x02;
   ;	
	?debug	L 2556
	mov	byte ptr _PSW_AMWP,2
   ;	
   ;	    PSW_COD_INT=0;
   ;	
	?debug	L 2557
	mov	word ptr _PSW_COD_INT,0
   ;	
   ;	    PSW_ILC=0;
   ;	
	?debug	L 2558
	mov	word ptr _PSW_ILC,0
   ;	
   ;	    PSW_CC=0;
   ;	
	?debug	L 2559
	mov	byte ptr _PSW_CC,0
   ;	
   ;	    PSW_PRG_MASK=0;
   ;	
	?debug	L 2560
	mov	byte ptr _PSW_PRG_MASK,0
   ;	
   ;	    PSW_ADRESS=0;
   ;	
	?debug	L 2561
	mov	dword ptr _PSW_ADRESS,large 0
   ;	
   ;	    PSW_EC_MASK=0;
   ;	
	?debug	L 2562
	mov	byte ptr _PSW_EC_MASK,0
   ;	
   ;	    RQ_TRACE=0;
   ;	
	?debug	L 2563
	mov	word ptr _RQ_TRACE,0
   ;	
   ;	
   ;		}
   ;	
	?debug	L 2565
	jmp	@29@898
@29@534:
   ;	
   ;	 else
   ;	/***********************************************
   ;	* process /f<file name command>
   ;	***********************************************/
   ;	
   ;	 if (argv[1][0]=='/' && (argv[1][1]!='f' || argv[1][1]!='F'))
   ;	
	?debug	L 2571
	les	bx,dword ptr [bp+8]
	les	bx,dword ptr es:[bx+4]
	cmp	byte ptr es:[bx],47
	je short	@@187
	jmp	@29@870
@@187:
	cmp	byte ptr es:[bx+1],102
	jne	short @29@618
	cmp	byte ptr es:[bx+1],70
	jne short	@@188
	jmp	@29@870
@@188:
@29@618:
	?debug	B
   ;	
   ;	   {
   ;	    FILE *FT;
   ;	    if (FT = fopen(&argv[1][2],"r"))
   ;	
	?debug	L 2574
	push	ds
	push	offset s@+892
	les	bx,dword ptr [bp+8]
	mov	ax,word ptr es:[bx+4]
	add	ax,2
	push	word ptr es:[bx+6]
	push	ax
	call	far ptr _fopen
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
	or	ax,dx
	jne short	@@189
	jmp	@29@842
@@189:
   ;	
   ;	      {
   ;	       fclose(FT);
   ;	
	?debug	L 2576
	push	dx
	push	word ptr [bp-4]
	call	far ptr _fclose
	add	sp,4
   ;	
   ;	       strcpy(NAME_FILE_IO_DEVICE[1],&argv[1][2]);
   ;	
	?debug	L 2577
	les	bx,dword ptr [bp+8]
	les	di,dword ptr es:[bx+4]
	add	di,2
	mov	ax,ds
	mov	si,offset _NAME_FILE_IO_DEVICE+40
	push	ax
	xor	ax,ax
	mov	cx,00000FFFFh
	repnz 	scasb	
	not	cx
	sub	di,cx
	shr	cx,1
	mov	ax,ds
	pop	ds
	push	ax
	xchg	si,di
	mov	bx,ds
	mov	ax,es
	mov	ds,ax
	mov	es,bx
	rep 	movsw	
	adc	cx,cx
	rep 	movsb	
	pop	ds
   ;	
   ;	       if (strchr(NAME_FILE_IO_DEVICE[1],'.'))
   ;	
	?debug	L 2578
	push	ds
	pop	es
	mov	di,offset _NAME_FILE_IO_DEVICE+40
	xor	ax,ax
	mov	cx,00000FFFFh
	repnz 	scasb	
	not	cx
	mov	ax,46
	sub	di,cx
	repnz 	scasb	
	je	short @29@702
	mov	di,1
	xor	ax,ax
	mov	es,ax
@29@702:
	dec	di
	mov	ax,es
	or	di,ax
	je	short @29@814
   ;	
   ;	         {
   ;	          strcpy(NAME_FILE_IO_DEVICE[3],&argv[1][2]);
   ;	
	?debug	L 2580
	les	bx,dword ptr [bp+8]
	les	di,dword ptr es:[bx+4]
	add	di,2
	mov	ax,ds
	mov	si,offset _NAME_FILE_IO_DEVICE+120
	push	ax
	xor	ax,ax
	mov	cx,00000FFFFh
	repnz 	scasb	
	not	cx
	sub	di,cx
	shr	cx,1
	mov	ax,ds
	pop	ds
	push	ax
	xchg	si,di
	mov	bx,ds
	mov	ax,es
	mov	ds,ax
	mov	es,bx
	rep 	movsw	
	adc	cx,cx
	rep 	movsb	
	pop	ds
   ;	
   ;	          *strchr(NAME_FILE_IO_DEVICE[3],'.') = 0;
   ;	
	?debug	L 2581
	push	ds
	pop	es
	mov	di,offset _NAME_FILE_IO_DEVICE+120
	xor	ax,ax
	mov	cx,00000FFFFh
	repnz 	scasb	
	not	cx
	mov	ax,46
	sub	di,cx
	repnz 	scasb	
	je	short @29@786
	mov	di,1
	xor	ax,ax
	mov	es,ax
@29@786:
	dec	di
	mov	ax,es
	mov	es,ax
	mov	byte ptr es:[di],0
   ;	
   ;	          strcat(NAME_FILE_IO_DEVICE[3],".out");
   ;	
	?debug	L 2582
	push	ds
	pop	es
	mov	di,offset _NAME_FILE_IO_DEVICE+120
	mov	si,offset s@+894
	mov	cx,00000FFFFh
	xor	ax,ax
	repnz 	scasb	
	dec	di
	mov	cx,5
	rep 	movsb	
@29@814:
   ;	
   ;	         }
   ;	       RQ_CONSOLE=1;
   ;	
	?debug	L 2584
	mov	word ptr _RQ_CONSOLE,1
   ;	
   ;	       strcpy(DEFAULT_RDR_STRING,"s rdr,00c");
   ;	
	?debug	L 2585
	push	ds
	pop	es
	mov	di,offset _DEFAULT_RDR_STRING
	mov	si,offset s@+899
	mov	cx,5
	rep 	movsw	
   ;	
   ;	       ungetch('\t');
   ;	
	?debug	L 2586
	push	9
	call	far ptr _ungetch
	add	sp,2
   ;	
   ;	      }
   ;	
	?debug	L 2587
	jmp	short @29@898
@29@842:
   ;	
   ;	    else ungetch('~');
   ;	
	?debug	L 2588
	push	126
	call	far ptr _ungetch
	add	sp,2
	jmp	short @29@898
@29@870:
	?debug	C E31C0014001E01
	?debug	C E31B000400161C00
	?debug	C E60246541B02FCFF00
	?debug	E
   ;	
   ;	
   ;	   }
   ;	 else ungetch('~');
   ;	
	?debug	L 2591
	push	126
	call	far ptr _ungetch
	add	sp,2
@29@898:
   ;	
   ;	
   ;	#ifdef DTA_370
   ;	 HELPHELP("##MAIN370");
   ;	#else
   ;	 HELPHELP("##MAIN360");
   ;	
	?debug	L 2596
	push	ds
	push	offset s@+909
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;	#endif
   ;	 printf("\n│ SERIAL NUMBER=%11s               IPL Adress    ║X║║X║║X║      ║IPL║  │",serial_number);
   ;	
	?debug	L 2598
	push	seg _serial_number
	push	offset _serial_number
	push	ds
	push	offset s@+919
	call	far ptr _printf
	add	sp,8
   ;	
   ;	 HELPHELP("##MAIN360_");
   ;	
	?debug	L 2599
	push	ds
	push	offset s@+993
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;	
   ;	 strcpy(bios_32_2,"ead4049902");
   ;	
	?debug	L 2601
	push	ds
	pop	es
	mov	di,offset d@w+1836
	mov	si,offset s@+1004
	mov	cx,5
	rep 	movsw	
	movsb	
   ;	
   ;	 for(i_count=5,BIOS_AREA=0xf000fff5;i_count<16;i_count++)
   ;	
	?debug	L 2602
	mov	word ptr d@w+1832,5
	mov	dword ptr d@w+1824,large 0F000FFF5h
	jmp	short @29@982
@29@926:
   ;	
   ;			 {
   ;				sprintf(&bios_32_2[i_count*2],"%02x",(int)(*BIOS_AREA++));
   ;	
	?debug	L 2604
	les	bx,dword ptr d@w+1824
	inc	word ptr d@w+1824
	mov	al,byte ptr es:[bx]
	mov	ah,0
	push	ax
	push	ds
	push	offset s@+562
	mov	ax,word ptr d@w+1832
	shl	ax,1
	add	ax,offset d@w+1836
	push	ds
	push	ax
	call	far ptr _sprintf
	add	sp,10
	?debug	L 2602
	inc	word ptr d@w+1832
@29@982:
	cmp	word ptr d@w+1832,16
	jl	short @29@926
   ;	
   ;			 }
   ;	 //printf("%s",bios_32_2);
   ;	
   ;	// if (memcmp(bios_32_2,bios_32,32)!=0)
   ;	//	 {
   ;	//		HELPHELP("##PROTECT");
   ;	//	 }
   ;	
   ;	/* PSW_AMWP|=0x02; */
   ;	 #ifdef DTA_370
   ;	 //for(i=0;i<4096;i++) TLB[i]=i;
   ;	 DINTRADR=0;
   ;	 if (PSW_AMWP&0x08) if (PSW_EC_MASK&0x04) DINTRADR=1;
   ;	 #endif
   ;	 COUNT_1000=1000;
   ;	
	?debug	L 2619
	mov	word ptr _COUNT_1000,1000
   ;	
   ;	 signal(SIGFPE, (fptr)Catcher);
   ;	
	?debug	L 2620
	push	seg _Catcher
	push	offset _Catcher
	push	8
	call	far ptr _signal
	add	sp,6
   ;	
   ;	
   ;	 HELPHELP("## РЕЖИМ ПУЛЬТА ОПЕРАТОРА (ВЫХОД ИЗ ПРОГРАММЫ: ESC)");
   ;	
	?debug	L 2622
	push	ds
	push	offset s@+1015
	call	far ptr _HELPHELP
	add	sp,4
   ;	
   ;	
   ;	
   ;	 ADD=GET_WORD(0x7c);
   ;	
	?debug	L 2625
	push	large 124
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+1814,eax
   ;	
   ;	 //GET_WORD(ADD);
   ;	 //ADD=GET_WORD(0x60);
   ;	 //GET_WORD(ADD);
   ;	 _AX=1;
   ;	
	?debug	L 2629
	mov	ax,1
   ;	
   ;	 __emit__(0xb1);__emit__(0x25);
   ;	
	?debug	L 2630
	db	177
	db	37
   ;	
   ;	 __emit__(0x8a);__emit__(0xe9);
   ;	
	?debug	L 2631
	db	138
	db	233
   ;	
   ;	 __emit__(0xb1);__emit__(0x03);
   ;	
	?debug	L 2632
	db	177
	db	3
   ;	
   ;	 __emit__(0xb4);__emit__(0x35);
   ;	
	?debug	L 2633
	db	180
	db	53
   ;	
   ;	 __emit__(0xcd);__emit__(0x21);
   ;	
	?debug	L 2634
	db	205
	db	33
   ;	
   ;	 __emit__(0x8c);__emit__(0xc0);
   ;	
	?debug	L 2635
	db	140
	db	192
   ;	
   ;	 __emit__(0x3d);__emit__(0x00);__emit__(0x10);
   ;	
	?debug	L 2636
	db	61
	db	0
	db	16
   ;	
   ;	 __emit__(0x7e);__emit__(0x08);
   ;	
	?debug	L 2637
	db	126
	db	8
   ;	
   ;	 __emit__(0x33);__emit__(0xd2);
   ;	
	?debug	L 2638
	db	51
	db	210
   ;	
   ;	 __emit__(0x8e);__emit__(0xda);
   ;	
	?debug	L 2639
	db	142
	db	218
   ;	
   ;	 __emit__(0x8b);__emit__(0xc1);
   ;	
	?debug	L 2640
	db	139
	db	193
   ;	
   ;	 __emit__(0xfa);__emit__(0xf4);
   ;	
	?debug	L 2641
	db	250
	db	244
   ;	
   ;	
   ;	 RQ_PRTR=0;
   ;	
	?debug	L 2643
	mov	word ptr _RQ_PRTR,0
   ;	
   ;	 RQ_DEBUG=0;
   ;	
	?debug	L 2644
	mov	word ptr _RQ_DEBUG,0
   ;	
   ;	 DO_ALL_WORK();
   ;	
	?debug	L 2645
	push	cs
	call	near ptr _DO_ALL_WORK
   ;	
   ;	 CLOSE_MEMORY();
   ;	
	?debug	L 2646
	push	cs
	call	near ptr _CLOSE_MEMORY
   ;	
   ;	 CLOSE_CHANEL();
   ;	
	?debug	L 2647
	call	far ptr _CLOSE_CHANEL
@29@1038:
   ;	
   ;	 debug_close;
   ;	#ifdef COM_STAT
   ;	 for (i=0;i<0xc0;i++)
   ;	 printf("%02x=%04x ",i,COMMAND_STAT[i]);
   ;	 for (i=0xd0;i<0xe0;i++)
   ;	 printf("%02x=%04x ",i,COMMAND_STAT[i]);
   ;	 for (i=0xf0;i<256;i++)
   ;	 printf("%02x=%04x ",i,COMMAND_STAT[i]);
   ;	#endif
   ;	}
   ;	
	?debug	L 2657
	pop	ds
	pop	di
	pop	si
	leave	
	ret	
	?debug	C E31D0040001A08
	?debug	C E31E000400161800
	?debug	C E60962696F735F33325F321D0000022C0701C309+
	?debug	C 09695F636F756E745F32040000022A0701C20907+
	?debug	C 695F636F756E7404000002280701C20909616C6C+
	?debug	C 5F636F756E740C000002240701C1090942494F53+
	?debug	C 5F4152454118000002200701C009016A04000002+
	?debug	C 1E0701BE090169040000021C0701BE0902696904+
	?debug	C 0000021A0701BE09034144440C000002160701BD+
	?debug	C 0902543206000002120701BC0902543106000002+
	?debug	C 0E0701BC090461726763040A0600000461726776+
	?debug	C 1E0A080000
	?debug	E
	?debug	E
_main	endp
	?debug	C E9E71A29230A44533336304344302E43
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
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
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
	?debug	C E80C0A44533336304344302E43E71A2923
   ;	
   ;	void CODE00(char far *COM)
   ;	
	?debug	L 13
	assume	cs:DS360WK1_TEXT
_CODE00	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
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
   ;	 static unsigned long ADRESS;
   ;	 static int NUMBER_BLOCK;
   ;	 static unsigned long UREZ;
   ;	 static unsigned long ADR1;
   ;	 static unsigned long ADR2;
   ;	 static unsigned long LEN1;
   ;	 static unsigned long LEN2;
   ;	 static unsigned char SIMBFILL;
   ;	 static unsigned long ADDR1;
   ;	 static unsigned long ADDR2;
   ;	 static unsigned long lenn;
   ;	 static unsigned int LENN;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 GET_OPERAND_RR;
   ;	
	?debug	L 43
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+1900,al
 	ror	 ax,4
	mov	byte ptr d@w+1902,al
 	shr	 ax,12
	mov	byte ptr d@w+1904,al
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 44
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 switch(COM[0])
   ;	
	?debug	L 45
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	dl,al
	mov	ah,0
	mov	bx,ax
	cmp	bx,15
	jbe short	@@190
	jmp	@30@1262
@@190:
	shl	bx,1
	jmp	word ptr cs:@30@C1090[bx]
@30@254:
   ;	
   ;		 {
   ;			case 0x00:            /* неопределенный код операции*/
   ;								T00(COM[0]);
   ;	
	?debug	L 48
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 49
	pop	ds
	pop	bp
	ret	
@30@282:
   ;	
   ;	
   ;			case 0x01:            /* НКО */
   ;								T00(COM[0]);
   ;	
	?debug	L 52
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 53
	pop	ds
	pop	bp
	ret	
@30@310:
   ;	
   ;	
   ;	
   ;			case 0x02:            /* НКО  */
   ;								T00(COM[0]);
   ;	
	?debug	L 57
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 58
	pop	ds
	pop	bp
	ret	
@30@338:
   ;	
   ;	
   ;	
   ;			case 0x03:            /* НКО  */
   ;	
   ;								T00(COM[0]);
   ;	
	?debug	L 63
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 64
	pop	ds
	pop	bp
	ret	
@30@366:
   ;	
   ;	
   ;	
   ;			case 0x04:            /* Установить маску программы SPM
   ;															 Биты 2-7 R1 замещают признак результата
   ;															 и маску программы в PSW
   ;															 R2 игнорируется
   ;															 остальная часть PSW неизменяется
   ;															 биты 2-3 -> признак результата
   ;															 биты 4-7 -> маску программы
   ;															 */
   ;								PSW_CC=(R[R1]>>28)&0x3;
   ;	
	?debug	L 75
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	shr	eax,28
	and	al,3
	mov	byte ptr _PSW_CC,al
   ;	
   ;								PSW_PRG_MASK=(R[R1]>>24)&0xf;
   ;	
	?debug	L 76
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	shr	eax,24
	and	al,15
	mov	byte ptr _PSW_PRG_MASK,al
   ;	
   ;								RETURN=1;
   ;	
	?debug	L 77
	mov	word ptr _RETURN,1
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 79
	pop	ds
	pop	bp
	ret	
@30@394:
   ;	
   ;	
   ;	
   ;			case 0x05:
   ;	//													 /* Переход с возвратом        BALR
   ;	//														 Правые 32 бита PSW (код длины команды ==1
   ;	//														 признак результата, маска программы и
   ;	//													 адрес команды, следующий за BALR
   ;	//														 загружаются в общий регистр R1
   ;	//														 если R2==0 то переход не происходит
   ;	//														 и выбирается следующая команда
   ;	//														 если R2!=0 то происходит переход по
   ;	//														 адресу определяемой правыми 24
   ;	//														 битами R2
   ;	//													*/
   ;	//						UREZ= (((unsigned long)PSW_ILC)<<29)|
   ;	//									 (((unsigned long)PSW_CC)<<28)|
   ;	//									 (((unsigned long)PSW_PRG_MASK)<<24)|
   ;	//									 (PSW_ADRESS);
   ;	//						if (R2) PSW_ADRESS=0xffffff & R[R2];
   ;	//						R[R1]=UREZ;
   ;							T();
   ;	
	?debug	L 100
	push	cs
	call	near ptr _T
   ;	
   ;							break;
   ;	
	?debug	L 101
	pop	ds
	pop	bp
	ret	
@30@422:
   ;	
   ;	
   ;	
   ;								case 0x06:            /* Переход по счетчику        BCTR
   ;	//                                     Из содержимого R1 автоматически вычитается
   ;	//                                     1 Если результат ==0 выбирается следующая
   ;	//                                     по порядку команда
   ;	//                                     Если результат не равен 0 то происходит
   ;	//                                     переход по адресу R2
   ;	//                                     адрес оапределяется до вычитания
   ;	//                                  */
   ;	//                              UREZ=0xffffff & R[R2];
   ;	//                              if (--((signed long)R[R1]))
   ;	//                                       if (R2) PSW_ADRESS=UREZ;
   ;	//                              //T();
   ;																break;
   ;	
   ;	
   ;								case 0x07:            /* условный переход           BCR
   ;	//                                   Следующая команда выбирается по R2
   ;	//                                   если условия указываемые в M1 удовлетворены
   ;	//                                  */
   ;	//                              if (R2) if ((0x08>>PSW_CC) & R1) PSW_ADRESS=0xffffff & R[R2];
   ;	//                              //T();
   ;																break;
   ;	
   ;	
   ;									case 0x08:            /* Установить ключ памяти     SSK
   ;																		 R2 содержит адрес 2048-байтового блока
   ;																			 памяти биты 8-20 задают адрес
   ;																			 Биты 0-7 и 21-27 игнорирууются
   ;																			 биты 28-31 должны быть нулевые
   ;																			 R1 в битах 24-31 содержит ключ памяти
   ;																			 Команда SSK игнорирует биты 0-23
   ;																			 и биты 29-31. Биты 24-27 помещаются
   ;																			 в биты 0-3 ключа памяти
   ;																			 если в машине предусмотрена
   ;																			 защита от выборки то бит 28
   ;																			 помещается в бит 4 ключа памяти в противном
   ;																			случае бит 4 всегда нулевой
   ;																			*/
   ;										if (PSW_AMWP&0x01) {RQ_PRG=2;RETURN=1;break;}
   ;	
	?debug	L 142
	test	byte ptr _PSW_AMWP,1
	je	short @30@478
	mov	word ptr _RQ_PRG,2
	mov	word ptr _RETURN,1
	pop	ds
	pop	bp
	ret	
@30@478:
   ;	
   ;										C_SSK(R[R1],R[R2]);
   ;	
	?debug	L 143
	mov	bx,word ptr d@w+1904
	shl	bx,2
	push	dword ptr _R[bx]
	mov	bx,word ptr d@w+1902
	shl	bx,2
	push	dword ptr _R[bx]
	push	cs
	call	near ptr _C_SSK
	add	sp,8
   ;	
   ;										//T();
   ;										break;
   ;	
	?debug	L 145
	pop	ds
	pop	bp
	ret	
@30@506:
   ;	
   ;	
   ;	
   ;				case 0x09:            /* Прочитать ключ памяти      ISK
   ;																 R2 содержит адрес 2048-байтового блока
   ;																 памяти биты 8-20 задают адрес
   ;																 Биты 0-7 и 21-27 игнорирууются
   ;																 биты 28-31 должны быть нулевые
   ;																 R1 в битах 24-31 содержит ключ памяти
   ;																 Команда SSK игнорирует биты 0-23
   ;																 и биты 29-31. Биты 24-27 помещаются
   ;																 в биты 0-3 ключа памяти
   ;																 если в машине предусмотрена
   ;																 защита от выборки то бит 28
   ;																 помещается в бит 4 ключа памяти в противном
   ;																 случае бит 4 всегда нулевой
   ;															 */
   ;									 if (PSW_AMWP&0x01) {RQ_PRG=2;RETURN=1;break;}
   ;	
	?debug	L 162
	test	byte ptr _PSW_AMWP,1
	je	short @30@562
	mov	word ptr _RQ_PRG,2
	mov	word ptr _RETURN,1
	pop	ds
	pop	bp
	ret	
@30@562:
   ;	
   ;									 R[R1]=R[R1]|C_ISK(R[R2]);
   ;	
	?debug	L 163
	mov	bx,word ptr d@w+1904
	shl	bx,2
	push	dword ptr _R[bx]
	push	cs
	call	near ptr _C_ISK
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	edx,dword ptr _R[bx]
	or	edx,eax
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	dword ptr _R[bx],edx
   ;	
   ;									 //T();
   ;									 break;
   ;	
	?debug	L 165
	pop	ds
	pop	bp
	ret	
@30@590:
   ;	
   ;	
   ;	
   ;				case 0x0a:            /* Обращение к супервизору    SVC
   ;																 Вызывет прерывание SVC
   ;																 байт I1 помещается в биты 24-31 старого
   ;																 PSW а биты 16-23 заполняются 000
   ;																 OLD PSW-> 32(10) 96(10)-> NEW PSW
   ;															*/
   ;									 RQ_SVC=RR;
   ;	
	?debug	L 174
	mov	al,byte ptr d@+1900
	mov	ah,0
	mov	word ptr _RQ_SVC,ax
   ;	
   ;									 if (RQ_SVC==0) RQ_SVC=0x100;
   ;	
	?debug	L 175
	cmp	word ptr _RQ_SVC,0
	jne	short @30@646
	mov	word ptr _RQ_SVC,256
@30@646:
   ;	
   ;									 RETURN=1;
   ;	
	?debug	L 176
	mov	word ptr _RETURN,1
   ;	
   ;									 //if (/*RQ_SVC==0x12 ||*/ RQ_SVC==0x2a) {printf("\nA=%06lx SVC %02x",PSW_ADRESS,RR);T();}
   ;									 //T();
   ;									 break;
   ;	
	?debug	L 179
	pop	ds
	pop	bp
	ret	
@30@674:
   ;	
   ;	
   ;	
   ;				case 0x0b:            /* НКО */
   ;									T00(COM[0]);
   ;	
	?debug	L 183
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;									break;
   ;	
	?debug	L 184
	pop	ds
	pop	bp
	ret	
@30@702:
   ;	
   ;	
   ;	
   ;				case 0x0c:            /* НКО */
   ;									T00(COM[0]);
   ;	
	?debug	L 188
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;									break;
   ;	
	?debug	L 189
	pop	ds
	pop	bp
	ret	
@30@730:
   ;	
   ;	
   ;	
   ;				case 0x0d:            /* Переход с записью в память BASR
   ;																																																				*/
   ;									T00(COM[0]);
   ;	
	?debug	L 194
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;									break;
   ;	
	?debug	L 195
	pop	ds
	pop	bp
	ret	
@30@758:
   ;	
   ;	
   ;	
   ;				case 0x0e:            /* MVCL
   ;																R1,R2 -четные  содержат адрес 00 ХХ ХХ ХХ
   ;																R1+1,R2+1 - длина пересылки   00 ХХ ХХ ХХ
   ;																если R1+1 ,больше R2+1 то остаток
   ;																в первом операнде забивается символом из
   ;																R2+1                          ХХ 00 00 00
   ;															*/
   ;									if ((R1&0x1) || (R2&0x1))
   ;	
	?debug	L 205
	test	word ptr d@w+1902,1
	jne	short @30@814
	test	word ptr d@w+1904,1
	je	short @30@842
@30@814:
   ;	
   ;										{RQ_PRG=0x0006;RETURN=1;
   ;	
	?debug	L 206
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
   ;	
   ;										 return;
   ;	
	?debug	L 207
	pop	ds
	pop	bp
	ret	
@30@842:
   ;	
   ;										}
   ;									ADR1=R[R1]&0x00ffffff;
   ;	
	?debug	L 209
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	and	eax,large 000FFFFFFh
	mov	dword ptr d@w+1936,eax
   ;	
   ;									ADR2=R[R2]&0x00ffffff;
   ;	
	?debug	L 210
	mov	bx,word ptr d@w+1904
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	and	eax,large 000FFFFFFh
	mov	dword ptr d@w+1940,eax
   ;	
   ;									LEN1=R[R1+1]&0x00ffffff;
   ;	
	?debug	L 211
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	and	eax,large 000FFFFFFh
	mov	dword ptr d@w+1944,eax
   ;	
   ;									LEN2=R[R2+1]&0x00ffffff;
   ;	
	?debug	L 212
	mov	bx,word ptr d@w+1904
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	and	eax,large 000FFFFFFh
	mov	dword ptr d@w+1948,eax
   ;	
   ;									SIMBFILL=R[R2+1]>>24;
   ;	
	?debug	L 213
	mov	bx,word ptr d@w+1904
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	shr	eax,24
	mov	byte ptr d@+1952,al
   ;	
   ;									for(ADDR1=ADR1,lenn=0,ADDR2=ADR2;lenn<LEN2;ADDR1+=128,ADDR2+=128,lenn+=128)
   ;	
	?debug	L 214
	mov	eax,dword ptr d@w+1936
	mov	dword ptr d@w+1954,eax
	mov	dword ptr d@w+1962,large 0
	mov	eax,dword ptr d@w+1940
	mov	dword ptr d@w+1958,eax
	jmp	@30@1038
@30@870:
   ;	
   ;										{
   ;										 if ((LEN2-lenn)<128) LENN=LEN2-lenn;
   ;	
	?debug	L 216
	mov	eax,dword ptr d@w+1948
	sub	eax,dword ptr d@w+1962
	cmp	eax,large 128
	jae	short @30@926
	mov	ax,word ptr d@w+1948
	sub	ax,word ptr d@w+1962
	mov	word ptr d@w+1966,ax
	jmp	short @30@954
@30@926:
   ;	
   ;										 else LENN=128;
   ;	
	?debug	L 217
	mov	word ptr d@w+1966,128
@30@954:
   ;	
   ;										 MOVE(ADDR1,ADDR2,LENN);
   ;	
	?debug	L 218
	push	word ptr d@w+1966
	push	dword ptr d@w+1958
	push	dword ptr d@w+1954
	push	cs
	call	near ptr _MOVE
	add	sp,10
   ;	
   ;										 if (RETURN)
   ;	
	?debug	L 219
	cmp	word ptr _RETURN,0
	je	short @30@1010
   ;	
   ;											 {R[R1]=ADDR1;
   ;	
	?debug	L 220
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	eax,dword ptr d@w+1954
	mov	dword ptr _R[bx],eax
   ;	
   ;												R[R2]=ADDR2;
   ;	
	?debug	L 221
	mov	bx,word ptr d@w+1904
	shl	bx,2
	mov	eax,dword ptr d@w+1958
	mov	dword ptr _R[bx],eax
   ;	
   ;												R[R1+1]=(R[R1+1]&0xff000000)|(LEN1-lenn);
   ;	
	?debug	L 222
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	and	eax,large 0FF000000h
	mov	edx,dword ptr d@w+1944
	sub	edx,dword ptr d@w+1962
	or	eax,edx
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;												R[R2+1]=(R[R2+1]&0xff000000)|(LEN2-lenn);
   ;	
	?debug	L 223
	mov	bx,word ptr d@w+1904
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	and	eax,large 0FF000000h
	mov	edx,dword ptr d@w+1948
	sub	edx,dword ptr d@w+1962
	or	eax,edx
	mov	bx,word ptr d@w+1904
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;												return;
   ;	
	?debug	L 224
	pop	ds
	pop	bp
	ret	
@30@1010:
	?debug	L 214
	add	dword ptr d@w+1954,large 128
	add	dword ptr d@w+1958,large 128
	add	dword ptr d@w+1962,large 128
@30@1038:
	mov	eax,dword ptr d@w+1962
	cmp	eax,dword ptr d@w+1948
	jae short	@@191
	jmp	@30@870
@@191:
   ;	
   ;											 }
   ;										}
   ;									R[R1]+=LEN2;
   ;	
	?debug	L 227
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	eax,dword ptr d@w+1948
	add	dword ptr _R[bx],eax
   ;	
   ;									R[R2]+=LEN2;
   ;	
	?debug	L 228
	mov	bx,word ptr d@w+1904
	shl	bx,2
	add	dword ptr _R[bx],eax
   ;	
   ;									R[R1+1]=LEN1-LEN2;
   ;	
	?debug	L 229
	mov	eax,dword ptr d@w+1944
	sub	eax,dword ptr d@w+1948
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;									R[R2+1]=R[R2+1]&0xff000000;
   ;	
	?debug	L 230
	mov	bx,word ptr d@w+1904
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	and	eax,large 0FF000000h
	mov	bx,word ptr d@w+1904
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;									if (((signed long)R[R1+1])>0l)
   ;	
	?debug	L 231
	mov	bx,word ptr d@w+1902
	shl	bx,2
	cmp	dword ptr _R[bx+4],large 0
	jle	short @30@1206
   ;	
   ;										{ADR1=R[R1]&0x00ffffff;
   ;	
	?debug	L 232
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	and	eax,large 000FFFFFFh
	mov	dword ptr d@w+1936,eax
   ;	
   ;										 LEN1=R[R1+1]&0x00ffffff;
   ;	
	?debug	L 233
	mov	bx,word ptr d@w+1902
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	and	eax,large 000FFFFFFh
	mov	dword ptr d@w+1944,eax
   ;	
   ;										 for(ADDR1=ADR1,lenn=0;lenn<LENN;ADDR1++,lenn++)
   ;	
	?debug	L 234
	mov	eax,dword ptr d@w+1936
	mov	dword ptr d@w+1954,eax
	mov	dword ptr d@w+1962,large 0
	jmp	short @30@1178
@30@1122:
   ;	
   ;											 PUT_BYTE(ADDR1,SIMBFILL);
   ;	
	?debug	L 235
	mov	al,byte ptr d@+1952
	push	ax
	push	dword ptr d@w+1954
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
	?debug	L 234
	inc	dword ptr d@w+1954
	inc	dword ptr d@w+1962
@30@1178:
	movzx	eax,word ptr d@w+1966
	cmp	eax,dword ptr d@w+1962
	ja	short @30@1122
@30@1206:
   ;	
   ;										}
   ;	
   ;									T();
   ;	
	?debug	L 238
	push	cs
	call	near ptr _T
   ;	
   ;									break;
   ;	
	?debug	L 239
	pop	ds
	pop	bp
	ret	
@30@1234:
   ;	
   ;	
   ;	
   ;				case 0x0f:            /* CLCL
   ;																R1,R2 -четные  содержат адрес 00 ХХ ХХ ХХ
   ;															R1+1,R2+1 - длина пересылки   00 ХХ ХХ ХХ
   ;															если R1+1 ,больше R2+1 то остаток
   ;															в первом операнде забивается символом из
   ;															R2+1                          ХХ 00 00 00
   ;															0-операнды равны
   ;															1-первый меньше
   ;															2-первый больше
   ;															*/
   ;									T();
   ;	
	?debug	L 252
	push	cs
	call	near ptr _T
   ;	
   ;									break;
   ;	
	?debug	L 253
@30@1262:
   ;	
   ;					 }
   ;	#undef B1
   ;	#undef I2
   ;	#undef X2
   ;	
   ;	
   ;	}
   ;	
	?debug	L 260
	pop	ds
	pop	bp
	ret	
	?debug	C E6044C454E4E0A000002AE070C2600046C656E6E+
	?debug	C 0C000002AA070C25000541444452320C000002A6+
	?debug	C 070C24000541444452310C000002A2070C230008+
	?debug	C 53494D4246494C4C08000002A0070C2200044C45+
	?debug	C 4E320C0000029C070C2100044C454E310C000002+
	?debug	C 98070C200004414452320C00000294070C1F0004+
	?debug	C 414452310C00000290070C1E00045552455A0C00+
	?debug	C 00028C070C1D000C4E554D4245525F424C4F434B+
	?debug	C 040000028A070C1C00064144524553530C000002+
	?debug	C 86070C1B000352455A1900000282070C1A000352+
	?debug	C 5232190000027E070C190003525231190000027A+
	?debug	C 070C1800034444440A00000278070C1600024444+
	?debug	C 0800000277070C15000242440800000276070C14+
	?debug	C 000249530400000274070C110002423204000002+
	?debug	C 72070C11000252320400000270070C1100025231+
	?debug	C 040000026E070C1100025258080000026D070C10+
	?debug	C 00025252080000026C070C0F0003434F4D180A06+
	?debug	C 0000
	?debug	E
	?debug	E
_CODE00	endp
@30@C1090	label	word
	dw	@30@254
	dw	@30@282
	dw	@30@310
	dw	@30@338
	dw	@30@366
	dw	@30@394
	dw	@30@1262
	dw	@30@1262
	dw	@30@422
	dw	@30@506
	dw	@30@590
	dw	@30@674
	dw	@30@702
	dw	@30@730
	dw	@30@758
	dw	@30@1234
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
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
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE05(char far *COM)  /* BALR */
   ;	
	?debug	L 261
	assume	cs:DS360WK1_TEXT
_CODE05	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
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
   ;	 static unsigned long ADRESS;
   ;	 static int NUMBER_BLOCK;
   ;	 static unsigned long UREZ;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 GET_OPERAND_RR;
   ;	
	?debug	L 282
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+1968,al
 	ror	 ax,4
	mov	byte ptr d@w+1970,al
 	shr	 ax,12
	mov	byte ptr d@w+1972,al
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 283
	movsx	eax,word ptr _PSW_ILC
	mov	dword ptr [bp-4],eax
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	
   ;	
   ;														 /* Переход с возвратом        BALR
   ;															 Правые 32 бита PSW (код длины команды ==1
   ;															 признак результата, маска программы и
   ;														 адрес команды, следующий за BALR
   ;															 загружаются в общий регистр R1
   ;															 если R2==0 то переход не происходит
   ;															 и выбирается следующая команда
   ;															 если R2!=0 то происходит переход по
   ;															 адресу определяемой правыми 24
   ;															 битами R2
   ;														*/
   ;	 UREZ= (((unsigned long)PSW_ILC)<<29)|
   ;	
	?debug	L 297
   ;	
   ;				 (((unsigned long)PSW_CC)<<28)|
   ;				 (((unsigned long)PSW_PRG_MASK)<<24)|
   ;				 (PSW_ADRESS);
   ;	
	?debug	L 300
	shl	eax,29
	movzx	edx,byte ptr _PSW_CC
	shl	edx,28
	or	eax,edx
	movzx	edx,byte ptr _PSW_PRG_MASK
	shl	edx,24
	or	eax,edx
	or	eax,dword ptr _PSW_ADRESS
	mov	dword ptr d@w+2000,eax
   ;	
   ;	 if (R2) PSW_ADRESS=0xffffff & R[R2];
   ;	
	?debug	L 301
	cmp	word ptr d@w+1972,0
	je	short @31@198
	mov	bx,word ptr d@w+1972
	shl	bx,2
	mov	eax,large 000FFFFFFh
	and	eax,dword ptr _R[bx]
	mov	dword ptr _PSW_ADRESS,eax
@31@198:
   ;	
   ;	 R[R1]=UREZ;
   ;	
	?debug	L 302
	mov	bx,word ptr d@w+1970
	shl	bx,2
	mov	eax,dword ptr d@w+2000
	mov	dword ptr _R[bx],eax
   ;	
   ;	#undef B1
   ;	#undef I2
   ;	#undef X2
   ;	
   ;	}
   ;	
	?debug	L 307
	pop	ds
	leave	
	ret	
	?debug	C E6045552455A0C000002D0070C15010C4E554D42+
	?debug	C 45525F424C4F434B04000002CE070C1401064144+
	?debug	C 524553530C000002CA070C13010352455A190000+
	?debug	C 02C6070C12010352523219000002C2070C110103+
	?debug	C 52523119000002BE070C1001034444440A000002+
	?debug	C BC070C0E0102444408000002BB070C0D01024244+
	?debug	C 08000002BA070C0C0102495304000002B8070C09+
	?debug	C 0102423204000002B6070C090102523204000002+
	?debug	C B4070C090102523104000002B2070C0901025258+
	?debug	C 08000002B1070C080102525208000002B0070C07+
	?debug	C 0103434F4D180A060000
	?debug	E
	?debug	E
_CODE05	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
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
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE06(char far *COM)  /* BCTR */
   ;	
	?debug	L 308
	assume	cs:DS360WK1_TEXT
_CODE06	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
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
   ;	 static unsigned long ADRESS;
   ;	 static int NUMBER_BLOCK;
   ;	 static unsigned long UREZ;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 GET_OPERAND_RR;
   ;	
	?debug	L 329
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2004,al
 	ror	 ax,4
	mov	byte ptr d@w+2006,al
 	shr	 ax,12
	mov	byte ptr d@w+2008,al
   ;	
   ;	 UREZ=0xffffff & R[R2];
   ;	
	?debug	L 330
	mov	bx,word ptr d@w+2008
	shl	bx,2
	mov	eax,large 000FFFFFFh
	and	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2036,eax
   ;	
   ;	 if (--((signed long)R[R1]) )
   ;	
	?debug	L 331
	mov	bx,word ptr d@w+2006
	shl	bx,2
	dec	dword ptr _R[bx]
	je	short @32@226
   ;	
   ;									if (R2) {PSW_ADRESS=UREZ;return;}
   ;	
	?debug	L 332
	cmp	word ptr d@w+2008,0
	je	short @32@226
	mov	dword ptr _PSW_ADRESS,eax
	pop	ds
	pop	bp
	ret	
@32@226:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 333
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 //T();
   ;	#undef B1
   ;	#undef I2
   ;	#undef X2
   ;	
   ;	}
   ;	
	?debug	L 339
	pop	ds
	pop	bp
	ret	
	?debug	C E6045552455A0C000002F4070C44010C4E554D42+
	?debug	C 45525F424C4F434B04000002F2070C4301064144+
	?debug	C 524553530C000002EE070C42010352455A190000+
	?debug	C 02EA070C41010352523219000002E6070C400103+
	?debug	C 52523119000002E2070C3F01034444440A000002+
	?debug	C E0070C3D0102444408000002DF070C3C01024244+
	?debug	C 08000002DE070C3B0102495304000002DC070C38+
	?debug	C 0102423204000002DA070C380102523204000002+
	?debug	C D8070C380102523104000002D6070C3801025258+
	?debug	C 08000002D5070C370102525208000002D4070C36+
	?debug	C 0103434F4D180A060000
	?debug	E
	?debug	E
_CODE06	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
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
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE07(char far *COM)  /* BCR */
   ;	
	?debug	L 340
	assume	cs:DS360WK1_TEXT
_CODE07	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
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
   ;	 static unsigned long ADRESS;
   ;	 static int NUMBER_BLOCK;
   ;	 static unsigned long UREZ;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 if ((0x80 >> PSW_CC) & COM[1])
   ;	
	?debug	L 361
	mov	ax,128
	mov	cl,byte ptr _PSW_CC
	sar	ax,cl
	les	bx,dword ptr [bp+6]
	test	al,byte ptr es:[bx+1]
	je	short @33@114
   ;	
   ;					 {
   ;						if ((R2=0x0f&COM[1])) {PSW_ADRESS=0xffffff & R[R2];return;}
   ;	
	?debug	L 363
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	dx,15
	and	dx,ax
	mov	word ptr d@w+2044,dx
	mov	ax,dx
	or	ax,ax
	je	short @33@114
	mov	bx,word ptr d@w+2044
	shl	bx,2
	mov	eax,large 000FFFFFFh
	and	eax,dword ptr _R[bx]
	mov	dword ptr _PSW_ADRESS,eax
	pop	ds
	pop	bp
	ret	
@33@114:
   ;	
   ;					 }
   ;	
   ;	FORWARD_PSW;
   ;	
	?debug	L 366
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 //T();
   ;	#undef B1
   ;	#undef I2
   ;	#undef X2
   ;	
   ;	}
   ;	
	?debug	L 372
	pop	ds
	pop	bp
	ret	
	?debug	C E6045552455A0C00000218080C64010C4E554D42+
	?debug	C 45525F424C4F434B0400000216080C6301064144+
	?debug	C 524553530C00000212080C62010352455A190000+
	?debug	C 020E080C610103525232190000020A080C600103+
	?debug	C 5252311900000206080C5F01034444440A000002+
	?debug	C 04080C5D010244440800000203080C5C01024244+
	?debug	C 0800000202080C5B010249530400000200080C58+
	?debug	C 0102423204000002FE070C580102523204000002+
	?debug	C FC070C580102523104000002FA070C5801025258+
	?debug	C 08000002F9070C570102525208000002F8070C56+
	?debug	C 0103434F4D180A060000
	?debug	E
	?debug	E
_CODE07	endp
	?debug	C E9817C311E0A44533336304344312E43
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
	?debug	C E80D0A44533336304344312E43817C311E
   ;	
   ;	void SR(unsigned long *RR1,unsigned long *RR1_PLUS_1,
   ;	
	?debug	L 15
	assume	cs:DS360WK1_TEXT
_SR	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E31F000400160C00
	?debug	C E60A5252325F504C55535F311F0A120000035252+
	?debug	C 321F0A0E00000A5252315F504C55535F311F0A0A+
	?debug	C 0000035252311F0A060000
	?debug	B
   ;	
   ;					unsigned long *RR2,unsigned long *RR2_PLUS_1)
   ;	 {
   ;	
   ;		static int FLA;
   ;		(*RR1_PLUS_1)-=(*RR2_PLUS_1);
   ;	
	?debug	L 20
	les	bx,dword ptr [bp+18]
	mov	eax,dword ptr es:[bx]
	les	bx,dword ptr [bp+10]
	sub	dword ptr es:[bx],eax
   ;	
   ;		FLA=_FLAGS;
   ;	
	?debug	L 21
	pushf	
	pop	ax
	mov	word ptr d@w+2076,ax
   ;	
   ;		(*RR1)-=(*RR2);
   ;	
	?debug	L 22
	les	bx,dword ptr [bp+14]
	mov	eax,dword ptr es:[bx]
	les	bx,dword ptr [bp+6]
	sub	dword ptr es:[bx],eax
   ;	
   ;		if (FLA&0x0001) (*RR1)-=1;
   ;	
	?debug	L 23
	test	word ptr d@w+2076,1
	je	short @34@86
	dec	dword ptr es:[bx]
@34@86:
   ;	
   ;	
   ;	
   ;	 }
   ;	
	?debug	L 26
	pop	ds
	pop	bp
	ret	
	?debug	C E603464C41040000021C080D1300035252311F0A+
	?debug	C 0600000A5252315F504C55535F311F0A0A000003+
	?debug	C 5252321F0A0E00000A5252325F504C55535F311F+
	?debug	C 0A120000
	?debug	E
	?debug	E
_SR	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void MR(unsigned long *RR1,unsigned long *RR1_PLUS_1,unsigned long *MN_MN)
   ;	
	?debug	L 27
	assume	cs:DS360WK1_TEXT
_MR	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6054D4E5F4D4E1F0A0E00000A5252315F504C55+
	?debug	C 535F311F0A0A0000035252311F0A060000
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
	?debug	L 37
	mov	word ptr d@w+2106,0
	mov	word ptr d@w+2108,0
   ;	
   ;		if (((signed long)*MN_MN)<0)
   ;	
	?debug	L 38
	les	bx,dword ptr [bp+14]
	cmp	dword ptr es:[bx],large 0
	jge	short @35@86
   ;	
   ;			 {SIGN2=1;
   ;	
	?debug	L 39
	mov	word ptr d@w+2108,1
   ;	
   ;				mn_mn=-(*MN_MN);
   ;	
	?debug	L 40
	mov	eax,dword ptr es:[bx]
	neg	eax
	mov	dword ptr d@w+2086,eax
   ;	
   ;			 }
   ;	
	?debug	L 41
	jmp	short @35@114
@35@86:
   ;	
   ;		else mn_mn=*MN_MN;
   ;	
	?debug	L 42
	les	bx,dword ptr [bp+14]
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+2086,eax
@35@114:
   ;	
   ;		if (((signed long)*RR1_PLUS_1)<0)
   ;	
	?debug	L 43
	les	bx,dword ptr [bp+10]
	cmp	dword ptr es:[bx],large 0
	jge	short @35@170
   ;	
   ;			 {SIGN1=1;
   ;	
	?debug	L 44
	mov	word ptr d@w+2106,1
   ;	
   ;				rr1_plus_1=-(*RR1_PLUS_1);
   ;	
	?debug	L 45
	mov	eax,dword ptr es:[bx]
	neg	eax
	mov	dword ptr d@w+2082,eax
   ;	
   ;			 }
   ;	
	?debug	L 46
	jmp	short @35@198
@35@170:
   ;	
   ;		else
   ;			 {rr1_plus_1=*RR1_PLUS_1;
   ;	
	?debug	L 48
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+2082,eax
@35@198:
   ;	
   ;			 }
   ;					URREZ4  = ((rr1_plus_1) >>16)  * (mn_mn>>16);
   ;	
	?debug	L 50
	mov	eax,dword ptr d@w+2082
	shr	eax,16
	mov	dword ptr [bp-4],eax
	mov	edx,dword ptr d@w+2086
	shr	edx,16
	mov	dword ptr [bp-8],edx
	imul	eax,edx
	mov	dword ptr d@w+2102,eax
   ;	
   ;	
   ;					URREZ   = ((rr1_plus_1) >>16)  * (mn_mn&0xffff);
   ;	
	?debug	L 52
	mov	eax,dword ptr [bp-4]
	mov	edx,dword ptr d@w+2086
	and	edx,large 00000FFFFh
	imul	eax,edx
	mov	dword ptr d@w+2090,eax
   ;	
   ;					URREZ2  = ((rr1_plus_1)&0xffff)* (mn_mn>>16);
   ;	
	?debug	L 53
	mov	eax,dword ptr d@w+2082
	and	eax,large 00000FFFFh
	imul	eax,dword ptr [bp-8]
	mov	dword ptr d@w+2094,eax
   ;	
   ;					URREZ4 += URREZ >>16;
   ;	
	?debug	L 54
	mov	eax,dword ptr d@w+2090
	shr	eax,16
	add	dword ptr d@w+2102,eax
   ;	
   ;					URREZ4 += URREZ2>>16;
   ;	
	?debug	L 55
	mov	eax,dword ptr d@w+2094
	shr	eax,16
	add	dword ptr d@w+2102,eax
   ;	
   ;					URREZ3  = (0xffff&(rr1_plus_1))* (0xffff&(mn_mn));
   ;	
	?debug	L 56
	mov	eax,large 00000FFFFh
	and	eax,dword ptr d@w+2082
	mov	edx,large 00000FFFFh
	and	edx,dword ptr d@w+2086
	imul	eax,edx
	mov	dword ptr d@w+2098,eax
   ;	
   ;					URREZ   = (0xffff&URREZ)+(0xffff&URREZ2)+(URREZ3>>16);
   ;	
	?debug	L 57
	shr	eax,16
	mov	edx,large 00000FFFFh
	and	edx,dword ptr d@w+2090
	mov	ebx,large 00000FFFFh
	and	ebx,dword ptr d@w+2094
	add	edx,ebx
	add	edx,eax
	mov	dword ptr d@w+2090,edx
   ;	
   ;					rr1     = URREZ4+(URREZ>>16);
   ;	
	?debug	L 58
	mov	eax,dword ptr d@w+2090
	shr	eax,16
	mov	edx,dword ptr d@w+2102
	add	edx,eax
	mov	dword ptr d@w+2078,edx
   ;	
   ;					rr1_plus_1=(URREZ<<16)+(URREZ3&0xffff);
   ;	
	?debug	L 59
	mov	eax,dword ptr d@w+2090
	shl	eax,16
	mov	edx,dword ptr d@w+2098
	and	edx,large 00000FFFFh
	add	eax,edx
	mov	dword ptr d@w+2082,eax
   ;	
   ;		if ( ((SIGN1==0) && (SIGN2==1)) ||
   ;	
	?debug	L 60
   ;	
   ;				 ((SIGN1==1) && (SIGN2==0))
   ;			 )
   ;	
	?debug	L 62
	cmp	word ptr d@w+2106,0
	jne	short @35@254
	cmp	word ptr d@w+2108,1
	je	short @35@310
@35@254:
	cmp	word ptr d@w+2106,1
	jne	short @35@338
	cmp	word ptr d@w+2108,0
	jne	short @35@338
@35@310:
   ;	
   ;			 {*RR1=0;*RR1_PLUS_1=0;
   ;	
	?debug	L 63
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx],large 0
	les	bx,dword ptr [bp+10]
	mov	dword ptr es:[bx],large 0
   ;	
   ;				SR(RR1,RR1_PLUS_1,&rr1,&rr1_plus_1);
   ;	
	?debug	L 64
	push	ds
	push	offset d@w+2082
	push	ds
	push	offset d@w+2078
	push	word ptr [bp+12]
	push	bx
	push	dword ptr [bp+6]
	push	cs
	call	near ptr _SR
	add	sp,16
   ;	
   ;			 }
   ;	
	?debug	L 65
	pop	ds
	leave	
	ret	
@35@338:
   ;	
   ;		else
   ;			 {*RR1=rr1;*RR1_PLUS_1=rr1_plus_1;
   ;	
	?debug	L 67
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr d@w+2078
	mov	dword ptr es:[bx],eax
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr d@w+2082
	mov	dword ptr es:[bx],eax
   ;	
   ;			 }
   ;	 }
   ;	
	?debug	L 69
	pop	ds
	leave	
	ret	
	?debug	C E6055349474E32040000023C080D240005534947+
	?debug	C 4E31040000023A080D240006555252455A340C00+
	?debug	C 000236080D230006555252455A330C0000023208+
	?debug	C 0D220006555252455A320C0000022E080D210005+
	?debug	C 555252455A0C0000022A080D2000056D6E5F6D6E+
	?debug	C 0C00000226080D1F000A7272315F706C75735F31+
	?debug	C 0C00000222080D1E00037272310C0000021E080D+
	?debug	C 1D00035252311F0A0600000A5252315F504C5553+
	?debug	C 5F311F0A0A0000054D4E5F4D4E1F0A0E0000
	?debug	E
	?debug	E
_MR	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	10 dup (0)
	db	10 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void DR(unsigned long *RR1,unsigned long *RR1_PLUS_1,unsigned long *DEL_DEL)
   ;	
	?debug	L 70
	assume	cs:DS360WK1_TEXT
_DR	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E60744454C5F44454C1F0A0E00000A5252315F50+
	?debug	C 4C55535F311F0A0A0000035252311F0A060000
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
	?debug	L 84
	mov	word ptr d@w+2122,0
	mov	word ptr d@w+2124,0
   ;	
   ;		 if (((signed long)*DEL_DEL)<0)
   ;	
	?debug	L 85
	les	bx,dword ptr [bp+14]
	cmp	dword ptr es:[bx],large 0
	jge	short @36@86
   ;	
   ;			 {SIGN2=1;
   ;	
	?debug	L 86
	mov	word ptr d@w+2124,1
   ;	
   ;				del_del=-(*DEL_DEL);
   ;	
	?debug	L 87
	mov	eax,dword ptr es:[bx]
	neg	eax
	mov	dword ptr d@w+2118,eax
   ;	
   ;			 }
   ;	
	?debug	L 88
	jmp	short @36@114
@36@86:
   ;	
   ;		 else del_del=*DEL_DEL;
   ;	
	?debug	L 89
	les	bx,dword ptr [bp+14]
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+2118,eax
@36@114:
   ;	
   ;		 if (del_del==0l)
   ;	
	?debug	L 90
	cmp	dword ptr d@w+2118,large 0
	jne	short @36@170
   ;	
   ;			{RETURN=1;RQ_PRG=0x0009;return;
   ;	
	?debug	L 91
	mov	word ptr _RETURN,1
	mov	word ptr _RQ_PRG,9
	pop	ds
	leave	
	ret	
@36@170:
   ;	
   ;			}
   ;		 if ((*RR1)&0x80000000)
   ;	
	?debug	L 93
	les	bx,dword ptr [bp+6]
	test	dword ptr es:[bx],large 080000000h
	je	short @36@226
   ;	
   ;			 {SIGN1=1;
   ;	
	?debug	L 94
	mov	word ptr d@w+2122,1
   ;	
   ;				rr1=0;rr1_plus_1=0;
   ;	
	?debug	L 95
	mov	dword ptr d@w+2110,large 0
	mov	dword ptr d@w+2114,large 0
   ;	
   ;				SR(&rr1,&rr1_plus_1,RR1,RR1_PLUS_1);
   ;	
	?debug	L 96
	push	dword ptr [bp+10]
	push	word ptr [bp+8]
	push	bx
	push	ds
	push	offset d@w+2114
	push	ds
	push	offset d@w+2110
	push	cs
	call	near ptr _SR
	add	sp,16
   ;	
   ;			 }
   ;	
	?debug	L 97
	jmp	short @36@254
@36@226:
   ;	
   ;		 else
   ;			 {rr1=*RR1;rr1_plus_1=*RR1_PLUS_1;
   ;	
	?debug	L 99
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+2110,eax
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr es:[bx]
	mov	dword ptr d@w+2114,eax
@36@254:
   ;	
   ;			 }
   ;		 if (rr1==0)
   ;	
	?debug	L 101
	cmp	dword ptr d@w+2110,large 0
	jne	short @36@310
   ;	
   ;			{
   ;			 rr1=rr1_plus_1%del_del;
   ;	
	?debug	L 103
	mov	eax,dword ptr d@w+2114
	xor	edx,edx
	div	dword ptr d@w+2118
	mov	dword ptr d@w+2110,edx
   ;	
   ;			 rr1_plus_1/=del_del;
   ;	
	?debug	L 104
	mov	eax,dword ptr d@w+2114
	xor	edx,edx
	div	dword ptr d@w+2118
	mov	dword ptr d@w+2114,eax
   ;	
   ;			}
   ;	
	?debug	L 105
	jmp	@36@534
@36@310:
   ;	
   ;		 else
   ;	
   ;			{
   ;			 F_R1_R2=((long double)rr1)/(long double)del_del*4096.0*4096.0*256.0+
   ;	
	?debug	L 109
   ;	
   ;							 ((long double)rr1_plus_1)/(long double)del_del;
   ;	
	?debug	L 110
	mov	eax,dword ptr d@w+2110
	mov	dword ptr [bp-8],eax
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	fild	qword ptr [bp-8]
	mov	eax,dword ptr d@w+2118
	mov	dword ptr [bp-8],eax
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	fild	qword ptr [bp-8]
	fdiv	
	fmul	dword ptr s@+1068
	fmul	dword ptr s@+1068
	fmul	dword ptr s@+1072
	mov	eax,dword ptr d@w+2114
	mov	dword ptr [bp-8],eax
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	fild	qword ptr [bp-8]
	mov	eax,dword ptr d@w+2118
	mov	dword ptr [bp-8],eax
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	fild	qword ptr [bp-8]
	fdiv	
	fadd	
	fstp	tbyte ptr d@w+2126
   ;	
   ;			 if (F_R1_R2>((long double)0x7fffffffl))
   ;	
	?debug	L 111
	fld	tbyte ptr d@w+2126
	fld	tbyte ptr s@+1076
	fcompp
	fstsw	ax
	sahf	
	jae	short @36@366
   ;	
   ;				 {
   ;					RETURN=1;RQ_PRG=0x0009;return;
   ;	
	?debug	L 113
	mov	word ptr _RETURN,1
	mov	word ptr _RQ_PRG,9
	pop	ds
	leave	
	ret	
@36@366:
   ;	
   ;				 }
   ;			 r0_plus_1=F_R1_R2;r0=0;
   ;	
	?debug	L 115
	fld	tbyte ptr d@w+2126
	call	far ptr F_FTOL@
	shl	eax,16
	shrd	eax,edx,16
	mov	dword ptr d@w+2150,eax
	mov	dword ptr d@w+2146,large 0
   ;	
   ;			 if (r0_plus_1>0) r0_plus_1--;
   ;	
	?debug	L 116
	cmp	dword ptr d@w+2150,large 0
	jbe	short @36@422
	dec	dword ptr d@w+2150
@36@422:
   ;	
   ;			 r2=r0;r2_plus_1=r0_plus_1;
   ;	
	?debug	L 117
	mov	eax,dword ptr d@w+2146
	mov	dword ptr d@w+2154,eax
	mov	eax,dword ptr d@w+2150
	mov	dword ptr d@w+2158,eax
   ;	
   ;			 MR(&r2,&r2_plus_1,&del_del);
   ;	
	?debug	L 118
	push	ds
	push	offset d@w+2118
	push	ds
	push	offset d@w+2158
	push	ds
	push	offset d@w+2154
	push	cs
	call	near ptr _MR
	add	sp,12
   ;	
   ;			 SR(&r2,&r2_plus_1,&rr1,&rr1_plus_1);
   ;	
	?debug	L 119
	push	ds
	push	offset d@w+2114
	push	ds
	push	offset d@w+2110
	push	ds
	push	offset d@w+2158
	push	ds
	push	offset d@w+2154
	push	cs
	call	near ptr _SR
	add	sp,16
   ;	
   ;			 if (r2&0x80000000)
   ;	
	?debug	L 120
	test	dword ptr d@w+2154,large 080000000h
	je	short @36@478
   ;	
   ;				 {
   ;					r3=0;r3_plus_1=0;
   ;	
	?debug	L 122
	mov	dword ptr d@w+2162,large 0
	mov	dword ptr d@w+2166,large 0
   ;	
   ;					SR(&r3,&r3_plus_1,&r2,&r2_plus_1);
   ;	
	?debug	L 123
	push	ds
	push	offset d@w+2158
	push	ds
	push	offset d@w+2154
	push	ds
	push	offset d@w+2166
	push	ds
	push	offset d@w+2162
	push	cs
	call	near ptr _SR
	add	sp,16
   ;	
   ;				 }
   ;	
	?debug	L 124
	jmp	short @36@506
@36@478:
   ;	
   ;			 else
   ;				 {r3=r2;r3_plus_1=r2_plus_1;
   ;	
	?debug	L 126
	mov	eax,dword ptr d@w+2154
	mov	dword ptr d@w+2162,eax
	mov	eax,dword ptr d@w+2158
	mov	dword ptr d@w+2166,eax
@36@506:
   ;	
   ;				 }
   ;			 rr1_plus_1=r0_plus_1+r3_plus_1/del_del;
   ;	
	?debug	L 128
	mov	eax,dword ptr d@w+2166
	xor	edx,edx
	div	dword ptr d@w+2118
	mov	edx,dword ptr d@w+2150
	add	edx,eax
	mov	dword ptr d@w+2114,edx
   ;	
   ;			 rr1=r3_plus_1%del_del;
   ;	
	?debug	L 129
	mov	eax,dword ptr d@w+2166
	xor	edx,edx
	div	dword ptr d@w+2118
	mov	dword ptr d@w+2110,edx
@36@534:
   ;	
   ;			}
   ;	
   ;		 if ( ((SIGN1==0) && (SIGN2==0)))
   ;	
	?debug	L 132
	cmp	word ptr d@w+2122,0
	jne	short @36@618
	cmp	word ptr d@w+2124,0
	jne	short @36@618
   ;	
   ;			 {*RR1=rr1;*RR1_PLUS_1=rr1_plus_1;
   ;	
	?debug	L 133
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr d@w+2110
	mov	dword ptr es:[bx],eax
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr d@w+2114
	mov	dword ptr es:[bx],eax
   ;	
   ;			 }
   ;	
	?debug	L 134
	pop	ds
	leave	
	ret	
@36@618:
   ;	
   ;		 else if ( ((SIGN1==0) && (SIGN2==1)))
   ;	
	?debug	L 135
	cmp	word ptr d@w+2122,0
	jne	short @36@702
	cmp	word ptr d@w+2124,1
	jne	short @36@702
   ;	
   ;						{*RR1=rr1;*RR1_PLUS_1=-rr1_plus_1;
   ;	
	?debug	L 136
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr d@w+2110
	mov	dword ptr es:[bx],eax
	mov	eax,dword ptr d@w+2114
	neg	eax
	les	bx,dword ptr [bp+10]
	mov	dword ptr es:[bx],eax
   ;	
   ;						}
   ;	
	?debug	L 137
	pop	ds
	leave	
	ret	
@36@702:
   ;	
   ;					else if ( ((SIGN1==1) && (SIGN2==0)))
   ;	
	?debug	L 138
	cmp	word ptr d@w+2122,1
	jne	short @36@786
	cmp	word ptr d@w+2124,0
	jne	short @36@786
   ;	
   ;								 {*RR1=-rr1;*RR1_PLUS_1=rr1_plus_1;
   ;	
	?debug	L 139
	mov	eax,dword ptr d@w+2110
	neg	eax
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx],eax
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr d@w+2114
	mov	dword ptr es:[bx],eax
   ;	
   ;								 }
   ;	
	?debug	L 140
	pop	ds
	leave	
	ret	
@36@786:
   ;	
   ;							 else
   ;								 {*RR1=-rr1;*RR1_PLUS_1=rr1_plus_1;
   ;	
	?debug	L 142
	mov	eax,dword ptr d@w+2110
	neg	eax
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx],eax
	les	bx,dword ptr [bp+10]
	mov	eax,dword ptr d@w+2114
	mov	dword ptr es:[bx],eax
   ;	
   ;								 }
   ;	
   ;		}
   ;	
	?debug	L 145
	pop	ds
	leave	
	ret	
	?debug	C E60972335F706C75735F310C00000276080D5300+
	?debug	C 0272330C00000272080D52000972325F706C7573+
	?debug	C 5F310C0000026E080D51000272320C0000026A08+
	?debug	C 0D50000972305F706C75735F310C00000266080D+
	?debug	C 4F000272300C00000262080D4E0009465F44454C+
	?debug	C 5F44454C1000000258080D4D0007465F52315F52+
	?debug	C 32100000024E080D4C00055349474E3204000002+
	?debug	C 4C080D4B00055349474E31040000024A080D4B00+
	?debug	C 0764656C5F64656C0C00000246080D4A000A7272+
	?debug	C 315F706C75735F310C00000242080D4900037272+
	?debug	C 310C0000023E080D4800035252311F0A0600000A+
	?debug	C 5252315F504C55535F311F0A0A00000744454C5F+
	?debug	C 44454C1F0A0E0000
	?debug	E
	?debug	E
_DR	endp
   ;	
   ;	void SET_CC_BY_SIGN(long OP)
   ;	
	?debug	L 148
	assume	cs:DS360WK1_TEXT
_SET_CC_BY_SIGN	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E6024F50060A060000
	?debug	B
   ;	
   ;	{if(OP==0) PSW_CC=0;
   ;	
	?debug	L 149
	cmp	dword ptr [bp+6],large 0
	jne	short @37@86
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@37@86:
   ;	
   ;	 else if (OP<0) PSW_CC=1;
   ;	
	?debug	L 150
	cmp	dword ptr [bp+6],large 0
	jge	short @37@142
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@37@142:
   ;	
   ;	       else PSW_CC=2;
   ;	
	?debug	L 151
	mov	byte ptr _PSW_CC,2
   ;	
   ;	}
   ;	
	?debug	L 152
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
	?debug	L 153
	assume	cs:DS360WK1_TEXT
_SET_CC	proc	far
	?debug	B
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;	{
   ;	
   ;	 asm sahf;
   ;	
	?debug	L 156
 	sahf	
   ;	
   ;	 asm jno NOPR;
   ;	
	?debug	L 157
	jno	short @38@114
   ;	
   ;	 PSW_CC=3;goto EXIT;
   ;	
	?debug	L 158
	mov	byte ptr _PSW_CC,3
	pop	ds
	ret	
@38@114:
   ;	
   ;	NOPR:
   ;	 asm jnz NOZERRO;
   ;	
	?debug	L 160
	jne	short @38@170
   ;	
   ;	 PSW_CC=0;goto EXIT;
   ;	
	?debug	L 161
	mov	byte ptr _PSW_CC,0
	pop	ds
	ret	
@38@170:
   ;	
   ;	NOZERRO:
   ;	 asm jl MINUS;
   ;	
	?debug	L 163
	jl	short @38@226
   ;	
   ;	 PSW_CC=2;goto EXIT;
   ;	
	?debug	L 164
	mov	byte ptr _PSW_CC,2
	pop	ds
	ret	
@38@226:
   ;	
   ;	MINUS:
   ;	 PSW_CC=1;
   ;	
	?debug	L 166
	mov	byte ptr _PSW_CC,1
   ;	
   ;	EXIT:;
   ;	
   ;	}
   ;	
	?debug	L 169
	pop	ds
	ret	
	?debug	E
	?debug	E
_SET_CC	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
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
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	10 dup (0)
	db	10 dup (0)
	db	10 dup (0)
	db	10 dup (0)
	db	2 dup (0)
	?debug	C E989A60F1D09445333363053522E43
	?debug	C E989A60F1D09445333363053522E43
	?debug	C E9BAAEFE1C0A4453333630414C522E43
	?debug	C E9BAAEFE1C0A4453333630414C522E43
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
	?debug	L 170
	assume	cs:DS360WK1_TEXT
_CODE10	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
	?debug	L 202
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2170,al
 	ror	 ax,4
	mov	byte ptr d@w+2172,al
 	shr	 ax,12
	mov	byte ptr d@w+2174,al
	?debug	L 203
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
	?debug	L 204
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	sub	ax,16
	mov	bx,ax
	cmp	bx,15
	jbe short	@@192
	jmp	@39@2382
@@192:
	shl	bx,1
	jmp	word ptr cs:@39@C2754[bx]
@39@254:
	?debug	L 212
	mov	bx,word ptr d@w+2174
	shl	bx,2
	cmp	dword ptr _R[bx],large 080000000h
	jne	short @39@338
	?debug	L 213
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	dword ptr _R[bx],eax
	mov	byte ptr _PSW_CC,3
	?debug	L 214
	push	cs
	call	near ptr _T
	?debug	L 215
	test	byte ptr _PSW_PRG_MASK,8
	jne short	@@193
	jmp	@39@2382
@@193:
	mov	word ptr _RQ_PRG,8
	mov	word ptr _RETURN,1
	push	ds
	push	offset s@+1086
	call	far ptr _printf
	add	sp,4
	pop	ds
	pop	bp
	ret	
@39@338:
	?debug	L 219
	mov	bx,word ptr d@w+2174
	shl	bx,2
	test	dword ptr _R[bx],large 080000000h
	je	short @39@394
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	neg	eax
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	dword ptr _R[bx],eax
	jmp	short @39@422
@39@394:
	?debug	L 220
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	dword ptr _R[bx],eax
@39@422:
	?debug	L 221
	mov	bx,word ptr d@w+2172
	shl	bx,2
	cmp	dword ptr _R[bx],large 0
	je	short @39@478
	mov	byte ptr _PSW_CC,2
	pop	ds
	pop	bp
	ret	
@39@478:
	?debug	L 222
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@39@506:
	?debug	L 236
	mov	bx,word ptr d@w+2174
	shl	bx,2
	test	dword ptr _R[bx],large 080000000h
	je	short @39@562
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	dword ptr _R[bx],eax
	jmp	short @39@590
@39@562:
	?debug	L 237
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	neg	eax
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	dword ptr _R[bx],eax
@39@590:
	?debug	L 238
	mov	bx,word ptr d@w+2172
	shl	bx,2
	cmp	dword ptr _R[bx],large 0
	je	short @39@646
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@39@646:
	?debug	L 239
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@39@674:
	?debug	L 252
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	dword ptr _R[bx],eax
	cmp	eax,large 0
	je	short @39@786
	?debug	L 253
	pushf	
	pop	ax
	mov	word ptr d@w+2200,ax
	?debug	L 254
	test	word ptr d@w+2200,128
	je	short @39@758
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@39@758:
	?debug	L 255
	mov	byte ptr _PSW_CC,2
	pop	ds
	pop	bp
	ret	
@39@786:
	?debug	L 257
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@39@814:
	?debug	L 273
	mov	bx,word ptr d@w+2174
	shl	bx,2
	cmp	dword ptr _R[bx],large 080000000h
	jne	short @39@898
	?debug	L 274
	mov	byte ptr _PSW_CC,3
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	dword ptr _R[bx],eax
	?debug	L 275
	push	cs
	call	near ptr _T
	?debug	L 276
	test	byte ptr _PSW_PRG_MASK,8
	jne short	@@194
	jmp	@39@2382
@@194:
	mov	word ptr _RQ_PRG,8
	mov	word ptr _RETURN,1
	push	ds
	push	offset s@+1086
	call	far ptr _printf
	add	sp,4
	pop	ds
	pop	bp
	ret	
@39@898:
	?debug	L 280
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	neg	eax
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	dword ptr _R[bx],eax
	?debug	L 281
	mov	bx,word ptr d@w+2172
	shl	bx,2
	push	dword ptr _R[bx]
	push	cs
	call	near ptr _SET_CC_BY_SIGN
	add	sp,4
	pop	ds
	pop	bp
	ret	
@39@926:
	?debug	L 296
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2172
	shl	bx,2
	and	dword ptr _R[bx],eax
	mov	eax,dword ptr _R[bx]
	cmp	eax,large 0
	je	short @39@982
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@39@982:
	?debug	L 297
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@39@1010:
	?debug	L 314
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2174
	shl	bx,2
	cmp	eax,dword ptr _R[bx]
	jne	short @39@1066
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@39@1066:
	?debug	L 315
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2174
	shl	bx,2
	cmp	eax,dword ptr _R[bx]
	jae	short @39@1122
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@39@1122:
	?debug	L 316
	mov	byte ptr _PSW_CC,2
	pop	ds
	pop	bp
	ret	
@39@1150:
	?debug	L 320
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2172
	shl	bx,2
	or	dword ptr _R[bx],eax
	mov	eax,dword ptr _R[bx]
	cmp	eax,large 0
	je	short @39@1206
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@39@1206:
	?debug	L 321
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@39@1234:
	?debug	L 325
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2172
	shl	bx,2
	xor	dword ptr _R[bx],eax
	mov	eax,dword ptr _R[bx]
	cmp	eax,large 0
	je	short @39@1290
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@39@1290:
	?debug	L 326
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@39@1318:
	?debug	L 331
	push	cs
	call	near ptr _T
	?debug	L 332
	pop	ds
	pop	bp
	ret	
@39@1346:
	?debug	L 342
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2174
	shl	bx,2
	cmp	eax,dword ptr _R[bx]
	jne	short @39@1402
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@39@1402:
	?debug	L 349
	mov	bx,word ptr d@w+2172
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2174
	shl	bx,2
	cmp	eax,dword ptr _R[bx]
	jge	short @39@1458
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@39@1458:
	?debug	L 350
	mov	byte ptr _PSW_CC,2
	pop	ds
	pop	bp
	ret	
@39@1486:
	?debug	L 354
	mov	ax,word ptr d@w+2172
	shl	ax,2
	add	ax,offset _R
	mov	word ptr d@w+2184+2,ds
	mov	word ptr d@w+2184,ax
	?debug	L 355
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	les	bx,dword ptr d@w+2184
	add	dword ptr es:[bx],eax
	?debug	C E80E09445333363053522E4389A60F1D
	?debug	L 2
	pushf	
	pop	ax
	mov	word ptr d@w+2200,ax
	?debug	L 3
	test	word ptr d@w+2200,64
	je	short @39@1542
	mov	byte ptr _PSW_CC,0
	jmp	short @39@1626
@39@1542:
	?debug	L 5
	test	word ptr d@w+2200,128
	je	short @39@1598
	mov	byte ptr _PSW_CC,1
	jmp	short @39@1626
@39@1598:
	?debug	L 6
	mov	byte ptr _PSW_CC,2
@39@1626:
	?debug	L 8
	test	word ptr d@w+2200,2048
	jne short	@@195
	jmp	@39@2382
@@195:
	?debug	L 9
	mov	byte ptr _PSW_CC,3
	?debug	L 11
	test	byte ptr _PSW_PRG_MASK,8
	jne short	@@196
	jmp	@39@2382
@@196:
	mov	word ptr _RQ_PRG,8
	mov	word ptr _RETURN,1
	push	ds
	push	offset s@+1086
	call	far ptr _printf
	add	sp,4
	pop	ds
	pop	bp
	ret	
@39@1710:
	?debug	C E80D
	?debug	L 360
	mov	ax,word ptr d@w+2172
	shl	ax,2
	add	ax,offset _R
	mov	word ptr d@w+2184+2,ds
	mov	word ptr d@w+2184,ax
	?debug	L 361
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	neg	eax
	les	bx,dword ptr d@w+2184
	add	dword ptr es:[bx],eax
	?debug	C E80F09445333363053522E4389A60F1D
	?debug	L 2
	pushf	
	pop	ax
	mov	word ptr d@w+2200,ax
	?debug	L 3
	test	word ptr d@w+2200,64
	je	short @39@1766
	mov	byte ptr _PSW_CC,0
	jmp	short @39@1850
@39@1766:
	?debug	L 5
	test	word ptr d@w+2200,128
	je	short @39@1822
	mov	byte ptr _PSW_CC,1
	jmp	short @39@1850
@39@1822:
	?debug	L 6
	mov	byte ptr _PSW_CC,2
@39@1850:
	?debug	L 8
	test	word ptr d@w+2200,2048
	jne short	@@197
	jmp	@39@2382
@@197:
	?debug	L 9
	mov	byte ptr _PSW_CC,3
	?debug	L 11
	test	byte ptr _PSW_PRG_MASK,8
	jne short	@@198
	jmp	@39@2382
@@198:
	mov	word ptr _RQ_PRG,8
	mov	word ptr _RETURN,1
	push	ds
	push	offset s@+1086
	call	far ptr _printf
	add	sp,4
	pop	ds
	pop	bp
	ret	
@39@1934:
	?debug	C E80D
	?debug	L 369
	and	word ptr d@w+2172,254
	?debug	L 370
	mov	ax,word ptr d@w+2174
	shl	ax,2
	add	ax,offset _R
	push	ds
	push	ax
	mov	ax,word ptr d@w+2172
	shl	ax,2
	add	ax,offset _R+4
	push	ds
	push	ax
	mov	ax,word ptr d@w+2172
	shl	ax,2
	add	ax,offset _R
	push	ds
	push	ax
	push	cs
	call	near ptr _MR
	add	sp,12
	?debug	L 372
	pop	ds
	pop	bp
	ret	
@39@1962:
	?debug	L 378
	and	word ptr d@w+2172,254
	?debug	L 379
	mov	ax,word ptr d@w+2174
	shl	ax,2
	add	ax,offset _R
	push	ds
	push	ax
	mov	ax,word ptr d@w+2172
	shl	ax,2
	add	ax,offset _R+4
	push	ds
	push	ax
	mov	ax,word ptr d@w+2172
	shl	ax,2
	add	ax,offset _R
	push	ds
	push	ax
	push	cs
	call	near ptr _DR
	add	sp,12
	?debug	L 381
	pop	ds
	pop	bp
	ret	
@39@1990:
	?debug	L 394
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2172
	shl	bx,2
	add	dword ptr _R[bx],eax
	?debug	C E8100A4453333630414C522E43BAAEFE1C
	?debug	L 1
	pushf	
	pop	ax
	mov	word ptr d@w+2200,ax
	?debug	L 5
	test	word ptr d@w+2200,64
	je	short @39@2102
	?debug	L 6
	test	word ptr d@w+2200,1
	je	short @39@2074
	mov	byte ptr _PSW_CC,2
	pop	ds
	pop	bp
	ret	
@39@2074:
	?debug	L 7
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@39@2102:
	?debug	L 10
	test	word ptr d@w+2200,1
	je	short @39@2158
	mov	byte ptr _PSW_CC,3
	pop	ds
	pop	bp
	ret	
@39@2158:
	?debug	L 11
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@39@2186:
	?debug	C E80D
	?debug	L 410
	mov	bx,word ptr d@w+2174
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	neg	eax
	mov	bx,word ptr d@w+2172
	shl	bx,2
	add	dword ptr _R[bx],eax
	?debug	C E8110A4453333630414C522E43BAAEFE1C
	?debug	L 1
	pushf	
	pop	ax
	mov	word ptr d@w+2200,ax
	?debug	L 5
	test	word ptr d@w+2200,64
	je	short @39@2298
	?debug	L 6
	test	word ptr d@w+2200,1
	je	short @39@2270
	mov	byte ptr _PSW_CC,2
	pop	ds
	pop	bp
	ret	
@39@2270:
	?debug	L 7
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@39@2298:
	?debug	L 10
	test	word ptr d@w+2200,1
	je	short @39@2354
	mov	byte ptr _PSW_CC,3
	pop	ds
	pop	bp
	ret	
@39@2354:
	?debug	L 11
	mov	byte ptr _PSW_CC,1
@39@2382:
	?debug	C E80D
	?debug	L 415
	pop	ds
	pop	bp
	ret	
	?debug	C E6067073775F636304000002DE080DC50004465F+
	?debug	C 573410000002D4080DC40004465F573310000002+
	?debug	C CA080DC30004465F573210000002C0080DC20004+
	?debug	C 465F573110000002B6080DC10006414452455353+
	?debug	C 0C000002B2080DC00009555252455A5F414C520C+
	?debug	C 000002AE080DBF0005555252455A0C000002AA08+
	?debug	C 0DBE0006555252455A330C000002A6080DBD0006+
	?debug	C 555252455A320C000002A2080DBC00045252455A+
	?debug	C 060000029E080DBB000352455A190000029A080D+
	?debug	C BA0003464C410A00000298080DB8000455525232+
	?debug	C 1F00000294080DB70004555252311F0000029008+
	?debug	C 0DB60003525232190000028C080DB50003525231+
	?debug	C 1900000288080DB400034444440A00000286080D+
	?debug	C B2000244440800000285080DB100024244080000+
	?debug	C 0284080DB0000249530400000282080DAD000242+
	?debug	C 320400000280080DAD00025232040000027E080D+
	?debug	C AD00025231040000027C080DAD00025258080000+
	?debug	C 027B080DAC00025252080000027A080DAB000343+
	?debug	C 4F4D180A060000
	?debug	E
	?debug	E
_CODE10	endp
@39@C2754	label	word
	dw	@39@254
	dw	@39@506
	dw	@39@674
	dw	@39@814
	dw	@39@926
	dw	@39@1010
	dw	@39@1150
	dw	@39@1234
	dw	@39@1318
	dw	@39@1346
	dw	@39@1486
	dw	@39@1710
	dw	@39@1934
	dw	@39@1962
	dw	@39@1990
	dw	@39@2186
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE18(char far *COM)
   ;	
	?debug	L 421
	assume	cs:DS360WK1_TEXT
_CODE18	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
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
	?debug	L 431
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2272,al
 	ror	 ax,4
	mov	byte ptr d@w+2274,al
 	shr	 ax,12
	mov	byte ptr d@w+2276,al
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 432
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 R[R1]=R[R2];         /* LR */
   ;	
	?debug	L 433
	mov	bx,word ptr d@w+2276
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2274
	shl	bx,2
	mov	dword ptr _R[bx],eax
   ;	
   ;	}
   ;	
	?debug	L 434
	pop	ds
	pop	bp
	ret	
	?debug	C E602495304000002E8080DA80102423204000002+
	?debug	C E6080DA80102523204000002E4080DA801025231+
	?debug	C 04000002E2080DA80102525808000002E1080DA7+
	?debug	C 0102525208000002E0080DA60103434F4D180A06+
	?debug	C 0000
	?debug	E
	?debug	E
_CODE18	endp
	?debug	C E91D0529230A44533336304344342E43
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
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
	db	20 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	8 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	?debug	C E989A60F1D09445333363053522E43
	?debug	C E989A60F1D09445333363053522E43
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
	?debug	C E8120A44533336304344342E431D052923
	?debug	L 14
	assume	cs:DS360WK1_TEXT
_CODE40	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,2
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
	?debug	L 47
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2283,al
 	ror	 ax,4
	mov	byte ptr d@w+2284,al
 	shr	 ax,12
	mov	byte ptr d@w+2286,al
	or	al,al
	je	short @41@198
	mov	bx,ax
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2322,eax
	jmp	short @41@226
@41@198:
	mov	dword ptr d@w+2322,large 0
@41@226:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @41@394
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	add	dword ptr d@w+2322,eax
	jmp	short @41@450
@41@394:
 	ror	 ax,8
	movzx	eax,ax
	add	dword ptr d@w+2322,eax
@41@450:
	?debug	L 48
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
	?debug	L 49
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-1],al
	mov	ah,0
	sub	ax,64
	mov	bx,ax
	cmp	bx,15
	jbe short	@@199
	jmp	@41@2662
@@199:
	shl	bx,1
	jmp	word ptr cs:@41@C2546[bx]
@41@562:
	?debug	L 57
	test	word ptr d@w+2322,1
	je	short @41@618
	?debug	L 58
	mov	word ptr _RQ_PRG,6
	?debug	L 59
	mov	word ptr _RETURN,1
	?debug	L 60
	pop	ds
	leave	
	ret	
@41@618:
	?debug	L 62
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	ax,word ptr _R[bx]
	mov	word ptr d@w+2298,ax
	?debug	L 63
	shr	ax,8
	push	ax
	push	dword ptr d@w+2322
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
	?debug	L 65
	les	bx,dword ptr _POINTER_T
	mov	al,byte ptr d@w+2298
	mov	byte ptr es:[bx+1],al
	?debug	L 68
	pop	ds
	leave	
	ret	
@41@646:
	?debug	L 76
	push	cs
	call	near ptr _T
	?debug	L 77
	pop	ds
	leave	
	ret	
@41@674:
	?debug	L 85
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	al,byte ptr _R[bx]
	push	ax
	push	dword ptr d@w+2322
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
	?debug	L 87
	pop	ds
	leave	
	ret	
@41@702:
	?debug	L 101
	push	dword ptr d@w+2322
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	edx,large -256
	and	edx,dword ptr _R[bx]
	or	edx,eax
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	dword ptr _R[bx],edx
	?debug	L 104
	pop	ds
	leave	
	ret	
@41@730:
	?debug	L 110
	push	6
	push	ds
	push	offset d@w+2360
	push	dword ptr d@w+2322
	push	cs
	call	near ptr _MOVE_360_TO_MEM
	add	sp,10
	?debug	L 111
	cmp	word ptr _RETURN,0
	je	short @41@786
	pop	ds
	leave	
	ret	
@41@786:
	?debug	L 112
	cmp	byte ptr d@w+2360,68
	jne	short @41@842
	mov	word ptr _RQ_PRG,3
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@41@842:
	?debug	L 113
	cmp	word ptr d@w+2284,0
	je	short @41@898
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	al,255
	and	al,byte ptr _R[bx]
	or	al,byte ptr d@w+2360+1
	mov	byte ptr d@w+2360+1,al
@41@898:
	?debug	L 121
	mov	word ptr _PSW_ILC,0
	?debug	L 123
	push	ds
	push	offset d@w+2360
	mov	al,byte ptr d@w+2360
	mov	ah,0
	shl	ax,2
	mov	bx,ax
	call	dword ptr _POINT[bx]
	add	sp,4
	?debug	L 124
	mov	word ptr _PSW_ILC,2
	?debug	L 126
	pop	ds
	leave	
	ret	
@41@926:
	?debug	L 135
	push	cs
	call	near ptr _T
	?debug	L 136
	pop	ds
	leave	
	ret	
@41@954:
	?debug	L 142
	mov	bx,word ptr d@w+2284
	shl	bx,2
	dec	dword ptr _R[bx]
	jne short	@@200
	jmp	@41@2662
@@200:
	?debug	L 143
	mov	eax,dword ptr d@w+2322
	and	eax,large 000FFFFFEh
	mov	dword ptr _PSW_ADRESS,eax
	pop	ds
	leave	
	ret	
@41@1010:
	?debug	L 152
	push	cs
	call	near ptr _T
	?debug	L 153
	pop	ds
	leave	
	ret	
@41@1038:
	?debug	L 166
	push	cs
	call	near ptr _T
	?debug	L 167
	pop	ds
	leave	
	ret	
@41@1066:
	?debug	L 174
	test	word ptr d@w+2322,1
	je	short @41@1122
	?debug	L 175
	mov	word ptr _RQ_PRG,6
	?debug	L 176
	mov	word ptr _RETURN,1
	?debug	L 177
	pop	ds
	leave	
	ret	
@41@1122:
	?debug	L 179
	?debug	L 180
	push	dword ptr d@w+2322
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	shl	eax,8
	push	eax
	mov	eax,dword ptr d@w+2322
	inc	eax
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	pop	edx
	or	edx,eax
	mov	dword ptr d@w+2326,edx
	?debug	L 182
	test	dword ptr d@w+2326,large 000008000h
	je	short @41@1178
	mov	eax,large 0FFFF0000h
	or	eax,dword ptr d@w+2326
	mov	dword ptr d@w+2326,eax
@41@1178:
	?debug	L 183
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	cmp	eax,dword ptr d@w+2326
	jne	short @41@1234
	mov	byte ptr _PSW_CC,0
	pop	ds
	leave	
	ret	
@41@1234:
	?debug	L 185
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	cmp	eax,dword ptr d@w+2326
	jge	short @41@1290
	mov	byte ptr _PSW_CC,1
	pop	ds
	leave	
	ret	
@41@1290:
	?debug	L 186
	mov	byte ptr _PSW_CC,2
	pop	ds
	leave	
	ret	
@41@1318:
	?debug	L 195
	test	word ptr d@w+2322,1
	je	short @41@1374
	?debug	L 196
	mov	word ptr _RQ_PRG,6
	?debug	L 197
	mov	word ptr _RETURN,1
	?debug	L 198
	pop	ds
	leave	
	ret	
@41@1374:
	?debug	L 200
	?debug	L 201
	push	dword ptr d@w+2322
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	shl	eax,8
	push	eax
	mov	eax,dword ptr d@w+2322
	inc	eax
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	pop	edx
	or	edx,eax
	mov	dword ptr d@w+2326,edx
	?debug	L 203
	test	dword ptr d@w+2326,large 000008000h
	je	short @41@1430
	mov	eax,large 0FFFF0000h
	or	eax,dword ptr d@w+2326
	mov	dword ptr d@w+2326,eax
@41@1430:
	?debug	L 204
	mov	ax,word ptr d@w+2284
	shl	ax,2
	add	ax,offset _R
	mov	word ptr d@w+2306+2,ds
	mov	word ptr d@w+2306,ax
	?debug	L 205
	les	bx,dword ptr d@w+2306
	mov	eax,dword ptr d@w+2326
	add	dword ptr es:[bx],eax
	?debug	C E81309445333363053522E4389A60F1D
	?debug	L 2
	pushf	
	pop	ax
	mov	word ptr d@w+2374,ax
	?debug	L 3
	test	word ptr d@w+2374,64
	je	short @41@1486
	mov	byte ptr _PSW_CC,0
	jmp	short @41@1570
@41@1486:
	?debug	L 5
	test	word ptr d@w+2374,128
	je	short @41@1542
	mov	byte ptr _PSW_CC,1
	jmp	short @41@1570
@41@1542:
	?debug	L 6
	mov	byte ptr _PSW_CC,2
@41@1570:
	?debug	L 8
	test	word ptr d@w+2374,2048
	jne short	@@201
	jmp	@41@2662
@@201:
	?debug	L 9
	mov	byte ptr _PSW_CC,3
	?debug	L 11
	test	byte ptr _PSW_PRG_MASK,8
	jne short	@@202
	jmp	@41@2662
@@202:
	mov	word ptr _RQ_PRG,8
	mov	word ptr _RETURN,1
	push	ds
	push	offset s@+1086
	call	far ptr _printf
	add	sp,4
	pop	ds
	leave	
	ret	
@41@1654:
	?debug	C E812
	?debug	L 215
	test	word ptr d@w+2322,1
	je	short @41@1710
	?debug	L 216
	mov	word ptr _RQ_PRG,6
	?debug	L 217
	mov	word ptr _RETURN,1
	?debug	L 218
	pop	ds
	leave	
	ret	
@41@1710:
	?debug	L 220
	?debug	L 221
	push	dword ptr d@w+2322
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	shl	eax,8
	push	eax
	mov	eax,dword ptr d@w+2322
	inc	eax
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	pop	edx
	or	edx,eax
	mov	dword ptr d@w+2326,edx
	?debug	L 223
	test	dword ptr d@w+2326,large 000008000h
	je	short @41@1766
	mov	eax,large 0FFFF0000h
	or	eax,dword ptr d@w+2326
	mov	dword ptr d@w+2326,eax
@41@1766:
	?debug	L 224
	mov	ax,word ptr d@w+2284
	shl	ax,2
	add	ax,offset _R
	mov	word ptr d@w+2306+2,ds
	mov	word ptr d@w+2306,ax
	?debug	L 225
	mov	eax,dword ptr d@w+2326
	neg	eax
	les	bx,dword ptr d@w+2306
	add	dword ptr es:[bx],eax
	?debug	C E81409445333363053522E4389A60F1D
	?debug	L 2
	pushf	
	pop	ax
	mov	word ptr d@w+2374,ax
	?debug	L 3
	test	word ptr d@w+2374,64
	je	short @41@1822
	mov	byte ptr _PSW_CC,0
	jmp	short @41@1906
@41@1822:
	?debug	L 5
	test	word ptr d@w+2374,128
	je	short @41@1878
	mov	byte ptr _PSW_CC,1
	jmp	short @41@1906
@41@1878:
	?debug	L 6
	mov	byte ptr _PSW_CC,2
@41@1906:
	?debug	L 8
	test	word ptr d@w+2374,2048
	jne short	@@203
	jmp	@41@2662
@@203:
	?debug	L 9
	mov	byte ptr _PSW_CC,3
	?debug	L 11
	test	byte ptr _PSW_PRG_MASK,8
	jne short	@@204
	jmp	@41@2662
@@204:
	mov	word ptr _RQ_PRG,8
	mov	word ptr _RETURN,1
	push	ds
	push	offset s@+1086
	call	far ptr _printf
	add	sp,4
	pop	ds
	leave	
	ret	
@41@1990:
	?debug	C E812
	?debug	L 235
	test	word ptr d@w+2322,1
	je	short @41@2046
	?debug	L 236
	mov	word ptr _RQ_PRG,6
	?debug	L 237
	mov	word ptr _RETURN,1
	?debug	L 238
	pop	ds
	leave	
	ret	
@41@2046:
	?debug	L 240
	?debug	L 241
	push	dword ptr d@w+2322
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	shl	eax,8
	push	eax
	mov	eax,dword ptr d@w+2322
	inc	eax
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	pop	edx
	or	edx,eax
	mov	dword ptr d@w+2326,edx
	?debug	L 243
	test	dword ptr d@w+2326,large 000008000h
	je	short @41@2102
	mov	eax,large 0FFFF0000h
	or	eax,dword ptr d@w+2326
	mov	dword ptr d@w+2326,eax
@41@2102:
	?debug	L 244
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	imul	eax,dword ptr d@w+2326
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	dword ptr _R[bx],eax
	?debug	L 246
	pop	ds
	leave	
	ret	
@41@2130:
	?debug	L 255
	mov	al,byte ptr [bp-1]
	push	ax
	push	cs
	call	near ptr _T00
	add	sp,2
	?debug	L 256
	pop	ds
	leave	
	ret	
@41@2158:
	?debug	L 263
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2330,eax
	cmp	dword ptr d@w+2330,large 0
	jl	short @41@2214
	mov	byte ptr d@+2300,12
	jmp	short @41@2242
@41@2214:
	mov	byte ptr d@+2300,13
	mov	eax,dword ptr d@w+2330
	neg	eax
	mov	dword ptr d@w+2330,eax
@41@2242:
	?debug	L 269
	push	dword ptr d@w+2330
	push	ds
	push	offset s@+1093
	push	ds
	push	offset d@w+2334
	call	far ptr _sprintf
	add	sp,12
	?debug	L 270
	mov	word ptr d@w+2292,15
	add	dword ptr d@w+2322,large 7
	mov	word ptr d@w+2296,0
	jmp	short @41@2382
@41@2270:
	?debug	L 272
	cmp	word ptr d@w+2296,0
	jne	short @41@2326
	?debug	L 274
	mov	bx,word ptr d@w+2292
	mov	al,byte ptr d@w+2334[bx]
	add	al,208
	shl	al,4
	or	al,byte ptr d@+2300
	push	ax
	mov	eax,dword ptr d@w+2322
	dec	dword ptr d@w+2322
	push	eax
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
	?debug	L 275
	mov	word ptr d@w+2296,1
	?debug	L 276
	jmp	short @41@2354
@41@2326:
	?debug	L 279
	mov	bx,word ptr d@w+2292
	mov	al,byte ptr d@w+2334[bx]
	add	al,208
	mov	byte ptr d@+2300,al
	mov	word ptr d@w+2296,0
@41@2354:
	?debug	L 270
	dec	word ptr d@w+2292
@41@2382:
	cmp	word ptr d@w+2292,0
	jge	short @41@2270
	?debug	L 283
	pop	ds
	leave	
	ret	
@41@2438:
	?debug	L 292
	mov	dword ptr d@w+2326,large 0
	mov	word ptr d@w+2292,0
@41@2466:
	?debug	L 293
	mov	eax,dword ptr d@w+2322
	inc	dword ptr d@w+2322
	push	eax
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+2300,al
	?debug	L 294
	mov	eax,dword ptr d@w+2326
	imul	eax,large 10
	mov	dl,byte ptr d@+2300
	mov	dh,0
	mov	cx,dx
	and	dx,240
	sar	dx,4
	movsx	edx,dx
	add	eax,edx
	mov	dword ptr d@w+2326,eax
	?debug	L 295
	imul	eax,large 10
	mov	dx,cx
	and	dx,15
	movsx	edx,dx
	add	eax,edx
	mov	dword ptr d@w+2326,eax
	?debug	L 292
	inc	word ptr d@w+2292
	cmp	word ptr d@w+2292,7
	jl	short @41@2466
	?debug	L 297
	push	dword ptr d@w+2322
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr d@+2300,al
	?debug	L 298
	mov	eax,dword ptr d@w+2326
	imul	eax,large 10
	mov	dl,byte ptr d@+2300
	mov	dh,0
	and	dx,240
	sar	dx,4
	movsx	edx,dx
	add	eax,edx
	mov	dword ptr d@w+2326,eax
	?debug	L 299
	mov	dword ptr d@w+2330,eax
	?debug	L 300
	test	byte ptr d@+2300,0
	jne	short @41@2606
	test	byte ptr d@+2300,0
	je	short @41@2634
@41@2606:
	mov	eax,dword ptr d@w+2330
	neg	eax
	mov	dword ptr d@w+2330,eax
@41@2634:
	?debug	L 302
	mov	bx,word ptr d@w+2284
	shl	bx,2
	mov	eax,dword ptr d@w+2330
	mov	dword ptr _R[bx],eax
	?debug	L 304
@41@2662:
	?debug	L 307
	pop	ds
	leave	
	ret	
	?debug	C E3200008001A08
	?debug	C E3210014001A08
	?debug	C E602633008000002480912290003464C410A0000+
	?debug	C 024609122800066164726573730C000002420912+
	?debug	C 2700086F6C645F62797465080000024009122600+
	?debug	C 07636F6D6D616E64200000023809122500077073+
	?debug	C 775F696C630400000236091224000A7073775F61+
	?debug	C 6472657373060000023209122300045354524921+
	?debug	C 0000021E09122200055357575757060000021A09+
	?debug	C 12210004575757570C0000021609122000064144+
	?debug	C 524553530C0000021209121F00045252455A0600+
	?debug	C 00020E09121E000352455A190000020A09121D00+
	?debug	C 03525232190000020609121C0003525231190000+
	?debug	C 020209121B00034444440A000002000912190002+
	?debug	C 444408000002FE0812180002424408000002FD08+
	?debug	C 121700034D4D4D08000002FC081214000448414C+
	?debug	C 460A000002FA08121300016B04000002F8081212+
	?debug	C 00016A04000002F608121200016904000002F408+
	?debug	C 12120002495304000002F2081212000242320400+
	?debug	C 0002F00812120002523204000002EE0812120002+
	?debug	C 523104000002EC0812120002525808000002EB08+
	?debug	C 12110002525208000002EA0812100003434F4D18+
	?debug	C 0A060000
	?debug	E
	?debug	E
_CODE40	endp
	db	1 dup (0)
@41@C2546	label	word
	dw	@41@562
	dw	@41@646
	dw	@41@674
	dw	@41@702
	dw	@41@730
	dw	@41@926
	dw	@41@954
	dw	@41@1010
	dw	@41@1038
	dw	@41@1066
	dw	@41@1318
	dw	@41@1654
	dw	@41@1990
	dw	@41@2130
	dw	@41@2158
	dw	@41@2438
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE41(char far *COM)                 /*** LA */
   ;	
	?debug	L 308
	assume	cs:DS360WK1_TEXT
_CODE41	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
   ;	 static char RX;
   ;	 static int R1,R2,B2,IS;
   ;	
   ;	
   ;	 static char BD;
   ;	 static char DD;
   ;	 static unsigned int DDD;
   ;	
   ;	 static unsigned long ADRESS;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	GET_OPERAND_RX;
   ;	
	?debug	L 324
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2378,al
 	ror	 ax,4
	mov	byte ptr d@w+2380,al
 	shr	 ax,12
	mov	byte ptr d@w+2382,al
	or	al,al
	je	short @42@198
	mov	bx,ax
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2392,eax
	jmp	short @42@226
@42@198:
	mov	dword ptr d@w+2392,large 0
@42@226:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @42@394
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	add	dword ptr d@w+2392,eax
	jmp	short @42@450
@42@394:
 	ror	 ax,8
	movzx	eax,ax
	add	dword ptr d@w+2392,eax
@42@450:
   ;	
   ;	FORWARD_PSW;
   ;	
	?debug	L 325
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	R[R1]=ADRESS&0xffffff;
   ;	
	?debug	L 326
	mov	eax,dword ptr d@w+2392
	and	eax,large 000FFFFFFh
	mov	bx,word ptr d@w+2380
	shl	bx,2
	mov	dword ptr _R[bx],eax
   ;	
   ;	//T();
   ;	}                                         /* BAL */
   ;	
	?debug	L 328
	pop	ds
	pop	bp
	ret	
	?debug	C E6064144524553530C0000025809123F01034444+
	?debug	C 440A0000025609123D0102444408000002550912+
	?debug	C 3C01024244080000025409123B01024953040000+
	?debug	C 0252091238010242320400000250091238010252+
	?debug	C 32040000024E09123801025231040000024C0912+
	?debug	C 3801025258080000024A09123701025252080000+
	?debug	C 02490912360103434F4D180A060000
	?debug	E
	?debug	E
_CODE41	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE45(char far *COM)
   ;	
	?debug	L 329
	assume	cs:DS360WK1_TEXT
_CODE45	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
   ;	 static char RX;
   ;	 static int R1,R2,B2,IS;
   ;	
   ;	
   ;	 static char BD;
   ;	 static char DD;
   ;	 static unsigned int DDD;
   ;	
   ;	 static unsigned long ADRESS;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;		 GET_OPERAND_RX;
   ;	
	?debug	L 345
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2397,al
 	ror	 ax,4
	mov	byte ptr d@w+2398,al
 	shr	 ax,12
	mov	byte ptr d@w+2400,al
	or	al,al
	je	short @43@198
	mov	bx,ax
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2410,eax
	jmp	short @43@226
@43@198:
	mov	dword ptr d@w+2410,large 0
@43@226:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @43@394
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	add	dword ptr d@w+2410,eax
	jmp	short @43@450
@43@394:
 	ror	 ax,8
	movzx	eax,ax
	add	dword ptr d@w+2410,eax
@43@450:
   ;	
   ;		 FORWARD_PSW;
   ;	
	?debug	L 346
	movsx	eax,word ptr _PSW_ILC
	mov	dword ptr [bp-4],eax
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;		 R[R1]= (((unsigned long)PSW_ILC)<<29)|
   ;	
	?debug	L 347
   ;	
   ;									(((unsigned long)PSW_CC)<<28)|
   ;									(((unsigned long)PSW_PRG_MASK)<<24)|
   ;								 (PSW_ADRESS);
   ;	
	?debug	L 350
	shl	eax,29
	movzx	edx,byte ptr _PSW_CC
	shl	edx,28
	or	eax,edx
	movzx	edx,byte ptr _PSW_PRG_MASK
	shl	edx,24
	or	eax,edx
	or	eax,dword ptr _PSW_ADRESS
	mov	bx,word ptr d@w+2398
	shl	bx,2
	mov	dword ptr _R[bx],eax
   ;	
   ;		 PSW_ADRESS=0xfffffe & ADRESS;
   ;	
	?debug	L 351
	mov	eax,large 000FFFFFEh
	and	eax,dword ptr d@w+2410
	mov	dword ptr _PSW_ADRESS,eax
   ;	
   ;		 //T();
   ;	}
   ;	
	?debug	L 353
	pop	ds
	leave	
	ret	
	?debug	C E6064144524553530C0000026A09125401034444+
	?debug	C 440A000002680912520102444408000002670912+
	?debug	C 5101024244080000026609125001024953040000+
	?debug	C 026409124D01024232040000026209124D010252+
	?debug	C 32040000026009124D01025231040000025E0912+
	?debug	C 4D01025258080000025D09124C01025252080000+
	?debug	C 025C09124B0103434F4D180A060000
	?debug	E
	?debug	E
_CODE45	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE47(char far *COM)                  /* BC */
   ;	
	?debug	L 354
	assume	cs:DS360WK1_TEXT
_CODE47	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
   ;	 static char RX;
   ;	 static int R1,R2,B2,IS;
   ;	
   ;	
   ;	 static char BD;
   ;	 static char DD;
   ;	 static unsigned int DDD;
   ;	
   ;	 static unsigned long ADRESS;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	if ((0x80>>PSW_CC) & COM[1])
   ;	
	?debug	L 370
	mov	ax,128
	mov	cl,byte ptr _PSW_CC
	sar	ax,cl
	les	bx,dword ptr [bp+6]
	test	al,byte ptr es:[bx+1]
	jne short	@@205
	jmp	@44@506
@@205:
   ;	
   ;		{GET_OPERAND_RX;
   ;	
	?debug	L 371
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2415,al
 	ror	 ax,4
	mov	byte ptr d@w+2416,al
 	shr	 ax,12
	mov	byte ptr d@w+2418,al
	or	al,al
	je	short @44@226
	mov	bx,ax
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2428,eax
	jmp	short @44@254
@44@226:
	mov	dword ptr d@w+2428,large 0
@44@254:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @44@422
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	add	dword ptr d@w+2428,eax
	jmp	short @44@478
@44@422:
 	ror	 ax,8
	movzx	eax,ax
	add	dword ptr d@w+2428,eax
@44@478:
   ;	
   ;		 PSW_ADRESS=0xfffffe & ADRESS;
   ;	
	?debug	L 372
	mov	eax,large 000FFFFFEh
	and	eax,dword ptr d@w+2428
	mov	dword ptr _PSW_ADRESS,eax
   ;	
   ;		}
   ;	
	?debug	L 373
	pop	ds
	pop	bp
	ret	
@44@506:
   ;	
   ;	else PSW_ADRESS+=PSW_ILC;
   ;	
	?debug	L 374
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	}
   ;	
	?debug	L 375
	pop	ds
	pop	bp
	ret	
	?debug	C E6064144524553530C0000027C09126D01034444+
	?debug	C 440A0000027A09126B0102444408000002790912+
	?debug	C 6A01024244080000027809126901024953040000+
	?debug	C 0276091266010242320400000274091266010252+
	?debug	C 3204000002720912660102523104000002700912+
	?debug	C 6601025258080000026F09126501025252080000+
	?debug	C 026E0912640103434F4D180A060000
	?debug	E
	?debug	E
_CODE47	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
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
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE48(char far *COM)               /* LH */
   ;	
	?debug	L 377
	assume	cs:DS360WK1_TEXT
_CODE48	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
   ;	 static char RX;
   ;	 static int R1,R2,B2,IS;
   ;	
   ;	
   ;	 static char BD;
   ;	 static char DD;
   ;	 static unsigned int DDD;
   ;	
   ;	 static unsigned long ADRESS;
   ;	 static unsigned long WWWW;
   ;	 static signed long SWWWW;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;		GET_OPERAND_RX;
   ;	
	?debug	L 395
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2433,al
 	ror	 ax,4
	mov	byte ptr d@w+2434,al
 	shr	 ax,12
	mov	byte ptr d@w+2436,al
	or	al,al
	je	short @45@198
	mov	bx,ax
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2446,eax
	jmp	short @45@226
@45@198:
	mov	dword ptr d@w+2446,large 0
@45@226:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @45@394
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	add	dword ptr d@w+2446,eax
	jmp	short @45@450
@45@394:
 	ror	 ax,8
	movzx	eax,ax
	add	dword ptr d@w+2446,eax
@45@450:
   ;	
   ;		FORWARD_PSW;
   ;	
	?debug	L 396
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;		if (ADRESs&0x1)
   ;	
	?debug	L 397
	test	word ptr d@w+2446,1
	je	short @45@506
   ;	
   ;						 {RQ_PRG=6;
   ;	
	?debug	L 398
	mov	word ptr _RQ_PRG,6
   ;	
   ;							RETURN=1;
   ;	
	?debug	L 399
	mov	word ptr _RETURN,1
   ;	
   ;							return;
   ;	
	?debug	L 400
	pop	ds
	pop	bp
	ret	
@45@506:
   ;	
   ;						 }
   ;		WWWW=(((unsigned long)GET_BYTE(ADRESS))<<8) |
   ;	
	?debug	L 402
   ;	
   ;				 ((unsigned long)(*(POINTER_T+1))  );
   ;	
	?debug	L 403
	push	dword ptr d@w+2446
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	movzx	eax,al
	shl	eax,8
	les	bx,dword ptr _POINTER_T
	movzx	edx,byte ptr es:[bx+1]
	or	eax,edx
	mov	dword ptr d@w+2450,eax
   ;	
   ;	//	WWWW=(((unsigned long)GET_BYTE(ADRESS))<<8) |
   ;	//			 ((unsigned long)GET_BYTE(ADRESS+1)  );
   ;		Dtaret;
   ;		if (WWWW&0x8000) R[R1]=0xffff0000|WWWW;
   ;	
	?debug	L 407
	test	dword ptr d@w+2450,large 000008000h
	je	short @45@562
	mov	eax,large 0FFFF0000h
	or	eax,dword ptr d@w+2450
	mov	bx,word ptr d@w+2434
	shl	bx,2
	mov	dword ptr _R[bx],eax
	pop	ds
	pop	bp
	ret	
@45@562:
   ;	
   ;		else R[R1]=WWWW;
   ;	
	?debug	L 408
	mov	bx,word ptr d@w+2434
	shl	bx,2
	mov	eax,dword ptr d@w+2450
	mov	dword ptr _R[bx],eax
   ;	
   ;		//T();
   ;	}
   ;	
	?debug	L 410
	pop	ds
	pop	bp
	ret	
	?debug	C E605535757575706000002960912860104575757+
	?debug	C 570C0000029209128501064144524553530C0000+
	?debug	C 028E09128401034444440A0000028C0912820102+
	?debug	C 4444080000028B09128101024244080000028A09+
	?debug	C 128001024953040000028809127D010242320400+
	?debug	C 00028609127D01025232040000028409127D0102+
	?debug	C 5231040000028209127D01025258080000028109+
	?debug	C 127C01025252080000028009127B0103434F4D18+
	?debug	C 0A060000
	?debug	E
	?debug	E
_CODE48	endp
	?debug	C E9470D2B230A44533336304344352E43
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
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
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	10 dup (0)
	db	10 dup (0)
	db	10 dup (0)
	db	10 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	4 dup (0)
	db	2 dup (0)
	?debug	C E989A60F1D09445333363053522E43
	?debug	C E989A60F1D09445333363053522E43
	?debug	C E9BAAEFE1C0A4453333630414C522E43
	?debug	C E9BAAEFE1C0A4453333630414C522E43
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
	?debug	C E8150A44533336304344352E43470D2B23
	?debug	L 13
	assume	cs:DS360WK1_TEXT
_CODE50	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
	?debug	L 51
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2459,al
 	ror	 ax,4
	mov	byte ptr d@w+2460,al
 	shr	 ax,12
	mov	byte ptr d@w+2462,al
	or	al,al
	je	short @46@198
	mov	bx,ax
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2522,eax
	jmp	short @46@226
@46@198:
	mov	dword ptr d@w+2522,large 0
@46@226:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @46@394
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	add	dword ptr d@w+2522,eax
	jmp	short @46@450
@46@394:
 	ror	 ax,8
	movzx	eax,ax
	add	dword ptr d@w+2522,eax
@46@450:
	?debug	L 52
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
	?debug	L 54
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	dl,al
	mov	ah,0
	sub	ax,80
	mov	bx,ax
	cmp	bx,15
	jbe short	@@206
	jmp	@46@2774
@@206:
	shl	bx,1
	jmp	word ptr cs:@46@C2834[bx]
@46@562:
	?debug	L 64
	push	cs
	call	near ptr _T
	?debug	L 65
	pop	ds
	leave	
	ret	
@46@590:
	?debug	L 67
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
	?debug	L 68
	pop	ds
	leave	
	ret	
@46@618:
	?debug	L 70
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
	?debug	L 71
	pop	ds
	leave	
	ret	
@46@646:
	?debug	L 73
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
	?debug	L 74
	pop	ds
	leave	
	ret	
@46@674:
	?debug	L 81
	test	word ptr d@w+2522,3
	je	short @46@730
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@730:
	?debug	L 91
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	bx,word ptr d@w+2460
	shl	bx,2
	and	dword ptr _R[bx],eax
	mov	eax,dword ptr _R[bx]
	cmp	eax,large 0
	jne	short @46@786
	mov	byte ptr _PSW_CC,0
	pop	ds
	leave	
	ret	
@46@786:
	?debug	L 92
	mov	byte ptr _PSW_CC,1
	pop	ds
	leave	
	ret	
@46@814:
	?debug	L 102
	test	word ptr d@w+2522,3
	je	short @46@870
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@870:
	?debug	L 103
	mov	ax,word ptr d@w+2460
	shl	ax,2
	add	ax,offset _R
	mov	word ptr d@w+2514+2,ds
	mov	word ptr d@w+2514,ax
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+2488,eax
	?debug	L 105
	mov	word ptr d@w+2518+2,ds
	mov	word ptr d@w+2518,offset d@w+2488
	?debug	L 106
	les	bx,dword ptr d@w+2514
	mov	eax,dword ptr es:[bx]
	mov	dword ptr [bp-4],eax
	les	bx,dword ptr d@w+2518
	cmp	eax,dword ptr es:[bx]
	jne	short @46@926
	mov	byte ptr _PSW_CC,0
	pop	ds
	leave	
	ret	
@46@926:
	?debug	L 107
	mov	eax,dword ptr [bp-4]
	les	bx,dword ptr d@w+2518
	cmp	eax,dword ptr es:[bx]
	jae	short @46@982
	mov	byte ptr _PSW_CC,1
	pop	ds
	leave	
	ret	
@46@982:
	?debug	L 108
	mov	byte ptr _PSW_CC,2
	pop	ds
	leave	
	ret	
@46@1010:
	?debug	L 117
	test	word ptr d@w+2522,3
	je	short @46@1066
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@1066:
	?debug	L 118
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+2488,eax
	?debug	L 120
	mov	bx,word ptr d@w+2460
	shl	bx,2
	or	dword ptr _R[bx],eax
	mov	eax,dword ptr _R[bx]
	cmp	eax,large 0
	jne	short @46@1122
	mov	byte ptr _PSW_CC,0
	pop	ds
	leave	
	ret	
@46@1122:
	?debug	L 121
	mov	byte ptr _PSW_CC,1
	pop	ds
	leave	
	ret	
@46@1150:
	?debug	L 130
	test	word ptr d@w+2522,3
	je	short @46@1206
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@1206:
	?debug	L 131
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+2488,eax
	?debug	L 133
	mov	bx,word ptr d@w+2460
	shl	bx,2
	xor	dword ptr _R[bx],eax
	mov	eax,dword ptr _R[bx]
	cmp	eax,large 0
	jne	short @46@1262
	mov	byte ptr _PSW_CC,0
	pop	ds
	leave	
	ret	
@46@1262:
	?debug	L 134
	mov	byte ptr _PSW_CC,1
	pop	ds
	leave	
	ret	
@46@1290:
	?debug	L 138
	test	word ptr d@w+2522,3
	je	short @46@1346
	?debug	L 153
	push	cs
	call	near ptr _T
@46@1346:
	?debug	L 160
	test	word ptr d@w+2522,3
	je	short @46@1402
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@1402:
	?debug	L 161
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+2484,eax
	?debug	L 163
	mov	bx,word ptr d@w+2460
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	cmp	eax,dword ptr d@w+2484
	jne	short @46@1458
	mov	byte ptr _PSW_CC,0
	pop	ds
	leave	
	ret	
@46@1458:
	?debug	L 169
	mov	bx,word ptr d@w+2460
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	cmp	eax,dword ptr d@w+2484
	jge	short @46@1514
	mov	byte ptr _PSW_CC,1
	pop	ds
	leave	
	ret	
@46@1514:
	?debug	L 170
	mov	byte ptr _PSW_CC,2
	pop	ds
	leave	
	ret	
@46@1542:
	?debug	L 178
	test	word ptr d@w+2522,3
	je	short @46@1598
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@1598:
	?debug	L 179
	mov	ax,word ptr d@w+2460
	shl	ax,2
	add	ax,offset _R
	mov	word ptr d@w+2472+2,ds
	mov	word ptr d@w+2472,ax
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+2484,eax
	?debug	L 181
	les	bx,dword ptr d@w+2472
	add	dword ptr es:[bx],eax
	?debug	C E81609445333363053522E4389A60F1D
	?debug	L 2
	pushf	
	pop	ax
	mov	word ptr d@w+2508,ax
	?debug	L 3
	test	word ptr d@w+2508,64
	je	short @46@1654
	mov	byte ptr _PSW_CC,0
	jmp	short @46@1738
@46@1654:
	?debug	L 5
	test	word ptr d@w+2508,128
	je	short @46@1710
	mov	byte ptr _PSW_CC,1
	jmp	short @46@1738
@46@1710:
	?debug	L 6
	mov	byte ptr _PSW_CC,2
@46@1738:
	?debug	L 8
	test	word ptr d@w+2508,2048
	jne short	@@207
	jmp	@46@2774
@@207:
	?debug	L 9
	mov	byte ptr _PSW_CC,3
	?debug	L 11
	test	byte ptr _PSW_PRG_MASK,8
	jne short	@@208
	jmp	@46@2774
@@208:
	mov	word ptr _RQ_PRG,8
	mov	word ptr _RETURN,1
	push	ds
	push	offset s@+1086
	call	far ptr _printf
	add	sp,4
	pop	ds
	leave	
	ret	
@46@1822:
	?debug	C E815
	?debug	L 191
	test	word ptr d@w+2522,3
	je	short @46@1878
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@1878:
	?debug	L 192
	mov	ax,word ptr d@w+2460
	shl	ax,2
	add	ax,offset _R
	mov	word ptr d@w+2472+2,ds
	mov	word ptr d@w+2472,ax
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+2484,eax
	?debug	L 194
	neg	eax
	les	bx,dword ptr d@w+2472
	add	dword ptr es:[bx],eax
	?debug	C E81709445333363053522E4389A60F1D
	?debug	L 2
	pushf	
	pop	ax
	mov	word ptr d@w+2508,ax
	?debug	L 3
	test	word ptr d@w+2508,64
	je	short @46@1934
	mov	byte ptr _PSW_CC,0
	jmp	short @46@2018
@46@1934:
	?debug	L 5
	test	word ptr d@w+2508,128
	je	short @46@1990
	mov	byte ptr _PSW_CC,1
	jmp	short @46@2018
@46@1990:
	?debug	L 6
	mov	byte ptr _PSW_CC,2
@46@2018:
	?debug	L 8
	test	word ptr d@w+2508,2048
	jne short	@@209
	jmp	@46@2774
@@209:
	?debug	L 9
	mov	byte ptr _PSW_CC,3
	?debug	L 11
	test	byte ptr _PSW_PRG_MASK,8
	jne short	@@210
	jmp	@46@2774
@@210:
	mov	word ptr _RQ_PRG,8
	mov	word ptr _RETURN,1
	push	ds
	push	offset s@+1086
	call	far ptr _printf
	add	sp,4
	pop	ds
	leave	
	ret	
@46@2102:
	?debug	C E815
	?debug	L 205
	test	word ptr d@w+2522,3
	je	short @46@2158
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@2158:
	?debug	L 206
	and	word ptr d@w+2460,254
	?debug	L 207
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+2510,eax
	?debug	L 209
	push	ds
	push	offset d@w+2510
	mov	ax,word ptr d@w+2460
	shl	ax,2
	add	ax,offset _R+4
	push	ds
	push	ax
	mov	ax,word ptr d@w+2460
	shl	ax,2
	add	ax,offset _R
	push	ds
	push	ax
	push	cs
	call	near ptr _MR
	add	sp,12
	?debug	L 211
	pop	ds
	leave	
	ret	
@46@2186:
	?debug	L 218
	test	word ptr d@w+2522,3
	je	short @46@2242
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@2242:
	?debug	L 219
	and	word ptr d@w+2460,254
	?debug	L 220
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	dword ptr d@w+2574,eax
	?debug	L 222
	push	ds
	push	offset d@w+2574
	mov	ax,word ptr d@w+2460
	shl	ax,2
	add	ax,offset _R+4
	push	ds
	push	ax
	mov	ax,word ptr d@w+2460
	shl	ax,2
	add	ax,offset _R
	push	ds
	push	ax
	push	cs
	call	near ptr _DR
	add	sp,12
	?debug	L 226
	pop	ds
	leave	
	ret	
@46@2270:
	?debug	L 233
	test	word ptr d@w+2522,3
	je	short @46@2326
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@2326:
	?debug	L 239
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	bx,word ptr d@w+2460
	shl	bx,2
	add	dword ptr _R[bx],eax
	?debug	C E8180A4453333630414C522E43BAAEFE1C
	?debug	L 1
	pushf	
	pop	ax
	mov	word ptr d@w+2508,ax
	?debug	L 5
	test	word ptr d@w+2508,64
	je	short @46@2438
	?debug	L 6
	test	word ptr d@w+2508,1
	je	short @46@2410
	mov	byte ptr _PSW_CC,2
	pop	ds
	leave	
	ret	
@46@2410:
	?debug	L 7
	mov	byte ptr _PSW_CC,0
	pop	ds
	leave	
	ret	
@46@2438:
	?debug	L 10
	test	word ptr d@w+2508,1
	je	short @46@2494
	mov	byte ptr _PSW_CC,3
	pop	ds
	leave	
	ret	
@46@2494:
	?debug	L 11
	mov	byte ptr _PSW_CC,1
	pop	ds
	leave	
	ret	
@46@2522:
	?debug	C E815
	?debug	L 251
	test	word ptr d@w+2522,3
	je	short @46@2578
	mov	word ptr _RQ_PRG,6
	mov	word ptr _RETURN,1
	pop	ds
	leave	
	ret	
@46@2578:
	?debug	L 258
	push	dword ptr d@w+2522
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	neg	eax
	mov	bx,word ptr d@w+2460
	shl	bx,2
	add	dword ptr _R[bx],eax
	?debug	C E8190A4453333630414C522E43BAAEFE1C
	?debug	L 1
	pushf	
	pop	ax
	mov	word ptr d@w+2508,ax
	?debug	L 5
	test	word ptr d@w+2508,64
	je	short @46@2690
	?debug	L 6
	test	word ptr d@w+2508,1
	je	short @46@2662
	mov	byte ptr _PSW_CC,2
	pop	ds
	leave	
	ret	
@46@2662:
	?debug	L 7
	mov	byte ptr _PSW_CC,0
	pop	ds
	leave	
	ret	
@46@2690:
	?debug	L 10
	test	word ptr d@w+2508,1
	je	short @46@2746
	mov	byte ptr _PSW_CC,3
	pop	ds
	leave	
	ret	
@46@2746:
	?debug	L 11
	mov	byte ptr _PSW_CC,1
@46@2774:
	?debug	C E815
	?debug	L 266
	pop	ds
	leave	
	ret	
	?debug	C E6067073775F636304000002120A152D00074445+
	?debug	C 4C5F44454C0C0000020E0A152C0003525F320C00+
	?debug	C 00020A0A152B0003525F310C000002060A152A00+
	?debug	C 04465F573410000002FC0915290004465F573310+
	?debug	C 000002F20915280004465F573210000002E80915+
	?debug	C 270004465F573110000002DE0915260006414452+
	?debug	C 4553530C000002DA0915250004555252321F0000+
	?debug	C 02D60915240004555252311F000002D209152300+
	?debug	C 05755252455A0C000002CE0915210003464C410A+
	?debug	C 000002CC0915200006555252455A330C000002C8+
	?debug	C 09151F0006555252455A320C000002C409151E00+
	?debug	C 0A555252455A5F574F524B0C000002C009151D00+
	?debug	C 08555252455A5F414C0C000002BC09151C000555+
	?debug	C 5252455A0C000002B809151B00045252455A0600+
	?debug	C 0002B409151A000352455A19000002B009151900+
	?debug	C 0352523219000002AC0915180003525231190000+
	?debug	C 02A809151700034444440A000002A60915150002+
	?debug	C 444408000002A50915140002424408000002A409+
	?debug	C 15130002495304000002A2091510000242320400+
	?debug	C 0002A009151000025232040000029E0915100002+
	?debug	C 5231040000029C09151000025258080000029B09+
	?debug	C 150F00025252080000029A09150E0003434F4D18+
	?debug	C 0A060000
	?debug	E
	?debug	E
_CODE50	endp
@46@C2834	label	word
	dw	@46@562
	dw	@46@590
	dw	@46@618
	dw	@46@646
	dw	@46@674
	dw	@46@814
	dw	@46@1010
	dw	@46@1150
	dw	@46@1290
	dw	@46@1346
	dw	@46@1542
	dw	@46@1822
	dw	@46@2102
	dw	@46@2186
	dw	@46@2270
	dw	@46@2522
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE5G(char far *COM)
   ;	
	?debug	L 267
	assume	cs:DS360WK1_TEXT
_CODE5G	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
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
   ;	 static unsigned long ADRESS;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	
   ;	 GET_OPERAND_RX;
   ;	
	?debug	L 283
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2581,al
 	ror	 ax,4
	mov	byte ptr d@w+2582,al
 	shr	 ax,12
	mov	byte ptr d@w+2584,al
	or	al,al
	je	short @47@198
	mov	bx,ax
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2594,eax
	jmp	short @47@226
@47@198:
	mov	dword ptr d@w+2594,large 0
@47@226:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @47@394
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	add	dword ptr d@w+2594,eax
	jmp	short @47@450
@47@394:
 	ror	 ax,8
	movzx	eax,ax
	add	dword ptr d@w+2594,eax
@47@450:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 284
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 if (ADRESs&0x3)
   ;	
	?debug	L 285
	test	word ptr d@w+2594,3
	je	short @47@506
   ;	
   ;		 {RQ_PRG=6;
   ;	
	?debug	L 286
	mov	word ptr _RQ_PRG,6
   ;	
   ;			RETURN=1;
   ;	
	?debug	L 287
	mov	word ptr _RETURN,1
   ;	
   ;			return;
   ;	
	?debug	L 288
	pop	ds
	pop	bp
	ret	
@47@506:
   ;	
   ;		 }
   ;	 PUT_WORD(ADRESS,R[R1]);
   ;	
	?debug	L 290
	mov	bx,word ptr d@w+2582
	shl	bx,2
	push	dword ptr _R[bx]
	push	dword ptr d@w+2594
	push	cs
	call	near ptr _PUT_WORD
	add	sp,8
   ;	
   ;										 /* ST */
   ;	}
   ;	
	?debug	L 292
	pop	ds
	pop	bp
	ret	
	?debug	C E6064144524553530C000002220A151501034444+
	?debug	C 440A000002200A151301024444080000021F0A15+
	?debug	C 1201024244080000021E0A151101024953040000+
	?debug	C 021C0A150E01024232040000021A0A150E010252+
	?debug	C 3204000002180A150E0102523104000002160A15+
	?debug	C 0E0102525808000002150A150D01025252080000+
	?debug	C 02140A150C0103434F4D180A060000
	?debug	E
	?debug	E
_CODE5G	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
	db	4 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE58(char far *COM)
   ;	
	?debug	L 297
	assume	cs:DS360WK1_TEXT
_CODE58	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
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
   ;	 static unsigned long ADRESS;
   ;	 static unsigned long URREZ;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	
   ;	 GET_OPERAND_RX;
   ;	
	?debug	L 314
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2599,al
 	ror	 ax,4
	mov	byte ptr d@w+2600,al
 	shr	 ax,12
	mov	byte ptr d@w+2602,al
	or	al,al
	je	short @48@198
	mov	bx,ax
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2612,eax
	jmp	short @48@226
@48@198:
	mov	dword ptr d@w+2612,large 0
@48@226:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @48@394
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	add	dword ptr d@w+2612,eax
	jmp	short @48@450
@48@394:
 	ror	 ax,8
	movzx	eax,ax
	add	dword ptr d@w+2612,eax
@48@450:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 315
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	
   ;		 if (ADRESs&0x3)
   ;	
	?debug	L 317
	test	word ptr d@w+2612,3
	je	short @48@506
   ;	
   ;		 {RQ_PRG=6;
   ;	
	?debug	L 318
	mov	word ptr _RQ_PRG,6
   ;	
   ;			RETURN=1;
   ;	
	?debug	L 319
	mov	word ptr _RETURN,1
   ;	
   ;			return;
   ;	
	?debug	L 320
	pop	ds
	pop	bp
	ret	
@48@506:
   ;	
   ;		 }
   ;	#ifdef DTA_370
   ;		 URREZ=GET_WORD(ADRESS);
   ;		 Dtaret;
   ;		 R[R1]=URREZ;
   ;	
   ;	#else
   ;		 R[R1]=GET_WORD(ADRESS);            /* L */
   ;	
	?debug	L 328
	push	dword ptr d@w+2612
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	bx,word ptr d@w+2600
	shl	bx,2
	mov	dword ptr _R[bx],eax
   ;	
   ;	#endif
   ;	}
   ;	
	?debug	L 330
	pop	ds
	pop	bp
	ret	
	?debug	C E605555252455A0C000002380A15340106414452+
	?debug	C 4553530C000002340A153301034444440A000002+
	?debug	C 320A15310102444408000002310A153001024244+
	?debug	C 08000002300A152F01024953040000022E0A152C+
	?debug	C 01024232040000022C0A152C0102523204000002+
	?debug	C 2A0A152C0102523104000002280A152C01025258+
	?debug	C 08000002270A152B0102525208000002260A152A+
	?debug	C 0103434F4D180A060000
	?debug	E
	?debug	E
_CODE58	endp
	?debug	C E959823A1E0A44533336304344382E43
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
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
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	1 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
	?debug	C E81A0A44533336304344382E4359823A1E
   ;	
   ;	void CODE80(char far *COM)
   ;	
	?debug	L 14
	assume	cs:DS360WK1_TEXT
_CODE80	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,2
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
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
   ;	 static unsigned long ADRESS;
   ;	 static unsigned long URREZ;
   ;	 static signed long SRREZ;
   ;	 static int SIGN_SIGN;
   ;	 static int i;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	static int r2,r3,is;
   ;	static unsigned int FLA;
   ;	static char c0;
   ;	
   ;	 GET_OPERAND_SI;
   ;	
	?debug	L 41
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2621,al
 	ror	 ax,4
	mov	byte ptr d@w+2622,al
 	shr	 ax,12
	mov	byte ptr d@w+2624,al
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @49@310
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2650,eax
	jmp	short @49@366
@49@310:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+2650,eax
@49@366:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 42
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 switch(COM[0])
   ;	
	?debug	L 43
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-1],al
	mov	ah,0
	sub	ax,128
	mov	bx,ax
	cmp	bx,15
	jbe short	@@211
	jmp	@49@3670
@@211:
	shl	bx,1
	jmp	word ptr cs:@49@C3778[bx]
@49@478:
   ;	
   ;		 {
   ;		case 0x80:      /* SSM
   ;										установить маску системы
   ;										*/
   ;							if (PSW_AMWP&0x8) /*EC */
   ;	
	?debug	L 48
	test	byte ptr _PSW_AMWP,8
	je	short @49@562
   ;	
   ;								{
   ;								 if (R370[0]&0x40000000)
   ;	
	?debug	L 50
	test	dword ptr _R370,large 040000000h
	je	short @49@618
   ;	
   ;									 {RETURN=1;
   ;	
	?debug	L 51
	mov	word ptr _RETURN,1
   ;	
   ;										RQ_PRG=0x0002;
   ;	
	?debug	L 52
	mov	word ptr _RQ_PRG,2
   ;	
   ;										break;
   ;	
	?debug	L 53
	pop	ds
	leave	
	ret	
@49@562:
   ;	
   ;									 }
   ;								}
   ;							else
   ;							if (PSW_AMWP&0x1)
   ;	
	?debug	L 57
	test	byte ptr _PSW_AMWP,1
	je	short @49@618
   ;	
   ;								{RETURN=1;
   ;	
	?debug	L 58
	mov	word ptr _RETURN,1
   ;	
   ;								 RQ_PRG=0x0002;
   ;	
	?debug	L 59
	mov	word ptr _RQ_PRG,2
   ;	
   ;								 break;
   ;	
	?debug	L 60
	pop	ds
	leave	
	ret	
@49@618:
   ;	
   ;								}
   ;	#ifdef DTA_370
   ;							c0=GET_BYTE(ADRESS);
   ;							Dtaret;
   ;							PSW_MASK=c0;
   ;	#else
   ;							PSW_MASK=GET_BYTE(ADRESS);
   ;	
	?debug	L 67
	push	dword ptr d@w+2650
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	byte ptr _PSW_MASK,al
   ;	
   ;	#endif
   ;							//T();
   ;							break;
   ;	
	?debug	L 70
	pop	ds
	leave	
	ret	
@49@646:
   ;	
   ;		case 0x81:      /* SPSW
   ;										установить PSW
   ;										*/
   ;							T00(COM[0]);
   ;	
	?debug	L 74
	mov	al,byte ptr [bp-1]
	push	ax
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;							break;
   ;	
	?debug	L 75
	pop	ds
	leave	
	ret	
@49@674:
   ;	
   ;		case 0x82:      /* LPSW
   ;										загрузить PSW
   ;										*/
   ;							if (PSW_AMWP&0x1)
   ;	
	?debug	L 79
	test	byte ptr _PSW_AMWP,1
	je	short @49@730
   ;	
   ;								{RETURN=1;
   ;	
	?debug	L 80
	mov	word ptr _RETURN,1
   ;	
   ;								 RQ_PRG=0x0002;
   ;	
	?debug	L 81
	mov	word ptr _RQ_PRG,2
   ;	
   ;								 break;
   ;	
	?debug	L 82
	pop	ds
	leave	
	ret	
@49@730:
   ;	
   ;								}
   ;							LOAD_PSW(ADRESS);
   ;	
	?debug	L 84
	push	dword ptr d@w+2650
	push	cs
	call	near ptr _LOAD_PSW
	add	sp,4
   ;	
   ;							//T();
   ;							break;
   ;	
	?debug	L 86
	pop	ds
	leave	
	ret	
@49@758:
   ;	
   ;		case 0x83:      /*  ДИАГНОСТИКА
   ;										*/
   ;							Chk_priv;
   ;	
	?debug	L 89
	test	byte ptr _PSW_AMWP,1
	je	short @49@814
	mov	word ptr _RETURN,1
	mov	word ptr _RQ_PRG,2
	pop	ds
	leave	
	ret	
@49@814:
   ;	
   ;							T();
   ;	
	?debug	L 90
	push	cs
	call	near ptr _T
   ;	
   ;							break;
   ;	
	?debug	L 91
	pop	ds
	leave	
	ret	
@49@842:
   ;	
   ;		case 0x84:      /* WRD
   ;										прямая запись
   ;										*/
   ;							T();
   ;	
	?debug	L 95
	push	cs
	call	near ptr _T
   ;	
   ;							break;
   ;	
	?debug	L 96
	pop	ds
	leave	
	ret	
@49@870:
   ;	
   ;		case 0x85:      /* RDD
   ;										прямое чтение
   ;										*/
   ;							T();
   ;	
	?debug	L 100
	push	cs
	call	near ptr _T
   ;	
   ;							break;
   ;	
	?debug	L 101
	pop	ds
	leave	
	ret	
@49@898:
   ;	
   ;		case 0x86:      /* BXH
   ;										переход по индексу больше
   ;										*/
   ;							r2=R2;r3=r2;if ((r3&0x01)==0) r3++;
   ;	
	?debug	L 105
	mov	ax,word ptr d@w+2624
	mov	word ptr d@w+2666,ax
	mov	word ptr d@w+2668,ax
	test	word ptr d@w+2624,1
	jne	short @49@954
	inc	word ptr d@w+2668
@49@954:
   ;	
   ;							SRREZ=(signed long)R[R1]+(signed long)R[r2];
   ;	
	?debug	L 106
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2666
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2658,eax
   ;	
   ;							if ( (SRREZ) > ((signed long)R[r3]) )
   ;	
	?debug	L 107
	mov	bx,word ptr d@w+2668
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	cmp	eax,dword ptr d@w+2658
	jge	short @49@1010
   ;	
   ;								 PSW_ADRESS=0xffffff&ADRESS;
   ;	
	?debug	L 108
	mov	eax,large 000FFFFFFh
	and	eax,dword ptr d@w+2650
	mov	dword ptr _PSW_ADRESS,eax
@49@1010:
   ;	
   ;							R[R1]=SRREZ;
   ;	
	?debug	L 109
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr d@w+2658
	mov	dword ptr _R[bx],eax
   ;	
   ;							//T();
   ;							break;
   ;	
	?debug	L 111
	pop	ds
	leave	
	ret	
@49@1038:
   ;	
   ;		case 0x87:      /* BXLE
   ;										переход по индексу меньше или равно
   ;										*/
   ;							r2=R2;r3=r2;if ((r3&0x01)==0) r3++;
   ;	
	?debug	L 115
	mov	ax,word ptr d@w+2624
	mov	word ptr d@w+2666,ax
	mov	word ptr d@w+2668,ax
	test	word ptr d@w+2624,1
	jne	short @49@1094
	inc	word ptr d@w+2668
@49@1094:
   ;	
   ;							SRREZ=(signed long)R[R1]+(signed long)R[r2];
   ;	
	?debug	L 116
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2666
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2658,eax
   ;	
   ;							if ( (SRREZ) <= ((signed long)R[r3]) )
   ;	
	?debug	L 117
	mov	bx,word ptr d@w+2668
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	cmp	eax,dword ptr d@w+2658
	jl	short @49@1150
   ;	
   ;								 PSW_ADRESS=0xffffff&ADRESS;
   ;	
	?debug	L 118
	mov	eax,large 000FFFFFFh
	and	eax,dword ptr d@w+2650
	mov	dword ptr _PSW_ADRESS,eax
@49@1150:
   ;	
   ;							R[R1]=SRREZ;
   ;	
	?debug	L 119
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr d@w+2658
	mov	dword ptr _R[bx],eax
   ;	
   ;							//T();
   ;							break;
   ;	
	?debug	L 121
	pop	ds
	leave	
	ret	
@49@1178:
   ;	
   ;		case 0x88:      /* SRL
   ;										сдвиг вправо кода
   ;										*/
   ;							ADRESS&=0x3f;
   ;	
	?debug	L 125
	and	dword ptr d@w+2650,large 63
   ;	
   ;							if (ADRESS<32) R[R1]>>=ADRESS;
   ;	
	?debug	L 126
	cmp	dword ptr d@w+2650,large 32
	jae	short @49@1234
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	cl,byte ptr d@w+2650
	shr	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],eax
	pop	ds
	leave	
	ret	
@49@1234:
   ;	
   ;							else R[R1]=0;
   ;	
	?debug	L 127
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],large 0
	pop	ds
	leave	
	ret	
@49@1262:
   ;	
   ;							/* NO PSW_CC*/
   ;							//T();
   ;							break;
   ;		case 0x89:      /* SLL
   ;										сдвиг влево кода
   ;										*/
   ;							ADRESS&=0x3f;
   ;	
	?debug	L 134
	and	dword ptr d@w+2650,large 63
   ;	
   ;							if (ADRESS<32) R[R1]<<=ADRESS;
   ;	
	?debug	L 135
	cmp	dword ptr d@w+2650,large 32
	jae	short @49@1318
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	cl,byte ptr d@w+2650
	shl	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],eax
	pop	ds
	leave	
	ret	
@49@1318:
   ;	
   ;							else R[R1]=0;
   ;	
	?debug	L 136
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],large 0
	pop	ds
	leave	
	ret	
@49@1346:
   ;	
   ;							/* NO PSW_CC*/
   ;							//T();
   ;							break;
   ;		case 0x8a:      /* SRA
   ;										сдвиг вправо арифметический
   ;										*/
   ;							ADRESS&=0x3f;
   ;	
	?debug	L 143
	and	dword ptr d@w+2650,large 63
   ;	
   ;							if (ADRESS<32) URREZ=((0x7fffffff&R[R1])>>ADRESS);
   ;	
	?debug	L 144
	cmp	dword ptr d@w+2650,large 32
	jae	short @49@1402
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,large 07FFFFFFFh
	and	eax,dword ptr _R[bx]
	mov	cl,byte ptr d@w+2650
	shr	eax,cl
	mov	dword ptr d@w+2654,eax
	jmp	short @49@1430
@49@1402:
   ;	
   ;							else URREZ=0;
   ;	
	?debug	L 145
	mov	dword ptr d@w+2654,large 0
@49@1430:
   ;	
   ;							if (R[R1]&0x80000000)
   ;	
	?debug	L 146
	mov	bx,word ptr d@w+2622
	shl	bx,2
	test	dword ptr _R[bx],large 080000000h
	je	short @49@1542
   ;	
   ;								{
   ;								 if (ADRESS<32) R[R1]=URREZ|(0xffffffff<<(31-ADRESS));
   ;	
	?debug	L 148
	cmp	dword ptr d@w+2650,large 32
	jae	short @49@1514
	mov	cl,31
	sub	cl,byte ptr d@w+2650
	mov	eax,large -1
	shl	eax,cl
	mov	edx,dword ptr d@w+2654
	or	edx,eax
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],edx
	jmp	short @49@1570
@49@1514:
   ;	
   ;								 else R[R1]=-1;
   ;	
	?debug	L 149
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],large -1
	jmp	short @49@1570
@49@1542:
   ;	
   ;								}
   ;							else R[R1]=URREZ;
   ;	
	?debug	L 151
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr d@w+2654
	mov	dword ptr _R[bx],eax
@49@1570:
   ;	
   ;							SET_CC_BY_SIGN(R[R1]);
   ;	
	?debug	L 152
	mov	bx,word ptr d@w+2622
	shl	bx,2
	push	dword ptr _R[bx]
	push	cs
	call	near ptr _SET_CC_BY_SIGN
	add	sp,4
   ;	
   ;							//T();
   ;							break;
   ;	
	?debug	L 154
	pop	ds
	leave	
	ret	
@49@1598:
   ;	
   ;		case 0x8b:      /* SLA
   ;										сдвиг влево арифметический
   ;										*/
   ;							ADRESS&=0x3f;
   ;	
	?debug	L 158
	and	dword ptr d@w+2650,large 63
   ;	
   ;							URREZ=0x7fffffff&R[R1];
   ;	
	?debug	L 159
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,large 07FFFFFFFh
	and	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2654,eax
   ;	
   ;							if (R[R1]&0x80000000) SIGN_SIGN=1;
   ;	
	?debug	L 160
	mov	bx,word ptr d@w+2622
	shl	bx,2
	test	dword ptr _R[bx],large 080000000h
	je	short @49@1654
	mov	word ptr d@w+2662,1
	jmp	short @49@1682
@49@1654:
   ;	
   ;							else SIGN_SIGN=0;
   ;	
	?debug	L 161
	mov	word ptr d@w+2662,0
@49@1682:
   ;	
   ;							PSW_CC=0;
   ;	
	?debug	L 162
	mov	byte ptr _PSW_CC,0
   ;	
   ;							for (i=0;i<ADRESS;i++)
   ;	
	?debug	L 163
	mov	word ptr d@w+2664,0
	jmp	short @49@1878
@49@1710:
   ;	
   ;							 {
   ;								URREZ<<=1;
   ;	
	?debug	L 165
	mov	eax,dword ptr d@w+2654
	shl	eax,1
	mov	dword ptr d@w+2654,eax
   ;	
   ;								if (SIGN_SIGN)
   ;	
	?debug	L 166
	cmp	word ptr d@w+2662,0
	je	short @49@1794
   ;	
   ;									{
   ;									 if ((URREZ&0x80000000)==0) PSW_CC=3;
   ;	
	?debug	L 168
	test	dword ptr d@w+2654,large 080000000h
	jne	short @49@1850
	mov	byte ptr _PSW_CC,3
	jmp	short @49@1850
@49@1794:
   ;	
   ;									}
   ;								else
   ;									{
   ;									 if (URREZ&0x80000000) PSW_CC=3;
   ;	
	?debug	L 172
	test	dword ptr d@w+2654,large 080000000h
	je	short @49@1850
	mov	byte ptr _PSW_CC,3
@49@1850:
	?debug	L 163
	inc	word ptr d@w+2664
@49@1878:
	movsx	eax,word ptr d@w+2664
	cmp	eax,dword ptr d@w+2650
	jb	short @49@1710
   ;	
   ;									}
   ;							 }
   ;							if (SIGN_SIGN) R[R1]=0x80000000l&(URREZ&0x7fffffffl);
   ;	
	?debug	L 175
	cmp	word ptr d@w+2662,0
	je	short @49@1962
	mov	eax,dword ptr d@w+2654
	and	eax,large 0
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],eax
	jmp	short @49@1990
@49@1962:
   ;	
   ;							else R[R1]=URREZ&0x7fffffffl;
   ;	
	?debug	L 176
	mov	eax,dword ptr d@w+2654
	and	eax,large 07FFFFFFFh
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],eax
@49@1990:
   ;	
   ;							if (PSW_CC!=3) SET_CC_BY_SIGN(R[R1]);
   ;	
	?debug	L 177
	cmp	byte ptr _PSW_CC,3
	je	short @49@2046
	mov	bx,word ptr d@w+2622
	shl	bx,2
	push	dword ptr _R[bx]
	push	cs
	call	near ptr _SET_CC_BY_SIGN
	add	sp,4
	pop	ds
	leave	
	ret	
@49@2046:
   ;	
   ;							else
   ;								{
   ;								 //T();
   ;								 if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG SLA!!!");}
   ;	
	?debug	L 181
	test	byte ptr _PSW_PRG_MASK,8
	jne short	@@212
	jmp	@49@3670
@@212:
	mov	word ptr _RQ_PRG,8
	mov	word ptr _RETURN,1
	push	ds
	push	offset s@+1100
	call	far ptr _printf
	add	sp,4
	pop	ds
	leave	
	ret	
@49@2102:
   ;	
   ;								}
   ;							//T();
   ;							break;
   ;		case 0x8c:      /* SRDL
   ;										сдвиг вправо двойной кода
   ;										*/
   ;							if (R1&0x01)
   ;	
	?debug	L 188
	test	word ptr d@w+2622,1
	je	short @49@2158
   ;	
   ;								{
   ;								 RQ_PRG=6;
   ;	
	?debug	L 190
	mov	word ptr _RQ_PRG,6
   ;	
   ;								 RETURN=1;
   ;	
	?debug	L 191
	mov	word ptr _RETURN,1
   ;	
   ;								 break;
   ;	
	?debug	L 192
	pop	ds
	leave	
	ret	
@49@2158:
   ;	
   ;								}
   ;							ADRESS&=0x3f;
   ;	
	?debug	L 194
	and	dword ptr d@w+2650,large 63
   ;	
   ;							if (ADRESS==0) break;
   ;	
	?debug	L 195
	cmp	dword ptr d@w+2650,large 0
	jne	short @49@2214
	pop	ds
	leave	
	ret	
@49@2214:
   ;	
   ;							if (ADRESS<32)
   ;	
	?debug	L 196
	cmp	dword ptr d@w+2650,large 32
	jae	short @49@2270
   ;	
   ;								{
   ;								 R[R1+1]>>=(int)ADRESS;
   ;	
	?debug	L 198
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	mov	cl,byte ptr d@w+2650
	shr	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;								 R[R1+1]|=(R[R1]<<(32-(int)ADRESS));
   ;	
	?debug	L 199
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	cl,32
	sub	cl,byte ptr d@w+2650
	shl	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	or	dword ptr _R[bx+4],eax
   ;	
   ;								 R[R1]>>=(int)ADRESS;
   ;	
	?debug	L 200
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	cl,byte ptr d@w+2650
	shr	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],eax
   ;	
   ;								}
   ;	
	?debug	L 201
	pop	ds
	leave	
	ret	
@49@2270:
   ;	
   ;							else
   ;								{
   ;								 R[R1+1]=R[R1]>>(int)(ADRESS-32);
   ;	
	?debug	L 204
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	cl,byte ptr d@w+2650
	add	cl,224
	shr	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;								 R[R1]=0;
   ;	
	?debug	L 205
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],large 0
	pop	ds
	leave	
	ret	
@49@2298:
   ;	
   ;								}
   ;							/* NO PSW_CC*/
   ;							//T();
   ;							break;
   ;		case 0x8d:      /* SLDL
   ;										сдвиг влево двойной кода
   ;										*/
   ;	
   ;							if (R1&0x1)
   ;	
	?debug	L 214
	test	word ptr d@w+2622,1
	je	short @49@2354
   ;	
   ;								{
   ;								 RQ_PRG=6;
   ;	
	?debug	L 216
	mov	word ptr _RQ_PRG,6
   ;	
   ;								 RETURN=1;
   ;	
	?debug	L 217
	mov	word ptr _RETURN,1
   ;	
   ;								 break;
   ;	
	?debug	L 218
	pop	ds
	leave	
	ret	
@49@2354:
   ;	
   ;								}
   ;							ADRESS&=0x3f;
   ;	
	?debug	L 220
	and	dword ptr d@w+2650,large 63
   ;	
   ;							if (ADRESS==0) break;
   ;	
	?debug	L 221
	cmp	dword ptr d@w+2650,large 0
	jne	short @49@2410
	pop	ds
	leave	
	ret	
@49@2410:
   ;	
   ;							if (ADRESS<32)
   ;	
	?debug	L 222
	cmp	dword ptr d@w+2650,large 32
	jae	short @49@2466
   ;	
   ;								{
   ;								 R[R1]<<=(int)ADRESS;
   ;	
	?debug	L 224
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	cl,byte ptr d@w+2650
	shl	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],eax
   ;	
   ;								 R[R1]|=(R[R1+1]>>(32-(int)ADRESS));
   ;	
	?debug	L 225
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	mov	cl,32
	sub	cl,byte ptr d@w+2650
	shr	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	or	dword ptr _R[bx],eax
   ;	
   ;								 R[R1+1]<<=(int)ADRESS;
   ;	
	?debug	L 226
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	mov	cl,byte ptr d@w+2650
	shl	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;								}
   ;	
	?debug	L 227
	pop	ds
	leave	
	ret	
@49@2466:
   ;	
   ;							else
   ;								{
   ;								 R[R1]=R[R1+1]<<(int)(ADRESS-32);
   ;	
	?debug	L 230
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	mov	cl,byte ptr d@w+2650
	add	cl,224
	shl	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],eax
   ;	
   ;								 R[R1+1]=0;
   ;	
	?debug	L 231
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx+4],large 0
	pop	ds
	leave	
	ret	
@49@2494:
   ;	
   ;								}
   ;							/*   NO PSW_CC*/
   ;							//T();
   ;							break;
   ;		case 0x8e:      /* SRDA
   ;										*/
   ;							if (R1&0x1)
   ;	
	?debug	L 238
	test	word ptr d@w+2622,1
	je	short @49@2550
   ;	
   ;								{
   ;								 RQ_PRG=6;
   ;	
	?debug	L 240
	mov	word ptr _RQ_PRG,6
   ;	
   ;								 RETURN=1;
   ;	
	?debug	L 241
	mov	word ptr _RETURN,1
   ;	
   ;								 break;
   ;	
	?debug	L 242
	pop	ds
	leave	
	ret	
@49@2550:
   ;	
   ;								}
   ;							ADRESS&=0x3f;
   ;	
	?debug	L 244
	and	dword ptr d@w+2650,large 63
   ;	
   ;							if (ADRESS==0) goto NOSD1;
   ;	
	?debug	L 245
	cmp	dword ptr d@w+2650,large 0
	jne	short @49@2606
	jmp	@49@2886
@49@2606:
   ;	
   ;							URREZ=R[R1];
   ;	
	?debug	L 246
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2654,eax
   ;	
   ;							if (ADRESS<32)
   ;	
	?debug	L 247
	cmp	dword ptr d@w+2650,large 32
	jb short	@@213
	jmp	@49@2690
@@213:
   ;	
   ;								{URREZ=R[R1];
   ;	
	?debug	L 248
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr d@w+2654,eax
   ;	
   ;								 R[R1+1]>>=ADRESS;
   ;	
	?debug	L 249
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	mov	cl,byte ptr d@w+2650
	shr	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;								 R[R1+1]|=(0x7fffffffl&R[R1]<<(32-ADRESS));
   ;	
	?debug	L 250
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	cl,32
	sub	cl,byte ptr d@w+2650
	shl	eax,cl
	mov	edx,large 07FFFFFFFh
	and	edx,eax
	mov	bx,word ptr d@w+2622
	shl	bx,2
	or	dword ptr _R[bx+4],edx
   ;	
   ;								 R[R1]=((unsigned long)(0x7fffffff&R[R1]))>>ADRESS;
   ;	
	?debug	L 251
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,large 07FFFFFFFh
	and	eax,dword ptr _R[bx]
	mov	cl,byte ptr d@w+2650
	shr	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],eax
   ;	
   ;								 if (URREZ&0x80000000l)
   ;	
	?debug	L 252
	test	dword ptr d@w+2654,large 080000000h
	jne short	@@214
	jmp	@49@2886
@@214:
   ;	
   ;									 {R[R1]|=(0xffffffffl << (31-(int)ADRESS));
   ;	
	?debug	L 253
	mov	cl,31
	sub	cl,byte ptr d@w+2650
	mov	eax,large -1
	shl	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	or	dword ptr _R[bx],eax
	jmp	@49@2886
@49@2690:
   ;	
   ;									 }
   ;								}
   ;							else
   ;								{
   ;								 if (ADRESS==32)
   ;	
	?debug	L 258
	cmp	dword ptr d@w+2650,large 32
	jne	short @49@2802
   ;	
   ;									 {
   ;										R[R1+1]=R[R1];
   ;	
	?debug	L 260
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;										if (URREZ&0x80000000) R[R1]=0xffffffff;
   ;	
	?debug	L 261
	test	dword ptr d@w+2654,large 080000000h
	je	short @49@2774
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],large -1
	jmp	@49@2886
@49@2774:
   ;	
   ;										else R[R1]=0;
   ;	
	?debug	L 262
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],large 0
	jmp	@49@2886
@49@2802:
   ;	
   ;									 }
   ;								 else if (URREZ&0x80000000)
   ;	
	?debug	L 264
	test	dword ptr d@w+2654,large 080000000h
	je	short @49@2858
   ;	
   ;												{R[R1+1]=(0x7fffffff&R[R1])>>(ADRESS-32);
   ;	
	?debug	L 265
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,large 07FFFFFFFh
	and	eax,dword ptr _R[bx]
	mov	cl,byte ptr d@w+2650
	sub	cl,32
	shr	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;												 R[R1]=0xffffffff;
   ;	
	?debug	L 266
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],large -1
   ;	
   ;												 R[R1+1]|=(0xffffffff<<(63-(int)ADRESS));
   ;	
	?debug	L 267
	mov	cl,63
	sub	cl,byte ptr d@w+2650
	mov	eax,large -1
	shl	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	or	dword ptr _R[bx+4],eax
   ;	
   ;												}
   ;	
	?debug	L 268
	jmp	short @49@2886
@49@2858:
   ;	
   ;											else
   ;												{R[R1+1]=R[R1]>>(ADRESS-32);
   ;	
	?debug	L 270
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx]
	mov	cl,byte ptr d@w+2650
	sub	cl,32
	shr	eax,cl
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;												 R[R1]=0;
   ;	
	?debug	L 271
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],large 0
@49@2886:
   ;	
   ;												}
   ;								}
   ;	NOSD1:      if (R[R1]==0 && R[R1+1]==0) PSW_CC=0;
   ;	
	?debug	L 274
	mov	bx,word ptr d@w+2622
	shl	bx,2
	cmp	dword ptr _R[bx],large 0
	jne	short @49@2970
	mov	bx,word ptr d@w+2622
	shl	bx,2
	cmp	dword ptr _R[bx+4],large 0
	jne	short @49@2970
	mov	byte ptr _PSW_CC,0
	pop	ds
	leave	
	ret	
@49@2970:
   ;	
   ;							else if (R[R1]&0x80000000) PSW_CC=1;
   ;	
	?debug	L 275
	mov	bx,word ptr d@w+2622
	shl	bx,2
	test	dword ptr _R[bx],large 080000000h
	je	short @49@3026
	mov	byte ptr _PSW_CC,1
	pop	ds
	leave	
	ret	
@49@3026:
   ;	
   ;									 else PSW_CC=2;
   ;	
	?debug	L 276
	mov	byte ptr _PSW_CC,2
	pop	ds
	leave	
	ret	
@49@3054:
   ;	
   ;							//T();
   ;							break;
   ;		case 0x8f:      /* SLDA
   ;										*/
   ;							if (R1&0x1)
   ;	
	?debug	L 281
	test	word ptr d@w+2622,1
	je	short @49@3110
   ;	
   ;								{
   ;								 RQ_PRG=6;
   ;	
	?debug	L 283
	mov	word ptr _RQ_PRG,6
   ;	
   ;								 RETURN=1;
   ;	
	?debug	L 284
	mov	word ptr _RETURN,1
   ;	
   ;								 break;
   ;	
	?debug	L 285
	pop	ds
	leave	
	ret	
@49@3110:
   ;	
   ;								}
   ;							ADRESS&=0x3f;
   ;	
	?debug	L 287
	and	dword ptr d@w+2650,large 63
   ;	
   ;							URREZ=0x7fffffff&R[R1];
   ;	
	?debug	L 288
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,large 07FFFFFFFh
	and	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2654,eax
   ;	
   ;							if (R[R1]&0x80000000) SIGN_SIGN=1;
   ;	
	?debug	L 289
	mov	bx,word ptr d@w+2622
	shl	bx,2
	test	dword ptr _R[bx],large 080000000h
	je	short @49@3166
	mov	word ptr d@w+2662,1
	jmp	short @49@3194
@49@3166:
   ;	
   ;								else SIGN_SIGN=0;
   ;	
	?debug	L 290
	mov	word ptr d@w+2662,0
@49@3194:
   ;	
   ;							PSW_CC=0;
   ;	
	?debug	L 291
	mov	byte ptr _PSW_CC,0
   ;	
   ;							for (i=0;i<ADRESS;i++)
   ;	
	?debug	L 292
	mov	word ptr d@w+2664,0
	jmp	short @49@3390
@49@3222:
   ;	
   ;							 {URREZ<<=1;URREZ|=(R[R1+1]>>31);
   ;	
	?debug	L 293
	mov	eax,dword ptr d@w+2654
	shl	eax,1
	mov	dword ptr d@w+2654,eax
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	shr	eax,31
	or	dword ptr d@w+2654,eax
   ;	
   ;								R[R1+1]<<=1;
   ;	
	?debug	L 294
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	eax,dword ptr _R[bx+4]
	shl	eax,1
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx+4],eax
   ;	
   ;								if (SIGN_SIGN)
   ;	
	?debug	L 295
	cmp	word ptr d@w+2662,0
	je	short @49@3306
   ;	
   ;									{
   ;									 if ((URREZ&0x80000000)==0) PSW_CC=3;
   ;	
	?debug	L 297
	test	dword ptr d@w+2654,large 080000000h
	jne	short @49@3362
	mov	byte ptr _PSW_CC,3
	jmp	short @49@3362
@49@3306:
   ;	
   ;									}
   ;								else
   ;									{
   ;									 if (URREZ&0x80000000) PSW_CC=3;
   ;	
	?debug	L 301
	test	dword ptr d@w+2654,large 080000000h
	je	short @49@3362
	mov	byte ptr _PSW_CC,3
@49@3362:
	?debug	L 292
	inc	word ptr d@w+2664
@49@3390:
	movsx	eax,word ptr d@w+2664
	cmp	eax,dword ptr d@w+2650
	jb	short @49@3222
   ;	
   ;									}
   ;							 }
   ;							if (SIGN_SIGN) R[R1]=0x80000000l&(URREZ&0x7fffffffl);
   ;	
	?debug	L 304
	cmp	word ptr d@w+2662,0
	je	short @49@3474
	mov	eax,dword ptr d@w+2654
	and	eax,large 0
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],eax
	jmp	short @49@3502
@49@3474:
   ;	
   ;							else R[R1]=URREZ&0x7fffffffl;
   ;	
	?debug	L 305
	mov	eax,dword ptr d@w+2654
	and	eax,large 07FFFFFFFh
	mov	bx,word ptr d@w+2622
	shl	bx,2
	mov	dword ptr _R[bx],eax
@49@3502:
   ;	
   ;							if (PSW_CC!=3)
   ;	
	?debug	L 306
	cmp	byte ptr _PSW_CC,3
	je	short @49@3614
   ;	
   ;								{SET_CC_BY_SIGN(R[R1]);
   ;	
	?debug	L 307
	mov	bx,word ptr d@w+2622
	shl	bx,2
	push	dword ptr _R[bx]
	push	cs
	call	near ptr _SET_CC_BY_SIGN
	add	sp,4
   ;	
   ;								 if (PSW_CC==0)
   ;	
	?debug	L 308
	cmp	byte ptr _PSW_CC,0
	jne	short @49@3670
   ;	
   ;									{ if (R[R1+1]) PSW_CC=2;
   ;	
	?debug	L 309
	mov	bx,word ptr d@w+2622
	shl	bx,2
	cmp	dword ptr _R[bx+4],large 0
	je	short @49@3670
	mov	byte ptr _PSW_CC,2
	pop	ds
	leave	
	ret	
@49@3614:
   ;	
   ;									}
   ;								}
   ;							else
   ;								{
   ;								 //T();
   ;								 if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG SLDA!!!");}
   ;	
	?debug	L 315
	test	byte ptr _PSW_PRG_MASK,8
	je	short @49@3670
	mov	word ptr _RQ_PRG,8
	mov	word ptr _RETURN,1
	push	ds
	push	offset s@+1111
	call	far ptr _printf
	add	sp,4
@49@3670:
   ;	
   ;								}
   ;							//T();
   ;							break;
   ;		 }
   ;	}
   ;	
	?debug	L 320
	pop	ds
	leave	
	ret	
	?debug	C E602633008000002720A1A270003464C410A0000+
	?debug	C 02700A1A2600026973040000026E0A1A25000272+
	?debug	C 33040000026C0A1A2500027232040000026A0A1A+
	?debug	C 2500016904000002680A1A2000095349474E5F53+
	?debug	C 49474E04000002660A1A1F0005535252455A0600+
	?debug	C 0002620A1A1E0005555252455A0C0000025E0A1A+
	?debug	C 1D00064144524553530C0000025A0A1A1C000452+
	?debug	C 52455A06000002560A1A1B000352455A19000002+
	?debug	C 520A1A1A0003525232190000024E0A1A19000352+
	?debug	C 5231190000024A0A1A1800034444440A00000248+
	?debug	C 0A1A160002444408000002470A1A150002424408+
	?debug	C 000002460A1A140002495304000002440A1A1100+
	?debug	C 02423204000002420A1A11000252320400000240+
	?debug	C 0A1A1100025231040000023E0A1A110002525808+
	?debug	C 0000023D0A1A1000025252080000023C0A1A0F00+
	?debug	C 03434F4D180A060000
	?debug	E
	?debug	E
_CODE80	endp
	db	1 dup (0)
@49@C3778	label	word
	dw	@49@478
	dw	@49@646
	dw	@49@674
	dw	@49@758
	dw	@49@842
	dw	@49@870
	dw	@49@898
	dw	@49@1038
	dw	@49@1178
	dw	@49@1262
	dw	@49@1346
	dw	@49@1598
	dw	@49@2102
	dw	@49@2298
	dw	@49@2494
	dw	@49@3054
	?debug	C E91C823A1E0A44533336304344392E43
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
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
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
	?debug	C E81B0A44533336304344392E431C823A1E
   ;	
   ;	void CODE90(char far *COM)
   ;	
	?debug	L 13
	assume	cs:DS360WK1_TEXT
_CODE90	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
   ;	 static char RX;
   ;	 static unsigned int is;
   ;	 static unsigned int iis;
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
   ;	 static int i,j;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 static unsigned long ADR;
   ;	 GET_OPERAND_SI;
   ;	
	?debug	L 37
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2676,al
 	ror	 ax,4
	mov	byte ptr d@w+2682,al
 	shr	 ax,12
	mov	byte ptr d@w+2684,al
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	test	al,240
	je	short @50@310
	mov	bl,al
 	ror	 ax,8
	mov	bh,0
 	shr	 bx,4
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2710,eax
	jmp	short @50@366
@50@310:
 	ror	 ax,8
	movzx	eax,ax
	mov	dword ptr d@w+2710,eax
@50@366:
   ;	
   ;	 FORWARD_PSW;
   ;	
	?debug	L 38
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 switch(COM[0])
   ;	
	?debug	L 39
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	dl,al
	mov	ah,0
	sub	ax,144
	mov	bx,ax
	cmp	bx,15
	jbe short	@@215
	jmp	@50@1766
@@215:
	shl	bx,1
	jmp	word ptr cs:@50@C1666[bx]
@50@478:
   ;	
   ;		 {
   ;			case 0x90:            /* STM r1,r2,AREA
   ;														запись в память групповая
   ;														*/
   ;	
   ;								i=R1;
   ;	
	?debug	L 45
	mov	ax,word ptr d@w+2682
	mov	word ptr d@w+2714,ax
@50@506:
   ;	
   ;	#ifdef DTA_370
   ;								DtaEnd(ADRESS,0);
   ;								DtaEnd(ADRESS,63);
   ;	#endif
   ;	
   ;	PUT_STORE:
   ;								PUT_WORD(ADRESS,R[i]);
   ;	
	?debug	L 52
	mov	bx,word ptr d@w+2714
	shl	bx,2
	push	dword ptr _R[bx]
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _PUT_WORD
	add	sp,8
   ;	
   ;								if (RETURN) return;
   ;	
	?debug	L 53
	cmp	word ptr _RETURN,0
	je	short @50@562
	pop	ds
	pop	bp
	ret	
@50@562:
   ;	
   ;								ADRESS+=4;
   ;	
	?debug	L 54
	add	dword ptr d@w+2710,large 4
   ;	
   ;								if (i==R2) goto END_STORE;
   ;	
	?debug	L 55
	mov	ax,word ptr d@w+2714
	cmp	ax,word ptr d@w+2684
	jne	short @50@618
	pop	ds
	pop	bp
	ret	
@50@618:
   ;	
   ;								if (++i>=16) i=0;
   ;	
	?debug	L 56
	inc	word ptr d@w+2714
	mov	ax,word ptr d@w+2714
	cmp	ax,16
	jl	short @50@506
	mov	word ptr d@w+2714,0
	jmp	short @50@506
@50@674:
   ;	
   ;								goto PUT_STORE;
   ;	END_STORE:    ;
   ;								//T();
   ;								break;
   ;			case 0x91:            /*  TM MASK,AREA
   ;	//													проверить по маске
   ;	//													*/
   ;	//							is=GET_BYTE(ADRESS);
   ;	//							is&=I2;
   ;	//							if (is==0) PSW_CC=0;
   ;	//							else
   ;	//								if (is==I2) PSW_CC=3;
   ;	//								else PSW_CC=1;
   ;								break;
   ;			case 0x92:                                /* MVI */
   ;								PUT_BYTE(ADRESS,I2);
   ;	
	?debug	L 72
	mov	al,byte ptr d@+2676
	push	ax
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 74
	pop	ds
	pop	bp
	ret	
@50@702:
   ;	
   ;			case 0x93:            /*   TS MASK,AREA
   ;														проверить и установить
   ;														*/
   ;								is=GET_BYTE(ADRESS);
   ;	
	?debug	L 78
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	mov	word ptr d@w+2678,ax
   ;	
   ;								Dtaret;
   ;								if (is&0x80) PSW_CC=1;
   ;	
	?debug	L 80
	test	word ptr d@w+2678,128
	je	short @50@758
	mov	byte ptr _PSW_CC,1
	jmp	short @50@786
@50@758:
   ;	
   ;								else PSW_CC=0;
   ;	
	?debug	L 81
	mov	byte ptr _PSW_CC,0
@50@786:
   ;	
   ;								PUT_BYTE(ADRESS,0xff);
   ;	
	?debug	L 82
	push	255
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 84
	pop	ds
	pop	bp
	ret	
@50@814:
   ;	
   ;			case 0x94:PSW_CC=0;                         /*NI*/
   ;	
	?debug	L 85
	mov	byte ptr _PSW_CC,0
   ;	
   ;								//is=GET_BYTE(ADRESS);
   ;								//is&=I2;
   ;								//PUT_BYTE(ADRESS,is);
   ;								if ((is=(I2&GET_BYTE(ADRESS)))!=0) PSW_CC=1;
   ;	
	?debug	L 89
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	dl,byte ptr d@+2676
	and	dl,al
	mov	dh,0
	mov	word ptr d@w+2678,dx
	mov	ax,dx
	or	ax,ax
	je	short @50@870
	mov	byte ptr _PSW_CC,1
@50@870:
   ;	
   ;								Dtaret;
   ;								PUT_BYTE(ADRESS,is);
   ;	
	?debug	L 91
	mov	al,byte ptr d@w+2678
	push	ax
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 93
	pop	ds
	pop	bp
	ret	
@50@898:
   ;	
   ;			case 0x95:PSW_CC=0;                         /*CLI*/
   ;	
	?debug	L 94
	mov	byte ptr _PSW_CC,0
   ;	
   ;								is=GET_BYTE(ADRESS);
   ;	
	?debug	L 95
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	mov	word ptr d@w+2678,ax
   ;	
   ;								Dtaret;
   ;								iis=I2;
   ;	
	?debug	L 97
	mov	al,byte ptr d@+2676
	mov	ah,0
	mov	word ptr d@w+2680,ax
   ;	
   ;								if (is<iis) PSW_CC=1;
   ;	
	?debug	L 98
	mov	ax,word ptr d@w+2678
	cmp	ax,word ptr d@w+2680
	jae	short @50@954
	mov	byte ptr _PSW_CC,1
@50@954:
   ;	
   ;								if (is>iis)  PSW_CC=2;
   ;	
	?debug	L 99
	mov	ax,word ptr d@w+2678
	cmp	ax,word ptr d@w+2680
	ja short	@@216
	jmp	@50@1766
@@216:
	mov	byte ptr _PSW_CC,2
	pop	ds
	pop	bp
	ret	
@50@1010:
   ;	
   ;								//T();
   ;								break;
   ;			case 0x96:PSW_CC=0;                          /*OI*/
   ;	
	?debug	L 102
	mov	byte ptr _PSW_CC,0
   ;	
   ;								//is=GET_BYTE(ADRESS);
   ;								//is|=I2;
   ;								//PUT_BYTE(ADRESS,is);
   ;								if ((is=(I2|GET_BYTE(ADRESS)))!=0) PSW_CC=1;
   ;	
	?debug	L 106
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	dl,byte ptr d@+2676
	or	dl,al
	mov	dh,0
	mov	word ptr d@w+2678,dx
	mov	ax,dx
	or	ax,ax
	je	short @50@1066
	mov	byte ptr _PSW_CC,1
@50@1066:
   ;	
   ;								Dtaret;
   ;								PUT_BYTE(ADRESS,is);
   ;	
	?debug	L 108
	mov	al,byte ptr d@w+2678
	push	ax
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 110
	pop	ds
	pop	bp
	ret	
@50@1094:
   ;	
   ;			case 0x97:PSW_CC=0;                           /*XI*/
   ;	
	?debug	L 111
	mov	byte ptr _PSW_CC,0
   ;	
   ;								is=GET_BYTE(ADRESS);
   ;	
	?debug	L 112
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	ah,0
	mov	word ptr d@w+2678,ax
   ;	
   ;								Dtaret;
   ;								is^=I2;
   ;	
	?debug	L 114
	mov	al,byte ptr d@+2676
	mov	ah,0
	xor	word ptr d@w+2678,ax
   ;	
   ;								PUT_BYTE(ADRESS,is);
   ;	
	?debug	L 115
	mov	al,byte ptr d@w+2678
	push	ax
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _PUT_BYTE
	add	sp,6
   ;	
   ;								if (is!=0) PSW_CC=1;
   ;	
	?debug	L 116
	cmp	word ptr d@w+2678,0
	jne short	@@217
	jmp	@50@1766
@@217:
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@50@1150:
   ;	
   ;								//T();
   ;								break;
   ;			case 0x98:                  /*  LM r1,r2,AREA
   ;																	загрузка групповая
   ;																	*/
   ;	
   ;								i=R1;
   ;	
	?debug	L 123
	mov	ax,word ptr d@w+2682
	mov	word ptr d@w+2714,ax
@50@1178:
   ;	
   ;	#ifdef DTA_370
   ;								DtaEnd(ADRESS,0);
   ;								DtaEnd(ADRESS,63);
   ;	#endif
   ;	
   ;	GET_LM:
   ;								R[i]=GET_WORD(ADRESS);
   ;	
	?debug	L 130
	push	dword ptr d@w+2710
	push	cs
	call	near ptr _GET_WORD
	shl	eax,16
	shrd	eax,edx,16
	add	sp,4
	mov	bx,word ptr d@w+2714
	shl	bx,2
	mov	dword ptr _R[bx],eax
   ;	
   ;								if (RETURN) return;
   ;	
	?debug	L 131
	cmp	word ptr _RETURN,0
	je	short @50@1234
	pop	ds
	pop	bp
	ret	
@50@1234:
   ;	
   ;								if (i==R2) goto END_LM;
   ;	
	?debug	L 132
	mov	ax,word ptr d@w+2714
	cmp	ax,word ptr d@w+2684
	jne	short @50@1290
	pop	ds
	pop	bp
	ret	
@50@1290:
   ;	
   ;								//i++;
   ;								ADRESS+=4;
   ;	
	?debug	L 134
	add	dword ptr d@w+2710,large 4
   ;	
   ;								if (++i>=16) i=0;
   ;	
	?debug	L 135
	inc	word ptr d@w+2714
	mov	ax,word ptr d@w+2714
	cmp	ax,16
	jl	short @50@1178
	mov	word ptr d@w+2714,0
	jmp	short @50@1178
@50@1346:
   ;	
   ;								goto GET_LM;
   ;	END_LM:
   ;								//T();
   ;								break;
   ;			case 0x99:                  /*  HPR
   ;																	остановить и продолжить
   ;																	*/
   ;								T00(COM[0]);
   ;	
	?debug	L 143
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 144
	pop	ds
	pop	bp
	ret	
@50@1374:
   ;	
   ;			case 0x9a:                  /*  TIOB
   ;																	TEST I/O and BRANCH
   ;																	*/
   ;								T00(COM[0]);
   ;	
	?debug	L 148
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 149
	pop	ds
	pop	bp
	ret	
@50@1402:
   ;	
   ;			case 0x9b:                  /* CIO Control I/O
   ;																	*/
   ;								T00(COM[0]);
   ;	
	?debug	L 152
	push	dx
	push	cs
	call	near ptr _T00
	add	sp,2
   ;	
   ;								break;
   ;	
	?debug	L 153
	pop	ds
	pop	bp
	ret	
@50@1430:
   ;	
   ;			case 0x9c:                                  /*SIO*/
   ;								/* в режиме работы процессора PROGRAM SIO запрещено*/
   ;								//if (PSW_AMWP&0x01) {RQ_PRG=2;RETURN=1;break;}
   ;								Chk_priv;
   ;	
	?debug	L 157
	test	byte ptr _PSW_AMWP,1
	je	short @50@1486
	mov	word ptr _RETURN,1
	mov	word ptr _RQ_PRG,2
	pop	ds
	pop	bp
	ret	
@50@1486:
   ;	
   ;								PSW_CC=SIO_DEVICE(ADRESS);
   ;	
	?debug	L 158
	push	dword ptr d@w+2710
	call	far ptr _SIO_DEVICE
	add	sp,4
	mov	byte ptr _PSW_CC,al
   ;	
   ;								RETURN=1;
   ;	
	?debug	L 159
	mov	word ptr _RETURN,1
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 161
	pop	ds
	pop	bp
	ret	
@50@1514:
   ;	
   ;			case 0x9d:                                 /*TIO*/
   ;	
   ;								/* в режиме работы процессора PROGRAM TIO запрещено*/
   ;								//if (PSW_AMWP&0x01) {RQ_PRG=2;RETURN=1;break;}
   ;								Chk_priv;
   ;	
	?debug	L 166
	test	byte ptr _PSW_AMWP,1
	je	short @50@1570
	mov	word ptr _RETURN,1
	mov	word ptr _RQ_PRG,2
	pop	ds
	pop	bp
	ret	
@50@1570:
   ;	
   ;								PSW_CC=TIO_DEVICE(ADRESS);
   ;	
	?debug	L 167
	push	dword ptr d@w+2710
	call	far ptr _TIO_DEVICE
	add	sp,4
	mov	byte ptr _PSW_CC,al
   ;	
   ;								RETURN=1;
   ;	
	?debug	L 168
	mov	word ptr _RETURN,1
   ;	
   ;								//if (RQ_TRACE&0x02) printf("\TIO =%04lx",ADRESS);
   ;								//T();
   ;								break;
   ;	
	?debug	L 171
	pop	ds
	pop	bp
	ret	
@50@1598:
   ;	
   ;			case 0x9e:                    /* HIO */
   ;								//if (PSW_AMWP&0x1)
   ;								//{RETURN=1;
   ;								// RQ_PRG=0x0002;
   ;								// break;
   ;								//}
   ;								Chk_priv
   ;	
	?debug	L 178
	test	byte ptr _PSW_AMWP,1
	je	short @50@1654
	mov	word ptr _RETURN,1
	mov	word ptr _RQ_PRG,2
	pop	ds
	pop	bp
	ret	
@50@1654:
   ;	
   ;								PSW_CC=HIO_DEVICE(ADRESS);
   ;	
	?debug	L 179
	push	dword ptr d@w+2710
	call	far ptr _HIO_DEVICE
	add	sp,4
	mov	byte ptr _PSW_CC,al
   ;	
   ;								RETURN=1;
   ;	
	?debug	L 180
	mov	word ptr _RETURN,1
   ;	
   ;								T();
   ;	
	?debug	L 181
	push	cs
	call	near ptr _T
   ;	
   ;								break;
   ;	
	?debug	L 182
	pop	ds
	pop	bp
	ret	
@50@1682:
   ;	
   ;			case 0x9f:                    /* TCH */
   ;								//if (PSW_AMWP&0x1)
   ;								//{RETURN=1;
   ;								// RQ_PRG=0x0002;
   ;								// break;
   ;								//}
   ;								Chk_priv;
   ;	
	?debug	L 189
	test	byte ptr _PSW_AMWP,1
	je	short @50@1738
	mov	word ptr _RETURN,1
	mov	word ptr _RQ_PRG,2
	pop	ds
	pop	bp
	ret	
@50@1738:
   ;	
   ;								PSW_CC=TCH_DEVICE(ADRESS);
   ;	
	?debug	L 190
	push	dword ptr d@w+2710
	call	far ptr _TCH_DEVICE
	add	sp,4
	mov	byte ptr _PSW_CC,al
   ;	
   ;								//T();
   ;								break;
   ;	
	?debug	L 192
@50@1766:
   ;	
   ;		 }
   ;	}
   ;	
	?debug	L 194
	pop	ds
	pop	bp
	ret	
	?debug	C E6034144520C0000029E0A1B2400016A04000002+
	?debug	C 9C0A1B1F000169040000029A0A1B1F0006414452+
	?debug	C 4553530C000002960A1B1E00045252455A060000+
	?debug	C 02920A1B1D000352455A190000028E0A1B1C0003+
	?debug	C 525232190000028A0A1B1B000352523119000002+
	?debug	C 860A1B1A00034444440A000002840A1B18000244+
	?debug	C 4408000002830A1B170002424408000002820A1B+
	?debug	C 160002495304000002800A1B1300024232040000+
	?debug	C 027E0A1B1300025232040000027C0A1B13000252+
	?debug	C 31040000027A0A1B1300036969730A000002780A+
	?debug	C 1B12000269730A000002760A1B11000252580800+
	?debug	C 0002740A1B100002525208000002730A1B0F0003+
	?debug	C 434F4D180A060000
	?debug	E
	?debug	E
_CODE90	endp
	db	1 dup (0)
@50@C1666	label	word
	dw	@50@478
	dw	@50@1766
	dw	@50@674
	dw	@50@702
	dw	@50@814
	dw	@50@898
	dw	@50@1010
	dw	@50@1094
	dw	@50@1150
	dw	@50@1346
	dw	@50@1374
	dw	@50@1402
	dw	@50@1430
	dw	@50@1514
	dw	@50@1598
	dw	@50@1682
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
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
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE91(char far *COM)
   ;	
	?debug	L 195
	assume	cs:DS360WK1_TEXT
_CODE91	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
   ;	 static char RX;
   ;	 static unsigned int is;
   ;	 static unsigned int iis;
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
   ;	 static int i,j;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 static unsigned long ADR;
   ;	#ifdef OPT001
   ;	 _AL=COM[1];_AH=0;RX=_AL;
   ;	
	?debug	L 220
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
	mov	ah,0
	mov	byte ptr d@+2723,al
   ;	
   ;	 _AX=*(unsigned int*)(&COM[2]);
   ;	
	?debug	L 221
	mov	ax,word ptr es:[bx+2]
   ;	
   ;	 if (_AL & 0xf0)
   ;	
	?debug	L 222
	test	al,240
	je	short @51@198
   ;	
   ;		 {_BL=_AL;asm xchg ah,al;
   ;	
	?debug	L 223
	mov	bl,al
 	xchg	 ah,al
   ;	
   ;			_BH=0;asm shr bx,4;
   ;	
	?debug	L 224
	mov	bh,0
 	shr	 bx,4
   ;	
   ;			ADRESS=(unsigned long)(_AX&0x0fff)+R[_BX];
   ;	
	?debug	L 225
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2756,eax
   ;	
   ;		 }
   ;	
	?debug	L 226
	jmp	short @51@254
@51@198:
   ;	
   ;	 else
   ;		 {
   ;			asm xchg ah,al;
   ;	
	?debug	L 229
 	xchg	 ah,al
   ;	
   ;			ADRESS=(unsigned long)_AX;
   ;	
	?debug	L 230
	movzx	eax,ax
	mov	dword ptr d@w+2756,eax
@51@254:
   ;	
   ;		 }
   ;	
   ;	#else
   ;	 RX=COM[1];
   ;	 BD=COM[2];
   ;	 B2=BD>>4;
   ;	 if (B2) ADRESS=R[B2];else ADRESS=0;
   ;	 ADRESS+=(unsigned long)(((BD&0x0f)<<8)+COM[3]);
   ;	#endif
   ;	 FORWARD_PSW;
   ;	
	?debug	L 240
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 /*  TM MASK,AREA
   ;			проверить по маске
   ;												*/
   ;	 if ((is=(I2&GET_BYTE(ADRESS)))==0) PSW_CC=0;
   ;	
	?debug	L 244
	push	dword ptr d@w+2756
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	mov	dl,byte ptr d@+2723
	and	dl,al
	mov	dh,0
	mov	word ptr d@w+2724,dx
	mov	ax,dx
	or	ax,ax
	jne	short @51@310
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@51@310:
   ;	
   ;	 else
   ;			if (is==I2) PSW_CC=3;
   ;	
	?debug	L 246
	mov	al,byte ptr d@+2723
	mov	ah,0
	cmp	ax,word ptr d@w+2724
	jne	short @51@366
	mov	byte ptr _PSW_CC,3
	pop	ds
	pop	bp
	ret	
@51@366:
   ;	
   ;			else PSW_CC=1;
   ;	
	?debug	L 247
	mov	byte ptr _PSW_CC,1
   ;	
   ;	}
   ;	
	?debug	L 248
	pop	ds
	pop	bp
	ret	
	?debug	C E6034144520C000002CC0A1BDA00016A04000002+
	?debug	C CA0A1BD500016904000002C80A1BD50006414452+
	?debug	C 4553530C000002C40A1BD400045252455A060000+
	?debug	C 02C00A1BD3000352455A19000002BC0A1BD20003+
	?debug	C 52523219000002B80A1BD1000352523119000002+
	?debug	C B40A1BD000034444440A000002B20A1BCE000244+
	?debug	C 4408000002B10A1BCD0002424408000002B00A1B+
	?debug	C CC0002495304000002AE0A1BC900024232040000+
	?debug	C 02AC0A1BC90002523204000002AA0A1BC9000252+
	?debug	C 3104000002A80A1BC900036969730A000002A60A+
	?debug	C 1BC8000269730A000002A40A1BC7000252580800+
	?debug	C 0002A30A1BC60002525208000002A20A1BC50003+
	?debug	C 434F4D180A060000
	?debug	E
	?debug	E
_CODE91	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
	db	1 dup (0)
	db	1 dup (0)
	db	2 dup (0)
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
	db	2 dup (0)
	db	2 dup (0)
	db	2 dup (0)
	db	4 dup (0)
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void CODE95(char far *COM)
   ;	
	?debug	L 249
	assume	cs:DS360WK1_TEXT
_CODE95	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,DS360WK1_DATA
	mov	ds,ax
	?debug	C E603434F4D180A060000
	?debug	B
   ;	
   ;	{
   ;	 static char RR;
   ;	 static char RX;
   ;	 static unsigned int is;
   ;	 static unsigned int iis;
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
   ;	 static int i,j;
   ;	 static unsigned int FLA;
   ;	#define B1 B2
   ;	#define I2 RX
   ;	#define X2 R2
   ;	
   ;	 static unsigned long ADR;
   ;	// RX=COM[1];
   ;	#ifdef OPT001
   ;	 _AX=*(unsigned int*)(&COM[2]);
   ;	
	?debug	L 276
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
   ;	
   ;	 if (_AL & 0xf0)
   ;	
	?debug	L 277
	test	al,240
	je	short @52@198
   ;	
   ;		 {_BL=_AL;asm xchg ah,al;
   ;	
	?debug	L 278
	mov	bl,al
 	xchg	 ah,al
   ;	
   ;			_BH=0;asm shr bx,4;
   ;	
	?debug	L 279
	mov	bh,0
 	shr	 bx,4
   ;	
   ;			ADRESS=(unsigned long)(_AX&0x0fff)+R[_BX];
   ;	
	?debug	L 280
	and	ax,4095
	movzx	eax,ax
	shl	bx,2
	add	eax,dword ptr _R[bx]
	mov	dword ptr d@w+2802,eax
   ;	
   ;		 }
   ;	
	?debug	L 281
	jmp	short @52@254
@52@198:
   ;	
   ;	 else
   ;		 {
   ;			asm xchg ah,al;
   ;	
	?debug	L 284
 	xchg	 ah,al
   ;	
   ;			ADRESS=(unsigned long)_AX;
   ;	
	?debug	L 285
	movzx	eax,ax
	mov	dword ptr d@w+2802,eax
@52@254:
   ;	
   ;		 }
   ;	
   ;	#else
   ;	 BD=COM[2];
   ;	 B2=BD>>4;
   ;	 if (B2) ADRESS=R[B2];else ADRESS=0;
   ;	 ADRESS+=(unsigned long)(((BD&0x0f)<<8)+COM[3]);
   ;	#endif
   ;	 FORWARD_PSW;
   ;	
	?debug	L 294
	movsx	eax,word ptr _PSW_ILC
	add	dword ptr _PSW_ADRESS,eax
   ;	
   ;	 //is=GET_BYTE(ADRESS)-COM[1];
   ;	 if (GET_BYTE(ADRESS)==COM[1]) {PSW_CC=0;return;}
   ;	
	?debug	L 296
	push	dword ptr d@w+2802
	push	cs
	call	near ptr _GET_BYTE
	add	sp,4
	les	bx,dword ptr [bp+6]
	cmp	al,byte ptr es:[bx+1]
	jne	short @52@310
	mov	byte ptr _PSW_CC,0
	pop	ds
	pop	bp
	ret	
@52@310:
   ;	
   ;	 FLA=_FLAGS;
   ;	
	?debug	L 297
	pushf	
	pop	ax
	mov	word ptr d@w+2810,ax
   ;	
   ;	 if (FLA&0x0080) /*<0*/   PSW_CC=1;
   ;	
	?debug	L 298
	test	word ptr d@w+2810,128
	je	short @52@366
	mov	byte ptr _PSW_CC,1
	pop	ds
	pop	bp
	ret	
@52@366:
   ;	
   ;	 else            /*>0*/   PSW_CC=2;
   ;	
	?debug	L 299
	mov	byte ptr _PSW_CC,2
   ;	
   ;	 //if (FLA&0x0040)  /*==0*/   PSW_CC=0;
   ;	 //				else
   ;	 //				 {if (FLA&0x0080) /*<0*/   PSW_CC=1;
   ;	 //					else            /*>0*/   PSW_CC=2;
   ;	 //				 }
   ;	}
   ;	
	?debug	L 305
	pop	ds
	pop	bp
	ret	
	?debug	C E6034144520C000002FC0A1B110103464C410A00+
	?debug	C 0002FA0A1B0C01016A04000002F80A1B0B010169+
	?debug	C 04000002F60A1B0B01064144524553530C000002+
	?debug	C F20A1B0A01045252455A06000002EE0A1B090103+
	?debug	C 52455A19000002EA0A1B08010352523219000002+
	?debug	C E60A1B07010352523119000002E20A1B06010344+
	?debug	C 44440A000002E00A1B040102444408000002DF0A+
	?debug	C 1B030102424408000002DE0A1B02010249530400+
	?debug	C 0002DC0A1BFF0002423204000002DA0A1BFF0002+
	?debug	C 523204000002D80A1BFF0002523104000002D60A+
	?debug	C 1BFF00036969730A000002D40A1BFE000269730A+
	?debug	C 000002D20A1BFD0002525808000002D10A1BFC00+
	?debug	C 02525208000002D00A1BFB0003434F4D180A0600+
	?debug	C 00
	?debug	E
	?debug	E
_CODE95	endp
DS360WK1_TEXT	ends
DS360WK1_DATA	segment word public use16 'FAR_DATA'
_TraceOutCmd	label	dword
	db	4 dup (0)
XMS_P_STR	label	word
	db	4 dup (0)
XMS_POINTER_STR	label	dword
	db	4 dup (0)
XMS_OFFSET	label	word
	db	4 dup (0)
XMS_ALLOC_HANDLER	label	word
	db	2 dup (0)
XMS_BLOCK_SIZE	label	word
	db	4 dup (0)
XMS_status	label	word
	db	2 dup (0)
_DEFAULT_RDR_STRING	label	byte
	db	80 dup (0)
_RQ_DEBUG	label	word
	db	2 dup (0)
_RQ_PRTR	label	word
	db	2 dup (0)
_TR_CYL	label	dword
	db	80 dup (0)
_TRACE_COMMAND	label	byte
	db	256 dup (0)
_TRACE_UNIT	label	word
	db	2 dup (0)
_DASD_HEADER	label	byte
	db	20 dup (0)
_DASD_WRITE	label	byte
	db	20 dup (0)
_COUNT_MARK	label	byte
	db	20 dup (0)
_RR_ADRESS	label	dword
	db	80 dup (0)
_DASD_MEM_T	label	word
	db	40 dup (0)
_DASD_MEM_C	label	word
	db	40 dup (0)
_DASD_MEM_XMS	label	word
	db	40 dup (0)
_DASD_MEM_POINT	label	word
	db	40 dup (0)
_DASD_MEM_WRITE	label	word
	db	800 dup (0)
_DASD_MEM_TRK	label	word
	db	800 dup (0)
_DASD_MEM_CYL	label	word
	db	800 dup (0)
_AREA_DASD	label	dword
	db	80 dup (0)
_AREA_7920	label	dword
	db	80 dup (0)
_DASD_MASK	label	byte
	db	20 dup (0)
_DASD	label	word
	db	400 dup (0)
_NUMBER_IO_CUR	label	word
	db	2 dup (0)
_NUMBER_IO	label	word
	db	2 dup (0)
_FILE_IO_DEVICE	label	word
	db	40 dup (0)
_OLD_OPERATION	label	word
	db	40 dup (0)
_OLD_OFFSET_IO_DEVICE	label	word
	db	80 dup (0)
_OFFSET_IO_DEVICE	label	word
	db	80 dup (0)
_CSW_CAW	label	word
	db	80 dup (0)
_CSW_COUNT	label	word
	db	80 dup (0)
_CSW_TP	label	byte
	db	20 dup (0)
_CSW_MOD	label	byte
	db	20 dup (0)
_CSW_ADRESS	label	word
	db	80 dup (0)
_CSW_COD	label	byte
	db	20 dup (0)
_IO_STATUS	label	byte
	db	320 dup (0)
_NAME_FILE_IO_DEVICE	label	byte
	db	800 dup (0)
_FLAG_IO_DEVICE	label	byte
	db	20 dup (0)
_TYPE_IO_DEVICE	label	byte
	db	20 dup (0)
_ADRESS_IO_DEVICE	label	word
	db	40 dup (0)
_PREFIX_PR	label	word
	db	4 dup (0)
_ADRESS_DTA	label	word
	db	4 dup (0)
_DINTRADR	label	word
	db	2 dup (0)
_TLB	label	word
	db	8192 dup (0)
_PSW_EC_MASK	label	byte
	db	1 dup (0)
	db	1 dup (0)
_PSW_ADRESS	label	word
	db	4 dup (0)
_PSW_PRG_MASK	label	byte
	db	1 dup (0)
_PSW_CC	label	byte
	db	1 dup (0)
_PSW_ILC	label	word
	db	2 dup (0)
_PSW_COD_INT	label	word
	db	2 dup (0)
_PSW_AMWP	label	byte
	db	1 dup (0)
_PSW_KEY	label	byte
	db	1 dup (0)
_PSW_MASK	label	byte
	db	1 dup (0)
	db	1 dup (0)
_PSW_BEGIN	label	dword
	db	4 dup (0)
_R_FLOAT	label	qword
	db	80 dup (0)
_R	label	word
	db	64 dup (0)
_R370	label	word
	db	64 dup (0)
_RQ_CONSOLE	label	word
	db	2 dup (0)
_RQ_7920	label	word
	db	2 dup (0)
_RQ_EXIT	label	word
	db	2 dup (0)
_REAL_TIME	label	word
	db	4 dup (0)
_CLOCK2	label	word
	db	4 dup (0)
_CLOCK1	label	word
	db	4 dup (0)
_COUNT_1000	label	word
	db	2 dup (0)
_COUNT_COMP	label	word
	db	4 dup (0)
_REAL_TIME_COMP	label	word
	db	4 dup (0)
_CLOCK2_COMP	label	word
	db	4 dup (0)
_CLOCK1_COMP	label	word
	db	4 dup (0)
_COUNT_CPU	label	word
	db	4 dup (0)
_REAL_TIME_CPU	label	word
	db	4 dup (0)
_CLOCK2_CPU	label	word
	db	4 dup (0)
_CLOCK1_CPU	label	word
	db	4 dup (0)
_RQ_COMP	label	word
	db	2 dup (0)
_RQ_TIMER_CPU	label	word
	db	2 dup (0)
_RQ_TIMER	label	word
	db	2 dup (0)
_RQ_TRACE	label	word
	db	2 dup (0)
_RQ_IPL	label	word
	db	2 dup (0)
_RQ_PRG	label	word
	db	2 dup (0)
_RQ_SVC	label	word
	db	2 dup (0)
_RETURN	label	word
	db	2 dup (0)
NUMBER_BLOCK	label	word
	db	2 dup (0)
OFFSET_ADRESS	label	word
	db	2 dup (0)
_POINTER_T	label	dword
	db	4 dup (0)
POINTER	label	dword
	db	4 dup (0)
STATUS_FILE	label	word
	db	2 dup (0)
MEMORY_FILE	label	word
	db	2 dup (0)
MEM	label	dword
	db	4 dup (0)
MEMORY_USE	label	word
	db	100 dup (0)
MEMORY_BLOCK	label	word
	db	100 dup (0)
MEMORY_KEY	label	byte
	db	512 dup (0)
MEMORY_TO_BLOCK	label	word
	db	1024 dup (0)
MEMORY	label	dword
	db	2048 dup (0)
_DEBUG_PSW_ADRESS	label	word
	db	4 dup (0)
COMMAND_STAT	label	word
	db	512 dup (0)
	?debug	C E9
	?debug	C FAD5020000
s@	label	byte
	db	'#1MAX MEMORY BLOCK (command SSK)'
	db	0
	db	'##'
	db	141
	db	133
	db	132
	db	142
	db	145
	db	146
	db	128
	db	146
	db	142
	db	151
	db	141
	db	142
	db	' '
	db	143
	db	128
	db	140
	db	159
	db	146
	db	136
	db	0
	db	'MEMORY'
	db	0
	db	'STATUS'
	db	0
	db	'## NOT ENOUGT MEMORY IN XMS'
	db	0
	db	'##INITIALISATION XMS:'
	db	0
	db	'##ERROR in XMS INITIALISATION'
	db	0
	db	'##END-OFF-INITIALISATION XMS.'
	db	0
	db	'## NO XMS !!! check the XMS drive'
	db	0
	db	'##STORING XMS:'
	db	0
	db	'##END-OFF-STORING XMS.'
	db	0
	db	'#1MAX BLOCK MEMORY (GET BYTE)'
	db	0
	db	'= %08lx %x '
	db	0
	db	'#1MAX BLOCK MEMORY (PUT BYTE)'
	db	0
	db	'= %08lx %x value=%x'
	db	0
	db	'#1KEY PUT_BYTE_2'
	db	0
	db	'KEY PSW=%d KEY MEMORY=%d MVC PSW=%06x ADRESS=%06x'
	db	0
	db	'KEY=%d KEY MEMORY=%d MVCL PSW=%06x ADRESS=%06x'
	db	0
	db	'#1MAX BLOCK MEMORY (CLC BYTE)'
	db	0
	db	'KEY XC OC NC PSW=%06x ADRESS=%06x'
	db	0
	db	'KEY PUT_WORD PSW=%06x ADRESS=%06x'
	db	0
	db	'%lx : '
	db	0
	db	'%02x'
	db	0
	db	'##CHECK COD OPERATION='
	db	0
	db	10
	db	'WRONG CODE %x '
	db	0
	db	': %lx : '
	db	0
	db	10
	db	'CHECK I/O COMMAND:'
	db	0
	db	10
	db	'UNIT=%03x %06lx=> %02x %06lx %02x %02x %04x '
	db	0
	db	10
	db	' BP '
	db	0
	db	'RQ PRG'
	db	0
	db	'##'
	db	141
	db	128
	db	134
	db	128
	db	146
	db	128
	db	' '
	db	138
	db	139
	db	128
	db	130
	db	136
	db	152
	db	128
	db	' ESC - '
	db	135
	db	128
	db	143
	db	144
	db	142
	db	145
	db	' '
	db	141
	db	128
	db	' '
	db	130
	db	155
	db	149
	db	142
	db	132
	db	0
	db	27
	db	'[u UNIT %x IS BUSY                                 '
	db	0
	db	27
	db	'[u UNIT %x KEEPING INTERRUPT REQUEST            '
	db	0
	db	10
	db	' STORE CSW %06lx %02x %02x %04lx '
	db	0
	db	'## DST360P /<?/H/I/>'
	db	0
	db	'r'
	db	0
	db	'.out'
	db	0
	db	's rdr,00c'
	db	0
	db	'##MAIN360'
	db	0
	db	10
	db	179
	db	' SERIAL NUMBER=%11s               IPL Adress    '
	db	186
	db	'X'
	db	186
	db	186
	db	'X'
	db	186
	db	186
	db	'X'
	db	186
	db	'      '
	db	186
	db	'IPL'
	db	186
	db	'  '
	db	179
	db	0
	db	'##MAIN360_'
	db	0
	db	'ead4049902'
	db	0
	db	'## '
	db	144
	db	133
	db	134
	db	136
	db	140
	db	' '
	db	143
	db	147
	db	139
	db	156
	db	146
	db	128
	db	' '
	db	142
	db	143
	db	133
	db	144
	db	128
	db	146
	db	142
	db	144
	db	128
	db	' ('
	db	130
	db	155
	db	149
	db	142
	db	132
	db	' '
	db	136
	db	135
	db	' '
	db	143
	db	144
	db	142
	db	131
	db	144
	db	128
	db	140
	db	140
	db	155
	db	': ESC)'
	db	0
	db	0
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
	db	'%016ld'
	db	0
	db	'PRG SLA!!!'
	db	0
	db	'PRG SLDA!!!'
	db	0
DS360WK1_DATA	ends
DS360WK1_TEXT	segment byte public use16 'CODE'
DS360WK1_TEXT	ends
	extrn	__turboFloat:word
	public	_SET_CC
	public	_SET_CC_BY_SIGN
	extrn	F_FTOL@:far
	extrn	_ungetch:far
	extrn	__setargv__:far
	public	_main
	extrn	_RUN_CHANEL:far
	extrn	_kbhit:far
	public	_DO_ALL_WORK
	extrn	F_PADD@:far
	extrn	F_LXLSH@:far
	public	_Catcher
	public	_TraceOutCmd
	extrn	_TraceOut:dword
	extrn	_IPL_adr:word
	extrn	_serial_number:byte
_XMS_P_STR	equ	XMS_P_STR
_XMS_POINTER_STR	equ	XMS_POINTER_STR
_XMS_OFFSET	equ	XMS_OFFSET
_XMS_ALLOC_HANDLER	equ	XMS_ALLOC_HANDLER
_XMS_BLOCK_SIZE	equ	XMS_BLOCK_SIZE
_XMS_status	equ	XMS_status
	public	_POINT
_ILC	equ	ILC
	extrn	_FLAG_OPEN_CONNECTION:word
	public	_DEFAULT_RDR_STRING
	public	_RQ_DEBUG
	extrn	_SHOW_SHOW:word
	public	_RQ_PRTR
	public	_TR_CYL
	public	_TRACE_COMMAND
	public	_TRACE_UNIT
	public	_DASD_HEADER
	public	_DASD_WRITE
	public	_COUNT_MARK
	public	_RR_ADRESS
	public	_DASD_MEM_T
	public	_DASD_MEM_C
	public	_DASD_MEM_XMS
	public	_DASD_MEM_POINT
	public	_DASD_MEM_WRITE
	public	_DASD_MEM_TRK
	public	_DASD_MEM_CYL
	public	_AREA_DASD
	public	_AREA_7920
	public	_DASD_MASK
	public	_DASD
	public	_NUMBER_IO_CUR
	public	_NUMBER_IO
	public	_FILE_IO_DEVICE
	public	_OLD_OPERATION
	public	_OLD_OFFSET_IO_DEVICE
	public	_OFFSET_IO_DEVICE
	public	_CSW_CAW
	public	_CSW_COUNT
	public	_CSW_TP
	public	_CSW_MOD
	public	_CSW_ADRESS
	public	_CSW_COD
	public	_IO_STATUS
	public	_NAME_FILE_IO_DEVICE
	public	_FLAG_IO_DEVICE
	public	_TYPE_IO_DEVICE
	public	_ADRESS_IO_DEVICE
	public	_PREFIX_PR
	public	_ADRESS_DTA
	public	_DINTRADR
	public	_TLB
	public	_PSW_EC_MASK
	public	_PSW_ADRESS
	public	_PSW_PRG_MASK
	public	_PSW_CC
	public	_PSW_ILC
	public	_PSW_COD_INT
	public	_PSW_AMWP
	public	_PSW_KEY
	public	_PSW_MASK
	public	_PSW_BEGIN
	public	_R_FLOAT
	public	_R
	public	_R370
	public	_RQ_CONSOLE
	public	_RQ_7920
	public	_RQ_EXIT
	public	_REAL_TIME
	public	_CLOCK2
	public	_CLOCK1
	public	_COUNT_1000
	public	_COUNT_COMP
	public	_REAL_TIME_COMP
	public	_CLOCK2_COMP
	public	_CLOCK1_COMP
	public	_COUNT_CPU
	public	_REAL_TIME_CPU
	public	_CLOCK2_CPU
	public	_CLOCK1_CPU
	public	_RQ_COMP
	public	_RQ_TIMER_CPU
	public	_RQ_TIMER
	public	_RQ_TRACE
	public	_RQ_IPL
	public	_RQ_PRG
	public	_RQ_SVC
	public	_RETURN
_NUMBER_BLOCK_LONG	equ	NUMBER_BLOCK_LONG
_NUMBER_BLOCK	equ	NUMBER_BLOCK
_OFFSET_ADRESS	equ	OFFSET_ADRESS
	public	_POINTER_T
_POINTER	equ	POINTER
_NEXT_BLOCK_BUF	equ	NEXT_BLOCK_BUF
_STATUS_FILE	equ	STATUS_FILE
_MEMORY_FILE	equ	MEMORY_FILE
_MEM	equ	MEM
_MAX_BLOCK_BUF	equ	MAX_BLOCK_BUF
_MEMORY_USE	equ	MEMORY_USE
_MEMORY_BLOCK	equ	MEMORY_BLOCK
_MAX_BLOCK_MEMORY	equ	MAX_BLOCK_MEMORY
_MEMORY_KEY	equ	MEMORY_KEY
_MEMORY_TO_BLOCK	equ	MEMORY_TO_BLOCK
_MEMORY	equ	MEMORY
	public	_DEBUG_PSW_ADRESS
_COMMAND_STAT	equ	COMMAND_STAT
	extrn	_farmalloc:far
	extrn	_signal:far
	extrn	__XMMcopy:far
	extrn	_XMMfree:far
	extrn	_XMMalloc:far
	extrn	_XMMcoreleft:far
	extrn	_XMMlibinit:far
	extrn	_HELPHELP:far
	public	_SPECIAL_INT
	public	_TLB_RESET
	public	_TLB_SET
	extrn	_RUN_EDIT_CONSOLE:far
	public	_DR
	public	_MR
	public	_SR
	public	_MOVE
	public	_MOVE_MEM_TO_360
	public	_MOVE_360_TO_MEM
	public	_C_ISK
	public	_C_SSK
	extrn	_RUN_EDIT_NET:far
	extrn	_CODEGG:far
	public	_CODED7
	public	_CODED5
	public	_CODED2
	public	_CODE95
	public	_CODE91
	public	_CODE58
	public	_CODE5G
	public	_CODE48
	public	_CODE47
	public	_CODE45
	public	_CODE41
	public	_CODE18
	public	_CODE07
	public	_CODE06
	public	_CODE05
	extrn	_CODEF0:far
	extrn	_CODED0:far
	extrn	_CODEB0:far
	extrn	_CODEA0:far
	public	_CODE90
	public	_CODE80
	extrn	_CODE70:far
	extrn	_CODE60:far
	public	_CODE50
	public	_CODE40
	extrn	_CODE30:far
	extrn	_CODE20:far
	public	_CODE10
	public	_CODE00
	extrn	_RUN_EDIT:far
	extrn	_STORE_CSW:far
	extrn	_RUN_OPERATOR:far
	extrn	_INIT_CHANEL:far
	extrn	_HIO_DEVICE:far
	extrn	_TCH_DEVICE:far
	extrn	_TIO_DEVICE:far
	extrn	_SIO_DEVICE:far
	public	_RUN_COMMAND
	public	_FORW_PSW
	public	_STORE_PSW
	public	_LOAD_PSW
	extrn	_CLOSE_CHANEL:far
	public	_CLOSE_MEMORY
	public	_PUT_WORD
	public	_GET_WORD
	public	_GET_SECOND_BYTE
	public	_PUT_BYTE
	public	_GET_BYTE
	public	_INIT_MEMORY
	public	_tt
	public	_T00
	public	_T
	public	_PR
	extrn	_write:far
	extrn	_read:far
	extrn	_open:far
	extrn	_lseek:far
	extrn	_close:far
	extrn	_sprintf:far
	extrn	_printf:far
	extrn	_fprintf:far
	extrn	_fopen:far
	extrn	_fclose:far
_s@	equ	s@
	?debug	C EA010D
	?debug	C E32200000023010400
	?debug	C EC075F5345545F4343221800
	?debug	C E32300000023010400
	?debug	C EC0F5F5345545F43435F42595F5349474E231800
	?debug	C E32400000023040500
	?debug	C EB07465F46544F4C402400
	?debug	C E32500000023040400
	?debug	C EB085F756E67657463682500
	?debug	C EB0B5F5F736574617267765F5F2400
	?debug	C E32600000023010400
	?debug	C EC055F6D61696E261800
	?debug	C EB0B5F52554E5F4348414E454C2500
	?debug	C EB065F6B626869742500
	?debug	C E32700000023010400
	?debug	C EC0C5F444F5F414C4C5F574F524B271800
	?debug	C EB07465F50414444402400
	?debug	C EB08465F4C584C5348402400
	?debug	C E32800000023010400
	?debug	C EC085F43617463686572281800
	?debug	C EC0C5F54726163654F7574436D641B00010E01
	?debug	C EB095F54726163654F75741B00
	?debug	C EB085F49504C5F6164720400
	?debug	C E3290040001A08
	?debug	C EB0E5F73657269616C5F6E756D6265722900
	?debug	C E32C00000023010400
	?debug	C E32B000400162C00
	?debug	C E32A0000041A2B
	?debug	C EC065F504F494E542A0001D800
	?debug	C E32D0000011A08
	?debug	C EB155F464C41475F4F50454E5F434F4E4E454354+
	?debug	C 494F4E0400
	?debug	C E32E0050001A08
	?debug	C EC135F44454641554C545F5244525F535452494E+
	?debug	C 472E00019700
	?debug	C EC095F52515F44454255470400019600
	?debug	C EB0A5F53484F575F53484F570400
	?debug	C EC085F52515F505254520400019400
	?debug	C E32F0050001A18
	?debug	C EC075F54525F43594C2F00019300
	?debug	C E3300000011A08
	?debug	C EC0E5F54524143455F434F4D4D414E4430000192+
	?debug	C 00
	?debug	C EC0B5F54524143455F554E49540400019100
	?debug	C E3310014001A08
	?debug	C EC0C5F444153445F4845414445523100019000
	?debug	C E3320014001A08
	?debug	C EC0B5F444153445F57524954453200018F00
	?debug	C E3330014001A08
	?debug	C EC0B5F434F554E545F4D41524B3300018E00
	?debug	C E3340050001A18
	?debug	C EC0A5F52525F4144524553533400018D00
	?debug	C E3350028001A04
	?debug	C EC0B5F444153445F4D454D5F543500017900
	?debug	C E3360028001A04
	?debug	C EC0B5F444153445F4D454D5F433600017800
	?debug	C E3370028001A04
	?debug	C EC0D5F444153445F4D454D5F584D533700017700
	?debug	C E3380028001A04
	?debug	C EC0F5F444153445F4D454D5F504F494E54380001+
	?debug	C 7600
	?debug	C E33A0028001A04
	?debug	C E3390020031A3A
	?debug	C EC0F5F444153445F4D454D5F5752495445390001+
	?debug	C 7500
	?debug	C E33C0028001A04
	?debug	C E33B0020031A3C
	?debug	C EC0D5F444153445F4D454D5F54524B3B00017400
	?debug	C E33E0028001A04
	?debug	C E33D0020031A3E
	?debug	C EC0D5F444153445F4D454D5F43594C3D00017300
	?debug	C E33F0050001A18
	?debug	C EC0A5F415245415F444153443F00017200
	?debug	C E3400050001A18
	?debug	C EC0A5F415245415F373932304000017100
	?debug	C E3410014001A08
	?debug	C EC0A5F444153445F4D41534B4100017000
	?debug	C E3430014001A0A
	?debug	C E3420090011A43
	?debug	C EC055F444153444200016F00
	?debug	C EC0E5F4E554D4245525F494F5F4355520400016E+
	?debug	C 00
	?debug	C EC0A5F4E554D4245525F494F0400016D00
	?debug	C E3440028001A04
	?debug	C EC0F5F46494C455F494F5F444556494345440001+
	?debug	C 6C00
	?debug	C E3450028001A04
	?debug	C EC0E5F4F4C445F4F5045524154494F4E4500016B+
	?debug	C 00
	?debug	C E3460050001A0C
	?debug	C EC155F4F4C445F4F46465345545F494F5F444556+
	?debug	C 4943454600016A00
	?debug	C E3470050001A0C
	?debug	C EC115F4F46465345545F494F5F44455649434547+
	?debug	C 00016900
	?debug	C E3480050001A0C
	?debug	C EC085F4353575F4341574800016800
	?debug	C E3490050001A0C
	?debug	C EC0A5F4353575F434F554E544900016700
	?debug	C E34A0014001A08
	?debug	C EC075F4353575F54504A00016600
	?debug	C E34B0014001A08
	?debug	C EC085F4353575F4D4F444B00016500
	?debug	C E34C0050001A0C
	?debug	C EC0B5F4353575F4144524553534C00016400
	?debug	C E34D0014001A08
	?debug	C EC085F4353575F434F444D00016300
	?debug	C E34F0010001A08
	?debug	C E34E0040011A4F
	?debug	C EC0A5F494F5F5354415455534E00016200
	?debug	C E3510028001A08
	?debug	C E3500020031A51
	?debug	C EC145F4E414D455F46494C455F494F5F44455649+
	?debug	C 43455000016100
	?debug	C E3520014001A08
	?debug	C EC0F5F464C41475F494F5F444556494345520001+
	?debug	C 6000
	?debug	C E3530014001A08
	?debug	C EC0F5F545950455F494F5F444556494345530001+
	?debug	C 5F00
	?debug	C E3540028001A04
	?debug	C EC115F4144524553535F494F5F44455649434554+
	?debug	C 00015E00
	?debug	C EC0A5F5052454649585F50520C00015B00
	?debug	C EC0B5F4144524553535F4454410C00015A00
	?debug	C EC095F44494E54524144520400015900
	?debug	C E3550000201A0A
	?debug	C EC045F544C425500015800
	?debug	C EC0C5F5053575F45435F4D41534B0800015700
	?debug	C EC0B5F5053575F4144524553530C00015600
	?debug	C EC0D5F5053575F5052475F4D41534B0800015500
	?debug	C EC075F5053575F43430800015400
	?debug	C EC085F5053575F494C430400015300
	?debug	C EC0C5F5053575F434F445F494E540A00015200
	?debug	C EC095F5053575F414D57500800015100
	?debug	C EC085F5053575F4B45590800015000
	?debug	C EC095F5053575F4D41534B0800014F00
	?debug	C EC0A5F5053575F424547494E1800014E00
	?debug	C E3560050001A10
	?debug	C EC085F525F464C4F41545600014B00
	?debug	C E3570040001A0C
	?debug	C EC025F525700014A00
	?debug	C E3580040001A0C
	?debug	C EC055F523337305800014700
	?debug	C EC0B5F52515F434F4E534F4C450400014500
	?debug	C EC085F52515F373932300400014400
	?debug	C EC085F52515F455849540400014300
	?debug	C EC0A5F5245414C5F54494D450C00014200
	?debug	C EC075F434C4F434B320C00014100
	?debug	C EC075F434C4F434B310C00014000
	?debug	C EC0B5F434F554E545F313030300400013F00
	?debug	C EC0B5F434F554E545F434F4D500C00013C00
	?debug	C EC0F5F5245414C5F54494D455F434F4D500C0001+
	?debug	C 3B00
	?debug	C EC0C5F434C4F434B325F434F4D500C00013A00
	?debug	C EC0C5F434C4F434B315F434F4D500C00013900
	?debug	C EC0A5F434F554E545F4350550C00013700
	?debug	C EC0E5F5245414C5F54494D455F4350550C000136+
	?debug	C 00
	?debug	C EC0B5F434C4F434B325F4350550C00013500
	?debug	C EC0B5F434C4F434B315F4350550C00013400
	?debug	C EC085F52515F434F4D500400013300
	?debug	C EC0D5F52515F54494D45525F4350550400013200
	?debug	C EC095F52515F54494D45520400013100
	?debug	C EC095F52515F54524143450400013000
	?debug	C EC075F52515F49504C0400012F00
	?debug	C EC075F52515F5052470400012E00
	?debug	C EC075F52515F5356430400012D00
	?debug	C EC075F52455455524E0400012C00
	?debug	C EC0A5F504F494E5445525F541800012800
	?debug	C E3590064001A04
	?debug	C E35A0064001A04
	?debug	C E35B0000021A08
	?debug	C E35C0000041A04
	?debug	C E35D0000081A18
	?debug	C EC115F44454255475F5053575F4144524553530C+
	?debug	C 00011800
	?debug	C E35E0000021A04
	?debug	C E360000400160100
	?debug	C E35F00000023600400
	?debug	C EB0A5F6661726D616C6C6F635F00
	?debug	C E36300000023010400
	?debug	C E362000400166300
	?debug	C E36100000023620400
	?debug	C EB075F7369676E616C6100
	?debug	C E36400000023040400
	?debug	C EB095F5F584D4D636F70796400
	?debug	C E36500000023040400
	?debug	C EB085F584D4D667265656500
	?debug	C E36600000023040400
	?debug	C EB095F584D4D616C6C6F636600
	?debug	C E367000000230C0400
	?debug	C EB0C5F584D4D636F72656C6566746700
	?debug	C E36800000023040400
	?debug	C EB0B5F584D4D6C6962696E69746800
	?debug	C E36900000023010400
	?debug	C EB095F48454C5048454C506900
	?debug	C E36A00000023010400
	?debug	C EC0C5F5350454349414C5F494E546A1800
	?debug	C E36B00000023010400
	?debug	C EC0A5F544C425F52455345546B1800
	?debug	C E36C00000023040400
	?debug	C EC085F544C425F5345546C1800
	?debug	C E36D00000023040400
	?debug	C EB115F52554E5F454449545F434F4E534F4C456D+
	?debug	C 00
	?debug	C E36E00000023010400
	?debug	C EC035F44526E1800
	?debug	C E36F00000023010400
	?debug	C EC035F4D526F1800
	?debug	C E37000000023010400
	?debug	C EC035F5352701800
	?debug	C E37100000023010400
	?debug	C EC055F4D4F5645711800
	?debug	C E37200000023010400
	?debug	C EC105F4D4F56455F4D454D5F544F5F3336307218+
	?debug	C 00
	?debug	C E37300000023010400
	?debug	C EC105F4D4F56455F3336305F544F5F4D454D7318+
	?debug	C 00
	?debug	C E374000000230C0400
	?debug	C EC065F435F49534B741800
	?debug	C E37500000023010400
	?debug	C EC065F435F53534B751800
	?debug	C E37600000023040400
	?debug	C EB0D5F52554E5F454449545F4E45547600
	?debug	C E37700000023010400
	?debug	C EB075F434F444547477700
	?debug	C E37800000023010400
	?debug	C EC075F434F44454437781800
	?debug	C E37900000023010400
	?debug	C EC075F434F44454435791800
	?debug	C E37A00000023010400
	?debug	C EC075F434F444544327A1800
	?debug	C E37B00000023010400
	?debug	C EC075F434F444539357B1800
	?debug	C E37C00000023010400
	?debug	C EC075F434F444539317C1800
	?debug	C E37D00000023010400
	?debug	C EC075F434F444535387D1800
	?debug	C E37E00000023010400
	?debug	C EC075F434F444535477E1800
	?debug	C E37F00000023010400
	?debug	C EC075F434F444534387F1800
	?debug	C E3808000000023010400
	?debug	C EC075F434F4445343780801800
	?debug	C E3808100000023010400
	?debug	C EC075F434F4445343580811800
	?debug	C E3808200000023010400
	?debug	C EC075F434F4445343180821800
	?debug	C E3808300000023010400
	?debug	C EC075F434F4445313880831800
	?debug	C E3808400000023010400
	?debug	C EC075F434F4445303780841800
	?debug	C E3808500000023010400
	?debug	C EC075F434F4445303680851800
	?debug	C E3808600000023010400
	?debug	C EC075F434F4445303580861800
	?debug	C E3808700000023010400
	?debug	C EB075F434F44454630808700
	?debug	C E3808800000023010400
	?debug	C EB075F434F44454430808800
	?debug	C E3808900000023010400
	?debug	C EB075F434F44454230808900
	?debug	C E3808A00000023010400
	?debug	C EB075F434F44454130808A00
	?debug	C E3808B00000023010400
	?debug	C EC075F434F44453930808B1800
	?debug	C E3808C00000023010400
	?debug	C EC075F434F44453830808C1800
	?debug	C E3808D00000023010400
	?debug	C EB075F434F44453730808D00
	?debug	C E3808E00000023010400
	?debug	C EB075F434F44453630808E00
	?debug	C E3808F00000023010400
	?debug	C EC075F434F44453530808F1800
	?debug	C E3809000000023010400
	?debug	C EC075F434F4445343080901800
	?debug	C E3809100000023010400
	?debug	C EB075F434F44453330809100
	?debug	C E3809200000023010400
	?debug	C EB075F434F44453230809200
	?debug	C E3809300000023010400
	?debug	C EC075F434F4445313080931800
	?debug	C E3809400000023010400
	?debug	C EC075F434F4445303080941800
	?debug	C E3809500000023040400
	?debug	C EB095F52554E5F45444954809500
	?debug	C E3809600000023010400
	?debug	C EB0A5F53544F52455F435357809600
	?debug	C E3809700000023040400
	?debug	C EB0D5F52554E5F4F50455241544F52809700
	?debug	C E3809800000023040400
	?debug	C EB0C5F494E49545F4348414E454C809800
	?debug	C E3809900000023040400
	?debug	C EB0B5F48494F5F444556494345809900
	?debug	C E3809A00000023040400
	?debug	C EB0B5F5443485F444556494345809A00
	?debug	C E3809B00000023040400
	?debug	C EB0B5F54494F5F444556494345809B00
	?debug	C E3809C00000023040400
	?debug	C EB0B5F53494F5F444556494345809C00
	?debug	C E3809D00000023010400
	?debug	C EC0C5F52554E5F434F4D4D414E44809D1800
	?debug	C E3809E00000023010400
	?debug	C EC095F464F52575F505357809E1800
	?debug	C E3809F00000023010400
	?debug	C EC0A5F53544F52455F505357809F1800
	?debug	C E380A000000023010400
	?debug	C EC095F4C4F41445F50535780A01800
	?debug	C E380A100000023010400
	?debug	C EB0D5F434C4F53455F4348414E454C80A100
	?debug	C E380A200000023010400
	?debug	C EC0D5F434C4F53455F4D454D4F525980A21800
	?debug	C E380A300000023010400
	?debug	C EC095F5055545F574F524480A31800
	?debug	C E380A4000000230C0400
	?debug	C EC095F4745545F574F524480A41800
	?debug	C E380A500000023080400
	?debug	C EC105F4745545F5345434F4E445F4259544580A5+
	?debug	C 1800
	?debug	C E380A600000023010400
	?debug	C EC095F5055545F4259544580A61800
	?debug	C E380A700000023080400
	?debug	C EC095F4745545F4259544580A71800
	?debug	C E380A800000023040400
	?debug	C EC0C5F494E49545F4D454D4F525980A81800
	?debug	C E380A900000023010400
	?debug	C EC035F747480A91800
	?debug	C E380AA00000023010400
	?debug	C EC045F54303080AA1800
	?debug	C E380AB00000023010400
	?debug	C EC025F5480AB1800
	?debug	C E380AC00000023010400
	?debug	C EC035F505280AC1800
	?debug	C E380AD00000023040400
	?debug	C EB065F777269746580AD00
	?debug	C E380AE00000023040400
	?debug	C EB055F7265616480AE00
	?debug	C E380AF00000023040401
	?debug	C EB055F6F70656E80AF00
	?debug	C E380B000000023060400
	?debug	C EB065F6C7365656B80B000
	?debug	C E380B100000023040400
	?debug	C EB065F636C6F736580B100
	?debug	C E380B200000023040401
	?debug	C EB085F737072696E746680B200
	?debug	C E380B300000023040401
	?debug	C EB075F7072696E746680B300
	?debug	C E380B400000023040401
	?debug	C EB085F667072696E746680B400
	?debug	C E380B5000000231B0400
	?debug	C EB065F666F70656E80B500
	?debug	C E380B600000023040400
	?debug	C EB075F66636C6F736580B600
	?debug	C E609584D535F505F5354520C000002040B000F58+
	?debug	C 4D535F504F494E5445525F53545218000002080B+
	?debug	C 000A584D535F4F46465345540C0000020C0B0011+
	?debug	C 584D535F414C4C4F435F48414E444C4552040000+
	?debug	C 02100B000E584D535F424C4F434B5F53495A450C+
	?debug	C 000002120B000A584D535F737461747573040000+
	?debug	C 02160B0003494C432D0000020A0001C300114E55+
	?debug	C 4D4245525F424C4F434B5F4C4F4E470C00000206+
	?debug	C 00012A000C4E554D4245525F424C4F434B040000+
	?debug	C 029041000D4F46465345545F4144524553530400+
	?debug	C 000292410007504F494E54455218000002984100+
	?debug	C 0E4E4558545F424C4F434B5F4255460400000204+
	?debug	C 000125000B5354415455535F46494C4504000002+
	?debug	C 9C41000B4D454D4F52595F46494C45040000029E+
	?debug	C 4100034D454D18000002A041000D4D41585F424C+
	?debug	C 4F434B5F4255460400000202000120000A4D454D+
	?debug	C 4F52595F55534559000002A441000C4D454D4F52+
	?debug	C 595F424C4F434B5A000002084200104D41585F42+
	?debug	C 4C4F434B5F4D454D4F5259040000020000011D00+
	?debug	C 0A4D454D4F52595F4B45595B0000026C42000F4D+
	?debug	C 454D4F52595F544F5F424C4F434B5C0000026C44+
	?debug	C 00064D454D4F52595D0000026C48000C434F4D4D+
	?debug	C 414E445F535441545E0000027050000777636861+
	?debug	C 725F7408060B2B000C7369675F61746F6D69635F+
	?debug	C 74040609100009707472646966665F7406060719+
	?debug	C 0007636C6F636B5F740606061C000674696D655F+
	?debug	C 7406060617000446494C451C06022E000666706F+
	?debug	C 735F740606021F000673697A655F740A06021A00
	?debug	C E200056C6576656C040005666C6167730A000266+
	?debug	C 64080004686F6C640800056273697A6504000662+
	?debug	C 756666657218000463757270180006697374656D+
	?debug	C 700A0005746F6B656E04C014000000
	end
