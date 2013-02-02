#ifndef NETERROR
#define NETERROR

/* <NETERROR.H>
**
** Definition of Netbios error messages
**
*/

#ifndef CODETABLE
#include <codetbl.h>
#endif
    
static struct CodeTable NetErrorMsgs[] =
	{
	 { 0x00, "Normal return" },
	 { 0x01, "Illegal buffer length" },
	 { 0x03, "Invalid command" },
	 { 0x05, "Command timed out" },
	 { 0x06, "Message incomplete" },
	 { 0x08, "Illegal local session number" },
	 { 0x09, "No resource available" },
	 { 0x0A, "Session closed" },
	 { 0x0B, "Command cancelled" },
	 { 0x0D, "Duplicate name in local name table" },
	 { 0x0E, "Name table full" },
	 { 0x0F, "Name has active session & is now deregistered" },
	 { 0x11, "Local session table full" },
	 { 0x12, "Session open rejected" },
	 { 0x13, "Illegal name number" },
	 { 0x14, "Cannot find name called" },
	 { 0x15, "Name not found or cannot specify \"*\" or null" },
	 { 0x16, "Name in use on remote NETBIOS interface" },
	 { 0x17, "Name deleted" },
	 { 0x18, "Session ended abnormally" },
	 { 0x19, "Name conflict detected" },
	 { 0x21, "Interface busy" },
	 { 0x22, "Too many commands outstanding" },
	 { 0x23, "Invalid number in adapter number field" },
	 { 0x24, "Command completed while cancel occurring" },
	 { 0x26, "Command not valid to cancel" },
	 { 0x4E, "Ring status; bits 12,14,15 on for > 60 seconds" },
	 { 0x4F, "Ring status; one or more of bits 8-11 on" },
	 { 0xF7, "Error on implicit DIR.INITIALIZE" },
	 { 0xF8, "Error on implicit DIR.OPEN.ADAPTER" },
	 { 0xF9, "Adapter support interface internal error" },
	 { 0xFA, "Adapter check" },
	 { 0xFB, "NETBIOS program not loaded in PC" },
	 { 0xFC, "DIR.OPEN.ADAPTER or DLC.OPEN.SAP failed" },
	 { 0xFD, "Unexpected adapter close" },
	 { 0, 0 }
	};
	
#endif

