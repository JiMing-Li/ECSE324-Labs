			.text
			.global _start

_start:
			LDR R4, =RESULT		//R4 points to the result location
			LDR R2, [R4]		//R2 holds the number of elements in the list
			MOV R3, #0		//reset to 0
			ADD R3, R4, #4		//R3 points to the first number
			LDR R0, [R3]		//R0 holds the first number in the list
			MOV R6, R2		//R6 holds data of R2, R6 is how many iterations in a cycle, it goes from the length of array to 0


LOOP:		SUBS R2, R2, #1		//decrement the loop counter
			BEQ DONE		//end loop if counter has reached 0
			ADD R3, R3, #4		//R3 points to next number in the list
			LDR R1, [R3]		//R1 holds the next number in the list
			CMP R1, R0		//check if it is greater than the maximum
			BGE LOOPEQUAL		//if no, go to loop
			STR R0, [R3]		//store R0 in the location R3 is pointing to
			SUBS R3, R3, #4		//R3 points to A i-1
			STR R1, [R3]		//store R1 in the location R3 is point to
			ADD R3, R3, #4		//R3 points to next number in the list
			B LOOP			//branch back to the loop

LOOPEQUAL:	MOV R0, R1		//R0 holds data of R1
			B LOOP			//branch back to the loop

DONE:		ADD R3, R4, #4		//R3 points to the first number
			LDR R0, [R3]		//R0 holds the first number in the list
			MOV R2, R6		//R2 holds data of R6
			SUBS R6, R6, #1		//decrement the counter
			BEQ END			//end loop if counter has reached 0
			B LOOP			//branch back to the loop

END: 		B END			//infinite loop, end of program


RESULT:		.word 8			//number of entries in the list
			.word -1, 7, 3, 12	//the list data
			.word 1, 9, 2, -5	//the list data(continue..)
