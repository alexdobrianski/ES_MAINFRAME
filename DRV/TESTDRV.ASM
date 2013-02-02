	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
	endif
	?debug	V 300h
	?debug	S "TESTDRV.C"
	?debug	C E9940E212309544553544452562E43
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C53+
	?debug	C 5444494F2E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 444546532E48
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 4E46494C452E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 4E554C4C2E48
	?debug	C E94019CA1818433A5C424F524C414E44435C494E434C5544455C49+
	?debug	C 4F2E48
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C53+
	?debug	C 5452494E472E48
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C46+
	?debug	C 434E544C2E48
	?debug	C E94019CA181E433A5C424F524C414E44435C494E434C5544455C53+
	?debug	C 59535C535441542E48
_TEXT	segment byte public use16 'CODE'
_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_DATA	segment word public use16 'DATA'
	db	88
	db	116
	db	101
	db	120
	db	116
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	49
	db	166 dup (0)
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	50
	db	172 dup (0)
_DATA	ends
_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,400
	push	si
   ;	
   ;	{
   ;	 int iFile;
   ;	 char ttt[200]  ={"Xtext11111111111111111111111111111"};
   ;	
	lea	ax,word ptr [bp-200]
	push	ss
	push	ax
	push	ds
	push	offset DGROUP:d@w+0
	mov	cx,200
	call	near ptr N_SCOPY@
   ;	
   ;	 char ttt2[200] ={"2222222222222222222222222222"};
   ;	
	lea	ax,word ptr [bp-400]
	push	ss
	push	ax
	push	ds
	push	offset DGROUP:d@w+200
	mov	cx,200
	call	near ptr N_SCOPY@
   ;	
   ;	 unsigned long ADr;
   ;	 printf("\nstring(init)=%s",ttt2);
   ;	
	lea	ax,word ptr [bp-400]
	push	ax
	push	offset DGROUP:s@
	call	near ptr _printf
	add	sp,4
   ;	
   ;	 iFile=open("$NETDSPL",O_BINARY|O_RDONLY);
   ;	
	push	-32767
	push	offset DGROUP:s@+17
	call	near ptr _open
	add	sp,4
	mov	si,ax
   ;	
   ;	 if (iFile>0)
   ;	
	or	si,si
	jle	short @1@86
   ;	
   ;	 {
   ;	
   ;	//  ttt2[0]=2;
   ;	//  *((int*)&ttt2[1])=100;
   ;	//  *((int*)&ttt2[3])=20;
   ;	//
   ;	//  read(iFile,ttt2,40);
   ;	//  printf("\nstring in mem=%s\nEnter new string:",ttt2);
   ;	//
   ;	//  gets(&ttt[5]);
   ;	//
   ;	//  ttt[0]=1;
   ;	//  *((int*)&ttt[1])=100;
   ;	//  *((int*)&ttt[3])=20;
   ;	//
   ;	//  read(iFile,ttt,40);
   ;	//
   ;	//  ttt2[0]=2;
   ;	//  *((int*)&ttt2[1])=100;
   ;	//  *((int*)&ttt2[3])=20;
   ;	//
   ;	//  read(iFile,ttt2,40);
   ;	//  printf("\nstring in mem now=%s",ttt2);
   ;	//
   ;	  ttt[0]=4;
   ;	
	mov	byte ptr [bp-200],4
   ;	
   ;	  read(iFile,ttt,20);
   ;	
	push	20
	lea	ax,word ptr [bp-200]
	push	ax
	push	si
	call	near ptr _read
	add	sp,6
   ;	
   ;	  printf("\nstring in mem (read10)=%s",ttt);
   ;	
	lea	ax,word ptr [bp-200]
	push	ax
	push	offset DGROUP:s@+26
	call	near ptr _printf
	add	sp,4
   ;	
   ;	
   ;	
   ;	  gets(ttt);
   ;	
	lea	ax,word ptr [bp-200]
	push	ax
	call	near ptr _gets
	add	sp,2
   ;	
   ;	  ttt[0]=3;
   ;	
	mov	byte ptr [bp-200],3
   ;	
   ;	  read(iFile,ttt,20);
   ;	
	push	20
	lea	ax,word ptr [bp-200]
	push	ax
	push	si
	call	near ptr _read
	add	sp,6
   ;	
   ;	
   ;	  ttt[0]=4;
   ;	
	mov	byte ptr [bp-200],4
   ;	
   ;	  read(iFile,ttt,20);
   ;	
	push	20
	lea	ax,word ptr [bp-200]
	push	ax
	push	si
	call	near ptr _read
	add	sp,6
   ;	
   ;	  printf("\nstring in mem (read10)=%s",ttt);
   ;	
	lea	ax,word ptr [bp-200]
	push	ax
	push	offset DGROUP:s@+26
	call	near ptr _printf
	add	sp,4
   ;	
   ;	
   ;	//  ttt[0]=5;
   ;	//  read(iFile,ttt,20);
   ;	//  ADr = *(unsigned long*)ttt;
   ;	//  printf("\nadress = %lx ",ADr);
   ;	
   ;	
   ;	  close(iFile);
   ;	
	push	si
	call	near ptr _close
	add	sp,2
   ;	
   ;	 }
   ;	
	pop	si
	leave	
	ret	
@1@86:
   ;	
   ;	 else printf("\file not found");
   ;	
	push	offset DGROUP:s@+53
	call	near ptr _printf
	add	sp,2
   ;	
   ;	}
   ;	
	pop	si
	leave	
	ret	
_main	endp
	?debug	C E9
	?debug	C FA10000000
_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	10
	db	'string(init)=%s'
	db	0
	db	'$NETDSPL'
	db	0
	db	10
	db	'string in mem (read10)=%s'
	db	0
	db	12
	db	'ile not found'
	db	0
_DATA	ends
_TEXT	segment byte public use16 'CODE'
_TEXT	ends
	extrn	N_SCOPY@:far
	public	_main
	extrn	_read:near
	extrn	_open:near
	extrn	_close:near
	extrn	_printf:near
	extrn	_gets:near
_s@	equ	s@
	end
