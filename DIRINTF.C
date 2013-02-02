/*
*	  IBM Internal Use Only
*
*   Module name :    DIRINTF
*
*   Function :	     Lan adapter direct interface functions
*
*   Routines in
*   this module:     *dir_interrupt   (ccbptr,adapternum)
*		      dir_status      (ccbptr,adapternum)
*		     *dir_initialize  (ccbptr,adapternum)
*		     *dir_openadapter (ccbptr,adapternum)
*		     *dir_timer_set   (ccbptr,adapternum,secs)
*		     *dir_timer_cancel(ccbptr,adapternum,timerccbptr)
*		      receive	      (ccbptr,adapternum,station)
*
* Parameters:
*
*	  Input:     The adapter number. Other parms are supplied as necessary.
*
*	 Output:     Return code is based upon the kind of CCB executed.
*		     If the return code is 0xFF then the CCB is one that
*		     does not make the program wait while it runs, so the
*		     CCB command is valid, but incomplete when it returns.
*		     When these CCBs complete, they will take the CMD_CPLT
*		     exit defined in the CCB itself.
*		     The return code for a successful "no-wait" CCB is zero.
*		     Otherwise the return code from the CCB is returned,
*		     indicating that an error was detected.
*
*   Notes :	     The * by some of the above names means that the function
*		     does not use a CCB completed interrupt appendage since the
*		     command runs entirely within the adapter and is, therefore,
*		     complete upon return from the INT5c call.
*
*/

#include "dlcptbls.h"
#include "dlcconst.h"
#include "dlcgblv.h"

extern BYTE TRNcmd();
extern void CCBCpltApp(), RecDataApp(), DlcStatApp();

/*-------------------------------------------------------------------+
| dir_interrupt:  Simply forces an adapter interrupt and returns     |
|		  information about its state.			     |
|								     |
|		  Note: This command is executed entirely in the     |
|			adapter handler. Therefore, the command is   |
|			complete upon return from the INT 5C.	     |
*-------------------------------------------------------------------*/

BYTE dir_interrupt (ccbptr,adapternum)
CCB *ccbptr;
BYTE adapternum;
{

	ccbptr->command  = DIR_INTERRUPT;
	ccbptr->adapter  = adapternum;
	ccbptr->parm_tab = ccbptr->pointer = ccbptr->cmd_cplt = ZEROADDRESS;

	/*-----------------------------------------------------+
	| Because the DIR_INTERRUPT function doesn't allow the |
	| use of the CCB command complete appendage, we must   |
	| spin on the return code.			       |
	+-----------------------------------------------------*/

	TRNcmd(ccbptr);

	while( ccbptr->retcode == 0xFF );

	return ( ccbptr->retcode );
}

/*-------------------------------------------------------------------+
| dir_status   :  Reads the general status information of the adapter|
|								     |
|		  The interrupt exit CCBCpltApp() will get control   |
|		  when this command completes.			     |
+-------------------------------------------------------------------*/

BYTE dir_status (ccbptr,adapternum)
CCB *ccbptr;
BYTE adapternum;
{
	static STATUS_PT pt;

	ccbptr->command  = DIR_STATUS;
	ccbptr->adapter  = adapternum;
	ccbptr->parm_tab = (ADDRESS) &pt;
	ccbptr->pointer  = ZEROADDRESS;
	ccbptr->cmd_cplt = (ADDRESS) CCBCpltApp;

	memset( &pt,0,sizeof(STATUS_PT) );

	return (TRNcmd(ccbptr));
}

/*-------------------------------------------------------------------+
| dir_initialize: Initializes the adapter support interface areas    |
|		  in the PC, resets all adapter tables and buffers,  |
|		  and directs the adapter to run the bring-up tests. |
|								     |
|		  Note: This command completely resets the adapter,  |
|			so it should not be used if other programs   |
|			could have pending commands in the adapter.  |
|								     |
|		  Note: This command is executed entirely in the     |
|			adapter handler. Therefore, the command is   |
|			complete upon return from the INT 5C.	     |
+-------------------------------------------------------------------*/

BYTE dir_initialize (ccbptr,adapternum)
CCB *ccbptr;
BYTE adapternum;
{
	static DIR_INIT_PT pt;

	ccbptr->command  = DIR_INITIALIZE;
	ccbptr->adapter  = adapternum;
	ccbptr->retcode  = 0xFF;
	ccbptr->parm_tab = (ADDRESS) &pt;
	ccbptr->cmd_cplt = ccbptr->pointer = ZEROADDRESS;

	memset( &pt,0,sizeof(DIR_INIT_PT) );

	return (TRNcmd(ccbptr));
}


/*-------------------------------------------------------------------+
| dir_openadapter: This command makes the adapter ready for normal   |
|		   ring communication.	All buffers & tables will be |
|		   re-initialized.				     |
|								     |
|		   The interrupt exit CCBCpltApp() will get control  |
|		   when this command completes. 		     |
+-------------------------------------------------------------------*/

#define DLC_MAX_SAP	  2
#define DLC_MAX_STATIONS  2
#define WORKAREASIZE	  48+36*DLC_MAX_SAP+6*DLC_MAX_STATIONS

BYTE dir_openadapter (ccbptr,adapternum)
CCB *ccbptr;
BYTE adapternum;
{
	static DIR_OPEN_PT	openpt;
	static DIR_OPEN_AD_PT	adpt;
	static DIR_OPEN_DIR_PT	dirpt;
	static DIR_OPEN_DLC_PT	dlcpt;

	static BYTE dirbpool[4096];
	static BYTE workarea[WORKAREASIZE];


	ccbptr->command  = DIR_OPEN_ADAPTER;
	ccbptr->adapter  = adapternum;
	ccbptr->parm_tab = (ADDRESS) &openpt;
	ccbptr->pointer  = ZEROADDRESS;
	ccbptr->cmd_cplt = (ADDRESS) CCBCpltApp;

	openpt.adapter_parms = (ADDRESS) &adpt;
	openpt.direct_parms  = (ADDRESS) &dirpt;
	openpt.dlc_parms     = (ADDRESS) &dlcpt;
	openpt.msg_parms     = ZEROADDRESS;

	memset( &adpt, 0,sizeof(DIR_OPEN_AD_PT)  );
	memset( &dirpt,0,sizeof(DIR_OPEN_DIR_PT) );
	memset( &dlcpt,0,sizeof(DIR_OPEN_DLC_PT) );

	dlcpt.max_sap	= DLC_MAX_SAP;
	dlcpt.max_sta	= DLC_MAX_STATIONS;

	return (TRNcmd(ccbptr));
}
/*-------------------------------------------------------------------+
| dir_timer_set   : Sets a special programmable timer to expire in   |
|		    some multiple of half-second periods from 0 to   |
|		    12,000 (100 minutes).  When the specified time   |
|		    expires, the command completes with the retcode  |
|		    set to zero.				     |
|								     |
|		    Note: This command is executed entirely in the   |
|			  adapter handler. Therefore, the command is |
|			  complete upon return from the INT 5C.      |
+-------------------------------------------------------------------*/

BYTE dir_timer_set (ccbptr,adapternum, secs )
CCB *ccbptr;
BYTE adapternum;
int secs;
{

	ccbptr->command  = DIR_TIMER_SET;
	ccbptr->adapter  = adapternum;
	if (secs > 6000)
		secs = 6000;

	/* the function wants the # of half-seconds to appear
	   in the first two bytes of the parm_tab field.  The
	   following does this because of Intel's wonderful
	   byte-swapping feature.
	*/
	ccbptr->parm_tab = (ADDRESS) ((unsigned long) secs);
	ccbptr->pointer  = ZEROADDRESS;
	ccbptr->cmd_cplt = (ADDRESS) CCBCpltApp;

	/* I shouldn't have to do this, but it won't work if I don't */
	ccbptr->retcode = ccbptr->work = 0;

	return (TRNcmd(ccbptr));
}

/*-------------------------------------------------------------------+
| dir_timer_cancel: Cancels a timer that was previously initiated    |
|		    by a DIR.SET.TIMER command. 		     |
|								     |
|		    Note: This command is executed entirely in the   |
|			  adapter handler. Therefore, the command is |
|			  complete upon return from the INT 5C.      |
+-------------------------------------------------------------------*/

BYTE dir_timer_cancel (ccbptr,adapternum, timerccbptr )
CCB *ccbptr;
BYTE adapternum;
ADDRESS timerccbptr;
{

	ccbptr->command  = DIR_TIMER_CANCEL;
	ccbptr->adapter  = adapternum;
	ccbptr->parm_tab = timerccbptr;
	ccbptr->cmd_cplt = ccbptr->pointer = ZEROADDRESS;

	return (TRNcmd(ccbptr));
}


/*-------------------------------------------------------------------+
| receive      :  Enables the adapter to receive data for the	     |
|		  specified station.				     |
|								     |
|		  The interrupt exit CCBCpltApp() will get control   |
|		  when this command completes.			     |
+-------------------------------------------------------------------*/

BYTE receive (ccbptr,adapternum, stationid)
CCB *ccbptr;
BYTE adapternum;
WORD stationid;
{
	static RECV_PT pt;

	ccbptr->command  = RECEIVE;
	ccbptr->adapter  = adapternum;
	ccbptr->pointer  = ZEROADDRESS;
	ccbptr->parm_tab = (ADDRESS) &pt;
	ccbptr->cmd_cplt = (ADDRESS) CCBCpltApp;
	ccbptr->pointer  = ZEROADDRESS;

	memset( &pt,0,sizeof(RECV_PT) );

	pt.station_id	= stationid;
	pt.recv_exit	= (ADDRESS) RecDataApp;

	return (TRNcmd(ccbptr));
}

