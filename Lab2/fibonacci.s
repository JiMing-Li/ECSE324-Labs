				.text
				.global _start

_start:			
				LDR R0, N
				BL FIBONACCI
				POP {R4}
				
stop:			B stop

FIBONACCI:		PUSH {LR}
				CMP R0, #2
				BLE LESSTHAN2
				SUB R0, R0, #1		//n-1

				BL FIBONACCI			//push R0

				SUB R0, R1, #1		//n-2
				BL FIBONACCI
				//POP {LR}
				POP {R4-R5}
				ADD R4, R4, R5
				POP {LR}	//R0 contains result of fib(n-2) + R2
				PUSH {R4}
				BX LR
				
LESSTHAN2:		MOV R3, #1
				PUSH {R3}
				BX LR

N:				.word 5
