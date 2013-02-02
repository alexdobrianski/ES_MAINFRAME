// 7920Doc.h : interface of the CMy7920Doc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_7920DOC_H__F427F64C_2276_11D1_97E1_444553540000__INCLUDED_)
#define AFX_7920DOC_H__F427F64C_2276_11D1_97E1_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000


class CMy7920Doc : public CDocument
{
protected: // create from serialization only
	CMy7920Doc();
	DECLARE_DYNCREATE(CMy7920Doc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMy7920Doc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CMy7920Doc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CMy7920Doc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_7920DOC_H__F427F64C_2276_11D1_97E1_444553540000__INCLUDED_)
