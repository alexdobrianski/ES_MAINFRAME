#define FOR386 1           // for 386 GET PUT BYTE WORD
//#define FOR486 1         // for 486 GET PUT WORD
#define FORXMS 1           // for XMS
//#define FORXMSDASD 1     // XMS in DASD
#define INCLUDE 1          //  ��� ������ � ds360wk1
#define OPT001 1           //  ����������� �������

	#ifdef INCLUDE
	#else
		 #define OPT002 1      //  PSW_ILC
	#endif

	#ifdef FOR486
	#else
		 #define OPT003 1      //  ����������� ����������
	#endif
//#define DTA_370 1        //  ������������ �������������� ������
//#define TIMER_CPU 1      //  ������ CPU � ����������
//#define TRANSL_CYL 1       // ��ॠ����� 樫���஢ ��� 100��
//#define COM_STAT 1       //���� ����������
//#define DEBUG_COM 100    // �⫠��� (���⭠� ���� ������)
//#define DEBUG_IO  100    // �⫠��� (���⭠� ����) ����� �뢮��
#define EN_INTER           // ���७�� ����䥩� (梥� � ��.)
