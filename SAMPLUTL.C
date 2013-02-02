#include <stdio.h>
#include <dos.h>
#include <mem.h>

#include "ncb.h"
#include "dlcptbls.h"
#include "dlcconst.h"
#include "codetbl.h"
#include "funcdef.h"

/*****************************************************************************/
/*
**  TableLookUp This function scans a code table for a specified value,
**  		and returns a text string which can be used as a message.
*/

char *TableLookUp(table, key)
struct CodeTable *table;
unsigned char key;
{
	while (table->label && table->code!=key) table++;
	if (table->label) return(table->label);
	else return(" <unknown> ");
}

/**********************************************************************/
/*
**  TRNcmd 	Execute an NCB or CCB
**
**    		Accepts a pointer to an NCB or CCB and passes it to the
**		network interrupt via an INT 5C.
**
**		Returns the value in the AX register which is the NCB
**		or CCB return code.
*/

#define  TRNINT	0x5C

int TRNcmd(cmdptr)
void *cmdptr;
{
	union REGS inregs, outregs;
	struct SREGS segregs;
	int iRc;

	segread(&segregs);
	segregs.es  = FP_SEG(cmdptr);
	inregs.x.bx = FP_OFF(cmdptr);

	iRc=int86x( TRNINT, &inregs, &outregs, &segregs);
	return iRc;
}
	
/**********************************************************************/
/*
** Installed    Determines what INT5C handlers have been installed.
**
**		Returns 0 if nothing is handling INT5C
**			1 if only the adapter handler is installed
**			2 if NETBIOS is installed
*/

Installed(lana)
unsigned char lana;
{
	unsigned long *int5cptr;
	CCB ccb;
	NCB ncb;
	STATUS_PT ParmTab;


				/*------------------------------------------------------------+
				|  Is anything handling interrupt 5C ?                        |
				+------------------------------------------------------------*/

				FP_SEG(int5cptr) = 0x0000;
				FP_OFF(int5cptr) = (0x5C << 2);
				if (!*int5cptr)
								return 0;               /* nothing to handle int 5C's     */

				/*------------------------------------------------------------+
				|  That's good.  Now see if the adapter handler is installed  |
				+------------------------------------------------------------*/

	memset( &ccb, 0, sizeof(CCB) );
				ccb.command  = DIR_INTERRUPT;
				ccb.retcode  = 0x42;
				ccb.adapter  = lana;
				ccb.parm_tab = ccb.pointer = ccb.cmd_cplt = ZEROADDRESS;

	TRNcmd(&ccb);

//	if (ccb.retcode == 0x42)
//		return 0;		/* AH not present */
//	else
//		while( ccb.retcode == 0xFF ) ;   /* spin */


				/*------------------------------------------------------------+
				|  Great! Finally, we see if NETBIOS is installed by trying   |
				|  to have it execute an invalid command.		      |
				+------------------------------------------------------------*/

	memset( &ncb, 0, sizeof(NCB) );
	ncb.command = 0xFF;		/* an invalid command */

	TRNcmd(&ncb);

	if (ncb.retcode == 0x03)
		return 2;		/* NETBIOS is present */
	else
		return 1;		/* Alas, only the AH is present */


}

