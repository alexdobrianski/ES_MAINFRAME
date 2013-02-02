; Turbo Assembler    Copyright (c) 1988, 1991 By Borland International, Inc.

; HELLO.ASM - Display the message "Hello World"

; From the Turbo Assembler Users Guide - Getting started
   .MODEL huge
   .STACK 100h
   .DATA
HelloMessage DB 'Hello, world',13,10,'$'
B00 DD 0ffffh
A00 DD 0fefefefeh
T00 DQ  00000h
bb  DD 0fefefefeh
cc  DD 0fffffh
B000 DW 0ffffh
   .CODE
   mov  ax,@data
   mov  ds,ax                  ;set DS to point to the data segment
   mov  ah,9                   ;DOS print string function
   mov  dx,OFFSET HelloMessage ;point to "Hello, world"
   int  21h                    ;display "Hello, world"
    push ds
    pop es
    mov cx,1000
   .386
   mov ax,B000[bx]
   mov Eax,B00[bx]
   .386p
    sgdt T00
    lgdt T00
    mov Ebx,B00
L:  mov al,es:[Ebx]
    inc Ebx
    mov Eax,B00[Ebx]
    .286
    loop L
   mov  ah,4ch                 ;DOS terminate program function
   int  21h                    ;terminate the program
   END
