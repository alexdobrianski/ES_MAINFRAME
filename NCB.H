#ifndef NCBH
#define NCBH

/* <NCB.H>
**
** C definition of NETBIOS NCB (network control block)
**
*/

typedef struct {
        unsigned char command;      /* command                     */
        unsigned char retcode;      /* return code                 */
        unsigned char lsn;          /* local session number        */
        unsigned char num;          /* local name number           */
        unsigned char far *buffer;  /* buffer pointer (long)       */
        unsigned int  length;       /* buffer length               */
        unsigned char callname[16]; /* called name field           */
        unsigned char name[16];     /* local  name field           */
        unsigned char rto;          /* receive timeout             */
        unsigned char sto;          /* send timeout                */
        unsigned char far *post;    /* post routine pointer (long) */
        unsigned char lana_num;     /* adapter number              */
        unsigned char cmd_cplt;     /* command status              */
        unsigned char reserve[14];  /* reserved                    */
        } NCB;

#endif
