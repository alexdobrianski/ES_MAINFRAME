int PC390READ(int IN, char far*BUFER )

{
extern int FLAG;
extern int size;
extern int psize;
if (eof(IN)) return(0xff);
 read (IN,&size,2)    ;    /* ࠧ��� ⥪�饩 �����		*/
if (eof(IN)) return(0xff);
 read (IN,&psize,2)   ;    /* ࠧ��� �।��饩 �����.	*/
if (eof(IN)) return(0xff);
 read (IN,&FLAG,1)     ;    /* ���� ���� 䫠���		*/
if (eof(IN)) return(0xff);
 read (IN,NULL,1)     ;      /* ��ன ���� 䫠���		*/
 if (size!=0) read (IN, BUFER, size);    /* �⠥� ����)     */
if (eof(IN)) return(0xff);
return(FLAG);
};

