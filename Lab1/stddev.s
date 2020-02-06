			.text
			.global _start

_start:
			LDR R4, =RESULT		//R4 points to the result location
			LDR R2, [R4, #4]	//R2 holds the number of elements in the list
			ADD R3, R4, #8		//R3 points to the first number
			LDR R0, [R3]		//R0 holds the first number in the list, for max
			LDR R5, [R3]		//R5 holds the first number, for min

LOOP:		SUBS R2, R2, #1		//decrement the loop counter
			BEQ DONE		//end loop if counter has reached 0
			ADD R3, R3, #4		//R3 points to next number in the list
			LDR R1, [R3]		//R1 holds the next number in the list
			CMP R0, R1		//check if it is greater than the maximum
			BGE MIN			//if no, go to min
			MOV R0, R1		//if yes, update the current max, then go to min

MIN:		CMP R5, R1		//check 
			BLE LOOP		//if no, go to loop 
			MOV R5, R1		//if yes, update the current min
			B LOOP			//branch back to the loop

DONE:		SUBS R5, R0, R5		//subtract max - min, store in R0
			ASR R0, R5, #2		//right shift by 2, so divide by 4
			STR R0, [R4]		//store the result to the memory location

END: 		B END			//infinite loop, end of program

RESULT:		.word 0			//memory assigned for max result location
			.word 7			//number of entries in the list
			.word -4, -5, -3, -6	//the list data
			.word -1, -9, -2		//the list data(continue..)
