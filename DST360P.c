##HELP1
[2J
[37;44m
ESC   - dump memory & chanel and EXIT emulator
Q     - EXIT emulator without dumping memory and losting chanel status
D     - display memory
E     - edit word in memory
R     - display registers & PSW
T     - on trace
F8    - trace comand
F     - off trace
S     - stop all trace
I     - IPL
B     - display floating registers
M     - modify default settings
l     - change unit status (READY/REQUEST0
TAB   - REQUEST button on 01F console
(F10) - switch to terminals (7920,cons,etc.)
##
##MAIN360
[2J
�����������������������������������������������������������������������������Ŀ
�                                           ����  ������   ���   ���          �
� Emulator               Ver.2.1             ��    ��  ��   ��� ���           �
�                                            ��    �����    �� � ��           �
�                                            ��    ��  ��   ��   ��           �
�  for AT/386 /486                          ����  ������   ���� ����    360   �
�����������������������������������������������������������������������������Ĵ
� CSW � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �   �
�����������������������������������������������������������������������������Ĵ
� PSW � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �   �
�����������������������������������������������������������������������������Ĵ
�                                                       �ͻ�ͻ�ͻ      ���ͻ  �
##
##MAIN360_
�                                                       �ͼ�ͼ�ͼ      ���ͼ  �
�������������������������������������������������������������������������������

##
##MAIN370
�����������������������������������������������������������������������������Ŀ
�                                           ����  ������   ���   ���          �
� Emulator               Ver.2.1             ��    ��  ��   ��� ���           �
�                                            ��    �����    �� � ��           �
�                                            ��    ��  ��   ��   ��           �
�  for AT/386 /486                          ����  ������   ���� ����    370   �
�����������������������������������������������������������������������������Ĵ
� CSW � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �   �
�����������������������������������������������������������������������������Ĵ
� PSW � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �   �
�����������������������������������������������������������������������������Ĵ
�                                                       �ͻ�ͻ�ͻ      ���ͻ  �
##
##MAIN370_
�                                                       �ͼ�ͼ�ͼ      ���ͼ  �
�������������������������������������������������������������������������������

##
##PROTECT
�� ����������� ����������������� ������� ���������
������� ���������� ��������� �������:
  1. ��-�-����-������-��-��������� �������� ����������� ������
     DST360P.EXE ��� ������ ������ ����� INIT360.PRM
  2. � ����������� ������� ������������� ����������������� ������
     �� ������ ����������� ���������������� �������������
  3. ����������������� ��� ������������ (� ��������� ��� ��� ���)
     �� �������� (0622)-(90-44-07)/(35-41-28)

##
##IPL
�����������������������������������������������������������������������������Ĵ
� Procedure  IPL                                        ���ͻ          ���ͻ  �
�  Enter IPL adress, please...                          �
##
##IPL_
� Procedure IPL started.                                ���ͼ          ���ͼ  �
�������������������������������������������������������������������������������

##
##TRACE
 Enter trace type:
 c-command (stopping after each command),
 i-i/o,
 u-unit,
 p-non stop trace,
 b-back trace,
 e-end back trace,
 k-print back trace,
 ESC-exit this menu
##
##MAX BLOCK MEMORY (SSK)
 MAX BLOCK MEMORY (SSK)
##
##������������ ������
 NOT ENOUGHT MEMORY
##
## NOT ENOUGT MEMORY IN XMS
 NOT ENOUGT MEMORY IN XMS
##
##INITIALISATION XMS:
 INITIALISATION XMS:
##
##ERROR in XMS INITIALISATION
 ERROR in XMS INITIALISATION
##
##END-OFF-INITIALISATION XMS.
 END-OFF-INITIALISATION XMS.


##
## NO XMS !!! check the XMS drive
 NO XMS !!! check the XMS drive
##
##STORING XMS:
 STORING XMS:
##
##END-OFF-STORING XMS.
END-OFF-STORING XMS.


##
#1MAX BLOCK MEMORY (GET BYTE)
MAX BLOCK MEMORY (GET BYTE)
##
#1MAX BLOCK MEMORY (PUT BYTE)
MAX BLOCK MEMORY (PUT BYTE)
##
##KEY PUT_BYTE_2
KEY PUT_BYTE_2
##
#1MAX BLOCK MEMORY (CLC BYTE)
MAX BLOCK MEMORY (CLC BYTE)
##
##CHECK COD OPERATION=
WRONG COMMAND CODE=
##
## DST360P /<?/H/I/>
[2J
To start 360 emulator type:
 ------------------------------------------------------
 [37;44mDST360P /<?/H/I/>[0m
 ------------------------------------------------------
         ? -HELP
         H -HELP
         R -RUN IBM 360/370 EMULATOR
         I -INIT MEMORY & PROCESSOR BEFOR RUN
 ------------------------------------------------------
 Make shure that in CONFIG.SYS file present string:
 [37;44mDEVICE=...ANSI.SYS[0m

 if you already included ANSI.SYS in CONFIG.SYS, then
 you can see color text on this help screen
-------------------------------------------------------
##
## ����� ������ ��������� (����� �� ���������: ESC)
[K
[K
[K[3A[s[25;0H[36;44m�CPU�F1-help�I-ipl�F10-cons/term�F9 -rqst�ESC-exit�Q-xexit�M-modify�R�D�B�F8�  [37;40m[u
##
##������ ������� ESC - ������ �� �����
[u       PRESSED ESC KEY - REQUEST TO EXIT
##
##�������� �/� ��� ESC
[K
[K
[K[3A[s[25;0H[36;44m�CONSOLE�for REQUEST press TAB; for EXIT CONSOLE MODE press ESC                [37;40m[u
##
##������������ � ���������
[2J [36;44mConnect to terminal or operator console[37;40m
##
##FN - ����������� � ����
[K
[K
[K[3A[s[25;0H[36;44m�SWITCH TO�F1/F2..FN-terminal�TAB-console�ESC-CPU panel                        [37;40m[u
##
##������� ������ ����������
[s[25;0H[36;44mWRONG UNIT [37;40m[u
##
##Pressed-ESC: EXIT request
[K
[K
[K[3A[s[25;0H[36;44m�Pressed-ESC� EXIT. Are you sure? (Y/N)�                                       [37;40m[u
##
##Wait Please
[s[25;0H[36;44m�Wait Please)�                                          [37;40m[u
##
##Pressed-Q: EXIT without SAVE request
[K
[K
[K[3A[s[25;0H[36;44m�Pressed-Q� EXIT without SAVE. Are you sure? (Y/N)�                            [37;40m[u
##
##REQUEST or READY option:
[2J [36;44mREQUEST or READY option:[37;40m

##
##press ESC - to exit REQUEST
[K
[K
[K[3A[s[25;0H[36;44m�press ESC�- to exit REQUEST option or FN to make request or to READY�         [37;40m[u
##
##CLS
[2J
##
##EDIT1
[s[K[25;0H[36;44mENTER ADDRES [K[37;40m[u#
##
##EDIT2
[s[K[25;0H[36;44mENTER WORD [K[37;40m[u#
##
##