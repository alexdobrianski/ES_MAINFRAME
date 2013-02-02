/*---------------------------------------------------------------------------+
| Global variables for the DLCSAMPL package				     |
+---------------------------------------------------------------------------*/
/* only included if this is the first time */
#ifndef DLCGBLV
#define DLCGBLV
 
#ifdef	DEFGBLVARS
#define STCLASS	/*define*/
#else
#define STCLASS extern
#endif
 

STCLASS BYTE Mode;       	        /* 0 = Send, 1 = Recv                 */
STCLASS BYTE Lana;	                /* 0 or 1                             */
STCLASS BYTE RmtAddr[6];                /* Address of remote adapter          */
STCLASS BYTE LclAddr[6];		/* Address of local adapter	      */
STCLASS BYTE lanheaderlen;              /* size of the current lan header     */
STCLASS struct Lanheader lanheader;     /* get enough to hold a big one       */

STCLASS CCB    		*CCBADDR;	/* CCB complete pointer 	      */
STCLASS RECV_BUFFER_ONE *RECADDR;	/* Received data pointer	      */
STCLASS DLC_STAT_TBL 	*DLCADDR; 	/* DLC status change table pointer    */

#define SEND	0		/* mode flag for SEND		      */	
#define RECV    1               /* mode flag for RECEIVE              */
#define DISP    2		/* mode flag for DISPLAY	      */

#define MYSAP	0xA4

#define RECVWAITSECS  30
#define CONNWAITSECS  30

#define	BELL_CHAR	'\007'

#define Reset(addr)	addr = ZEROADDRESS
#define Spin(addr)	while( addr == ZEROADDRESS )
#define Spin2(a1,a2)    while( a1 == ZEROADDRESS && a2 == ZEROADDRESS )

#endif
