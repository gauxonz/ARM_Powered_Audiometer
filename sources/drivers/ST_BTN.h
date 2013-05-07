/*----------------------------------------------------------------------------
 * Name:    ST_BTN.h
 * Purpose: low level on-board botton definitions
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
#ifndef __ST_BTN_H
#define __ST_BTN_H


extern void ST_BTN_init(void);	//initialize onboard LEDs of ST32F4DISCOVERY board
extern uint32_t ST_BTN_Get(void);	//read onboard button of ST32F4DISCOVERY board
#endif