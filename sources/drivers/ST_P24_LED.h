/*----------------------------------------------------------------------------
 * Name:    ST_LED.h
 * Purpose: low level LED definitions
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
#include "..\basic\GPIO.h"
#ifndef __ST_P24_LED_H
#define __ST_P24_LED_H

/* LED Definitions */
#define LED_NUM     4                        /* Number of user LEDs          */
extern void ST_P24_LED_Init(void);	//In LED.asm, done by asm.
//extern void ST_P24_LED_On_G  (unsigned int num);
void ST_P24_LED_On_G  (unsigned int num)
{
	
}
extern void ST_P24_LED_On_R  (unsigned int num);
extern void ST_P24_LED_Off (unsigned int num);

#endif
