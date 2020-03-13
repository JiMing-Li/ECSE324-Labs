				.text
				.equ BUTTON_BASE, 0xFF200050
				.equ MASK_BASE, 0xFF200058
				.equ EDGE_BASE, 0xFF20005C
				.global read_PB_data_ASM
				.global PB_data_is_pressed_ASM
				.global read_PB_edgecap_ASM
				.global PB_edgecap_is_pressed_ASM
				.global PB_clear_edgecap_ASM
				.global enable_PB_INT_ASM
				.global disable_PB_INT_ASM

read_PB_data_ASM:
				LDR R1, =BUTTON_BASE
				MOV R2, #15
				LDR R0, [R1]
				AND R0, R0, R2
				BX LR

PB_data_is_pressed_ASM:
				LDR R1, =BUTTON_BASE
				LDR R2, [R1]
				AND R0, R0, R2
				BX LR

read_PB_edgecap_ASM:
				LDR R1, =EDGE_BASE
				MOV R2, #15
				LDR R0, [R1]
				AND R0, R0, R2
				BX LR

PB_edgecap_is_pressed_ASM:
				LDR R1, =EDGE_BASE
				LDR R2, [R1]
				AND R0, R0, R2
				BX LR

PB_clear_edgecap_ASM:
				LDR R1, =EDGE_BASE
				LDR R2, [R1]
				BIC R0, R2, R0
				STR R0, [R1]
				BX LR

enable_PB_INT_ASM:
				LDR R1, =MASK_BASE
				MOV R2, #15
				AND R0, R2, R0
				STR R0, [R1]
				BX LR

disable_PB_INT_ASM:
				LDR R1, =MASK_BASE
				MOV R2, #15
				BIC R0, R0, R2
				STR R0, [R1]
				BX LR

				.end
