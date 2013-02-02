/*------------------------------------------------------------------------+
| 	Command codes and other constants for the DLC interface           |
+------------------------------------------------------------------------*/
/* only inclded if this is the first time */
#ifndef DLCCONST
#define DLCCONST 1
 
/* CCB Commands */
 
#define DIR_INTERRUPT			0x00
#define DIR_MODIFY_OPEN_PARMS		0x01
#define DIR_RESTORE_OPEN_PARMS		0x02
#define DIR_OPEN_ADAPTER		0x03
#define DIR_CLOSE_ADAPTER		0x04
#define DIR_SET_GROUP_ADDRESS		0x06
#define DIR_SET_FUNC_ADDRESS            0x07
#define DIR_READ_LOG			0x08
#define DIR_INITIALIZE			0x20
#define DIR_STATUS			0x21
#define DIR_TIMER_SET			0x22
#define DIR_TIMER_CANCEL		0x23
#define DIR_DEFINE_MIF_ENVIRONMENT	0x2b
#define DIR_CANCEL_TIMER_GROUP		0x2c
#define DIR_SET_USER_APPENDAGE		0x2d
 
#define DLC_RESET			0x14
#define DLC_OPEN_SAP			0x15
#define DLC_CLOSE_SAP			0x16
#define DLC_OPEN_STATION		0x19
#define DLC_CLOSE_STATION		0x1a
#define DLC_CONNECT_STATION		0x1b
#define DLC_MODIFY			0x1c
#define DLC_FLOW_CONTROL		0x1d
#define DLC_STATISTICS			0x1e
 
#define RECEIVE				0x28
#define RECEIVE_CANCEL			0x29
#define RECEIVE_MODIFY			0x2a
 
#define TRANSMIT_DIR_FRAME		0x0a
#define TRANSMIT_I_FRAME		0x0b
#define TRANSMIT_UI_FRAME		0x0d
#define TRANSMIT_XID_CMD		0x0e
#define TRANSMIT_XID_RESP_FINAL		0x0f
#define TRANSMIT_XID_RESP_NOT_FINAL	0x10
#define TRANSMIT_TEST_CMD		0x11
 
#define BUFFER_FREE			0x27
#define BUFFER_GET			0x26
 
#define PDT_TRACE_ON			0x24
#define PDT_TRACE_OFF			0x25
 
 
/* Received data Message types */
 
#define	MT_MAC		0x02
#define MT_I            0x04
#define MT_UI           0x06
#define MT_XIDcp        0x08
#define MT_XIDcnp       0x0a
#define MT_XIDrf        0x0c
#define MT_XIDrnf       0x0e
#define MT_TESTrf       0x10
#define MT_TESTrnf      0x12
#define MT_OTHER	0x14
 
 
/* DLC Status Change codes */
 
#define LinkLost	0x8000
#define DMDISCrcvd	0x4000
#define FRMRrcvd	0x2000
#define FRMRsent	0x1000
#define SABMErcvd    	0x0800
#define SABMErcvdopened 0x0400
#define RemLocalBusy	0x0200
#define RemNotBusy	0x0100
#define TiExpired	0x0080
#define DLCcountovfl	0x0040
#define ACPlowered	0x0020
#define LclLocalBusy	0x0001
 

/* miscellaneous */

#define ZEROADDRESS	((unsigned char *)(0L))
#define	MYSAP		0xA4

#else	
 
/* DLCCONST.H already included in this compilation */
 
#endif
 
