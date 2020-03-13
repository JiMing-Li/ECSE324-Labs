#include <stdio.h>

#include "./drivers/inc/LEDs.h"
#include "./drivers/inc/slider_switches.h"

int main(){
	while(1){
		read_slider_switches_ASM();

	}
	return 0;
}