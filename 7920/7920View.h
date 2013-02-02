// 7920View.h : interface of the CMy7920View class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_7920VIEW_H__F427F64E_2276_11D1_97E1_444553540000__INCLUDED_)
#define AFX_7920VIEW_H__F427F64E_2276_11D1_97E1_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

class CMy7920View : public CView
{
protected: // create from serialization only
	CMy7920View();
	DECLARE_DYNCREATE(CMy7920View)

// Attributes
public:
	CMy7920Doc* GetDocument();
int INTERRUPT;
int FLAG_OPEN_CONNECTION;
unsigned long addr;
char *PT_MAIN_POINTER;
CFont *m_MyFont;
LOGFONT m_LOGFONT;
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMy7920View)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CMy7920View();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CMy7920View)
	afx_msg void OnChar(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnTestConnection();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnSelectNewFont();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in 7920View.cpp
inline CMy7920Doc* CMy7920View::GetDocument()
   { return (CMy7920Doc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_7920VIEW_H__F427F64E_2276_11D1_97E1_444553540000__INCLUDED_)
