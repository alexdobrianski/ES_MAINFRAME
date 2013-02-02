;///////////////////////////////////////////////////////
;// device driver was wrote by alex dobrianski
;///////////////////////////////////////////////////////


DGROUP group _DATA,CONST,_BSS,_TEXT
_DATA segment word public 'DATA'
                assume ds:DGROUP
                public _deviceheader
                org 0
_deviceheader label word
next_dev      dd    -1
attribute     dw    08800h
strategy      dw    DGROUP:_strategy
interrupt     dw    DGROUP:_interrupt
dev_name      db    '$NETDSPL'
                 public _rhptr
_rhptr        equ   $
rh_ofs        dw    ?
rh_seg        dw    ?
stack_ptr     dw    ?
stack_seg     dw    ?
newstack      db 100h dup (?)
newstacktop   label word
              public _main
_main         dw ?
              public DGROUP@
DGROUP@     dw ?
DDDS        dw ?
DDCS        dw ?
              public _errno
_errno        dd ?
_DATA         ends

CONST         segment word public 'CONST'
              assume   ds:DGROUP
CONST         ends

_BSS          segment word public 'BSS'
              assume ds:DGROUP
_BSS          ends

_TEXT         segment word public 'CODE'
              assume cs:DGROUP,ds:DGROUP
              public _strategy
_strategy     proc far
                mov cs:rh_seg,es
                mov cs:rh_ofs,bx
		ret
_strategy     endp
                                  public _interrupt
_interrupt    proc far
                                        cld
                                        .386
                                        push ds
                                        push es
                                        push eax
                                        push ebx
                                        push ecx
                                        push edx
                                        push edi
                                        push esi
                                        .286
                                        cli
                                        mov cs:stack_ptr,sp
                                        mov cs:stack_seg,ss
                                        mov ax,cs
                                        mov ss,ax
                                        mov sp,newstacktop
                                        sti
					mov ax,cs:rh_seg
					mov es,ax
					mov bx,cs:rh_ofs
					mov al,es:[bx]+2
					cmp al,0
					jne NO0
                                        push cs
                                        pop ax
                                        mov cs:DDCS,ax
                                        push ds
                                        pop ax
					mov cs:DGROUP@,ax
                                        mov cs:DDDS,ax
NO0:                                    mov ax,cs:DGROUP@
					push ax
					pop  ds
					mov ax,cs:rh_seg
					mov es,ax
					mov bx,cs:rh_ofs
					mov al,es:[bx]+2
					rol al,1
					lea di,cmdtab
					mov ah,0
					add di,ax
					call word ptr[di]
					cli
					mov ss,cs:stack_seg
					mov sp,cs:stack_ptr
					sti
                                        .386
                                        pop esi
                                        pop edi
                                        pop edx
                                        pop ecx
                                        pop ebx
                                        pop eax
                                        pop es
                                        pop ds
                                        .286
                                        ret
                                        EXTRN _init:near
                                        EXTRN _mediacheck:near
                                        EXTRN _getbpb:near
																				EXTRN _ioctlinput:near
                                        EXTRN _input:near
                                        EXTRN _ndinput:near
                                        EXTRN _inputstatus:near
                                        EXTRN _inputflush:near
                                        EXTRN _output:near
                                        EXTRN _outputverify:near
																																																				 EXTRN _outputstatus:near
                                        EXTRN _outputflush:near
                                        EXTRN _ioctloutput:near
                                        EXTRN _deviceopen:near
                                        EXTRN _deviceclose:near
                                        EXTRN _removeable:near
                                        EXTRN _outputbusy:near
                                        EXTRN _badcommand:near
                                        EXTRN _generioctl:near
                                        EXTRN _getdevice:near
                                        EXTRN _ioctlquery:near
                                        EXTRN _removeable:near

                                        EXTRN _readlong:near
                                        EXTRN _readlongprefetch:near
                                        EXTRN _seek:near
                                        EXTRN _play:near
                                        EXTRN _stopplay:near
CMDTAB         label word
                                        dw DGROUP:_init         ;0
                                        dw DGROUP:_mediacheck         ;1
                                        dw DGROUP:_getbpb         ;2
                                        dw DGROUP:_ioctlinput        ;3
                                        dw DGROUP:_input    ;4
                                        dw DGROUP:_ndinput        ;5
                                        dw DGROUP:_inputstatus      ;6
                                        dw DGROUP:_inputflush  ;7
                                        dw DGROUP:_output   ;8
                                        dw DGROUP:_outputverify       ;9
                                        dw DGROUP:_outputstatus ;a
                                        dw DGROUP:_outputflush ;b
                                        dw DGROUP:_ioctlinput  ;c
                                        dw DGROUP:_deviceopen   ;d
                                        dw DGROUP:_deviceclose   ;e
																				dw DGROUP:_removeable  ;f
                                        dw DGROUP:_outputbusy   ;10
                                        dw DGROUP:_badcommand  ;11
                                        dw DGROUP:_badcommand   ;12
                                        dw DGROUP:_getdevice   ;13
                                        dw DGROUP:_ioctlquery    ;14
exit:
_interrupt     endp
_TEXT          ends
               end







