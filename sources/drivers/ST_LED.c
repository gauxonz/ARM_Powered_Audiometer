//LED_02.c wmh 2013-03-18 : rewrite ST LED routines to use assembly functions
//LED_01.c wmh 2013-02-03 : fixups to allow compiling in gcc
/*----------------------------------------------------------------------------
 * Name:    LED.c
 * Purpose: low level LED functions
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

 //!!added stuff to get it to compile
#include <stdint.h>					//various versions of this in yagarto -- gives unint32_t and other definitions	
#include "STM32F4xx.h"
#include "ST_LED.h"

const unsigned long led_mask[] = {1UL << 12, 1UL << 13, 1UL << 14, 1UL << 15};

/*----------------------------------------------------------------------------
  initialize LED Pins
 *----------------------------------------------------------------------------*/
void LED_Init (void) {

  RCC->AHB1ENR  |= ((1UL <<  3) );         /* Enable GPIOD clock                */

  GPIOD->MODER    &= ~((3UL << 2*12) |
                       (3UL << 2*13) |
                       (3UL << 2*14) |
                       (3UL << 2*15)  );   /* PD.12..15 is output               */
  GPIOD->MODER    |=  ((1UL << 2*12) |
                       (1UL << 2*13) | 
                       (1UL << 2*14) | 
                       (1UL << 2*15)  ); 
  GPIOD->OTYPER   &= ~((1UL <<   12) |
                       (1UL <<   13) |
                       (1UL <<   14) |
                       (1UL <<   15)  );   /* PD.12..15 is output Push-Pull     */
  GPIOD->OSPEEDR  &= ~((3UL << 2*12) |
                       (3UL << 2*13) |
                       (3UL << 2*14) |
                       (3UL << 2*15)  );   /* PD.12..15 is 50MHz Fast Speed     */
  GPIOD->OSPEEDR  |=  ((2UL << 2*12) |
                       (2UL << 2*13) | 
                       (2UL << 2*14) | 
                       (2UL << 2*15)  ); 
  GPIOD->PUPDR    &= ~((3UL << 2*12) |
                       (3UL << 2*13) |
                       (3UL << 2*14) |
                       (3UL << 2*15)  );   /* PD.12..15 is Pull up              */
  GPIOD->PUPDR    |=  ((1UL << 2*12) |
                       (1UL << 2*13) | 
                       (1UL << 2*14) | 
                       (1UL << 2*15)  ); 
}

/*----------------------------------------------------------------------------
  Function that turns on requested LED
 *----------------------------------------------------------------------------*/

 //defined in STM32F4_P24v04IO_02.asm
 void ST_LED0_On(void);
 void ST_LED1_On(void);
 void ST_LED2_On(void);
 void ST_LED3_On(void);
 void ST_LED0_Off(void);
 void ST_LED1_Off(void);
 void ST_LED2_Off(void);
 void ST_LED3_Off(void);
 
 
 void LED_On (unsigned int num) {
//original version
//  if (num < LED_NUM) {
//    GPIOD->BSRRL = led_mask[num];
//	}

//new version using asm and macros
	switch(num) {
		case 0: ST_LED0_On(); break;
		case 1: ST_LED1_On(); break;
		case 2: ST_LED2_On(); break;
		case 3: ST_LED3_On(); break;
		default: ;
	}
}

/*----------------------------------------------------------------------------
  Function that turns off requested LED
 *----------------------------------------------------------------------------*/
void LED_Off (unsigned int num) {
//original version
//  if (num < LED_NUM) {
//    GPIOD->BSRRH = led_mask[num];
//  }

//new version using asm and macros
	switch(num) {
		case 0: ST_LED0_Off(); break;
		case 1: ST_LED1_Off(); break;
		case 2: ST_LED2_Off(); break;
		case 3: ST_LED3_Off(); break;
		default: ;
	}
}

/*----------------------------------------------------------------------------
  Function that outputs value to LEDs
 *----------------------------------------------------------------------------*/
void LED_Out(unsigned int value) {
  int i;

  for (i = 0; i < LED_NUM; i++) {
    if (value & (1<<i)) {
      LED_On (i);
    } else {
      LED_Off(i);
    }
  }
}
