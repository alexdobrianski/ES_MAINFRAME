/*
*   Module name :    DLCINTF
*
*   Function :	     Lan adapter 802.2 interface functions
*
*   Routines in
*   this module:     dlc_open_sap	   (ccbptr,adapternum,sap)
*		     dlc_open_station	   (ccbptr,adapternum,sapid,destaddr)
*		     dlc_connect_station   (ccbptr,adapternum,stationid,
*					    route_info)
*		     dlc_reset		   (ccbptr,adapternum,stationid)
*		     dlc_transmit_I_frame  (ccbptr,adapternum,buffer1,bufflen1,
*					    buffer2,bufflen2,stationid)
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
*/

#include "dlcptbls.h"
#include "dlcconst.h"
#include "dlcgblv.h"

extern BYTE TRNcmd();
extern void CCBCpltApp(), RecDataApp(), DlcStatApp();


/*-------------------------------------------------------------------+
| dlc_open_sap							     |
|		  Activate a SAP and reserve a number of link	     |
|		  stations for the SAP. 			     |
|								     |
|		  The interrupt exit ccIEpp() will get control when  |
|		  this command completes.			     |
+-------------------------------------------------------------------*/

BYTE dlc_open_sap (ccbptr,adapternum,sap)
CCB *ccbptr;
BYTE adapternum;
BYTE  sap;
{
	static OPEN_SAP_PT pt;
	static BYTE sap_bpool[4096];

	ccbptr->command  = DLC_OPEN_SAP;
	ccbptr->adapter  = adapternum;
	ccbptr->parm_tab = (ADDRESS) &pt;
	ccbptr->pointer  = ZEROADDRESS;
	ccbptr->cmd_cplt = (ADDRESS) CCBCpltApp;

	memset(&pt,0,sizeof(OPEN_SAP_PT));

	pt.sap_value	   = sap;
	pt.station_count   = 2;
	pt.options	   = 0x0C;	/* Handle XIDs, Individual SAP */
	pt.dlc_pool_addr   = (ADDRESS) sap_bpool;
	pt.dlc_pool_len    = 256;
	pt.dlc_status_exit = (ADDRESS) DlcStatApp;


	return (TRNcmd(ccbptr));
}


/*-------------------------------------------------------------------+
| dlc_open_station						     |
|		  Allocate resources for a link station.  The adapter|
|		  support interface performs functions to set up the |
|		  the link station in the adapter, but no ring	     |
|		  communications takes place.  A dlc_connect_station |
|		  command must be issued either to the local or      |
|		  remote link station by its application program to  |
|		  initiate ring communications. Thereafter, another  |
|		  dlc_connect_station must be issued at the other    |
|		  station to complete the establishment of the link. |
|								     |
|		  The interrupt exit (ADDRESS) CCBCpltApp() will get |
|		  control when this command completes.		     |
+-------------------------------------------------------------------*/

BYTE dlc_open_station (ccbptr,adapternum,sapid,destaddr)
CCB *ccbptr;
BYTE adapternum;
WORD sapid;
BYTE destaddr[];
{
	static OPEN_STAT_PT pt;

	ccbptr->command  = DLC_OPEN_STATION;
	ccbptr->adapter  = adapternum;
	ccbptr->parm_tab = (ADDRESS) &pt;
	ccbptr->pointer  = ZEROADDRESS;
	ccbptr->cmd_cplt = (ADDRESS) CCBCpltApp;

	memset(&pt,0,sizeof(OPEN_STAT_PT));

	pt.sap_station_id = sapid;
	pt.rsap_value	  = MYSAP;
	pt.destination	  = destaddr;

	return (TRNcmd(ccbptr));
}


/*-------------------------------------------------------------------+
| dlc_connect_station						     |
|		  Start or complete a SABME-UA exchange to place     |
|		  both the local and remote link stations in a data  |
|		  transfer state.  This will be the first time ring  |
|		  activity takes place between two devices.	     |
|								     |
|		  The interrupt exit (ADDRESS) CCBCpltApp() will get |
|		  control when this command completes.		     |
+-------------------------------------------------------------------*/

BYTE dlc_connect_station (ccbptr,adapternum,stationid,route_info)
CCB *ccbptr;
BYTE adapternum;
WORD stationid;
BYTE *route_info;
{
	static DLC_CONNECT_PT pt;

	ccbptr->command  = DLC_CONNECT_STATION;
	ccbptr->adapter  = adapternum;
	ccbptr->parm_tab = (ADDRESS) &pt;
	ccbptr->pointer  = ZEROADDRESS;
	ccbptr->cmd_cplt = (ADDRESS) CCBCpltApp;

	memset(&pt,0,sizeof(DLC_CONNECT_PT));

	pt.link_station_id = stationid;
	pt.routing_addr    = route_info;

	return (TRNcmd(ccbptr));
}


/*-------------------------------------------------------------------+
| dlc_reset							     |
|		  Resets either one SAP and all associated link      |
|		  stations or all SAPs and all associated link	     |
|		  stations.  All outstanding commands will be	     |
|		  terminated for the SAP(s) and station(s).  All     |
|		  communications will cease and all the related      |
|		  resources will be released.  They must be reopened |
|		  to be used again.				     |
|								     |
|		  A stationid of 0x0000 defines all SAPs & stations, |
|		  and a stationid of 0xnn00 defines SAP 'nn' and all |
|		  its stations. 				     |
|								     |
|		  The interrupt exit (ADDRESS) CCBCpltApp() will get |
|		  control when this command completes.		     |
+-------------------------------------------------------------------*/

BYTE dlc_reset (ccbptr,adapternum,stationid)
CCB *ccbptr;
BYTE adapternum;
WORD  stationid;
{

	memset(ccbptr,0,sizeof(CCB));

	ccbptr->command  = DLC_RESET;
	ccbptr->adapter  = adapternum;
	ccbptr->pointer  = ZEROADDRESS;
	ccbptr->cmd_cplt = (ADDRESS) CCBCpltApp;

	/* the function wants the station id to appear in
	   the first two bytes of the parm_tab field.  The
	   following does this because of Intel's wonderful
	   byte-swapping feature.
	*/
	ccbptr->parm_tab = (ADDRESS) ((unsigned long) stationid);

	return (TRNcmd(ccbptr));
}


/*-------------------------------------------------------------------+
| dlc_transmit_I_frame						     |
|		  Transmits "information" data for a link station.   |
|		  The adapter provides the LAN and DLC headers. Only |
|		  actual data is provided by the caller.  The max    |
|		  length of the data is 2042 bytes.		     |
|								     |
|		  The interrupt exit (ADDRESS) CCBCpltApp() will get |
|		  control when this command completes.		     |
+-------------------------------------------------------------------*/

BYTE dlc_transmit_I_frame (ccbptr,adapternum,buffer1,bufflen1,buffer2,bufflen2,stationid)
CCB *ccbptr;
BYTE adapternum;
BUFFER *buffer1;
WORD bufflen1;
BUFFER *buffer2;
WORD bufflen2;
WORD stationid;
{
	static XMIT_PT pt;

	ccbptr->command  = TRANSMIT_I_FRAME;
	ccbptr->adapter  = adapternum;
	ccbptr->parm_tab = (ADDRESS) &pt;
	ccbptr->pointer  = ZEROADDRESS;
	ccbptr->cmd_cplt = (ADDRESS) CCBCpltApp;

	memset(&pt,0,sizeof(XMIT_PT));

	pt.station_id	= stationid;
	pt.rsap 	= MYSAP;
	pt.buff_one_len = bufflen1;
	pt.buff_two_len = bufflen2;
	pt.buffer_one	= buffer1;
	pt.buffer_two	= buffer2;

	return (TRNcmd(ccbptr));
}


