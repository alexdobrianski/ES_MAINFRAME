//LISTCOPY  JOB MSGLEVEL=(1,1)
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