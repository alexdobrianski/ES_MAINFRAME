/*
*   Module name :     DLCSAMPL
*
*   Function :	      Demo program for 802.2 interface of the Token Ring
*
*   Usage :	      DLCSAMPL	 {SEND	     Netaddress=123456789abc
*					     [Adapter={0|1} ]	  }
*
*				 {RECV	     [Adapter={0|1} ]	  }
*
*				 {DISP	     [Adapter={0|1} ]	  }
*
*				 defaults: Adapter=0
*
*				 note that the remote address MUST
*				 be supplied with the SEND option.
*
*		      DLCSAMPL	 ?
*
*   Return codes :    0    if successful
*		      1    if a parameter was bad and/or Help was given
*		      x    if an NCB fails the ncb.retcode is returned
*
*
*
*/

#include <stdio.h>
#include <dos.h>
#include <ctype.h>

#include "dlcptbls.h"
#include "dlcconst.h"
#include "dlcerror.h"

/* Global variables are defined here */
#define DEFGBLVARS
#include "dlcgblv.h"

BYTE funcaddr[4] = {0x00, 0x01, 0x00, 0x00};

BYTE message[] = "Hello!";

/* all the CCBs I'll ever need */
CCB workccb, timrccb, recvccb;

main(argc,argv)
int argc;
char *argv[];
{

	ADDRESS int5cptr, bp;
	BYTE rc,*dataptr;
	WORD Sapid, Stationid, i, msglen;
	RECV_BUFFER_ONE *rbp;
	DLC_STAT_TBL *dsp;


	/*------------------------------------------------------------+
	|  Set the default parameters and initial values	      |
	+------------------------------------------------------------*/

	Mode = SEND;
	Lana = 0;
	memset( RmtAddr, 0, 6);

	if ( GrabArgs( argc, argv ) )  {
		Help();
		exit(1);
	}
	else if (Mode == SEND && RmtAddr[0] == 0) {
		puts( ">> Remote network adapter address required for SEND" );
		Terminate( " ",0 );
	}

	printf( "\nDLC Sample Program Started in %s mode.\n",
		(Mode == SEND ? "SEND" : (Mode == RECV ? "RECEIVE" : "DISP")));

	/*------------------------------------------------------------+
	|  Make sure something is handling INT 5C calls 	      |
	+------------------------------------------------------------*/

	FP_SEG(int5cptr) = 0x0000;
	FP_OFF(int5cptr) = (0x5C << 4);
	if (!*int5cptr) {
		printf( ">> Netbios and/or Adapter handler not installed!\n" );
		Terminate( " ", 0);
	}

	/*------------------------------------------------------------+
	|  Initialize the appendages with the addresses of our	      |
	|  spin variables.					      |
	+------------------------------------------------------------*/

	appinit(&CCBADDR,&RECADDR,&DLCADDR);

	/*------------------------------------------------------------+
	|  See that the adapter is initialized and open and make sure |
	|  the user isn't trying to get us to talk to ourselves.      |
	+------------------------------------------------------------*/

	LanaInit();
	if (Mode == DISP)  {

		printf( "\nThe lan adapter %u address is  ", Lana);
		for( i=0; i<6; ++i)
			printf( "%02X", LclAddr[i] );
		printf( ".\n" );
		exit(0);
	}

	if (memcmp(LclAddr,RmtAddr,6) == 0) {
		puts( ">> This program cannot talk to itself" );
		Terminate( " ",0);
	}

	/*------------------------------------------------------------+
	|  Open our special SAP 				      |
	+------------------------------------------------------------*/
	printf( "Opening our SAP..." );
	Reset(CCBADDR);
	dlc_open_sap( &workccb, Lana, MYSAP );
	Spin(CCBADDR);

	if (workccb.retcode)
		Terminate( "DLC_OPEN_SAP", workccb.retcode);
	else {
		Sapid = ((OPEN_SAP_PT *)(workccb.parm_tab))->station_id;
		puts( "ok" );
	}


	if (Mode == SEND) {
		/*----------------------------------------------------+
		|  If we're the SENDer, we now open a link station    |
		|  and do a dlc_connect.			      |
		+----------------------------------------------------*/

		printf( "\nOpening the link station ..." );
		Reset(CCBADDR);
		dlc_open_station( &workccb, Lana, Sapid, RmtAddr );
		Spin(CCBADDR);

		if (workccb.retcode)
			Terminate( "DLC_OPEN_STATION", workccb.retcode);
		else
			puts( "ok" );

		Stationid = ((OPEN_STAT_PT *)(workccb.parm_tab))->
							    link_station_id;

		printf( "Connecting the link station ..." );
		Reset(CCBADDR);
		dlc_connect_station( &workccb, Lana, Stationid, ZEROADDRESS );
		Spin(CCBADDR);

		if (workccb.retcode)
			Terminate( "DLC_CONNECT_STATION", workccb.retcode);
		else
			puts( "ok" );

		/*----------------------------------------------------+
		|  Next, we send our test data to the other station   |
		|  & set a timer to insure that we don't wait forever |
		+----------------------------------------------------*/

		msglen = strlen(message);
		dir_timer_set( &timrccb, Lana, RECVWAITSECS );
		if (timrccb.retcode != 0xFF)
			Terminate( "DIR_TIMER_SET", timrccb.retcode);


		printf( "\nSending the message: <%s> ...", message );
		Reset(CCBADDR);
		dlc_transmit_I_frame( &workccb, Lana, message, msglen,
				      ZEROADDRESS, (WORD) 0, Stationid);
		Spin(CCBADDR);

		if (timrccb.retcode != 0xFF)
			printf( "Send timer expired\n" );
		else if (workccb.retcode)
			Terminate( "DLC_TRANSMIT_I_FRAME", workccb.retcode);
		else
			puts( "ok\n" );

	}

	else {	/* Mode is RECV */

		/*----------------------------------------------------+
		|  If we're the RECeiVer, we must wait for a DLC      |
		|  status change to tell us a link station has been   |
		|  opened.					      |
		+----------------------------------------------------*/

		Reset(CCBADDR);
		dir_timer_set( &timrccb, Lana, CONNWAITSECS );
		if (timrccb.retcode != 0xFF)
			Terminate( "DIR_TIMER_SET", timrccb.retcode);


		for( ;; ) {

			printf( "\nWaiting on DLC status change...\n" );
			Reset(DLCADDR);
			Spin2(DLCADDR,CCBADDR);

			if ( DLCADDR == ZEROADDRESS ) {
				printf( "\n>> Connect Wait Timer expired\n");
				Terminate( " ", 0);
			}

			dsp = (DLC_STAT_TBL *)DLCADDR;
			printf( "=> DLC_STAT_CHANGE: 0x%04x\n\n", dsp->reg_ax);
			if (dsp->reg_ax & SABMErcvdopened)  {
				Stationid = dsp->stationid;
				break;
			}

		}

		/*----------------------------------------------------+
		|  Next we start a receive for messages coming	      |
		|  to this new link station.  Note that this CCB      |
		|  doesn't complete until we cancel it or something   |
		|  goes wrong.					      |
		+----------------------------------------------------*/
		printf( "Starting a receive on the new linkstation ..." );
		Reset(RECADDR);
		receive( &recvccb, Lana, Stationid );
		if (recvccb.retcode != 0xFF)
			Terminate( "RECEIVE", recvccb.retcode);
		else
			puts( "ok" );

		/*----------------------------------------------------+
		|  Finally We must complete the connection by issuing |
		|  a DLC_CONNECT_STATION CCB ourselves. 	      |
		+----------------------------------------------------*/
		printf( "Connecting to the remote station ..." );
		Reset(CCBADDR);
		dlc_connect_station( &workccb, Lana, Stationid, ZEROADDRESS );
		Spin(CCBADDR);

		if (workccb.retcode)
			Terminate( "DLC_CONNECT_STATION", workccb.retcode);
		else
			puts( "ok" );

		/*----------------------------------------------------+
		|  Now the link has been established, so we wait for  |
		|  a received message, the receive to fail, or	      |
		|  a timer ccb to expire.			      |
		+----------------------------------------------------*/

		Reset(CCBADDR);
		dir_timer_set( &timrccb, Lana, RECVWAITSECS );
		if (timrccb.retcode == 0xFF)
			Spin2(CCBADDR,RECADDR);

		if (RECADDR==ZEROADDRESS)  {
			if (recvccb.retcode != 0xFF)
				Terminate( "RECEIVE", recvccb.retcode);
			else if (timrccb.retcode)
				Terminate( "DIR_TIMER_SET", timrccb.retcode);
			else
				printf( "\n>> Receive Wait Timer expired\n");
		}

		else  {
			printf( "\n=> Message received: ");
			rbp = (RECV_BUFFER_ONE *)RECADDR;

			FP_SEG(dataptr) = FP_SEG(RECADDR);
			FP_OFF(dataptr) = rbp->adapter_offset;
			for( i=0; i<rbp->len_in_buffer; ++i)
				printf( "%c", *dataptr++ );
			printf( "\n\n");
		}

	}

	/*------------------------------------------------------------+
	|  That's all, so we reset the whole SAP, thereby closing all |
	|  its open link stations and freeing its resources.	      |
	+------------------------------------------------------------*/
	printf( "Doing DLC_RESET ..." );
	Reset(CCBADDR);
	dlc_reset( &workccb, Lana, Sapid );
	Spin(CCBADDR);

	if (workccb.retcode)
		Terminate( "DLC_RESET", workccb.retcode);
	else
		puts( "ok" );

	printf( "DLC Sample Program Completed.%c\n", BELL_CHAR );

	exit(0);
}

/**********************************************************************/
/*
**  LanaInit	verifies that the lan adapter is ready for use.
**
**  First, see if the adapter is talking at all, using the dir_interrupt().
**  If so, we then initialize it if necessary. Next we open it, if necessary.
**  If everything went alright, we return with rc=0, otherwise 1.
**
*/

LanaInit()
{
	BYTE intrrc=0, initrc=0, openrc=0, statrc=0;


	/*--------------------------------------------------------------------+
	|   dir_interrupt to see if anybody's home                            |
	+--------------------------------------------------------------------*/

	printf( "\nChecking to see if the adapter handler is installed ..." );
	intrrc=dir_interrupt( &workccb, Lana );

	if ( intrrc && intrrc != 0x09 )
		Terminate( "DIR_INTERRUPT", intrrc);
	else
		puts( "ok" );

	/*--------------------------------------------------------------------+
	|   dir_initialize the adapter					      |
	+--------------------------------------------------------------------*/
	printf( "Initializing the adapter ..." );
	initrc=dir_initialize( &workccb, Lana );

	if (initrc)
		Terminate( "DIR_INITIALIZE", initrc);
	else
		puts( "ok" );

	/*--------------------------------------------------------------------+
	|   dir_open the adapter with mostly default parameters 	      |
	|   If we're the receiver, we ring the bell when this CCB completes   |
	|   to signal that the sender program should be started.	      |
	+--------------------------------------------------------------------*/

	printf( "Opening the adapter ..." );
	Reset(CCBADDR);
	dir_openadapter( &workccb, Lana );
	Spin(CCBADDR);

	openrc = CCBADDR->retcode;
	if (openrc && openrc != 0x10)
		Terminate( "DIR_OPEN", openrc);
	else
		printf( "ok%c\n",(Mode==RECV? BELL_CHAR : ' '));

	/* get our adapter's address */
	statrc = dir_status( &workccb, Lana );
	if (statrc)
		Terminate( "DIR_STATUS", statrc );

	memcpy( LclAddr, ((STATUS_PT *)workccb.parm_tab)->encoded_addr, 6);

	return 0;
}


/**********************************************************************/
/*
**  GrabArgs	Parses the command line arguments.  The first letters
**		of each possible parameter keyword are sufficient to
**		identify the parameter.
**
**		Accepts the standard argc,argv parameters
**
**		Modifies the global variables Mode, Lana, and NetAddr
**		if successful, or produces an error message and exits.
*/

GrabArgs( argc, argv )
int argc;
char *argv[];
{
	char *cp, *strchr();
	BYTE i;


	while( --argc )  {

		cp = *++argv;

		switch( toupper(*cp) )	{

			case 'S':       Mode = SEND;
					break;

			case 'R':       Mode = RECV;
					break;

			case 'D':       Mode = DISP;
					break;

			case 'A':       cp = strchr( cp, '=' );
					if (! *cp)
					    Terminate("Bad adapter number", 0);
					if (*++cp == '0')
					    Lana = 0;
					else if (*cp == '1')
					    Lana = 1;
					else
					    Terminate("Bad adapter number", 0);
					break;

			case 'N':       cp = strchr( cp, '=' );
					if (! *cp)
					    Terminate("Bad remote network address", 0);

					for (++cp,i=0; isxdigit(*cp) && i<12; ++cp, ++i)
					    RmtAddr[i/2] = (RmtAddr[i/2] << 4) +
							   (isdigit(*cp) ? (*cp-'0')
									 : (toupper(*cp)-'A'+10));

					if (i<12)
					    Terminate("Bad remote network address", 0);

					break;

			case '?':       return 1;

			default:	printf( ">>Extraneous input on command line: %s\n",cp );
					Terminate( " ", 0);
					break;
		}

	}

	return 0;
}

/**********************************************************************/
/*
**  Help	Displays directions for running this demo program
*/

Help()
{
	puts( " " );
	puts( " DLCSAMPL   {SEND       Netaddress=123456789abc  ");
	puts( "                        [Adapter={0|1} ]     }   ");
	puts( "                                                 ");
	puts( "            {RECV       [Adapter={0|1} ]     }   ");
	puts( "                                                 ");
	puts( "            {DISP       [Adapter={0|1} ]     }   ");
	puts( "                                                 ");
	puts( "            defaults: Adapter=0                  ");
	puts( "                                                 ");
	puts( "            Note that the remote address MUST    ");
	puts( "            be supplied with the SEND option.    ");
	puts( "            This value can be obtained by running");
	puts( "                                                 ");
	puts( "                DLCSAMPL DISP [Adapter={0|1}]    ");
	puts( "                                                 ");
	puts( "            on the remote PC.                    ");
	puts( " ");

	return;
}

/**********************************************************************/
/*
**  Terminate	 Produce a formatted error message and
**		terminate the program
**
**		Accepts a character string holding the failed action
**		and an BYTE holding the return code.
**
**		DOES NOT RETURN
*/

#define BELL_CHAR	'\007'

Terminate( message, code )
BYTE *message;
BYTE code;
{
	char *TableLookUp();

	if (code)
		printf( "\n\n>> Error during %s: \n>>   %s%c\n",
			message, TableLookUp(DLCErrorMsgs,code), BELL_CHAR );
	else	{
		printf( ">> %s\n", message);
		Help();
		code=1;
	}

	exit(code);
}


