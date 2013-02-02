#ifndef NCBCMDS
#define NCBCMDS

/* <NCBCMDS.H>
**
** NCB Command Codes   10/16/89
**
*/

#define  NCB_NOWAIT          0x80          /* Command wait flag       */

#define  NCB_RESET           0x32          /* Reset adapter           */
#define  NCB_CANCEL          0x35          /* Cancel command          */
#define  NCB_STATUS          0x33          /* Get NETBIOS intf status */
#define  NCB_UNLINK          0x70          /* Unlink   (RPL)          */
#define  NCB_ADDNAME         0x30          /* Add name                */
#define  NCB_ADDGNAME        0x36          /* Add group name          */
#define  NCB_DELNAME         0x31          /* Delete name             */
#define  NCB_FINDNAME        0x78          /* Find name               */
#define  NCB_CALL            0x10          /* Call                    */
#define  NCB_LISTEN          0x11          /* Listen                  */
#define  NCB_HANGUP          0x12          /* Hang up                 */
#define  NCB_SEND            0x14          /* Send                    */
#define  NCB_SENDNW          0x94          /* Send NOWAIT             */
#define  NCB_CHSEND          0x17          /* Chain send              */
#define  NCB_RECEIVE         0x15          /* Receive                 */
#define  NCB_RECEIVENW       0x95          /* Receive  NOWAIT         */

#define  NCB_RECANY          0x16          /* Receive any             */
#define  NCB_SESSTATUS       0x34          /* Get session status      */
#define  NCB_SDATAGRAM       0x20          /* Send datagram           */
#define  NCB_SBROADCAST      0x22          /* Send broadcast          */
#define  NCB_RDATAGRAM       0x21          /* Receive datagram        */
#define  NCB_RBROADCAST      0x23          /* Receive broadcast       */
#define  NCB_SEND_NOACK      0x71          /* Send no ack             */
#define  NCB_CHSEND_NOACK    0x72          /* Chain send no ack       */
#define  NCB_TRACE           0x79          /* Start trace             */
#define  NCB_LAN_STATUS      0xF3          /* Lan Status Alert        */

#endif
