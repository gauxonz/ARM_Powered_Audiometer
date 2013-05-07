//STM32F4main04.c wmh 2013-03-20 : adds P24v04 switch inputs to ST32F4
//STM32F4main03.c wmh 2013-03-18 : extending IO functions to P24v04 -- display output first
//STM32F4main02.c wmh 2013-03-16 : moving functions over to assembly
//STM32F4main01.c wmh 2013-02-02 : trying to get a barebones 'main()' to compile
/*----------------------------------------------------------------------------
 * Name:    Blinky.c
 * Purpose: LED Flasher
 * Note(s): 
 *----------------------------------------------------------------------------
 * This file is part of the uVision/ARM development tools.
 * This software may only be used under the terms of a valid, current,
 * end user licence from KEIL for a compatible version of KEIL software
 * development tools. Nothing else gives you the right to use this software.
 *
 * This software is supplied "AS IS" without warranties of any kind.
 *
 * Copyright (c) 2011 Keil - An ARM Company. All rights reserved.
 *----------------------------------------------------------------------------*/

//global variables used in CortexM4asmOps_01.asm but defined here

	
//!!added stuff to get it to compile
#include <stdint.h>	//various versions of this in yagarto -- gives unint32_t and other definitions
#include ".\basic\system_stm32f4xx.h"
#include ".\basic\stm32f4xx.h"
#include ".\basic\core_cm4.h"
#include ".\basic\GPIO.h"
#include ".\basic\TIM.h"

#include ".\drivers\ST_LED.h"
#include ".\drivers\ST_BTN.h"
#include ".\drivers\ST_P24_SWITCH.h"
#include ".\drivers\ST_P24_DISPLAY.h"
#include ".\drivers\ST_P24_LED.h"


extern uint32_t SystemCoreClock;
volatile uint32_t msTicks;                    //counts 1ms timeTicks 
unsigned int* DispContants;
unsigned int freq_arr[4]={0,1,2,5};



/*----------------------------------------------------------------------------
  SysTick_Handler
 *----------------------------------------------------------------------------*/
void SysTick_Handler(void) {
  msTicks++;
  //if(msTicks==20){ST_P24_DisplayUpdate(DispContants);msTicks=0;}
  }
  
 void TIM2_IRQHandler() {
	
    if(TIM2->SR & TIM_SR_UIF != 0)                      // If update flag is set
	{
        GPIOD->BSRRL = GPIO_BSRR_BS_15;                 // Set D15 high
		ST_P24_DisplayUpdate(DispContants);
	}
    TIM2->SR &= ~TIM_SR_UIF;                            // Interrupt has been handled
}
/*----------------------------------------------------------------------------
  delays number of tick Systicks (happens every 1 ms)
 *----------------------------------------------------------------------------*/
void Delay (uint32_t dlyTicks) {                                              
  uint32_t curTicks;
  curTicks = 0x12345;
  while(curTicks-- > 0);
  return;
}


void Conver_Int2Array(int in, unsigned int* arr)
{
	for(int i=3;i>=0;i--)
	{
	arr[i] = in%10;
	in/=10;
	}
}
/*----------------------------------------------------------------------------
  MAIN function
 *----------------------------------------------------------------------------*/
int main (void) {
 int32_t num = -1; 
 int32_t dir =  1;
 uint32_t btns = 0;
 unsigned int freq=125;

 int i;
  SystemCoreClock = 168000000; 	//!!found in system_stm32f4xx.c, added here instead of as global
							   //because we're trying to avoid need to have crt0.o
  SystemCoreClockUpdate();                      /* Get Core Clock Frequency   */
  if (SysTick_Config(SystemCoreClock / 1000)) 
  { /* SysTick 1 msec interrupts  */
    while (1);                                  /* Capture error              */
  }
 


	ST_LED_init(); 								//initialize onboard LEDs of ST32F4DISCOVERY board
	ST_BTN_init();								//initialize onboard switches of ST32F4DISCOVERY board
	ST_P24SWITCH_init(); 							//initialize ST32F4 pins controlling switches
	ST_P24_DisplayIni();							//initialize ST32F4 output pins controlling P24 display pins
	ST_P24_Display_SetChar(31);
	ST_P24_Display_SlctSeg(5);
										//enable output drive of P24 anode, cathode latches
	DispContants[0]=DispContants[1]=DispContants[2]=DispContants[3]=31;
	ST_P24_Display_On();	
	
	
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;                // Enable GPIOD clock
    GPIOD->MODER |= GPIO_MODER_MODER15_0;               // Enable output mode for D15


	TIM2_Init();
	TIM2_Config(16,1000);
	TIM2_Start();
	
	
  while(1) {                                    // Loop forever               
	
	
	for(i=1;i<=12;i++) {
		Conver_Int2Array(freq,freq_arr);
		if(ST_P24_GetSwitch(i)==0) 
		{ //switch i is pressed
			Delay(5);
			if(ST_P24_GetSwitch(i)==0) 
			{
			switch(i)
			{
				case 1:
					(freq_arr[0]<9)?(freq+=1000):(freq-=9000);
				break;
				case 2:
					(freq_arr[0]<1)?(freq+=9000):(freq-=1000);
				break;
				case 3:
					(freq_arr[1]<9)?(freq+=100):(freq-=900);
				break;
				case 4:
					(freq_arr[1]<1)?(freq+=900):(freq-=100);
				break;
				case 5:
					(freq_arr[2]<9)?(freq+=10):(freq-=90);
				break;
				case 6:
					(freq_arr[2]<1)?(freq+=90):(freq-=10);
				break;
				case 7:
					(freq_arr[3]<9)?(freq+=1):(freq-=9);
				break;
				case 8:
					(freq_arr[3]<1)?(freq+=9):(freq-=1);
				break;
				case 9:
					freq=125;
					
				break;
				case 10:
				break;
				case 11:
				break;
				case 12:
				break;
				default:	
				freq=125;
				break;
			}
			}
			
		}
	DispContants=freq_arr;
	}

	
	
//ST_P24_LED_On_G(1);
//					Set_PortC_Bit(3,1);
	//				Set_PortC_Bit(5,0);
		//			Set_PortC_Bit(5,1);
/*	
	Set_PortC_MODER(0,1)
	Set_PortC_MODER(1,0)
	Set_PortC_MODER(4,1)
	Set_PortC_MODER(5,0)
*/	
					//ST_P24_Display_Off();	
					//ST_P24_DisplayIni();
					
					//Set_PortC_Bit(3,0);
					//Set_PortC_Bit(5,0);
					//Set_PortC_Bit(5,1);
					
					
					//ST_P24_Display_On();	
//	DWrite_PortC(2,0);
     
/**/
/*
		btns = ST_BTN_Get();                      // Read button states 
		if (btns != (1UL << 0)) { // Calculate 'num': 0,1,...,LED_NUM-1,LED_NUM-1,...,1,0,0,...  

			num += dir;
			if (num == LED_NUM) { dir = -1; num =  LED_NUM-1; } 
			else if   (num < 0) { dir =  1; num =  0;         }

			LED_On (num);
			Delay( 50);                               // Delay 50ms                 
			LED_Off(num);
			Delay(200); 
			// Delay 200ms            
		}
		else {
			LED_Out (0x0F);
			Delay(10);                                // Delay 10ms               
		}
/**/
  }
}
