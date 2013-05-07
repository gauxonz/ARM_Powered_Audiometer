/*----------------------------------------------------------------------------
 * Name:    GPIO.h
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
#include <stdint.h>
#ifndef __GPIO_H
#define __GPIO_H

// 2bit & word access, depend on first parameter
// if first para <16, set 2bits, parameter2 is the val, 
// else if set word
extern void Set_PortA_MODER(uint32_t, uint32_t);
extern void Set_PortB_MODER(uint32_t, uint32_t);
extern void Set_PortC_MODER(uint32_t, uint32_t);
extern void Set_PortD_MODER(uint32_t, uint32_t);

// bit & word access, depend on first parameter
// if first para <16, set 2bits, parameter2 is the val, 
// else if set word
extern void Set_PortA_OTYPER(uint32_t, uint32_t);
extern void Set_PortB_OTYPER(uint32_t, uint32_t);
extern void Set_PortC_OTYPER(uint32_t, uint32_t);
extern void Set_PortD_OTYPER(uint32_t, uint32_t);

// 2bit & word access, depend on first parameter
// if first para <16, set 2bits, parameter2 is the val, 
// else if set word
extern void Set_PortA_OSPEEDER(uint32_t, uint32_t);
extern void Set_PortB_OSPEEDER(uint32_t, uint32_t);
extern void Set_PortC_OSPEEDER(uint32_t, uint32_t);
extern void Set_PortD_OSPEEDER(uint32_t, uint32_t);

// 2bit & word access, depend on first parameter
// if first para <16, set 2bits, parameter2 is the val, 
// else if set word
extern void Set_PortA_PUPDR(uint32_t, uint32_t);
extern void Set_PortB_PUPDR(uint32_t, uint32_t);
extern void Set_PortC_PUPDR(uint32_t, uint32_t);
extern void Set_PortD_PUPDR(uint32_t, uint32_t);


// bit & word access, length 16 bits, depend on first parameter
// if first para <16, set bit, parameter2 is the val, 
// else if set word
extern void Set_PortA_ODR(uint32_t, uint32_t);
extern void Set_PortB_ODR(uint32_t, uint32_t);
extern void Set_PortC_ODR(uint32_t, uint32_t);
extern void Set_PortD_ODR(uint32_t, uint32_t);

// Function for set output val
// bit & word access, depend on first parameter
// if first para <16, set bits, parameter2 is the val(0 off / 1 on), 
// else if set word
extern void Set_PortA_Bit(uint32_t, uint32_t);
extern void Set_PortB_Bit(uint32_t, uint32_t);
extern void Set_PortC_Bit(uint32_t, uint32_t);
extern void Set_PortD_Bit(uint32_t, uint32_t);


//	This bit can be read any time. It can only be modified using the lock key write sequence.
//	0: Port configuration lock key not active
//	1: Port configuration lock key active. The GPIOx_LCKR register is locked until an MCU reset occurs.
//	LOCK key write sequence:
//	WR LCKR[16] = ¡®1¡¯ + LCKR[15:0]
//	WR LCKR[16] = ¡®0¡¯ + LCKR[15:0]
//	WR LCKR[16] = ¡®1¡¯ + LCKR[15:0]
//	RD LCKR
//	RD LCKR[16] = ¡®1¡¯ (this read operation is optional but it confirms that the lock is active)
//	Note: During the LOCK key write sequence, the value of LCK[15:0] must not change. Any error in the lock sequence aborts the lock.
//	After the first lock sequence on any bit of the port, any read access on the LCKK bit will return ¡®1¡¯ until the next CPU reset.

//	LCKy:Portxlockbity(y=0..15)
//	These bits are read/write but can only be written when the LCKK bit is ¡®0.
//	0: Port configuration not locked 1: Port configuration locked	

// bit & word access, length 17 bits, depend on first parameter
// if first para <16, set bit, parameter2 is the val, 
// else if set word                       
extern void Set_PortA_LCKR(uint32_t, uint32_t);
extern void Set_PortB_LCKR(uint32_t, uint32_t);
extern void Set_PortC_LCKR(uint32_t, uint32_t);
extern void Set_PortD_LCKR(uint32_t, uint32_t);

// Functoins to select function,
// byte and word access, length 1word*2, depend on first parameter
// if first para <16, set bit, parameter2 is the val, 
// else if = 16 , set low word
// else if = 17 , set high word  	                      
extern void Set_PortA_AFR(uint32_t, uint32_t);
extern void Set_PortB_AFR(uint32_t, uint32_t);
extern void Set_PortC_AFR(uint32_t, uint32_t);
extern void Set_PortD_AFR(uint32_t, uint32_t);

 
 
// bit & word access, depend on parameter
// if first para <16, return bit, 
// else return word
extern uint32_t Get_PortA_Bit(uint32_t);
extern uint32_t Get_PortB_Bit(uint32_t);
extern uint32_t Get_PortC_Bit(uint32_t);
extern uint32_t Get_PortD_Bit(uint32_t);

#endif