void WRITE(int OUT,char far*BUFER,long LEN_BLOCK,char PR)
{
 static long OFF_PREV=0l;
 static long OFF_NEXT=0l;
 static long OFF_NOW=0l;

 OFF_NOW=tell(OUT);          /* ⥪��� ������ 䠩�� �����                 */
 write(OUT,&OFF_PREV,4);     /* ��砫� ���ਯ�� �।��饩 �����        */
 write(OUT,&OFF_NEXT,4);     /* ��砫� ᫥���饩 �����, �⫮������ �ନ�. */
 write(OUT,&LEN_BLOCK,4);    /* ����� ����� �� ���� 			    */
 write(OUT,&PR,1);           /* ��� �����: 0xff - TM , 0x11 - data          */
 if (LEN_BLOCK) write(OUT,BUFER,LEN_BLOCK);
 OFF_PREV=OFF_NOW;           /* ⥪��� ������ �⠭������ "�।��饩"      */

 OFF_NOW=tell(OUT);    /* ���������� ������, �� ���ன �����稫��� ������ */
 lseek(OUT,OFF_PREV+4l,SEEK_SET); /* ��⠭�������� OFF_NEXT                 */
 write(OUT,&OFF_NOW,4);           /* � ��襬 ���                            */
 lseek(OUT,OFF_NOW,SEEK_SET); /* �⠢���� �� ����� ⥪�襩 �����           */
}

