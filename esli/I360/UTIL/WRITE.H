void WRITE(int OUT,char far*BUFER,long LEN_BLOCK,char PR)
{
 static long OFF_PREV=0l;
 static long OFF_NEXT=0l;
 static long OFF_NOW=0l;

 OFF_NOW=tell(OUT);          /* текущая позиция файла ленты                 */
 write(OUT,&OFF_PREV,4);     /* начало дескриптора предыдущей записи        */
 write(OUT,&OFF_NEXT,4);     /* Начало следующей записи, отложенное формир. */
 write(OUT,&LEN_BLOCK,4);    /* длина блока на ленте 			    */
 write(OUT,&PR,1);           /* Тип блока: 0xff - TM , 0x11 - data          */
 if (LEN_BLOCK) write(OUT,BUFER,LEN_BLOCK);
 OFF_PREV=OFF_NOW;           /* текущая запись становится "предыдущей"      */

 OFF_NOW=tell(OUT);    /* запоминаем позицию, на которой закончилась запись */
 lseek(OUT,OFF_PREV+4l,SEEK_SET); /* устанавливаем OFF_NEXT                 */
 write(OUT,&OFF_NOW,4);           /* и пишем его                            */
 lseek(OUT,OFF_NOW,SEEK_SET); /* ставимся на конец текушей записи           */
}

