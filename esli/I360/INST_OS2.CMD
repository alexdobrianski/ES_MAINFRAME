/*
 Installation Script for Esli (OS/2)
*/

CALL rxfuncadd sysloadfuncs, rexxutil, sysloadfuncs
CALL sysloadfuncs

CALL SysFileTree 'Esli.exe', datei, 'FO'
IF datei.0 < 1 THEN
DO
   SAY "Esli not found. CD <esli_catalog>, please "
   EXIT
END

pfad = FILESPEC("path",datei.1)
disk = FILESPEC("drive",datei.1)
path = OVERLAY(pfad,disk,3)

SAY "Installation of esli for DOS (c) 1996 Urusov V.V. 2:5030/269.0"

class='WPFolder'
title='Esli'
ort='<WP_DESKTOP>'
param='OBJECTID=<Esli>;ICONFILE='path'\I360.ICO;ICONPOS=40 53;BACKGROUND=(none),,,C,114 130 212;'
mode='REPLACE'
rc = SysCreateObject(class,title,ort,param,mode)

class='WPProgram'
title='Start ESLI'
ort='<Esli>'
param='EXENAME='path'\ESLI.EXE;ICONFILE='path'\I360.ICO;STARTUPDIR='path';PARAMETERS=I 0;SET XMS_MEMORY_LIMIT=8192;'
mode='REPLACE'
rc = SysCreateObject(class,title,ort,param,mode)

class='WPProgram'
title='Esli'
ort='<Esli>'
param='EXENAME='path'\ESLI.EXE;ICONFILE='path'\I360.ICO;STARTUPDIR='path';PARAMETERS=G 0;SET XMS_MEMORY_LIMIT=8192;'
mode='REPLACE'
rc = SysCreateObject(class,title,ort,param,mode)

class='WPProgram'
title='Esli Server'
ort='<Esli>'
param='EXENAME='path'\ESLI.EXE;ICONFILE='path'\I360.ICO;STARTUPDIR='path';PARAMETERS=GS 0;SET XMS_MEMORY_LIMIT=8192;'
mode='REPLACE'
rc = SysCreateObject(class,title,ort,param,mode)

EXIT
