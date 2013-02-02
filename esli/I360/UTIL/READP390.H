int PC390READ(int IN, char far*BUFER )

{
extern int FLAG;
extern int size;
extern int psize;
if (eof(IN)) return(0xff);
 read (IN,&size,2)    ;    /* размер текущей записи		*/
if (eof(IN)) return(0xff);
 read (IN,&psize,2)   ;    /* размер предыдущей записи.	*/
if (eof(IN)) return(0xff);
 read (IN,&FLAG,1)     ;    /* первый байт флагов		*/
if (eof(IN)) return(0xff);
 read (IN,NULL,1)     ;      /* второй байт флагов		*/
 if (size!=0) read (IN, BUFER, size);    /* читаем блок)     */
if (eof(IN)) return(0xff);
return(FLAG);
};

