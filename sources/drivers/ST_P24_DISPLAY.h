/*----------------------------------------------------------------------------
 * Name:    ST_SEG.h
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
#ifndef __ST_P24_DISPLAY_H
#define __ST_P24_DISPLAY_H


extern void ST_P24_DisplayIni(void);	//initialize ST32F4 pins controlling P24 display pins


extern void  ST_P24_Display_On(void);
extern void  ST_P24_Display_Off(void);

extern void  ST_P24_Display_SetChar(unsigned int);
extern void  ST_P24_Display_SlctSeg(unsigned int);
//extern void ST_P24_DisplayUpdate(char* DispContants);
void ST_P24_DisplayUpdate(unsigned int* DispContants)
{
	static unsigned int refreshcount=0;					//number of display refresh events
	ST_P24_Display_Off();									//hide changover
	ST_P24_Display_SetChar( DispContants[refreshcount & 0x03]);		//print contents of digitvals[]
	ST_P24_Display_SlctSeg(refreshcount & 0x03);			//in digits positions 1-2-3-4
	ST_P24_Display_On();									//lights back on
	refreshcount++;	
}

#endif
