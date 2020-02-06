				.text
				.global _start

_start:
				PUSH R1
				PUSH R2
				PUSH R3
				LDR R0, [R1]
	
LOOP:			SUBS R3, R3, #1			//decrement loop counter
				BEQ DONE				//end loop if counter has reached 0
				ADD R3, R3, #4			//R3 points to the next number in the list
				LDR R2, [R3]			//R1 holds the next number in the list
				CMP R0, R2				//check if it's greater than the maximum
				BGE LOOP				//if no, brach back to loop
				MOV R0, R2 				//if yes, update the current max
				B LOOP					//branch back to the loop

DONE:			POP {R3-R0}
				BX LR			//store the result to the memory location

END:			B END					// infinite loop

