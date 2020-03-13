				.text
				.equ HPS_BASE1, 0xFFC08000
				.equ HPS_BASE2, 0xFFC09000
				.equ HPS_BASE3, 0xFFD00000
				.equ HPS_BASE4, 0xFFD01000
				.global HPS_TIM_config_ASM
				.global HPS_TIM_read_INT_ASM
				.global HPS_TIM_clear_INT_ASM

HPS_TIM_config_ASM:
				MOV R2, #1				//R2 store 1 
				LDR R5, [R0]
				TST R2, R5				//branch is is 0 for this clock
				BEQ CONFIG_CLOCK2

				LDR R1, =HPS_BASE1
				MOV R3, #0 				//for E control flag
				STR R3, [R1, #8]  
				MOV R6, #100
				LDR R3, [R0, #4]
				MUL R3, R3, R6
				STR R3, [R1]
				LDR R3, [R0, #12]		//get interrupt bit
				STR R3, [R1, #0x10]
				MOV	R3, #0		
				LDR R4, [R0, #8]	
				ORR R3, R3, R4 			//get manual bit
				LSL R3, R3, #1
				LDR R4, [R0, #16]
				ORR R3, R3, R4			//get enable bit*/
				STR R3, [R1, #8] 		//stroe control register	

CONFIG_CLOCK2:
				LSL R2, R2, #1
				TST R2, R5
				BEQ CONFIG_CLOCK3

				LDR R1, =HPS_BASE2
				MOV R3, #0 				//for E control flag
				STR R3, [R1, #8]  
				MOV R6, #100
				LDR R3, [R0, #4]
				MUL R3, R3, R6
				STR R3, [R1]
				LDR R3, [R0, #12]		//get interrupt bit
				STR R3, [R1, #0x10]
				MOV	R3, #0		
				LDR R4, [R0, #8]	
				ORR R3, R3, R4 			//get manual bit
				LSL R3, R3, #1
				LDR R4, [R0, #16]
				ORR R3, R3, R4			//get enable bit*/
				STR R3, [R1, #8] 		//stroe control register	

CONFIG_CLOCK3:
				LSL R2, R2, #1
				TST R2, R5
				BEQ CONFIG_CLOCK4

				LDR R1, =HPS_BASE3
				MOV R3, #0 				//for E control flag
				STR R3, [R1, #8]  
				MOV R6, #25
				LDR R3, [R0, #4]
				MUL R3, R3, R6
				STR R3, [R1]
				LDR R3, [R0, #12]		//get interrupt bit
				STR R3, [R1, #0x10]
				MOV	R3, #0		
				LDR R4, [R0, #8]	
				ORR R3, R3, R4 			//get manual bit
				LSL R3, R3, #1
				LDR R4, [R0, #16]
				ORR R3, R3, R4			//get enable bit*/
				STR R3, [R1, #8] 		//stroe control register	

CONFIG_CLOCK4:
				LSL R2, R2, #1
				TST R2, R5
				BEQ CONFIG_END

				LDR R1, =HPS_BASE4
				MOV R3, #0 				//for E control flag
				STR R3, [R1, #8]  
				MOV R6, #25
				LDR R3, [R0, #4]
				MUL R3, R3, R6
				STR R3, [R1]
				LDR R3, [R0, #12]		//get interrupt bit
				STR R3, [R1, #0x10]
				MOV	R3, #0		
				LDR R4, [R0, #8]	
				ORR R3, R3, R4 			//get manual bit
				LSL R3, R3, #1
				LDR R4, [R0, #16]
				ORR R3, R3, R4			//get enable bit*/
				STR R3, [R1, #8] 		//stroe control register	

CONFIG_END:
				BX LR

HPS_TIM_read_INT_ASM:
				MOV R3, #0				//R3 store result
				MOV R2, #1				//R2 store 1 
				MOV R5, #1
				TST R2, R0				//branch is is 0 for this clock
				BEQ READ_CLOCK2

				LDR R1, =HPS_BASE1
				LDR R4, [R1, #0x10]
				AND R0, R4, R5
				B READ_END
				
READ_CLOCK2:		
				LSL R2, R2, #1
				TST R2, R0
				BEQ READ_CLOCK3

				LDR R1, =HPS_BASE2
				LDR R4, [R1, #0x10]
				AND R0, R4, R5
				B READ_END

READ_CLOCK3:		
				LSL R2, R2, #1
				TST R2, R0
				BEQ READ_CLOCK4

				LDR R1, =HPS_BASE3
				LDR R4, [R1, #0x10]
				AND R0, R4, R5
				B READ_END

READ_CLOCK4:		
				LSL R2, R2, #1
				TST R2, R0
				BEQ READ_END

				LDR R1, =HPS_BASE4
				LDR R4, [R1, #0x10]
				AND R0, R4, R5
				B READ_END

READ_END:
				BX LR

HPS_TIM_clear_INT_ASM:
				MOV R3, #0				//R3 store 0
				MOV R2, #1				//R2 store 1 
				TST R2, R0				//branch is is 0 for this clock
				BEQ CLEAR_CLOCK2

				LDR R1, =HPS_BASE1
				LDR R4, [R1, #8]
				MOV R5, #1
				BIC R5, R4, R5
				STR R5, [R1, #8]
				STR R3, [R1, #0xC]
				STR R3, [R1, #0x10]
				STR R4, [R1, #8]
				
				
CLEAR_CLOCK2:		
				LSL R2, R2, #1
				TST R2, R0
				BEQ CLEAR_CLOCK3

				LDR R1, =HPS_BASE2
				LDR R4, [R1, #8]
				MOV R5, #1
				BIC R5, R4, R5
				STR R5, [R1, #8]
				STR R3, [R1, #0xC]
				STR R3, [R1, #0x10]
				STR R4, [R1, #8]

CLEAR_CLOCK3:		
				LSL R2, R2, #1
				TST R2, R0
				BEQ CLEAR_CLOCK4

				LDR R1, =HPS_BASE3
				LDR R4, [R1, #8]
				MOV R5, #1
				BIC R5, R4, R5
				STR R5, [R1, #8]
				STR R3, [R1, #0xC]
				STR R3, [R1, #0x10]
				STR R4, [R1, #8]

CLEAR_CLOCK4:		
				LSL R2, R2, #1
				TST R2, R0
				BEQ CLEAR_END

				LDR R1, =HPS_BASE4
				LDR R4, [R1, #8]
				MOV R5, #1
				BIC R5, R4, R5
				STR R5, [R1, #8]
				STR R3, [R1, #0xC]
				STR R3, [R1, #0x10]
				STR R4, [R1, #8]

CLEAR_END:
				BX LR

				.end
