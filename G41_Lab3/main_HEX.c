#include <stdio.h>

#include "./drivers/inc/pushbuttons.h"
#include "./drivers/inc/HEX_displays.h"
#include "./drivers/inc/slider_switches.h"

int main(){
	
	while(1){
		int switches = read_slider_switches_ASM();
		

		
		
		switches = switches % 1025;
		int mod = switches % 16;

		
		//get value from push buttons
		HEX_write_ASM(read_PB_data_ASM(), mod);
		
		//flood the last 2
		if(switches > 512)
			HEX_clear_ASM( HEX0 | HEX1 | HEX2 | HEX3 | HEX4 | HEX5);
		else 
		HEX_flood_ASM( HEX4 | HEX5);
		
		
	}
	return 0;
}