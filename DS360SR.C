//				SET_CC_BY_SIGN(R[R1]);
				FLA=_FLAGS;
				if (FLA&0x0040)  /*==0*/   PSW_CC=0;
				else
				 {if (FLA&0x0080) /*<0*/   PSW_CC=1;
					else            /*>0*/   PSW_CC=2;
				 }
				if (FLA&0x0800)   /* PEREPOLNENIE*/
					 {PSW_CC=3;
						//T();
						if (PSW_PRG_MASK&0x8) {RQ_PRG=0x0008;RETURN=1;printf("PRG!!!");}
					 }

