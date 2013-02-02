/****************************************************************
*
* void RUN_5010(int UNIT) - spesial tape
*
****************************************************************/
#include "ds360opt.h"
#include <stdio.h>
#include <dos.h>
#include <io.h>
#include <\sys\stat.h>
#include <fcntl.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <alloc.h>
#include <mem.h>

#include "ds360psw.h"

#include "ds360dfn.h"

//#include "ds360trn.h"


void RUN_5010(int UNIT)
{
 static int flag_reader_open=0;
 static int RDFILE;
 static int RE;
 static unsigned long CAW;
 static unsigned long ar;
 static int i;
 static long OFF_PREV;
 static long OFF_NEXT;
 static long LEN_BLOCK;
 static long OFF_NOW;
 static char PR=0x11;
 static int BLOCK_SIZE;
 static char BUFER[20000];
 static char far*bufer;
 static unsigned int RET;
 static unsigned int COUNT_CC;
 static unsigned int count_cc;


 /********************************************************************
 Байт состояния устройства
 0 - не используется
 1 - модификатор состояния если возбужден одновременно с битом ЗАНЯТО
 2 - контроллер кончил Возбуждается в следующих случаях
		 а) в конце любой операции при выполнении которой был
				выдан сигнал КОНТРОЛЛЕР ЗАНЯТ
		 б) в конце любой операции управления при выполнении которой были
				обнаружены ОШИБКА В УСТРОЙСТВЕ или ОСОБЫЙ СЛУЧАЙ В УСТРОЙСТВЕ
 3 - Занято Если возбужден одновременно с модификатором  состояния
		 то контроллер занят Если возбужденн а модификатор состояния нет
		 - занято устройство
 4 - Канал кончил Для команд управления возбуждается сразу после поступления
		 команды для команд чтения и записи - в конце передачи данных
 5 - УВВ кончило Означает что устройство завершило операцию
		 Сигнал выдается так-же когда устройство переходит
		 из состояния НЕ ГОТОВО в состояние ГОТОВО
 6 - Ошибка в устройстве, Возбуждается всякий раз когда
		 а) возбужден любой бит байта 0 уточненного состояния
		 б) возбужден бит 4 байта 1 уточненного состояния
		 в) контролер завершил свою работу начав
				выполнение команды ПЕРЕМОТКА И РАЗГРУЗКА
 7 - Особый случай в устройстве Возбуждается если
		 при выполнении команды ЗАПИСЬ  WTM ERG пройден отражающий
		 маркер конца ленты EOT

 Байт 0
 0 - команда отвергнута Недопустимая команда или команды ЗАПИСЬ
		 WTM ERG выдана для защищенного файла
 1 - требуется вмешательство (бит 1 байта 1 равен 0)
 2 - ошибка в выходной информационной шине
 3 - ошибка в оборудовании бит 7 байт 3 и 1 5 6 7 байта 4 не все равны 0
 4 - ошибка в данных биты 0-4 байта 4 не все равны 0
 5 - переполнение возможно при выполнении операции ЧТЕНИЕ
		 ЗАПИСЬ ОБРАТНОЕ ЧТЕНИЕ  передача данных прекращается
 6 - нулевое число слов возбуждается при выполнении записи
		 если операция прервана (например HIO) до того как мог быть
		 записан первый байт Движение ленты не было
 7 - не используется

 Байт 1
 0 - помеха при работе в режиме NRZ обнаружены сигналы помех
		 в межблочном промежутке при работе в режиме PE бит всегда 0
 1 - готово устройство находится в состоянии готово
 2 - если этот бит возбужден а бит 1 сброшен то лентопротяжного устройства
		 нет если одновременно с этим битом бит 1 возбужден
		 но сброшен бит занято то устройство находится в состоянии не готово
		 если одновременно с этим битом возбужден бит 1 и бит
		 занято то выполняется перемотка
 3 - головка установлена для работы с 7-дорожечной лентой

 4 - лента находится в точке загрузки
 5 - лента находится в состоянии записи это означает
			что последнее движение ленты относилось к командам
			запись ERG ?WTM
 6 - лента защищена (снято кольцо защиты)
 7 - при режиме NRZ не используется

 Байт 2
 При режиме PE не используется

 Байт 3

 Байт 4

 Байт 5
 ********************************************************************/

 if (IO_STATUS[UNIT][8]==0)
			 {
//				IO_STATUS[UNIT][9]=
//					open(&NAME_FILE_IO_DEVICE[UNIT][0],O_RDWR|O_BINARY);
				IO_STATUS[UNIT][8]=1;
				IO_STATUS[UNIT][5]=0;
				OFFSET_IO_DEVICE[UNIT]=0l;
				IO_STATUS[UNIT][3]=0x48;
			 }
 bufer=BUFER;
 switch(CSW_COD[UNIT])
	 {
		case 0x02:   /* ЧТЕНИЕ
								 лента перемещается до следующего IBG данные
								 передаются в канал
								 */

							//tt(UNIT);
							COUNT_CC=CSW_COUNT[UNIT];
							asm pusha;
							asm push ds;
							asm mov cx,COUNT_CC;
							asm lds dx,bufer;
							asm mov ah,2;
							asm int 0x61;
							asm pop ds;
							asm mov count_cc,cx;
							RET=_AX;
							asm popa;

							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto R1;
								 }
							if (RET&0x0084)    /* ОШИБКА */
								 {
									IO_STATUS[UNIT][2]=U4;
									IO_STATUS[UNIT][1]|=U6;
									goto R1;
								 }
							if (RET&0x0008)    /* TM */
								 {IO_STATUS[UNIT][1]|=U7;
								 }
							else
								 {if (RET&0x8000)
										{BLOCK_SIZE=COUNT_CC;
										}
									else
										{BLOCK_SIZE=COUNT_CC-count_cc;
										}
									MOVE_MEM_TO_360(BUFER,CSW_ADRESS[UNIT],COUNT_CC);
									CSW_COUNT[UNIT]-=COUNT_CC;
								 }

R1:
							//tt(UNIT);
				break;


		case 0x0c:   /* ОБРАТНОЕ ЧТЕНИЕ
								 лента движется в обратном направлении до IBG
								 данные передаются в канал
								 */
							tt(UNIT);

				break;


		case 0x04:   /* УТОЧНИТЬ СОСТОЯНИЕ
								 шесть байтов информации уточненного состояния
								 передаются в канал
								 байты уточненного состояния сбрасываются в начале
								 каждой операции чтения или записи а также
								 в начале каждой операции управления которая требует
								 движения ленты
								 */
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0x40;
				for(i=0,ar=CSW_ADRESS[UNIT];i<2;i++,ar++)
						{
						 PUT_BYTE(ar,IO_STATUS[UNIT][i+2]);
						}
				IO_STATUS[UNIT][2]=0;
				IO_STATUS[UNIT][3]=0;
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;


		case 0x01:   /* ЗАПИСЬ
								 лента движется в прямом направлении
								 запись производится пока канал посылает данные
								 по окончании передачи на ленте формируется IBG
								 размер блока не должен быть меньше 18 байт
								 */

							MOVE_360_TO_MEM(CSW_ADRESS[UNIT],BUFER,CSW_COUNT[UNIT]);
							COUNT_CC=CSW_COUNT[UNIT];
							asm pusha;
							asm push ds;
							asm mov cx,COUNT_CC;
							asm lds dx,bufer;
							asm mov ah,1;
							asm int 0x61;
							asm pop ds;
							asm mov count_cc,cx;
							RET=_AX;
							asm popa;
							IO_STATUS[UNIT][1]=U4|U5;
							CSW_COUNT[UNIT]=0;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto W1;
								 }
							if (RET&0x0084)    /* ОШИБКА */
								 {
									IO_STATUS[UNIT][2]=U4;
									IO_STATUS[UNIT][1]|=U6;
									goto W1;
								 }
							if (RET&0x0040)    /* ЗАЩИТА ЗАПИСИ*/
								 {
									IO_STATUS[UNIT][2]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W1;
								 }
W1:
							tt(UNIT);
				break;


		case 0x07:   /* ПЕРЕМОТКА      REW
								 Лента перемещается к началу т.е. к точке загрузки
								 как только начинается перемотка вырабатывается
								 сигнал УВВ кончило
								 когда перемотка заканчивается вырабатывается
								 второй сигнал УВВ кончило
								 */
							asm pusha;
							asm push ds;
							asm mov ah,9;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							IO_STATUS[UNIT][3]=0x48;
							IO_STATUS[UNIT][1]=U4|U5;
							CSW_COUNT[UNIT]=0;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;


		case 0x0f:   /*  ПЕРЕМОТКА И РАЗГРУЗКА  RUN
								 то же что и ПЕРЕМОТКА кроме того лента разгружается
								 */
							asm pusha;
							asm push ds;
							asm mov ah,9;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							IO_STATUS[UNIT][3]=0x48;
							IO_STATUS[UNIT][1]=U4|U5;
							CSW_COUNT[UNIT]=0;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;




		case 0x17:   /*  СТЕРЕТЬ УЧАСТОК        EBG
								 Это операция записи но без передачи данных
								 в результатте создается удлиненный IBG
								 */
							asm pusha;
							asm push ds;
							asm mov cx,0xffff;
							asm mov ah,8;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							tt(UNIT);
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto W2;
								 }
							if (RET&0x0084)    /* ОШИБКА */
								 {
									IO_STATUS[UNIT][3]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W2;
								 }
							if (RET&0x0040)    /* ЗАЩИТА ЗАПИСИ*/
								 {
									IO_STATUS[UNIT][2]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W2;
								 }
W2:           tt(UNIT);
				break;


		case 0x1f:   /* ЗАПИСЬ МАРКИ ЛЕНТЫ      WTM
								 Записывается специальный короткий блок
								 называемый маркой ленты
								 как и для любого другого блока ему предшествует
								 и за ним следует IBG
								 */
							asm pusha;
							asm push ds;
							asm mov ah,3;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;

							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
									goto W3;
								 }
							if (RET&0x0084)    /* ОШИБКА */
								 {
									IO_STATUS[UNIT][2]=U4;
									IO_STATUS[UNIT][1]|=U6;
									goto W3;
								 }
							if (RET&0x0040)    /* ЗАЩИТА ЗАПИСИ*/
								 {
									IO_STATUS[UNIT][2]=U0;
									IO_STATUS[UNIT][1]|=U6;
									goto W3;
								 }
W3:
							tt(UNIT);
				break;


		case 0x27:   /* ШАГ НАЗАД НА БЛОК       BSB
								 лента движется назад до следующего IBG
								 */
							asm pusha;
							asm push ds;
							asm mov ah,7;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;

							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							if (RET&0x0008)    /* TM */
								 {IO_STATUS[UNIT][1]|=U7;
								 }
							tt(UNIT);
				break;


		case 0x2f:   /* ШАГ НАЗАД НА ФАЙЛ       BSF
								 Лента движется назад за следующую
								 марку ленты если марка не найдена лента устанавливается в точке
								 загрузки
								 */
							asm pusha;
							asm push ds;
							asm mov ah,5;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;


		case 0x37:   /* ШАГ ВПЕРЕД НА БОЛК      FSB

								 */
							asm pusha;
							asm push ds;
							asm mov ah,6;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							if (RET&0x0008)    /* TM */
								 {IO_STATUS[UNIT][1]|=U7;
								 }
							tt(UNIT);
				break;


		case 0x3f:   /* ШАГ ВПЕРЕД НА ФАЙЛ      FSF
								 */
							asm pusha;
							asm push ds;
							asm mov ah,4;
							asm int 0x61;
							asm pop ds;
							RET=_AX;
							asm popa;
							CSW_COUNT[UNIT]=0;
							IO_STATUS[UNIT][1]=U4|U5;
							if (RET&0x0002)    /* НЕ ГОТОВО */
								 {
									IO_STATUS[UNIT][2]=U1;
									IO_STATUS[UNIT][1]|=U6;
								 }
							tt(UNIT);
				break;


		case 0xc3:   /* УСТАНОВИТЬ РЕЖИМ 1600 PE   PE

								 */
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				break;


		case 0xcb:   /* УСТАНОВИТЬ РЕЖИМ 800 NZR   NRZ
								 */
				IO_STATUS[UNIT][1]=U4|U5;
				CSW_COUNT[UNIT]=0;
				break;


		case 0xdb:   /* ЗАПРОС TIE
								 */
				CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;
		case 0x03:  /*  NOP */
				//CSW_COUNT[UNIT]=0;
				IO_STATUS[UNIT][1]=U4|U5;
				tt(UNIT);
				break;


		default:
				tt(UNIT);
				break;
		}

}
