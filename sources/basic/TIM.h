#include <stdint.h> 
#ifndef _TIM_H
#define _TIM_H

extern void TIM2_Init(void);
extern void TIM2_Config(unsigned int psc, unsigned int arr);
extern void TIM2_Start(void);

#endif