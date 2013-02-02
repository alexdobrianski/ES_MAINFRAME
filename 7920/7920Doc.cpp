// 7920Doc.cpp : implementation of the CMy7920Doc class
//

#include "stdafx.h"
#include "7920.h"

#include "7920Doc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMy7920Doc

IMPLEMENT_DYNCREATE(CMy7920Doc, CDocument)

BEGIN_MESSAGE_MAP(CMy7920Doc, CDocument)
	//{{AFX_MSG_MAP(CMy7920Doc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMy7920Doc construction/destruction

CMy7920Doc::CMy7920Doc()
{
	// TODO: add one-time construction code here

}

CMy7920Doc::~CMy7920Doc()
{
}

BOOL CMy7920Doc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CMy7920Doc serialization

void CMy7920Doc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CMy7920Doc diagnostics

#ifdef _DEBUG
void CMy7920Doc::AssertValid() const
{
	CDocument::AssertValid();
}

void CMy7920Doc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMy7920Doc commands
