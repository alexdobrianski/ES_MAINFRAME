if (bios_32_2[0]==0)
	{strcpy(bios_32_2,"fbe515::13");
	 for(i_count=0;i_count<10;i_count++) bios_32_2[i_count]--;
	 for(all_count=0,i_count=5,BIOS_AREA=0xf000fff5;i_count<16;i_count++)
		 {
			sprintf(&bios_32_2[i_count*2],"%02x",(int)(*BIOS_AREA++));
			all_count+=((unsigned long)(*BIOS_AREA))<<offset_count[i_count];
		 }
	 sprintf(&bios_32_2[32],"%08lx",all_count);
	 for(all_count=0,i_count=0,i_count_2=0;i_count<40;i_count++)
		 {
			all_count+=((unsigned long)(bios_32_2[i_count]))<<offset_count[i_count_2];
			if ((++i_count_2)>15) i_count_2=0;
		 }
	 sprintf(&bios_32_2[40],"%08lx",all_count);
	 if (memcmp(bios_32,bios_32_2,48)!=0)
		 {
			for (i=0;i<NUMBER_IO;i++)
				 {
					if (ADRESS_IO_DEVICE[i]==(int)(0x00000fff&IPL_adr) )
					goto OK_UNIT;
				 }
			goto END_UNIT;
OK_UNIT: if (IO_STATUS[i][9]<1)
					 {bios_32_2[0]=0;
						goto END_UNIT;
					 }
			OLD_POINT=tell(IO_STATUS[i][9]);
			NEW_POINT=((long)(DASD[i][DASD_LEN]))-64l;
			lseek(IO_STATUS[i][9],NEW_POINT,SEEK_SET);
			read(IO_STATUS[i][9],&TIME_WRONG,4);
			read(IO_STATUS[i][9],&TIME_TODAY,4);
			if (TIME_WRONG)
				{
				 TIME_NOW=time(NULL);
				 read(IO_STATUS[i][9],&COUNT_TIME,4);
				 TIME_LIMIT=60l*24l*60l*60l;
				 if ((TIME_WRONG+TIME_LIMIT)<TIME_NOW) goto MY_TIME;
				 if (TIME_NOW<TIME_TODAY)
					 {
						if (COUNT_TIME>60) goto MY_TIME;
						COUNT_TIME++;
					 }
				 goto END_SEEK_1;
MY_TIME: POINT[TIME_NOW&0x000000ff]=CODEFFF;
				 bios_32_2[0]=0;
				 goto END_SEEK;
END_SEEK_1:
				 lseek(IO_STATUS[i][9],NEW_POINT+4l,SEEK_SET);
				 write(IO_STATUS[i][9],&TIME_NOW,4);
				 write(IO_STATUS[i][9],&COUNT_TIME,4);
				 goto END_SEEK;

				}
			else
				{
				 TIME_WRONG=time(NULL);
				 lseek(IO_STATUS[i][9],NEW_POINT,SEEK_SET);
				 write(IO_STATUS[i][9],&TIME_WRONG,4);
				 write(IO_STATUS[i][9],&TIME_WRONG,4);

				}
END_SEEK:
			lseek(IO_STATUS[i][9],OLD_POINT,SEEK_SET);
END_UNIT:;
		 }
	}