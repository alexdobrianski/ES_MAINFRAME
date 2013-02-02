//LISTCOP3  JOB MSGLEVEL=(1,1)
// exec pgm=iefbr14,region=200k
//dd1 dd unit=sysda,vol=ser=mvt617,disp=(old,delete),dsn=cbc1.load
//    EXEC PGM=IEBCOPY,TIME=1440,REGION=200K
//SYSPRINT DD SYSOUT=A
//from dd disp=shr,unit=5010,vol=ser=111111,label=(1,sl),
//  dsn=a
//TO DD UNIT=SYSDA,VOL=SER=MVT617,dsn=cbc1.load,
//  disp=(new,keep),dcb=(recfm=ut,blksize=15030),
// space=(cyl,(5,5,170))
//sysin dd *
 c i=from,o=to
 s m=MEXRD02
 s m=MEXRZDAT
 s m=MEXR0
 s m=MEXR10
 s m=MEXR150
 s m=MEXR173
 s m=MEXR23
 s m=MEXR262
 s m=MEXR321
 s m=MEXR37
 s m=MEXR41
 s m=MEXR50B
 s m=MEXR53
 s m=MEXR556
 s m=MEXR62
 s m=MEXR670
 s m=MEXR752
 s m=MEXR800
 s m=MEXR87
 s m=MEXR93
 s m=MEXTVPR
 s m=MEXTV07
 s m=MEXTV173
 s m=MEXTV324
 s m=MEXTV41
 s m=MEXTV60
 s m=MEXTV75B
 s m=MPCBC0
 s m=MPCB1010
 s m=MPCB150
 s m=MPCB158
 s m=MPCB191
 s m=MPCB230
 s m=MPCB253
 s m=MPCB28
 s m=MPCB320
 s m=MPCB350
 s m=MPCB40
 s m=MPCB444
 s m=MPCB50
 s m=MPCB51
 s m=MPCB552
 s m=MPCB602
 s m=MPCB663
 s m=MPCB69
 s m=MPCB75
 s m=MPCB770
 s m=MPCB84
 s m=MPCB90
 s m=MPCB905
 s m=MSSC00
 s m=MSSC101
 s m=MSSC151
 s m=MSSC159
 s m=MSSC202
 s m=MSSC241
 s m=MSSC262
 s m=MSSC3
 s m=MSSC324
 s m=MSSC37
 s m=MSSC42
 s m=MSSC460
 s m=MSSC501
 s m=MSSC520
 s m=MSSC552
 s m=MSSC58
 s m=MSSC65
 s m=MSSC67
 s m=MSSC700
 s m=MSSC751
 s m=MSSC770S
 s m=MSSC84
 s m=MSSC90
 s m=MSSC905
 s m=TZRTPRA
/*   TZRTPRA
//    EXEC PGM=IEBCOPY,TIME=1440,REGION=200K
//SYSPRINT DD SYSOUT=A
//from dd unit=5010,vol=ser=111111,label=(2,sl),
//  dsn=b,disp=(,keep)
//TO DD UNIT=SYSDA,VOL=SER=MVT617,dsn=cbc1.load,
//  disp=old
//sysin dd *
 c i=to,o=from
/*
//
