#include <stdio.h>

#include "./drivers/inc/int_setup.h"
#include "./drivers/inc/ISRs.h"
#include "./drivers/inc/HEX_displays.h"
#include "./drivers/inc/HPS_TIM.h"
#include "./drivers/inc/pushbuttons.h"


int main(){

	int_setup(2, (int[]){73, 199});
	int count10MS = 0, countS = 0, countM = 0;

	HPS_TIM_config_t hps_tim;
	HPS_TIM_config_t hps_edge;

	hps_tim.tim = TIM0;
	hps_tim.timeout = 10000;
	hps_tim.LD_en = 1;
	hps_tim.INT_en = 1;
	hps_tim.enable = 0;

	hps_edge.tim = TIM2;
	hps_edge.timeout = 5000;
	hps_edge.LD_en = 1;
	hps_edge.INT_en = 1;
	hps_edge.enable = 0;

	int option = -1;
	

	HPS_TIM_config_ASM(&hps_tim);
	HPS_TIM_config_ASM(&hps_edge);

	while(1){
		if(PB_data_is_pressed_ASM(PB0)){
			hps_edge.enable = 1;
			HPS_TIM_config_ASM(&hps_edge);
			option = 0;
		}
		if(PB_data_is_pressed_ASM(PB1)){
		hps_edge.enable = 1;
		HPS_TIM_config_ASM(&hps_edge);
		option = 1;
		}
		if(PB_data_is_pressed_ASM(PB2)){
		hps_edge.enable = 1;
		HPS_TIM_config_ASM(&hps_edge);
		option = 2;
		}
		if(HPS_TIM_read_INT_ASM(TIM2)){
			HPS_TIM_clear_INT_ASM(TIM2);
			hps_edge.enable = 0;
			HPS_TIM_config_ASM(&hps_edge);
			switch(option){
				case 0:
					hps_tim.enable = 1;
					HPS_TIM_config_ASM(&hps_tim);
					break;
				case 1:
					hps_tim.enable = 0;
					HPS_TIM_config_ASM(&hps_tim);
					break;
				case 2:		
					count10MS = 0;
					countS = 0;
					countM = 0;
					HEX_write_ASM( HEX0 | HEX1 | HEX2 | HEX3 | HEX4| HEX5, 0);
					break;

			}
		}

				if(hps_tim0_int_flag) {
			hps_tim0_int_flag = 0;
				if(++count10MS == 100){
					count10MS = 0;
					++countS;
				}
				if(countS == 60){
					countS = 0;
					++countM;
				}
				if(countM == 60){
					countM = 0;
				}
			HEX_write_ASM(HEX0, count10MS % 10);
			HEX_write_ASM(HEX1, count10MS / 10);
			HEX_write_ASM(HEX2, countS % 10);
			HEX_write_ASM(HEX3, countS / 10);
			HEX_write_ASM(HEX4, countM % 10);
			HEX_write_ASM(HEX5, countM / 10);
		}
	}
	return 0;
}
