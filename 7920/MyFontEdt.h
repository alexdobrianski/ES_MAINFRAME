#if !defined(AFX_MYFONTEDT_H__8C4C9142_22DD_11D1_97E1_444553540000__INCLUDED_)
#define AFX_MYFONTEDT_H__8C4C9142_22DD_11D1_97E1_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// MyFontEdt.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// MyFontEdt dialog

class MyFontEdt : public CFontDialog
{
	DECLARE_DYNAMIC(MyFontEdt)

public:
	MyFontEdt(LPLOGFONT lplfInitial = NULL,
		DWORD dwFlags = CF_EFFECTS | CF_SCREENFONTS,
		CDC* pdcPrinter = NULL,
		CWnd* pParentWnd = NULL);
#ifndef _AFX_NO_RICHEDIT_SUPPORT
	MyFontEdt(const CHARFORMAT& charformat,
		DWORD dwFlags = CF_SCREENFONTS,
		CDC* pdcPrinter = NULL,
		CWnd* pParentWnd = NULL);
#endif

protected:
	//{{AFX_MSG(MyFontEdt)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MYFONTEDT_H__8C4C9142_22DD_11D1_97E1_444553540000__INCLUDED_)
