			.text
			.global MAX_2

MAX_2:
			CMP R0,R2
			BXGE LR
			MOV R0, R2
			BX LR
			.end	
