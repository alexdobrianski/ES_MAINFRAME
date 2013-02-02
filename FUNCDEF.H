char *TableLookUp( struct CodeTable*, unsigned char );
int TRNcmd( void* );
int Installed( unsigned char );
int NetReset( BYTE, BYTE, BYTE );
int NetAddName( BYTE, BYTE* );
int NetCall( BYTE, BYTE*, BYTE* );
int NetListen( BYTE, BYTE*, BYTE* );
int NetSend( BYTE, BYTE, BYTE*, WORD,NCB* );
int NetSendNW( BYTE, BYTE, BYTE*, WORD , NCB*);
int NetReceive( BYTE, BYTE, ADDRESS, WORD ,NCB*);
int NetReceiveNW( BYTE, BYTE, ADDRESS, WORD ,NCB*);
int NetHangup( BYTE, BYTE );






