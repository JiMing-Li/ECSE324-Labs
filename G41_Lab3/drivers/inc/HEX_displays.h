#ifndef __HEX_DISPLAYS
#define __HEX_DISPLAYS

	typedef enum {
		HEX0 = 0x00000001, //00 0001
		HEX1 = 0x00000002, //00 0010
		HEX2 = 0x00000004, //00 0100
		HEX3 = 0x00000008, //00 1000
		HEX4 = 0x00000010, //01 0000
		HEX5 = 0x00000020  //10 0000
	} HEX_t;
	
	extern void HEX_clear_ASM(HEX_t hex);
	extern void HEX_flood_ASM(HEX_t hex);
	extern void HEX_write_ASM(HEX_t hex, char val);
	
#endif
