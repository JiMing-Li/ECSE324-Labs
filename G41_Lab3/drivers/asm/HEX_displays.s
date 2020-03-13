				.text
				.equ HEX_BASE, 0xFF200020
				.global HEX_clear_ASM
				.global HEX_flood_ASM
				.global HEX_write_ASM

HEX_clear_ASM:		
				MOV R2, #5  						//there are 6 hex
				MOV R3, #1							//R3 store the digit to compare digit
				LDR R1, =HEX_BASE
				LDR R5, [R1]
				MOV R6, #127 						// HEX 0
				
CLEAR_LOOP_ONE:	
						
				SUBS R2, R2, #1     				//loop through array, from 4 to 0
				BEQ CLEAR_INIT_TWO
				TST R0, R3							//R2 store the same value as digit
				BEQ CLEAR_LOOP_ONE_SHIFT			//if R2 is 0, turn do nothing go back to loop
				BIC R5, R5, R6						//if R2 is not 0, flood the hex
				B CLEAR_LOOP_ONE_SHIFT
				
CLEAR_LOOP_ONE_SHIFT:
				LSL R6, R6, #8						//shift R6 by 8
				LSL R3, R3, #1						//shift R3 by 1
				B CLEAR_LOOP_ONE
			
CLEAR_INIT_TWO:
				STR R5, [R1]
				MOV R2, #3
				LDR R5, [R1, #16]
				MOV R6, #127 						// HEX 4
				
CLEAR_LOOP_TWO:	
				SUBS R2, R2, #1						//loop through array, from 4 TO 0
				BEQ CLEAR_END
				TST R0, R3					//R2 store the same value as digit.
				BEQ CLEAR_LOOP_TWO_SHIFT			//if R2 is 0, turn do nothing go back to loop
				BIC R5, R5, R6					//if R2 is not 0, flood the hex
				B CLEAR_LOOP_TWO_SHIFT

CLEAR_LOOP_TWO_SHIFT:
				LSL R6, R6, #8						//shift R6 by 8
				LSL R3, R3, #1						//shift R3 by 1
				B CLEAR_LOOP_TWO
				
CLEAR_END:	
				STR R5, [R1, #16]
				BX LR
				
HEX_flood_ASM:
				MOV R2, #5  						//there are 6 hex
				MOV R3, #1							//R3 store the digit to compare digit
				LDR R1, =HEX_BASE
				LDR R5, [R1]
				MOV R6, #127 						// HEX 0
				
FLOOD_LOOP_ONE:	
						
				SUBS R2, R2, #1     				//loop through array, from 4 to 0
				BEQ FLOOD_INIT_TWO
				TST R0, R3							//R2 store the same value as digit
				BEQ FLOOD_LOOP_ONE_SHIFT			//if R2 is 0, turn do nothing go back to loop
				ORR R5, R5, R6						//if R2 is not 0, flood the hex
				B FLOOD_LOOP_ONE_SHIFT
				
FLOOD_LOOP_ONE_SHIFT:
				LSL R6, R6, #8						//shift R6 by 8
				LSL R3, R3, #1						//shift R3 by 1
				B FLOOD_LOOP_ONE
			
FLOOD_INIT_TWO:
				STR R5, [R1]
				MOV R2, #3
				LDR R5, [R1, #16]
				MOV R6, #127 						// HEX 4
				
FLOOD_LOOP_TWO:	
				SUBS R2, R2, #1						//loop through array, from 4 TO 0
				BEQ FLOOD_END
				TST R0, R3					//R2 store the same value as digit.
				BEQ FLOOD_LOOP_TWO_SHIFT			//if R2 is 0, turn do nothing go back to loop
				ORR R5, R5, R6						//if R2 is not 0, flood the hex
				B FLOOD_LOOP_TWO_SHIFT

FLOOD_LOOP_TWO_SHIFT:
				LSL R6, R6, #8						//shift R6 by 8
				LSL R3, R3, #1						//shift R3 by 1
				B FLOOD_LOOP_TWO
				
FLOOD_END:	
				STR R5, [R1, #16]
				BX LR
				
HEX_write_ASM:
				
				MOV R2, #5  						//there are 6 hex
				MOV R3, #1							//R3 store the digit to compare digit
				LDR R7, =HEX_BASE
				LDR R5, [R7]
				MOV R9, #127
				
WRITE_SET_NUMBER:

				MOV R6, #63							//0
				SUBS R1, R1, #0
				BEQ WRITE_COPY
				MOV R6, #6							//1
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #91							//2
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #79							//3
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #102						//4
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #109						//5
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #125						//6
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #7							//7
				SUBS R1, R1, #1
				BEQ WRITE_COPY			
				MOV R6, #127						//8
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #111						//9
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #119						//A
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #124						//B
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #57							//C
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #94							//D
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #121						//E
				SUBS R1, R1, #1
				BEQ WRITE_COPY
				MOV R6, #113						//F

WRITE_COPY:
				MOV R8, R6
				
WRITE_LOOP_ONE:	
				SUBS R2, R2, #1     				//loop through array, from 4 to 0
				BEQ WRITE_INIT_TWO
				TST R0, R3							//R2 store the same value as digit
				BEQ WRITE_LOOP_ONE_SHIFT			//if R2 is 0, turn do nothing go back to loop
				BIC R5, R5, R9	
				ORR R5, R5, R6						//logic of write
				B WRITE_LOOP_ONE_SHIFT
				
WRITE_LOOP_ONE_SHIFT:
				LSL R6, R6, #8						//shift R6 by 8
				LSL R9, R9, #8						//shift R6 by 8
				LSL R3, R3, #1						//shift R3 by 1
				B WRITE_LOOP_ONE
			
WRITE_INIT_TWO:
				STR R5, [R7]
				MOV R2, #3
				MOV R9, #127
				LDR R5, [R7, #16]
				
WRITE_LOOP_TWO:	
				SUBS R2, R2, #1						//loop through array, from 4 TO 0
				BEQ WRITE_END
				TST R0, R3							//R2 store the same value as digit.
				BEQ WRITE_LOOP_TWO_SHIFT			//if R2 is 0, turn do nothing go back to loop
				BIC R5, R5, R9	
				ORR R5, R5, R8						//if R2 is not 0, flood the hex
				B WRITE_LOOP_TWO_SHIFT

WRITE_LOOP_TWO_SHIFT:
				LSL R8, R8, #8						//shift R6 by 8
				LSL R9, R9, #8						//shift R6 by 8
				LSL R3, R3, #1						//shift R3 by 1
				B WRITE_LOOP_TWO
				
WRITE_END:	
				STR R5, [R7, #16]
				BX LR

				.end
