				.text
				.global _start

_start:		LDR R4, =NUMBER		//address of array
				SUB R4, R4, #4		//fun stuff
				LDR R5, N			//R5 for length of array

LOOP:			SUBS R5, R5, #1		//loop through array
				BLT MULTIPOP		//if R5 < 0, go to MULTIPOP
				ADD R4, R4, #4		//R4 points to the next number in the list
				LDR R0, [R4]		//load next number in R0
				B PUSH				//go to push


PUSH:			STR R0, [SP, #-4]!	//push
				B LOOP				//go back to loop

MULTIPOP:		LDMIA SP!, {R0-R2}	//pop

END:			B END					// infinite loop

NUMBER:		.word 4, 5, 6		//the list data
N:				.word 3
