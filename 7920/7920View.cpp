// 7920View.cpp : implementation of the CMy7920View class
//

#include "stdafx.h"
#include "7920.h"

#include "7920Doc.h"
#include "7920View.h"
#include "MyFontEdt.h"
#include "io.h"
#include "fcntl.h"
#include "stdio.h"
#include "sys\stat.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#include "..\ds360trn.h"
#define KEYLEFT 0x25
#define KEYRIGHT 0x27
#define KEYUP 0x26
#define KEYDOWN 0x28

#define KEYINS  0x2d
#define KEYDEL  0x2e
#define KEYHOME 0x24
#define KEYEND  0x23
#define KEYF1 0x3b
#define KEYF2 0x3c
#define KEYF3 0x3d
#define KEYF4 0x3e
#define KEYF5 0x3f
#define KEYF6 0x40
#define KEYF7 0x41
#define KEYF8 0x42
#define KEYF9 0x43
#define KEYF10 0x44
#define KEYF11 0x54
#define KEYF12 0x55
#define KEYCLS 0xf
#define KEYPD1 0x5e
#define KEYPD2 0x5f
#define KEYPD3 0x60

/////////////////////////////////////////////////////////////////////////////
// CMy7920View

IMPLEMENT_DYNCREATE(CMy7920View, CView)

BEGIN_MESSAGE_MAP(CMy7920View, CView)
	//{{AFX_MSG_MAP(CMy7920View)
	ON_WM_CHAR()
	ON_COMMAND(ID_TEST_CONNECTION, OnTestConnection)
	ON_WM_TIMER()
	ON_WM_KEYDOWN()
	ON_COMMAND(ID_SELECT_NEW_FONT, OnSelectNewFont)
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()



/*************************************************************
*  WORKING UTILITYS
**************************************************************/

CDC* ptDC;
#define ADRESS_EGA 0
int POSITIO;

unsigned char *PT_ADDR;
unsigned char *AREA_7920[10];
unsigned char ATR_EGA;
int Old_XX,Old_YY;
int FlagSetTimer;
TEXTMETRIC MyTextmetr;
short int CURSOR;
/*************************************************************/
void Gotoxy(int X,int Y)
 {
	int X_EGA,Y_EGA;
	X_EGA=X;Y_EGA=Y;
	POSITIO=ADRESS_EGA+((X_EGA-1)+(Y_EGA-1)*80)*2;
 }
/*************************************************************/
void Putchar(int CH)
{
	if (ptDC)
	{
		int XX,YY;
		unsigned char szCH[10];
        
		szCH[0] = CH;
		YY = POSITIO / 160;
		XX = (POSITIO % 160)/2;
		ptDC->TextOut(XX*(MyTextmetr.tmAveCharWidth+2),YY*MyTextmetr.tmHeight, (const char*)szCH,1);
	}
	//*POSITIO++=CH;*POSITIO++=ATR_EGA;
}
/*************************************************************/

void PutShowCh(int Unit_p,int Curs,char C0)
{
	AREA_7920[   Unit_p][Curs]=C0;
	Gotoxy(Curs%80+1,Curs/80+1);Putchar(C0);
}
/*************************************************************/
void Printf(char far*STRING)
{
	static int i;
	i=0;
	while(STRING[i]!=0x00) {Putchar(STRING[i]);i++;}
}
/*************************************************************/
void Normal(void)
{
	ATR_EGA=0x02;
}
/*************************************************************/
void Blink(void)
{
	ATR_EGA=0x70;
}
/*************************************************************/
void End_edit(void)
{
}
/*************************************************************/
int ADRESS_BUFER(char A1,char A2)
 {return(( ((int)(A1&0x3f)) <<6)+(int)(A2&0x3f));
 }
/*************************************************************/
int MAKE_ADRESS_BUFER(int adr)
 {
	return(((adr&0xffc0)<<2)+(adr&0x3f));
 }

/***************************************************************
* INTERFACE FUNCTIONS
****************************************************************/
/***************************************************************/
int WRITE_BUFER(int unit)
	{static int LINE,COLUMN,LINE80;
	 static int C0,C1,COUT;
	 static int OLD_SA;

	 Normal();
	 for(LINE=0,LINE80=0;LINE<24;LINE++,LINE80+=80)
		 {for(COLUMN=0;COLUMN<80;COLUMN++)
				{COUT=AREA_7920[unit][LINE80+COLUMN];

				 if (COUT>=0x20 || COUT==0x00)
					 {Gotoxy(COLUMN+1,LINE+1);if (COUT) Putchar(COUT);else Putchar(' ');
					 }
				 else
					 {if (COUT&0x06 == 0x04) {Gotoxy(COLUMN+1,LINE+1);Blink();}
						else {Gotoxy(COLUMN+1,LINE+1);Normal();}
						Putchar(223);
						OLD_SA=LINE80+COLUMN;
					 }
				}
		 }
	 Blink();
	 Gotoxy(1,25);Printf("PRESS ESC-for EXIT emulation 7920 mode                                         ");
	 CURSOR=0;
	 Normal();
	 CURSOR=((AREA_7920[unit][1920])<<8)+AREA_7920[unit][1921];
	 if (CURSOR<0 || CURSOR>1919) CURSOR=0;
	 Gotoxy(CURSOR%80+1,CURSOR/80+1);
	 Normal();
     AREA_7920[unit][1926]=0;
	 //IO_STATUS[unit][5]=0;
	 //IO_STATUS[unit][6]=0;
	 return(CURSOR);
	}
/**************************************************************/
int SET_POINT_SA(unsigned char far*area,int position)
{
	static int old_position,i;
	old_position=position;
	if (area[old_position]>0 && area[old_position]<0x20) return(old_position);
	i=position;
NEXT:
	i--;
	if (i<0) i=1919;
	if (i==old_position) return(0);
	if (area[i]>0 && area[i]<0x20) return(i);
	goto NEXT;

}


/////////////////////////////////////////////////////////////////////////////
// CMy7920View construction/destruction

CMy7920View::CMy7920View()
{
	// TODO: add construction code here
	FILE *fINI=fopen("C:\NETDSPL.INI","r");
    if (fINI)
    {
		char szTemp[100];
		fgets(szTemp,80,fINI);
        addr = atol(szTemp);
		PT_ADDR =(unsigned char*)(((addr>>16)<<4)+(addr&0xffffl));
		AREA_7920[0]=PT_ADDR;
		fclose(fINI);
    }
	ptDC = NULL;
	FlagSetTimer=0;
	Old_XX=0;Old_YY=0;
	m_MyFont = NULL;
}

CMy7920View::~CMy7920View()
{
	//if (FlagSetTimer)
	//{
	//	KillTimer(901);
	//}
	if (m_MyFont) delete m_MyFont;
}

BOOL CMy7920View::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CMy7920View drawing

void CMy7920View::OnDraw(CDC* pDC)
{
	CMy7920Doc* pDoc = GetDocument();
	CFont *OldCFont= NULL;
	ASSERT_VALID(pDoc);
	if (m_MyFont)
        OldCFont = (CFont*)pDC->SelectObject(m_MyFont);
	pDC->GetTextMetrics( &MyTextmetr );

	ptDC= pDC;
    int Curs= WRITE_BUFER(0);
	int XX,YY;
	YY = Curs / 80;
	XX = (Curs % 80);

    pDC->MoveTo(XX*(MyTextmetr.tmAveCharWidth+2),(YY+1)*MyTextmetr.tmHeight-2);
	pDC->LineTo((XX+1)*(MyTextmetr.tmAveCharWidth+2),(YY+1)*MyTextmetr.tmHeight-2);
	Old_XX=XX;
	Old_YY=YY;
	ptDC= NULL;
	if (FlagSetTimer==0)
	{
		SetTimer(901,100,NULL);
		FlagSetTimer=1;
		RECT lRect;
	
	    GetWindowRect( &lRect ) ;
	     AfxGetMainWnd( )->MoveWindow(0,// lRect.left, 
			0,//lRect.top, 
			82*(MyTextmetr.tmAveCharWidth+2), 
			25*MyTextmetr.tmHeight+85,
			TRUE );
	    
	}
	if (OldCFont) pDC->SelectObject(OldCFont);
	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CMy7920View printing

BOOL CMy7920View::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CMy7920View::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CMy7920View::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CMy7920View diagnostics

#ifdef _DEBUG
void CMy7920View::AssertValid() const
{
	CView::AssertValid();
}

void CMy7920View::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CMy7920Doc* CMy7920View::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CMy7920Doc)));
	return (CMy7920Doc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMy7920View message handlers

void CMy7920View::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
	// TODO: Add your message handler code here and/or call default
     int POINT_SA;
	int UNIT_POINT=0;
	unsigned char COUT;
	int i,j;

	POINT_SA=SET_POINT_SA(AREA_7920[UNIT_POINT],CURSOR);
	UINT C0=nChar;
	switch(C0)
	{
		case 13:COUT=0x7d;
PF:
			AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
			AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
            AREA_7920[UNIT_POINT][1925]=13;
			break;

	    case 27://OLD_ADRESS=0;
			AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
			AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
			End_edit();
			Gotoxy(1,25);
//              printf("\033[2J");
//							HELPHELP("## …†ˆŒ “‹œ’€ Ž…€’Ž€ (‚›•Ž„ ˆ‡ Žƒ€ŒŒ›: ESC)");
//							End_edit();
//							return(0);
	    case 8:
			COUT=AREA_7920[UNIT_POINT][CURSOR];
			if (COUT>0 && COUT<0x20) {;break;}
			if (POINT_SA)
			{
				if (0x08&AREA_7920[UNIT_POINT][POINT_SA])
					{;break;}
				AREA_7920[UNIT_POINT][POINT_SA]|=0x01;
			}
			CURSOR--;if (CURSOR<0) CURSOR=1919;
			Gotoxy(CURSOR%80+1,CURSOR/80+1);
            PutShowCh(UNIT_POINT,CURSOR,' ');
			//AREA_7920[UNIT_POINT][CURSOR]=' ';
			//Gotoxy(CURSOR%80+1,CURSOR/80+1);Putchar(' ');
     		AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
    		AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
			break;
	   default:
			if (C0<' ') C0=' ';
			if (C0>='a' && C0<='z') C0-=0x20;
			if (C0>=' ' && C0<='¯') C0-=0x20;
			if (C0>='à' && C0<='ï') C0-=0x50;
			COUT=AREA_7920[UNIT_POINT][CURSOR];
			if (COUT>0 && COUT<0x20) {break;}
			if (POINT_SA)
			{
				if (0x08&AREA_7920[UNIT_POINT][POINT_SA])
					{break;}
			    AREA_7920[UNIT_POINT][POINT_SA]|=0x01;
			}
			CDC *pDC = GetDC();
			ptDC = pDC;
            PutShowCh(UNIT_POINT,CURSOR,C0);
			ptDC=NULL;
			//AREA_7920[UNIT_POINT][CURSOR]=C0;
			//Gotoxy(CURSOR%80+1,CURSOR/80+1);Putchar(C0);
			CURSOR++;
			if (CURSOR>1919) CURSOR=0;
			AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
			AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
	        int XX,YY;
	        YY = CURSOR / 80;
	        XX = (CURSOR % 80);
        
		    pDC->SelectObject(GetStockObject(WHITE_PEN ));
		    pDC->MoveTo(Old_XX*(MyTextmetr.tmAveCharWidth+2),(Old_YY+1)*MyTextmetr.tmHeight-2);
	        pDC->LineTo((Old_XX+1)*(MyTextmetr.tmAveCharWidth+2),(Old_YY+1)*MyTextmetr.tmHeight-2);
		    pDC->SelectObject(GetStockObject(BLACK_PEN ));
		    pDC->MoveTo(XX*(MyTextmetr.tmAveCharWidth+2),(YY+1)*MyTextmetr.tmHeight-2);
	        pDC->LineTo((XX+1)*(MyTextmetr.tmAveCharWidth+2),(YY+1)*MyTextmetr.tmHeight-2);
		    Old_XX=XX;Old_YY=YY;

			ReleaseDC(pDC);
			goto NO_INVALIDATE;
			break;

	}
	RECT lRect;
	GetWindowRect( &lRect ) ;
	lRect.right-=lRect.left;
	lRect.bottom-=lRect.top;
	lRect.left=0;
	lRect.top=0;
	InvalidateRect( &lRect, TRUE );
NO_INVALIDATE:
	CView::OnChar(nChar, nRepCnt, nFlags);
}

void CMy7920View::OnTestConnection() 
{
	// TODO: Add your command handler code here
	char *ptMem = (char*)(((addr>>16)<<4)+(addr&0xffffl));
	char szTemp[200];
	strcpy(szTemp,ptMem);



}

void CMy7920View::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	if (AREA_7920[0][1926])
	{	
		RECT lRect;
		GetWindowRect( &lRect ) ;
		lRect.right-=lRect.left;
		lRect.bottom-=lRect.top;
		lRect.left=0;
		lRect.top=0;
		InvalidateRect( &lRect, TRUE );	
    }
	CView::OnTimer(nIDEvent);
}

void CMy7920View::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
	// TODO: Add your message handler code here and/or call default
	int POINT_SA;
	int UNIT_POINT=0;
	unsigned char COUT;
	int i,j;
	
	if (nFlags&0x100)
	{
		POINT_SA=SET_POINT_SA(AREA_7920[UNIT_POINT],CURSOR);
		UINT C0=nChar;
		RECT lRect;
		GetWindowRect( &lRect ) ;
		lRect.right-=lRect.left;
		lRect.bottom-=lRect.top;
		lRect.left=0;
		lRect.top=0;

		switch(C0)
		{
		case KEYRIGHT:CURSOR++;
			if (CURSOR>=1920) CURSOR=0;
			Gotoxy(CURSOR%80+1,CURSOR/80+1);
			AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
			AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
			break;
		case KEYLEFT:CURSOR--;
			if (CURSOR<0) CURSOR=1919;
			Gotoxy(CURSOR%80+1,CURSOR/80+1);
			AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
			AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
			break;
		case KEYUP:   CURSOR-=80;
			if (CURSOR<0) CURSOR=0;
			Gotoxy(CURSOR%80+1,CURSOR/80+1);
			AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
			AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
			break;
		case KEYDOWN:CURSOR+=80;
			if (CURSOR>=1920) CURSOR=1919;
			Gotoxy(CURSOR%80+1,CURSOR/80+1);
			AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
			AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
			break;
	    case KEYF1: COUT=0xf1;goto PF;
		case KEYF2: COUT=0xf2;goto PF;
		case KEYF3: COUT=0xf3;goto PF;
		case KEYF4: COUT=0xf4;goto PF;
		case KEYF5: COUT=0xf5;goto PF;
		case KEYF6: COUT=0xf6;goto PF;
		case KEYF7: COUT=0xf7;goto PF;
		case KEYF8: COUT=0xf8;goto PF;
		case KEYF9: COUT=0xf9;goto PF;
		case KEYF10:COUT=0x7a;goto PF;
		case KEYF11:COUT=0x7b;goto PF;
		case KEYF12:COUT=0x7c;goto PF;
		case KEYCLS:COUT=0x6d;goto PF;
		case KEYPD1:COUT=0x6c;goto PF;
		case KEYPD2:COUT=0x6e;goto PF;
		case KEYPD3:COUT=0x6b;
PF:
			AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
			AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
            AREA_7920[UNIT_POINT][1925]=13;
            break;
        case KEYINS:
            for(j=CURSOR;j<((CURSOR+80)/80)*80;j++)
            {
				if (AREA_7920[UNIT_POINT][j]==0) break;
            }
            for(i=j;i>CURSOR;i--)
            {
				PutShowCh(UNIT_POINT,i,AREA_7920[UNIT_POINT][i-1]);
            }
            PutShowCh(UNIT_POINT,CURSOR,' ');
			AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
			AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;

			InvalidateRect( &lRect, TRUE );
            break;
        case KEYDEL:
            for(j=CURSOR;j<((CURSOR+80)/80)*80;j++)
            {
				if (AREA_7920[UNIT_POINT][j]==0) break;
            }
            for(i=CURSOR;i<j;i++)
            {
				PutShowCh(UNIT_POINT,i,AREA_7920[UNIT_POINT][i+1]);
            }
			AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
			AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
            InvalidateRect( &lRect, TRUE );
			break;
        case KEYHOME:CURSOR=0;Gotoxy(CURSOR%80+1,CURSOR/80+1);
            AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
            AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
            Gotoxy(CURSOR%80+1,CURSOR/80+1);
            break;
        case KEYEND:CURSOR=((CURSOR+80)/80)*80;
			if (CURSOR>=1920) CURSOR=0;
            Gotoxy(CURSOR%80+1,CURSOR/80+1);
            AREA_7920[UNIT_POINT][1920]=CURSOR>>8;
            AREA_7920[UNIT_POINT][1921]=CURSOR&0x00ff;
            Gotoxy(CURSOR%80+1,CURSOR/80+1);
            break;
	   default:
			break;

		}
	    int XX,YY;
	    YY = CURSOR / 80;
	    XX = (CURSOR % 80);
        CDC *pDC = GetDC();
		pDC->SelectObject(GetStockObject(WHITE_PEN ));
		pDC->MoveTo(Old_XX*(MyTextmetr.tmAveCharWidth+2),(Old_YY+1)*MyTextmetr.tmHeight-2);
	    pDC->LineTo((Old_XX+1)*(MyTextmetr.tmAveCharWidth+2),(Old_YY+1)*MyTextmetr.tmHeight-2);
		pDC->SelectObject(GetStockObject(BLACK_PEN ));
		pDC->MoveTo(XX*(MyTextmetr.tmAveCharWidth+2),(YY+1)*MyTextmetr.tmHeight-2);
	    pDC->LineTo((XX+1)*(MyTextmetr.tmAveCharWidth+2),(YY+1)*MyTextmetr.tmHeight-2);
		Old_XX=XX;Old_YY=YY;
		ReleaseDC(pDC);

	}
	
	
	CView::OnKeyDown(nChar, nRepCnt, nFlags);
}

void CMy7920View::OnSelectNewFont() 
{
	// TODO: Add your command handler code here
	if (FlagSetTimer)
	{
		KillTimer(901);
		FlagSetTimer=0;
		MyFontEdt myFontEdt;
		if (myFontEdt.DoModal()==IDOK)
		{
			myFontEdt.GetCurrentFont(&m_LOGFONT);
			if (m_MyFont) delete m_MyFont;
			m_MyFont = new CFont();
			m_MyFont->CreateFontIndirect(&m_LOGFONT);
			RECT lRect;
			GetWindowRect( &lRect ) ;
			lRect.right-=lRect.left;
			lRect.bottom-=lRect.top;
			lRect.left=0;
			lRect.top=0;
			InvalidateRect( &lRect, TRUE );
		}
	
	}	
}
