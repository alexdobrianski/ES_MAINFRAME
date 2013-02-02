#define FOR386 1           // for 386 GET PUT BYTE WORD
//#define FOR486 1         // for 486 GET PUT WORD
#define FORXMS 1           // for XMS
//#define FORXMSDASD 1     // XMS in DASD
#define INCLUDE 1          //  КОД КОМАНД в ds360wk1
#define OPT001 1           //  ДЕКОДИРОВКА КОМАНДЫ

	#ifdef INCLUDE
	#else
		 #define OPT002 1      //  PSW_ILC
	#endif

	#ifdef FOR486
	#else
		 #define OPT003 1      //  РЕГИСТРОВЫЕ ПЕРЕМЕННЫЕ
	#endif
//#define DTA_370 1        //  ДИНАМИЧЕСКОЕ ПРЕОБРАЗОВАНИЕ АДРЕСА
//#define TIMER_CPU 1      //  ТАЙМЕР CPU И КОМПАРАТОР
//#define TRANSL_CYL 1       // переадресация цилиндров для 100МБ
//#define COM_STAT 1       //СБОР СТАТИСТИКИ
//#define DEBUG_COM 100    // Отладка (обратная трасса команд)
//#define DEBUG_IO  100    // Отладка (обратная трасса) ввода вывода
#define EN_INTER           // расширенный интерфейс (цвета и пр.)
