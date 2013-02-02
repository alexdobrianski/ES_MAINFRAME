#include <stdio.h>
#include <ctype.h>
#include <mem.h>
#include <string.h>
#include <process.h>

#include "ncb.h"
#include "ncbcmds.h"
#include "codetbl.h"
#include "neterror.h"

typedef unsigned char  BYTE;
typedef unsigned short WORD;
typedef char far *     ADDRESS;

#include "funcdef.h"

/* global variables */

NCB  Ncb;			/* NCB used for all commands	      */
NCB  Ncb2;
BYTE Mode;			/* 0 = Send, 1 = Recv		      */
BYTE Lana;			/* 0 or 1			      */
BYTE LclName[16];		/* local name to add to the network   */
BYTE NetName[16];		/* remote name to call/listen for     */
BYTE Message[80];		/* send/recv buffer		      */

#define  NET_LSN	 6	/* maximum number of local sessions   */
#define  NET_NUM	12	/* maximum number of outstanding NCBs */
#define  SEND		 0	/* Mode flag for SEND		      */
#define  RECV		 1	/* Mode flag for RECEIVE	      */



/**********************************************************************/
/*
** NetReset	Resets the NETBIOS interface status, clears the name
**		and session tables, and aborts all sessions.
**
**		Accepts the adapter number, max sessions, and max
**		pending NCBs.
**
**		Returns the NCB return code.
*/

NetReset( lana, lsn, num )
BYTE lana, lsn, num;
{
	printf( "Resetting lan adapter %u ... ", lana);

	memset( &Ncb, 0, sizeof(NCB) );
	Ncb.command  = NCB_RESET;
	Ncb.lana_num = lana;
	Ncb.lsn      = lsn;
	Ncb.num      = num;

	TRNcmd( &Ncb );

	if ( ! Ncb.retcode )
		puts( "Ok");

	return (Ncb.retcode);
}

/**********************************************************************/
/*
** NetAddName	Adds a 16-character name to the table of names.  The
**		name must be unique across the network.  This is a
**		name that this station will be known by.
**
**		Accepts the adapter number and the char array holding
**		the name.
**
**		Returns the NCB return code.
*/

NetAddName( lana, name )
BYTE lana;
BYTE *name;

{
	printf( "Adding the local name \"%s\" to the network ... ", name);

	memset( &Ncb, 0, sizeof(NCB) );
	Ncb.command  = NCB_ADDNAME;
	Ncb.lana_num = lana;
	strncpy( Ncb.name, name, 16 );

	TRNcmd( &Ncb );

	if ( ! Ncb.retcode )
		puts( "Ok");

	return (Ncb.retcode);
}

/**********************************************************************/
/*
** NetCall	Opens a session with another name specified in the
**		NCB.CALLNAME field using the local name specified in
**		the NCB.NAME field.
**
**		Accepts the adapter number and the char arrays holding
**		the local and remote names.
**
**		Returns the NCB return code.  If successful, the session
**		number is returned in the NCB.LSN field.
*/

#define RECV_TIMEOUT	10
#define SEND_TIMEOUT	10

NetCall( lana, lclname, rmtname)
BYTE lana;
BYTE *lclname, *rmtname;
{
	printf( "Calling the remote station \"%s\" ... ", rmtname);

	memset( &Ncb, 0, sizeof(NCB) );
	Ncb.command  = NCB_CALL;
	Ncb.lana_num = lana;
	Ncb.rto      = RECV_TIMEOUT<<1; 	/* times 2 since in   */
	Ncb.sto      = SEND_TIMEOUT<<1; 	/* steps of 500 msecs */
	strncpy( Ncb.name, lclname, 16 );
	strncpy( Ncb.callname, rmtname, 16 );

	TRNcmd( &Ncb );

	if ( ! Ncb.retcode )
		puts( "Ok");

	return (Ncb.retcode);
}

/**********************************************************************/
/*
** NetListen	Enables a session to be opened with the name specified
**		in the NCB.CALLNAME field, using the name specified in
**		the NCB.NAME field.
**
**		Accepts the adapter number and the char arrays holding
**		the local and remote names.
**
**		Returns the NCB return code.  If successful, the session
**		number is returned in the NCB.LSN field.
**
**		Note: A Listen command will NOT timeout, but it occupies
**		a session entry and is considered a pending session in the
**		information returned by a NCB.STATUS command.
*/

NetListen( lana, lclname, rmtname)
BYTE lana;
BYTE *lclname, *rmtname;
{
	printf( "Listening for a call from the remote station \"%s\" ... ", rmtname);

	memset( &Ncb, 0, sizeof(NCB) );
	Ncb.command  = NCB_LISTEN;
	Ncb.lana_num = lana;
	Ncb.rto      = RECV_TIMEOUT<<1; 	/* times 2 since in   */
	Ncb.sto      = SEND_TIMEOUT<<1; 	/* steps of 500 msecs */
	strncpy( Ncb.name, lclname, 16 );
	strncpy( Ncb.callname, rmtname, 16 );

	TRNcmd( &Ncb );

	if ( ! Ncb.retcode )
		puts( "Ok");

	return (Ncb.retcode);
}

/**********************************************************************/
/*
** NetSend	Sends data to the session partner as defined by the
**		session number in the NCB.LSN field.  The data to send
**		is in the buffer pointed to by the NCB.BUFFER field.
**
**		Accepts the adapter number, the session number,
**		the char array holding the message to be sent, and
**		the length of the message in that array.
**
**		Returns the NCB return code.
*/

NetSend( lana, lsn, message, length ,Ncb)
BYTE lana, lsn;
BYTE *message;
WORD length;
NCB *Ncb;
{
	printf( "Sending the to the answering station:\n" );

	memset( Ncb, 0, sizeof(NCB) );
	Ncb->command  = NCB_SEND;
	Ncb->lana_num = lana;
	Ncb->lsn      = lsn;
	Ncb->buffer   = message;
	Ncb->length   = length;

	TRNcmd( Ncb );

	return (Ncb->retcode);
}

/**********************************************************************/
/*
** NetReceive	Receives data from the session partner that sends data
**		to this station.
**
**		Accepts the adapter number, the session number,
**		the char array to hold the message received, and
**		the maximum length the message may occupy in that
**		array.
**
**		Returns the NCB return code and, if successful,
**		the received data in the buffer.
*/

NetReceive( lana, lsn, buffer, length ,Ncb)
BYTE lana, lsn;
ADDRESS buffer;
WORD length;
NCB Ncb;
{
	printf( "Receiving a message ..." );

	memset( Ncb, 0, sizeof(NCB) );
	Ncb.command  = NCB_RECEIVE;
	Ncb.lana_num = lana;
	Ncb.lsn      = lsn;
	Ncb.buffer   = buffer;
	Ncb.length   = length;

	TRNcmd( &Ncb );

	return (Ncb->retcode);
}
/**********************************************************************/
/*
** NetReceiveNW	Receives data from the session partner that sends data
**		to this station.
**
**		Accepts the adapter number, the session number,
**		the char array to hold the message received, and
**		the maximum length the message may occupy in that
**		array.
**
**		Returns the NCB return code and, if successful,
**		the received data in the buffer.
*/

NetReceiveNW( lana, lsn, buffer, length ,Ncb)
BYTE lana, lsn;
ADDRESS buffer;
WORD length;
NCB Ncb;
{
	printf( "Receiving a message NW..." );

	memset( Ncb, 0, sizeof(NCB) );
	Ncb.command  = NCB_RECEIVENW;
	Ncb.lana_num = lana;
	Ncb.lsn      = lsn;
	Ncb.buffer   = buffer;
	Ncb.length   = length;

	TRNcmd( Ncb );

	return (0);
}


/**********************************************************************/
/*
** NetHangup	Closes the session with another name on the network
**		specified by the session number.
**
**		Accepts the adapter number and session number.
**
**		Returns the NCB return code.
*/

NetHangup( lana, lsn )
BYTE lana, lsn;
{
	printf( "Hanging up the session ... " );

	memset( &Ncb, 0, sizeof(NCB) );
	Ncb.command  = NCB_HANGUP;
	Ncb.lana_num = lana;
	Ncb.lsn      = lsn;

	TRNcmd( &Ncb );

	if ( ! Ncb.retcode || Ncb.retcode == 0x0A)
		puts( "Ok");

	return (Ncb.retcode);
}


