				FLA=_FLAGS;
				//asm pushf;
				//asm pop ax;
				//asm mov FLA,ax;
				if (FLA&0x0040)  /*==0*/
				 {if (FLA&0x0001) PSW_CC=2;  /*��७��*/
					else            PSW_CC=0;
				 }
				else
				 {if (FLA&0x0001) PSW_CC=3;
					else            PSW_CC=1;
				 }
