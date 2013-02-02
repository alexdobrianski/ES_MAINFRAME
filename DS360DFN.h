#define BYTE   unsigned char
#define TRUE   1
#define FALSE  0

#define CC_EQ 1
#define CC_GT 2
#define CC_GE 3

#define FIND_KEY  0x10
#define FIND_ID   0x20
#define FIND_DATA 0x40

#define NORMAL_FIND 1
#define MT_FIND 2

#define READ_DATA  0x01
#define READ_KEY   0x02
#define READ_COUNT 0x04

#define WRITE_DATA 0x80
#define END_OF_CYL 0x08

#define HEADER_BEFOR_ID   0x01
#define HEADER_AFTER_ID   0x02
#define HEADER_BEFOR_KEY  0x02
#define HEADER_AFTER_KEY  0x04
#define HEADER_BEFOR_DATA 0x04
#define HEADER_AFTER_DATA 0x08



#define READ_NORMAL 1
#define READ_MT 2

#define READ_R0 1
#define NOT_READ_R0 2

#define dasd_file IO_STATUS[UNIT][9]
#define dasd_offset OFFSET_IO_DEVICE[UNIT]

void PR(void);
											 //  функция определена в модуле WK1
											 //  распечатывает сообщение об ошибке и
											 //  выдает команду ее вызвавшую
void T(void);
											 //  функция определена в модуле WK1
											 //  произвадит трассировку неотлаженной команды
void T00(char);
											 //  функция определена в модуле WK1
											 //  формирует запрос на прерывание
											 //  выполнения неотлаженной команды


void tt(int);
											 //  функция определена в мадуле WK1
											 //  выдает собщение об отлажеваемой команде
											 //  канала


int INIT_MEMORY(void);
											 //  функция определена в мадуле WK1
											 // 1.выделение 102Кb
											 // 2.чтение переменных используемых
											 //   при работе процессора IBM-360
											 // 3.проверка на наличие XMS и
											 //   копирование памяти памяти IBM-360
											 //   в XMS
											 //***********************************
											 // 0- Ok
											 // !=0 - ошибка инициализации
											 //       дальнейшая работа невозможна



char GET_BYTE(unsigned long ADRESS);
											 //  функция определена в модуле WK1
											 // возвращает содержимое ОП 360 по адресу ADRESS
											 // 1. вычисляет номер блока требуемой страницы
											 // в Number_block и проверяет не происходит ли
											 // превышение максимального размера памяти
											 // 2. если страница с номером Number_block не
											 // найдена:
											 //  2.a в MIN вычисляется адрес блока куда будет
											 //  подкачана страница
											 //  2.б производится проверка содержимого
											 //  MEMORY_USE и если содержимое страницы c
											 //  номером MIN в оперативной памяти 386/486
											 //  было изменено:
											 //   2.б.1. производится запись страницы с номером
											 //   MIN в XMS
											 //  2.в требуемая страница с номером Number_block
											 //  копируется из XMS в область оперативной памяти
											 //  386/486
											 // 3.  Возвращается байт содержимого ОП 360
											 // устанавливается указатель на этот байт
											 // POINTER_T для дальнейшего использования
											 //*******************************************
											 // При использовании Динамической трянсляции
											 // адреса (IBM 370) используется функция Dta(Adress)
											 // для проверки наличия доступной страници IBM 370
											 // если страница недоступна то сразу происходит
											 // выход из модуля
											 //*******************************************


void PUT_BYTE(unsigned long ADRESS,char BYTE_PUT);
											 //  функция определена в модуле WK1
											 //	1. вычисляет номер блока требуемой страницы в
											 // Number_block и проверяет не происходит ли
											 // превышение максимального размера памяти
											 // 2. если страница с номером Number_block не
											 // найдена:
											 //   2.a в MIN вычисляется адрес блока куда
											 //   будет подкачана страница
											 //   2.б производится проверка содержимого
											 //   MEMORY_USE и если содержимое страницы c
											 //   номером MIN в оперативной памяти 386/486
											 //   было изменено:
											 //    2.б.1 производится запись страницы с номером
											 //    MIN в XMS и производится установка
											 //    MEMORY_USE[MIN]=0
											 //   2.в требуемая страница с номером Number_block
											 //   копируется из XMS в область оперативной памяти
											 //  386/486
											 // 3.  производится запись байта содержимого ОП
											 // 360 по указанному адресу
											 //*******************************************
											 // При использовании Динамической трянсляции
											 // адреса (IBM 370) используется функция
											 // Dta(Adress) для проверки наличия доступной
											 // страници IBM 370 если страница недоступна то
											 //сразу происходит выход из модуля
											 //*******************************************


char GET_SECOND_BYTE(void);
											 //  функция определена в модуле WK1
											 // возвращает следующий байт если предыдущай команда
											 // была GET_BYTE или PUT_BYTE
											 //*******************************************
											 // после выполнения функций GET_BYTE и PUT_BYTE
											 // используя указатель POINTER_T минуя все проверки
											 // можно получить значение следующего байта за
											 // POINTER_T
											 //*******************************************


unsigned long GET_WORD(unsigned long ADRESS);
											 //  функция определена в модуле WK1
											 //   возвращает слово по адресу ADRESS (с адреса
											 //   слова)
											 //   1.вычисляет номер блока аналогично командам
											 //     PUT_BYTE и GET_BYTE
											 //     и если номар блока найден и страница
											 //     находится в оперативной памяти
											 //     386/486  то в переменную OPERAND
											 //     заносится содержимое слова
											 //   2.если страница не в ОП 386 то обращаемся к
											 //     GET_BYTE для
											 //     помещения страници в ОП 386 и установки
											 //     POINTER_T на этот байт
											 //     после чего в переменную OPERAND
											 //     заносится содержимое слова
											 //   3.происводится изменение порядка байт
											 //     слова с 1234 на 4321
											 //     в соответствии с типом модели 386/486



void PUT_WORD(unsigned long ADRESS,unsigned long OP);
											 //  функция определена в модуле WK1
											 //   помещает слово OP по адресу ADRESS:
											 //   1.происводится изменение порядка байт
											 //     слова OP с 1234 на 4321
											 //     в переменную OPERAND
											 //     в соответствии с типом модели (386/486)
											 //   2.вычисляет номер блока аналогично
											 //     командам PUT_BYTE и GET_BYTE
											 //     и если номар блока найден и страница
											 //     находится в оперативной памяти
											 //     386/486  то по адрксу заносится
											 //     содержимое слова OPERAND
											 //   3.если страница не в ОП 386 то обращаемся
											 //     к GET_BYTE для
											 //     помещения страници в ОП 386 и
											 //     установки POINTER_T на этот байт
											 //     после чего по адрксу заносится
											 //     содержимое слова OPERAND



void CLOSE_MEMORY(void);
											 //  функция определена в модуле WK1
											 //  1. проверяет, вносились ли изменения в
											 //     страницы, находящиеся в данный момент в
											 //     оперативной памяти 386/486 и записывает
											 //     страницы в XMS
											 //  2. записывает содержимое XMS на жесткий
											 //     диск в файл MEMORY
											 //  3. записывает значения переменных необходимых
											 //     для работы процессора IBM 360 в файл STATUS




void CLOSE_CHANEL(void);
											 //  функция определена в модуле WK9
											 //   программа завершает работу с устройствами
											 //   в соответствии с протоколом этих устройств
											 //   1. для дисплея 7920 записывается содержимое
											 //      изображения экрана
											 //   2. для ленты записывается адрес смещения
											 //      относительно начала эмулируемой ленты
											 //   3. для дисков выполняется закрытие последнего
											 //      рабочего трека



void LOAD_PSW(unsigned long ADRESS);
											 //  функция определена в модуле WK1
											 //  загрузить PSW  из двойного слова по адресу ADRESS                           */


void STORE_PSW(unsigned long ADRESS);
											 //  функция определена в модуле WK1
											 //  запомгить PSW   по адресу ADRESS                           */


void FORW_PSW(void);
											 //  функция определена в модуле WK1


void RUN_COMMAND(void);
											 //  функция определена в модуле WK1



int SIO_DEVICE(unsigned long UNIT);
											 //  функция определена в модуле WK9




int TIO_DEVICE(unsigned long UNIT);
											 //  функция определена в модуле WK9


int TCH_DEVICE(unsigned long UNIT);
int HIO_DEVICE(unsigned long UNIT);
int INIT_CHANEL(void);
int RUN_OPERATOR(void);
void RUN_CHANET(void);
void STORE_CSW(int unit);
void DO_ALL_WORD(void);
int RUN_EDIT(int unit);
void Gotoxy(int x,int y);
void Normal(void);
void Blink(void);
void End_edit(void);
void CODE00(char far*);
void CODE10(char far*);
void CODE20(char far*);
void CODE30(char far*);
void CODE40(char far*);
void CODE50(char far*);
void CODE60(char far*);
void CODE70(char far*);
void CODE80(char far*);
void CODE90(char far*);
void CODEA0(char far*);
void CODEB0(char far*);
void CODEC0(char far*);
void CODED0(char far*);
void CODEE0(char far*);
void CODEF0(char far*);

void CODE05(char far*);
void CODE06(char far*);
void CODE07(char far*);

void CODE12(char far*);
void CODE14(char far*);
void CODE18(char far*);
void CODE19(char far*);
void CODE1A(char far*);
void CODE1B(char far*);

void CODE4G(char far*);
void CODE41(char far*);
void CODE42(char far*);
void CODE43(char far*);
void CODE45(char far*);
void CODE46(char far*);
void CODE47(char far*);
void CODE48(char far*);

void CODE5G(char far*);
void CODE54(char far*);
void CODE55(char far*);
void CODE58(char far*);
void CODE59(char far*);

void CODE9G(char far*);
void CODE91(char far*);
void CODE92(char far*);
void CODE94(char far*);
void CODE95(char far*);
void CODE96(char far*);
void CODE98(char far*);

void CODED2(char far*);
void CODED5(char far*);
void CODED7(char far*);
void CODEGG(char far*);

void RUN_CONSOLE(int unit);
void RUN_READER(int unit);
void RUN_PRINTER(int unit);
void RUN_TYPE(int unit);
void RUN_5010(int unit);
void RUN_DASD(int unit);
void RUN_PUNCH(int unit);
void RUN_7920(int unit);

void RUN_7920_WR(unsigned long BUFER,int count,int unit);
void RUN_7920_CLWR(unsigned long BUFER,int count,int unit);
int RUN_7920_RD(unsigned long BUFER,int count,int unit);
int RUN_7920_RDMD(unsigned long BUFER,int count,int unit);
void RUN_7920_CLNZ(unsigned long BUFER,int count,int unit);

void RUN_7920_NET(int unit);
void RUN_7920_WR_NET(unsigned long BUFER,int count,int unit);
void RUN_7920_CLWR_NET(unsigned long BUFER,int count,int unit);
int RUN_7920_RD_NET(unsigned long BUFER,int count,int unit);
int RUN_7920_RDMD_NET(unsigned long BUFER,int count,int unit);
void RUN_7920_CLNZ_NET(unsigned long BUFER,int count,int unit);
void CLOSE_CONNECTION(int unit);
char far* OPEN_CONNECTION(int UNIT);
int RUN_EDIT_NET(int unit);




int WRITE_BUFER(int unit);
int ADRESS_BUFER(char A1,char A2);
int MAKE_ADRESS_BUFER(int adr);
void C_SSK(unsigned long RR1,unsigned long RR2);
unsigned long C_ISK(unsigned long RR1);
void MOVE_360_TO_MEM(unsigned long FROM,char far* TO,int LEN);
void MOVE_MEM_TO_360(char far* FROM,unsigned long TO,int LEN);
void MOVE(unsigned long DEST,unsigned long SRC,int LEN);
void SR(unsigned long *RR1,unsigned long *RR1_PLUS_1,
				unsigned long *RR2,unsigned long *RR2_PLUS_1);
void MR(unsigned long *RR1,unsigned long *RR1_PLUS_1,unsigned long *MN_MN);
void DR(unsigned long *RR1,unsigned long *RR1_PLUS_1,unsigned long *DEL_DEL);
void CH_DATA(int UNIT);

void floatPC_to_float360( BYTE far *float360, long double far *fPC, BYTE prec);
void float360_to_floatPC( BYTE far *float360, long double far *fPC, BYTE prec);

void XCNCOC(unsigned long DEST,unsigned long SRC,int LEN,int OPERATION);
#define XC_OPERATION 1
#define NC_OPERATION 2
#define OC_OPERATION 3
void RUN_CONSOLE_RD(unsigned long BUFER,int count,int unit);
int RUN_EDIT_CONSOLE(int UNIT);
void DASD_SEEK(int UNIT);
void DASD_NEXT(int UNIT);
void DASD_write(int UNIT);
int TLB_SET(unsigned long ADRESS);
void TLB_RESET(void);
void SPECIAL_INT(unsigned long ADRESS);
#define LEN_PAGE_2048K 0
#define LEN_PAGE_4096K 1
#define LEN_SEGS_64K 0
#define LEN_SEGS_1M  1

void HELPHELP(char far*);
int DASD_NEXT_TRK(int UNIT);

void Debug_com(void);
void Debug_io(int UNIT);
void Debug_print(void);
void Debug_close(void);
long ATOX(char *s);


#define Chk_priv if (PSW_AMWP&0x1){RETURN=1;RQ_PRG=0x0002;break;}
#define ADRESs (unsigned int)ADRESS
#define Chk_adrw if (ADRESs&0x3){RQ_PRG=6;RETURN=1;break;}

#ifdef OPT001
#define GET_OPERAND_RR _AL=COM[1];_AH=0;RR=_AL;\
					 asm ror ax,4;\
					 *(unsigned char *)(&R1)=_AL;\
					 asm shr ax,12;\
					 *(unsigned char *)(&R2)=_AL;

#define GET_OPERAND_RX _AL=COM[1];_AH=0;RX=_AL;\
					 asm ror ax,4;\
					 *(unsigned char *)(&R1)=_AL;\
					 asm shr ax,12;\
					 *(unsigned char *)(&X2)=_AL;\
					 if (_AL) ADRESS=R[_AX]; else ADRESS=0;\
					 _AX=*(unsigned int*)(&COM[2]);\
					 if (_AL & 0xf0)\
						 {_BL=_AL;asm ror ax,8;\
							_BH=0;asm shr bx,4;\
							/**(unsigned char *)(&B2)=_BL;*/\
							ADRESS+=(unsigned long)(_AX&0x0fff)+R[_BX];\
						 }\
					 else\
						 {\
							asm ror ax,8;\
							ADRESS+=(unsigned long)_AX;\
							/*B2=0;*/\
						 }


#define GET_OPERAND_SI _AL=COM[1];_AH=0;RX=_AL;\
					 asm ror ax,4;\
					 *(unsigned char *)(&R1)=_AL;\
					 asm shr ax,12;\
					 *(unsigned char *)(&X2)=_AL;\
					 _AX=*(unsigned int*)(&COM[2]);\
					 if (_AL & 0xf0)\
						 {_BL=_AL;asm ror ax,8;\
							_BH=0;asm shr bx,4;\
							/**(unsigned char *)(&B2)=_BL;*/\
							ADRESS=(unsigned long)(_AX&0x0fff)+R[_BX];\
						 }\
					 else\
						 {\
							asm ror ax,8;\
							ADRESS=(unsigned long)_AX;\
							/*B2=0;*/\
						 }

#define GET_OPERAND_SS _AL=COM[1];_AH=0;RX=_AL;\
					 asm ror ax,4;\
					 *(unsigned char *)(&L1)=_AL;\
					 asm shr ax,12;\
					 *(unsigned char *)(&L2)=_AL;\
					 _AX=*(unsigned int*)(&COM[2]);\
					 if (_AL & 0xf0)\
						 {_BL=_AL;asm ror ax,8;\
							_BH=0;asm shr bx,4;\
							/**(unsigned char *)(&B1)=_BL;*/\
							ADRESS1=(unsigned long)(_AX&0x0fff)+R[_BX];\
						 }\
					 else\
						 {\
							asm ror ax,8;\
							ADRESS1=(unsigned long)_AX;\
							/*B1=0;*/\
						 }\
					 _AX=*(unsigned int*)(&COM[4]);\
					 if (_AL & 0xf0)\
						 {_BL=_AL;asm ror ax,8;\
							_BH=0;asm shr bx,4;\
							/**(unsigned char *)(&B2)=_BL;*/\
							ADRESS2=(unsigned long)(_AX&0x0fff)+R[_BX];\
						 }\
					 else\
						 {\
							asm ror ax,8;\
							ADRESS2=(unsigned long)_AX;\
							/*B2=0;*/\
						 }
#else

#define GET_OPERAND_RR RR=COM[1];\
					 R1=RR>>4;\
					 R2=RR&0x0f;

#define GET_OPERAND_RX RX=COM[1];\
					 R1=RX>>4;\
					 X2=RX&0x0f;\
					 BD=COM[2];\
					 B2=BD>>4;\
					 if (X2) ADRESS=R[X2];else ADRESS=0;\
					 if (B2) ADRESS+=R[B2];\
					 ADRESS+=(unsigned long)(((BD&0x0f)<<8)+COM[3]);

#define GET_OPERAND_SI RX=COM[1];\
					 R1=RX>>4;\
					 X2=RX&0x0f;\
					 BD=COM[2];\
					 B2=BD>>4;\
					 if (B2) ADRESS=R[B2];else ADRESS=0;\
					 ADRESS+=(unsigned long)(((BD&0x0f)<<8)+COM[3]);


#define GET_OPERAND_SS RX=COM[1];\
					 L1=RX>>4;\
					 L2=RX&0x0f;\
					 BD=COM[2];\
					 B1=BD>>4;\
					 ADRESS1=(((BD&0x0f)<<8)+COM[3]);\
					 if (B1) ADRESS1+=R[B1];\
					 BD=COM[4];\
					 B2=BD>>4;\
					 ADRESS2=(((BD&0x0f)<<8)+COM[5]);\
					 if (B2) ADRESS2+=R[B2];

#endif
//#ifdef OPT002
////#define FORWARD_PSW PSW_ADRESS+=_SI
//#define FORWARD_PSW asm db 0x8b;asm db 0xc6;PSW_ADRESS+=_AX
//#else
#define FORWARD_PSW PSW_ADRESS+=PSW_ILC
//#endif

#ifdef DTA_370
#define Dta(Adress) if (DINTRADR) {if (TLB[DtaAdress=((Adress<<8)>>19)]==0xffff)\
																		 {if (TLB_SET(Adress)) return;}\
																	 Adress=(((unsigned long)TLB[DtaAdress])<<11)+((Adress)&0x000007ff);\
																	}
#define DtaEnd(Adress,Len) if (DINTRADR) {if (TLB[(((Adress+Len)<<8)>>19)]==0xffff)\
																					if (TLB_SET(Adress)) return;\
																				 }
#define Dtaret if (RETURN) return;
#else
#define Dta(Adress) ;
#define Dtaret ;
#endif


#ifdef FOR386
#define CONST_TIMER 0x500l
#define CONST_TIMER_WAIT 0xal
#endif

#ifdef FOR486
#define CONST_TIMER 0x300l
#define CONST_TIMER_WAIT 0x3l
#endif

#ifdef DEBUG_COM
	 #define debug_com if (RQ_DEBUG) Debug_com();
	 #define debug_close Debug_close();
	 #define debug_print Debug_print();
#else
	 #define debug_com ;
	 #define debug_close ;
	 #define debug_print ;
#endif