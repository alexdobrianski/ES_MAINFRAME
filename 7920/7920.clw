; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CMy7920View
LastTemplate=CFontDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "7920.h"
LastPage=0

ClassCount=6
Class1=CMy7920App
Class2=CMy7920Doc
Class3=CMy7920View
Class4=CMainFrame

ResourceCount=2
Resource1=IDR_MAINFRAME
Class5=CAboutDlg
Class6=MyFontEdt
Resource2=IDD_ABOUTBOX

[CLS:CMy7920App]
Type=0
HeaderFile=7920.h
ImplementationFile=7920.cpp
Filter=N

[CLS:CMy7920Doc]
Type=0
HeaderFile=7920Doc.h
ImplementationFile=7920Doc.cpp
Filter=N

[CLS:CMy7920View]
Type=0
HeaderFile=7920View.h
ImplementationFile=7920View.cpp
Filter=C
BaseClass=CView
VirtualFilter=VWC
LastObject=CMy7920View

[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
LastObject=ID_SELECT_NEW_FONT
BaseClass=CFrameWnd
VirtualFilter=fWC



[CLS:CAboutDlg]
Type=0
HeaderFile=7920.cpp
ImplementationFile=7920.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_SAVE_AS
Command5=ID_FILE_PRINT
Command6=ID_FILE_PRINT_PREVIEW
Command7=ID_FILE_PRINT_SETUP
Command8=ID_FILE_MRU_FILE1
Command9=ID_APP_EXIT
Command10=ID_EDIT_UNDO
Command11=ID_EDIT_CUT
Command12=ID_EDIT_COPY
Command13=ID_EDIT_PASTE
Command14=ID_SELECT_NEW_FONT
Command15=ID_VIEW_TOOLBAR
Command16=ID_VIEW_STATUS_BAR
Command17=ID_TEST_CONNECTION
Command18=ID_APP_ABOUT
CommandCount=18

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[TB:IDR_MAINFRAME]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
CommandCount=8

[CLS:MyFontEdt]
Type=0
HeaderFile=MyFontEdt.h
ImplementationFile=MyFontEdt.cpp
BaseClass=CFontDialog
Filter=D
LastObject=ID_APP_ABOUT

