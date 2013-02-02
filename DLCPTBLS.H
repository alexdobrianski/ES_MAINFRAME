/*------------------------------------------------------------------------+
|           CCB parameter table structures & typedefs                     |
|                                                                         |
| Note: all pointers are assumed to be LONG (i.e. /AL compiler option)    |
+------------------------------------------------------------------------*/
/* 10/16/90  */
/* only included if this is the first time */
#ifndef DLCPTBLS
#define DLCPTBLS

typedef unsigned char  BYTE;
typedef unsigned int   WORD;
typedef unsigned long  DWORD;
typedef unsigned char *ADDRESS;

/* CCB typedef */
typedef struct  {
        BYTE    adapter;                /* adapter number (0 or 1)         */
        BYTE    command;                /* command code byte               */
        BYTE    retcode;                /* return code                     */
        BYTE    work;                   /* adapter work area               */
        ADDRESS pointer;                /* queue pointer                   */
        ADDRESS cmd_cplt;               /* completion exit routine         */
        ADDRESS parm_tab;               /* pointer to parameter area       */
        } CCB;


/* dir.initialize parameter table */
typedef struct {
        WORD    bring_ups;              /* bring up error code             */
        WORD    sram_addr;              /* segment value of shared RAM     */
        BYTE    reserved[4];
        ADDRESS adptr_chk_exit;         /* adapter check appendage addr    */
        ADDRESS ring_status_exit;       /* status change appendage addr    */
        ADDRESS pc_error_exit;          /* IBM PC error appendage addr     */
        } DIR_INIT_PT;


/* dir.open parameter table */
typedef struct {
        ADDRESS adapter_parms;          /* adapter parm table address      */
        ADDRESS direct_parms;           /* direct parm table addr          */
        ADDRESS dlc_parms;              /* DLC parm table address          */
        ADDRESS msg_parms;              /* NETBIOS parm table address      */
        } DIR_OPEN_PT;

/* dir.open.adapter parameter table */
typedef struct {
        WORD    open_error_code;        /* open adapter errors found       */
        WORD    open_options;           /* various options                 */
        BYTE    node_addr[6];           /* local station's ring addr       */
        BYTE    group_addr[4];          /* set group address               */
        BYTE    func_addr[4];           /* set functional addr             */
        WORD    num_rcv_buffers;        /* number of receive buffers       */
        WORD    rcv_buffer_len;         /* length of receive buffers       */
        WORD    dhb_length;             /* length of transmit buffers      */
        BYTE    dhb_number;             /* number of transmit buffers      */
        BYTE    reserved;
        WORD    lock_code;              /* lock to prevent adapter closing */
        ADDRESS prod_id_addr;           /* addr of the 18-byte product id  */
        } DIR_OPEN_AD_PT;


/* dir.open.direct parameter table */
typedef struct {
        WORD    dir_buf_size;           /* size of buffs in dir buff pool  */
        WORD    dir_pool_blocks;        /* # of 16B blks in dir buff pool  */
        ADDRESS dir_pool_address;       /* segment addr of dir buff pool   */
        ADDRESS adpt_chk_exit;          /* adapter check appendage exit    */
        ADDRESS ring_status_exit;       /* ring stat change appendage exit */
        ADDRESS pc_error_exit;          /* error in PC appendage exit      */
        ADDRESS work_addr;              /* adapter work area address       */
        WORD    work_len_req;           /* requested adapter work area len */
        WORD    work_len_act;           /* actual adapter work area len    */
        } DIR_OPEN_DIR_PT;


/* dir.open.DLC parameter table */
typedef struct {
        BYTE    max_sap;                /* max number of SAPs              */
        BYTE    max_sta;                /* max number of link stations     */
        BYTE    max_gsap;               /* max number of group SAPs        */
        BYTE    max_gmem;               /* max members per group SAP       */
        BYTE    t1_tick_one;            /* timer T1 interval, group one    */
        BYTE    t2_tick_one;            /* timer T2 interval, group one    */
        BYTE    ti_tick_one;            /* timer Ti interval, group one    */
        BYTE    t1_tick_two;            /* timer T1 interval, group two    */
        BYTE    t2_tick_two;            /* timer T2 interval, group two    */
        BYTE    ti_tick_two;            /* timer Ti interval, group two    */
        } DIR_OPEN_DLC_PT;


/* dlc.open.sap parameter table */
typedef struct {
        WORD    station_id;             /* SAP station id (returned)       */
        WORD    user_stat_val;          /* user value                      */
        BYTE    timer_t1;               /* T1 timer                        */
        BYTE    timer_t2;               /* T2 timer                        */
        BYTE    timer_ti;               /* TI timer                        */
        BYTE    maxout;                 /* max outstanding frames          */
        BYTE    maxin;                  /* max outstanding acks            */
        BYTE    maxout_incr;            /* maxout increment                */
        BYTE    max_retry;              /* max retry                       */
        BYTE    max_members;            /* max saps in group sap           */
        WORD    max_i_fld;              /* max recvd information field     */
        BYTE    sap_value;              /* sap value requested             */
        BYTE    options;                /* options and priority            */
        BYTE    station_count;          /* number of stations              */
        BYTE    reserved[2];
        BYTE    group_count;            /* length of group list            */
        ADDRESS group_list;             /* list of group sap numbers       */
        ADDRESS dlc_status_exit;        /* I/O appendage exit              */
        WORD    dlc_buf_size;           /* size of buffers in pool         */
        WORD    dlc_pool_len;           /* length of pool buffer           */
        ADDRESS dlc_pool_addr;          /* address of Buffer pool          */
        } OPEN_SAP_PT;



/* dlc.open.station parameter table */
typedef struct {
        WORD    sap_station_id;         /* SAP station ID                  */
        WORD    link_station_id;        /* link station ID                 */
        BYTE    timer_t1;               /* timer t1                        */
        BYTE    timer_t2;               /* timer t2                        */
        BYTE    timer_ti;               /* timer ti                        */
        BYTE    maxout;                 /* max outstanding frames          */
        BYTE    maxin;                  /* max outstanding acks            */
        BYTE    maxout_incr;            /* maxout increment                */
        BYTE    max_retry;              /* max retry                       */
        BYTE    rsap_value;             /* remote sap value                */
        WORD    max_i_field;            /* max recvd information field     */
        BYTE    access_priority;        /* ring access priority            */
        BYTE    reserved[1];
        ADDRESS destination;            /* pointer to destination address  */
        } OPEN_STAT_PT;


/* dlc.connect parameter table */
typedef struct {
        WORD    link_station_id;        /* link station ID                  */
        BYTE    reserved[2];
        ADDRESS routing_addr;           /* pointer to routing info          */
        } DLC_CONNECT_PT;


/* dlc.statistics parameter table */
typedef struct {
        WORD    station_id;             /* station id                       */
        WORD    log_buf_length;         /* size of buffer at log_buf_addr   */
        ADDRESS log_buf_addr;           /* address to place the log data    */
        WORD    log_act_length;         /* actual length of log returned    */
        BYTE    options;                /* command options                  */

        } DLC_STAT_PT;


/* Adapter Status Parameter Table ( in shared RAM )   */
typedef struct {
        DWORD    phys_addr;             /* Adapter physical address         */
        BYTE     up_node_addr[6];       /* Upstream node address            */
        DWORD    up_phys_addr;          /* Upstream physical address        */
        BYTE     poll_addr[6];          /* Last poll address                */
        WORD     auth_env;              /* Authorized environment           */
        WORD     acc_priority;          /* Transmit access priority         */
        WORD     source_class;          /* Source class authorization       */
        WORD     att_code;              /* Last attention code              */
        BYTE     source_addr[6];        /* Last source address              */
        WORD     beacon_type;           /* Last beacon type                 */
        WORD     major_vector;          /* Last major vector                */
        WORD     ring_status;           /* Ring status                      */
        WORD     soft_error;            /* Soft error timer value           */
        WORD     fe_error;              /* Front end error counter          */
        WORD     next_state;            /* Next state indicator             */
        WORD     mon_error;             /* Monitor error code               */
        WORD     beacon_transmit;       /* Beacon transmit type             */
        WORD     beacon_receive;        /* Beacon receive type              */
        WORD     frame_correl;          /* Frame correlation save           */
        BYTE     beacon_naun[6];        /* Beaconing station NAUN           */
        DWORD    reserved;
        DWORD    beacon_phys;           /* Beaconing station physical addr  */
        } ADAPTER_STATUS_PT;

/* status parameter table */
typedef struct {
        BYTE    encoded_addr[6];        /* adapter's perm encoded addr      */
        BYTE    node_addr[6];           /* station's ring addr              */
        BYTE    group_addr[4];          /* station's group addr             */
        BYTE    functional_addr[4];     /* station's functional addr        */
        BYTE    max_sap;                /* max allowable SAP stations       */
        BYTE    open_sap;               /* number of SAP stations open      */
        BYTE    max_station;            /* max allowable link stations      */
        BYTE    open_station;           /* number of link stations open     */
        BYTE    avail_station;          /* number of link stations avail    */
        BYTE    msg_sap;                /* NETBIOS intf SAP or 0            */
        BYTE    mcode_level[10];        /* adapter's microcode level        */
        ADAPTER_STATUS_PT
               *sram_parm_addr;         /* sh'd RAM addr of adapter parms   */
        ADDRESS sram_mac_addr;          /* sh'd RAM addr of adapter MAC     */
        ADDRESS tick_counter_addr;      /* addr of timer tick counter       */
        WORD    last_ring_status;       /* most recent ring status reg      */
        ADDRESS extended_status;        /* address of extended status table */
        } STATUS_PT;

/* buffer get and free parameter table */
typedef struct {
        WORD    station_id;             /* station id                       */
        WORD    buffers_left;           /* number of buffers left in pool   */
        BYTE    numbuffs;               /* number of buffers to get         */
        BYTE    reserved[3];
        BYTE   *first_buffer;           /* @ of first buffer                */
        } BUFFER_PT;

/* general xmit/recv buffer format */
typedef struct {
        BYTE   *next_buf_ptr;
        BYTE    data[1];
        } BUFFER;

typedef struct {
        WORD      station_id;           /* sender's station id              */
        BYTE      transmit_fs;          /* *stripped FS field               */
        BYTE      rsap;                 /* remote SAP value                 */
        ADDRESS   queue_one;            /* @ of 1st transmit queue          */
        ADDRESS   queue_two;            /* @ of 2nd transmit queue          */
        WORD      buff_one_len;         /* length of xmit buffer buffer_one */
        WORD      buff_two_len;         /* length of xmit buffer buffer_two */
        BUFFER   *buffer_one;           /* @ of 1st transmit buffer         */
        BUFFER   *buffer_two;           /* @ of 2nd transmit buffer         */
        } XMIT_PT;

typedef struct {
        BUFFER *next_buf_ptr;           /* pointer to next buffer           */
        WORD    reserved;
        WORD    len_in_buffer;          /* length of actual data in buffer  */
        WORD    user_data;              /* user data ( anything )           */
        WORD    user_length;            /* length of user space             */
        BYTE    data[1];                /* data area, including user space  */
        } XMIT_BUFFER;

/*---------------------------------------------------------------------------+
| define the structure of the LAN and DLC headers for the RECV buffer        |
+---------------------------------------------------------------------------*/

#define ACCESSCTL       0x60;   /* prty 3 */
#define FRAMECTL        0x40;   /* LLC frame */
#define DSTADDR_IG      0x80;   /* mask for byte 0 of dest addr:  */
                                /*   0=individual address         */
                                /*   1=group address              */
#define DSTADDR_UL      0x40    /* mask for byte 0 of dest addr:  */
                                /*   0=universally adm address    */
                                /*   1=locally adm address        */
#define DSTADDR_FA      0x80    /* mask for byte 2 of dest addr:  */
                                /*   0=functional addr            */
                                /*   1=group addr                 */
#define SRCADDR_RI      0x80    /* mask for byte 0 of src addr:   */
                                /*   0=no routing info present    */
                                /*   1=routing info is present    */
#define SRCADDR_UL      0x40    /* mask for byte 0 of src addr:   */
                                /*   0=universally adm address    */
                                /*   1=locally adm address        */
#define RI_BCAST        0x80    /* mask for byte 0 of Routing CTL:*/
                                /*   0=non broadcast frame        */
                                /*   1=broadcast frame            */
#define DI_DIRECTION    0x80    /* mask for byte 1 of Routing CTL:*/
                                /*   0=use RI left-to-right       */
                                /*   1=use RI right-to-left       */


struct Lanheader  {
        BYTE access_ctl;
        BYTE frame_ctl;
        BYTE destaddr[6];
        BYTE srcaddr[6];
        BYTE rinfo[18]; /* RI is >= 2 bytes, <= 18 */
                        /* note: Since we'll only ever have a pointer */
                        /* to the lan header, we don't have to worry  */
                        /* about whether there is any RI or not here  */
        };


struct Dlcheader  {
        BYTE dsap;
        BYTE ssap;
        WORD control;
        };



typedef struct {
        BUFFER *next_buf_ptr;           /* pointer to next buffer (zero)    */
        WORD    rcv_len;                /* length of entire recv'ed frame   */
        WORD    len_in_buffer;          /* length of actual data in buffer  */
        WORD    adapter_offset;         /* offset to user space             */
        WORD    user_length;            /* length of user space             */
        WORD    station_id;             /* receiving station id             */
        BYTE    options;                /* receive options                  */
        BYTE    msg_type;               /* message type                     */
        WORD    buffers_left;           /* number of buffers left in pool   */
        BYTE    receive_fs;             /* stripped FS byte                 */
        BYTE    adapter_num;            /* lana number                      */
        BYTE    lan_hdr_len;            /* actual LAN header length         */
        BYTE    dlc_hdr_len;            /* actual DLC header length         */
        struct Lanheader lan_hdr;       /* a maximum length lan header      */
        struct Dlcheader dlc_hdr;       /* a maximum length dlc header      */
                                        /* user space and the data area is  */
                                        /* all jammed up together following */
                                        /* the dlc_hdr.                     */
        } RECV_BUFFER_ONE;

typedef struct {
        WORD      station_id;           /* receiver's station id            */
        WORD      user_length;          /* length of user data in buffers   */
        ADDRESS   recv_exit;            /* @ of exit for receive completion */
        RECV_BUFFER_ONE  *first_buffer; /* @ of 1st buffer received         */
        BYTE      recv_options;         /* receive options                  */
        } RECV_PT;

/*------------------------------------------------------------------------+
|  DLC status change message structure                                    |
+------------------------------------------------------------------------*/

typedef struct DLCStatusTable {
        WORD    stationid;
        WORD    reg_ax;
        BYTE    reasoncode[5];
        BYTE    accessprty;
        BYTE    remote_node[6];
        BYTE    remote_sap;
        BYTE    lana;
        }DLC_STAT_TBL;

#else

/* DLCPTBLS.H already included in this compilation */

#endif

