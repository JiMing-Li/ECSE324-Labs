			.text
			.global _start

_start:
			LDR R4, =RESULT		//R4 points to the result location
			LDR R2, [R4]		//R2 holds the number of elements in the list
			MOV R3, #0		//reset to 0
			ADD R3, R4, #4		//R3 points to the first number
			LDR R0, [R3]		//R0 holds the first number in the list, for max

LOOP:		SUBS R2, R2, #1		//decrement the loop counter
			BEQ DONE		//end loop if counter has reached 0
			ADD R3, R3, #4		//R3 points to next number in the list
			LDR R1, [R3]		//R1 holds the next number in the list
			ADD R0, R1, R0		//partial average
			B LOOP			//branch back to the loop

			
DONE:		LDR R2, [R4]		//R2 holds the number of elements in the list
			
LOOPAVG:	ASR R2, R2, #1		//divide by 2, so right shift by 2
			SUBS R2, R2, #0		
			BEQ DONEAVG		//end loop if counter has reached 0
			ASR R0, R0, #1		//divide by 2, so right shift by 2
			B LOOPAVG		//branch back to the loop

DONEAVG:	LDR R2, [R4]		//R2 holds the number of elements in the list
			MOV R3, R4		//R3 holds the data of R4

LOOPSUB:	SUBS R2, R2, #1		//decrement the loop counter
			BEQ END			//end loop if counter has reached 0
			ADD R3, R3, #4		//R3 points to next number in the list
			LDR R1, [R3]		//R1 holds the next number in the list
			SUBS R1, R1, R0		//partial average memory
			STR R1, [R3]		//store value in memory
			B LOOPSUB		//branch back to the loop			

END: 		B END			//infinite loop, end of program

RESULT:		.word 8			//number of entries in the list
			.word -4, -3, -3, -6	//the list data
			.word -1, -9, -2, -5	//the list data(continue..)
