// MyFontEdt.cpp : implementation file
//

#include "stdafx.h"
#include "7920.h"
#include "MyFontEdt.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// MyFontEdt

IMPLEMENT_DYNAMIC(MyFontEdt, CFontDialog)

MyFontEdt::MyFontEdt(LPLOGFONT lplfInitial, DWORD dwFlags, CDC* pdcPrinter, CWnd* pParentWnd) : 
	CFontDialog(lplfInitial, dwFlags, pdcPrinter, pParentWnd)
{
}


BEGIN_MESSAGE_MAP(MyFontEdt, CFontDialog)
	//{{AFX_MSG_MAP(MyFontEdt)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

