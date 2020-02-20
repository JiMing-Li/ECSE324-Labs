				.text
				.global _start

_start:
				LDR R4,  = RESULT
				LDR R1, [R4, #4]
				ADD R2, R4, #8
				LDR R0, [R2]
				BL LOOP
	
LOOP:			SUBS R1, R1, #1			//decrement loop counter
				BEQ DONE				//end loop if counter has reached 0
				ADD R2, R2, #4			//R3 points to the next number in the list
				LDR R5, [R2]			//R1 holds the next number in the list
				CMP R0, R5				//check if it's greater than the maximum
				BGE LOOP				//if no, brach back to loop
				MOV R0, R5 				//if yes, update the current max
				B LOOP					//branch back to the loop

DONE:			STR R0, [R4]		//store the result to the memory location

END:			B END					// infinite loop

RESULT:			.word 0			//store result
			.word 8			//number in list
			.word 1, 2, 3, 4	//list
			.word 8, 7, 6, 5
