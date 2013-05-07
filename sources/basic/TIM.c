#include <stdint.h>
#include "TIM.h" 
#include "system_stm32f4xx.h"
#include "stm32f4xx.h"
#include "core_cm4.h"
void TIM2_Init(void)
{ 
	RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;                 // Enable TIM2 clock
}
void TIM2_Config(unsigned int psc, unsigned int arr)
{	
    TIM2->PSC = psc;                                  // Set prescaler to 41999
    TIM2->ARR = arr;                                   // Set auto-reload to 5999
    //TIM2->CR1 |= TIM_CR1_OPM;                           // One pulse mode	
}
void TIM2_Start(void){	
    TIM2->EGR |= TIM_EGR_UG;                            // Force update
    TIM2->SR &= ~TIM_SR_UIF;                            // Clear the update flag
    TIM2->DIER |= TIM_DIER_UIE;                         // Enable interrupt on update event
    NVIC_EnableIRQ(TIM2_IRQn);                      // Enable TIM2 IRQ
    TIM2->CR1 |= TIM_CR1_CEN;                           // Enable TIM2 counter
	}
