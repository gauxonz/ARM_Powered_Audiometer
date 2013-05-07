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
#include "ST_P24_DISPLAY.h"

void ST_P24_Display_On(void)
{
  Set_PortA_Bit(6,0);
  Set_PortC_Bit(1,0);	
}

//extern void  ST_P24_Display_Off(void);
void  ST_P24_Display_Off(void)
{
  Set_PortA_Bit(6,1);
  Set_PortC_Bit(1,1);
}
//extern void  ST_P24_Display_SetChar(char);
//extern void  ST_P24_Display_SlctSeg(unsigned int);


