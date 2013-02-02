////////////////////////////////////////////////////////////
//  driver was wrote by alex dobrianski
////////////////////////////////////////////////////////////
#define ERROR 0x8000
#define BUSY  0x0200
#define DONE  0x0100

#define WRITEPROTECT        0
#define UNKNOWNUNIT         1
#define DRIVENOTREADY       2
#define UNKNOWN             3
#define CRCERROR            4
#define BADRHLENGTH         5
#define SEEKERROR           6
#define UNKNOWNMEDIA        7
#define SECTORNOTFOUND      8
#define OUTOFPAPER          9
#define WRITEFAULT         10
#define READFAULT          11
#define GENERALFAILURE     12
#define INAVALIDDISKCHANGE 15
typedef struct deice_header_struct
		  {
			struct device_header_struct far *nextdev;
			unsigned int attribute;
			void (*dev_strategy)(void);
			void (*dev_interrupt)(void);
			unsigned char dev_name[8];
		  } deviceheader_t;

typedef struct bpb_struct_struct
		  {
			unsigned int ss;   // sector size in byte
			unsigned char au;  // allocation unit size
			unsigned int rs;   // reserved (boot) sectors
			unsigned char nf;  // number of FAT
			unsigned int ds;   // directory size in files
			unsigned int ts;   // total sectors
			unsigned char md;  // media descriptors
			unsigned int fs;   // FAT sector
			unsigned int st;   // sector per track
			unsigned int nh;   // number of heads
			unsigned long hs;  // hidden sectors
			unsigned long ls;  // large sector count
		  } bpb_t;

typedef struct rhfixed_struct
		  {
			unsigned char Length;    //  request header length
			unsigned char Unit;   //  unit code
			unsigned char Function;    //  device driver command
			unsigned int  Status; //  driver returned status
			unsigned char Reserved[8]; //  reserved
		  } rh_t;

typedef struct rh_init_struct
		  {
			rh_t          rh;     // fixed portion
			unsigned char irUnits; // number of units
			char far * EndAddress; // break address
			bpb_t far ** ParamAddress;   //  pointer to array of BPBs
																	 //   config.sys line
			char       drive;     // 1st aviailable drive number
			unsigned int irMessageFlag; // Flag to indicate that Dos should
												 // output an error message on failure
		  } rh0_t;

typedef struct rh_media_check_struct
		  {
			rh_t          rh;     // fixed portion
			unsigned char media;  // media descriptor
			unsigned char md_stat;// media status
			char far     *volid;   // address of volume id
		  } rh1_t;

typedef struct rh_get_bpb_struct
		  {
			rh_t          rh;     // fixed portion
			unsigned char media;  // media descriptor
			char far *buf;        // address of data
			bpb_t far     *bpb;   // address ptr to BPB table
		  } rh2_t;

typedef struct rh_ioctl_struct
		  {
			rh_t         rh;      // fixed portion
			unsigned char media;  //  media descriptor
			char far *buf;        // address of data transfer
			unsigned int count;    // count (bytes or sector)
			unsigned int start;    // start sector number
		  } rh3_t, rh12_t;

typedef struct rh_io_struct
		  {
			rh_t          rh;     // fixed portion
			unsigned char media;  // media descriptor
			char far *buf;        // address of data
			unsigned int count;   // count (bytes or sectors)
			unsigned int start;   // start sector number
			char far *volid;       // adress of volume ID
		  } rh4_t, rh8_t, rh9_t;

typedef struct rh_ndinput_struct
		  {
			rh_t          rh;     // fixed portion
			unsigned char ch;     // character returned
		  } rh5_t;

typedef struct rh_output_busy_struct
		  {
			rh_t          rh;     // fixed portion
			unsigned char media;  // media descriptor
			char far       *buf;  // address of data transfer
			unsigned int  count;  // count (bytes or sectors)
		  } rh16_t;

typedef struct rh_generic_ioctl_struct
		  {
			rh_t          rh;     // fixed portion
			unsigned char major;  // major function
			unsigned char minor;  // minor function
			unsigned int si;      // SI register
			unsigned int di;      // DI register
			char far     *prt;    // adress of ioctl packet
		  } rh19_t , rh25_t;

typedef struct rh_device_struct
		  {
			rh_t          rh;     // fixed portion
			unsigned char io;     // input/output
			unsigned char devcmd; // command code
			unsigned int devstat; // status
			unsigned char res[4]; // reserved
		  } rh23_t, rh24_t;
