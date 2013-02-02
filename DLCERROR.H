/* <DLCERROR.H>
**
** Definition of DLC error messages
**
*/

#ifndef CODETABLE
#include "codetbl.h"
#endif
    
static struct CodeTable DLCErrorMsgs[] =
	{
	 { 0x00, "Normal return"},
	 { 0x01, "Invalid command code"},
	 { 0x02, "Duplicate command"},
	 { 0x03, "Adapter open - should be closed"},
	 { 0x04, "Adapter closed - should be open"},
	 { 0x05, "Required parameter(s) not provided"},
	 { 0x06, "Option(s) invalid or incompatible"},
	 { 0x07, "Command canceled - unrecoverable failure"},
	 { 0x08, "Unauthorized access priority"},
	 { 0x09, "Adapter not initialized - should be"},
	 { 0x0A, "Command canceled by user request"},
	 { 0x0B, "Command canceled - adapter closed while in progress"},
	 { 0x0C, "Command completed successfully - adapter not open"},
	 { 0x10, "Adapter open - NETBIOS interface not operational"},
	 { 0x11, "DIR.TIMER.SET or DIR.TIMER.CANCEL error"},
	 { 0x12, "Available work area exceeded"},
	 { 0x13, "Invalid LOG.ID"},
	 { 0x14, "Invalid shared RAM segment or size"},
	 { 0x15, "Lost log data, inadequate buffer space - log reset"},
	 { 0x16, "Requested buffer size exceeds pool length"},
	 { 0x17, "Command invalid - NETBIOS interface operational"},
	 { 0x18, "Invalid buffer length"},
	 { 0x19, "Inadequate buffers available for request"},
	 { 0x1A, "User length too large for buffer length"},
	 { 0x1B, "The CCB_PARM_TAB pointer is invalid"},
	 { 0x1C, "A pointer in the CCB parm table is invalid"},
	 { 0x1D, "Invalid CCB_ADAPTER value"},
	 { 0x20, "Lost data on receive - no buffers available"},
	 { 0x21, "Lost data on receive - inadequate buffer space"},
	 { 0x22, "Error on frame transmission - check TRANSMIT.FS"},
	 { 0x23, "Error in frame transmit or strip process"},
	 { 0x24, "Unauthorized MAC frame"},
	 { 0x25, "Maximum commands exceeded"},
	 { 0x26, "Unrecognized command correlator"},
	 { 0x27, "Link not transmitting I frames - state changed from link opened"},
	 { 0x28, "Invalid transmit frame length"},
	 { 0x30, "Inadequate receive buffers for adapter to open"},
	 { 0x31, "Reserved"},
	 { 0x32, "Invalid NODE_ADDRESS"},
	 { 0x33, "Invalid adapter receive buffer length specified"},
	 { 0x34, "Invalid adapter transmit buffer length defined"},
	 { 0x40, "Invalid STATION.ID"},
	 { 0x41, "Protocol error - link in invalid state for command"},
	 { 0x42, "Parameter exceeded maximum allowed"},
	 { 0x43, "Invalid SAP_VALUE or value already in use"},
	 { 0x44, "Invalid routing information field length"},
	 { 0x45, "Requested group membership in non-existant group SAP"},
	 { 0x46, "Resources not available"},
	 { 0x47, "SAP cannot close unless all link stations are closed"},
	 { 0x48, "Group SAP cannot close - individual SAPs not closed"},
	 { 0x49, "Group SAP has reached maximum membership"},
	 { 0x4A, "Sequence error: incompatible command in progress"},
	 { 0x4B, "Station closed without remote acknowledgement"},
	 { 0x4C, "Sequence error: cannon close, DLC commands outstanding"},
	 { 0x4D, "Unsuccessful link station connection attempted"},
	 { 0x4E, "Member SAP not found in group SAP list"},
	 { 0x4F, "Invalid remote address - may not be a group address"},
	 { 0xFF, "Command in progress"},
	 { 0, 0 }
	};
	
