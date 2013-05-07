/*----------------------------------------------------------------------------
 * Name:    ST_P24_SWITCH.h
 * Purpose: low level switch definitions
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
#ifndef __ST_P24_SWITCH
#define __ST_P24_SWITCH

extern void ST_P24SWITCH_init(void); //initialize ST32F4 pins controlling switches
extern int ST_P24_GetSwitch(int num);		 //return sampled value of switch
#endif