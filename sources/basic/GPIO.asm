.syntax unified	@;to allow thumb-2 instruction set
.thumb						@; Use thmb instructions only
.data
.bss


@; add "MY_" at beginning to avoid conflicting with stm32f4xx.h 

.include "./stm32f4xx_RegDef.h"
	

.macro SetVal_2bits_wl PortAddr ShiftVal_r SetVal_r temp_r1 temp_r2 temp_r3 	
	cmp \ShiftVal_r, #15
	bhi 1f
	@; 2bits access:
	ldr \temp_r1, =\PortAddr
	ldr \temp_r1, [\temp_r1]					@; temp_r1 =  current val
	ldr \temp_r2, =0xfffffffc
	lsl \ShiftVal_r, \ShiftVal_r, #1			@; ShiftVal_r *= 2 
	rsb \temp_r3, \ShiftVal_r, #32
	ror \temp_r2, \temp_r2, \temp_r3
	and \temp_r1, \temp_r1, \temp_r2			@; make a 2bits window at the prpper position
	and \SetVal_r, \SetVal_r, #0x3
	lsl \SetVal_r, \SetVal_r, \ShiftVal_r
	orr \SetVal_r, \temp_r1, \SetVal_r
1:	@; word access:
	DirectWrite_Reg \PortAddr \SetVal_r \temp_r1
.endm

.macro SetVal_1bit_hwl PortAddr ShiftVal_r SetVal_r temp_r1 temp_r2 	
	cmp \ShiftVal_r, #15
	bhi 1f
	@; bit access:
	ldr \temp_r1, =\PortAddr
	ldr \temp_r1, [\temp_r1]					@; temp_r1 =  current val
	and \SetVal_r, \SetVal_r, #0x1
	mov \temp_r2, #1
	lsl \temp_r2, \temp_r2, \ShiftVal_r
	cmp \SetVal_r, #0
	beq 2f
	@; bit write 1
	orr \SetVal_r, \temp_r1, \temp_r2			
	b 1f
2:	@; bit write 0
	mvn \temp_r2, \temp_r2
	and \SetVal_r, \temp_r1, \temp_r2			
	b 1f
1:	@; word access:
	ldr \temp_r1, =0x0000ffff
	and \SetVal_r, \SetVal_r, \temp_r1
	DirectWrite_Reg \PortAddr \SetVal_r \temp_r1
.endm

.macro SetVal_1bit_17bitsl PortAddr ShiftVal_r SetVal_r temp_r1 temp_r2 	
	cmp \ShiftVal_r, #16
	bhi 1f
	@; bit access:
	ldr \temp_r1, =\PortAddr
	ldr \temp_r1, [\temp_r2]					@; temp_r1 =  current val
	and \SetVal_r, \SetVal_r, #0x1
	mov \temp_r2, #1
	lsl \temp_r2, \temp_r2, \ShiftVal_r
	cmp \SetVal_r, #0
	beq 2f
	@; bit write 1
	orr \SetVal_r, \temp_r1, \temp_r2		
	b 1f
2:	@; bit write 0
	mvn \temp_r2, \temp_r2
	and \SetVal_r, \temp_r1, \temp_r2			
	b 1f
1:	@; word access:
	ldr \temp_r1, =0x0001ffff
	and \SetVal_r, \SetVal_r, \temp_r1
	DirectWrite_Reg \PortAddr \SetVal_r \temp_r1
.endm

.macro SetVal_4bits_2wl PortAddr_H PortAddr_L ShiftVal_r SetVal_r temp_r1 temp_r2 temp_r3 	
	cmp \ShiftVal_r, #15
	bhi 1f
	@; byte access:
	cmp \ShiftVal_r, #7
	bhi 3f
	@; access low word
	ldr \temp_r1, =\PortAddr_L
	ldr \temp_r1, [\temp_r1]					@; temp_r1 =  current val
	ldr \temp_r2, =0xfffffff0
	lsl \ShiftVal_r, \ShiftVal_r, #2			@; ShiftVal_r *= 2 
	rsb \temp_r3, \ShiftVal_r, #32
	ror \temp_r2, \temp_r2, \temp_r3
	and \temp_r1, \temp_r1, \temp_r2			@; make a 4bits window at the prpper position
	and \SetVal_r, \SetVal_r, #0xf
	lsl \SetVal_r, \SetVal_r, \ShiftVal_r
	orr \SetVal_r, \temp_r1, \SetVal_r
	DirectWrite_Reg \PortAddr_L \SetVal_r \temp_r1
	b 4f
3:	@; access high word
	ldr \temp_r1, =\PortAddr_H
	ldr \temp_r1, [\temp_r1]					@; temp_r1 =  current val
	ldr \temp_r2, =0xfffffff0
	sub \ShiftVal_r, \ShiftVal_r, #8
	lsl \ShiftVal_r, \ShiftVal_r, #2			@; ShiftVal_r *= 2 
	rsb \temp_r3, \ShiftVal_r, #32
	ror \temp_r2, \temp_r2, \temp_r3
	and \temp_r1, \temp_r1, \temp_r2			@; make a 4bits window at the prpper position
	and \SetVal_r, \SetVal_r, #0xf
	lsl \SetVal_r, \SetVal_r, \ShiftVal_r
	orr \SetVal_r, \temp_r1, \SetVal_r
	DirectWrite_Reg \PortAddr_H \SetVal_r \temp_r1
	b 4f
1:	@; word access:
	cmp \ShiftVal_r, #16
	beq 2f
	@; write low word:
	DirectWrite_Reg \PortAddr_L \SetVal_r \temp_r1
	b 4f
2:	@; write high word:
	DirectWrite_Reg \PortAddr_H \SetVal_r \temp_r1
4:
.endm

.macro SetVal_1bit_1_wl PortAddr ShiftVal_r SetVal_r temp_r1 temp_r2 	
	cmp \ShiftVal_r, #15
	bhi 1f
	@; bit access:
	cmp \SetVal_r, #0
	bne 2f
	@; bit reset 0
	add \ShiftVal_r, \ShiftVal_r, #16
2:	@; bit set 1
	mov \temp_r2, #1
	lsl \SetVal_r, \temp_r2, \ShiftVal_r 	
	b 1f
1:	@; word access:
	DirectWrite_Reg \PortAddr \SetVal_r \temp_r1
.endm


.macro GetVal_1bit_hwl PortAddr ShiftVal_r return_r temp_r1 temp_r2 	
	ldr \temp_r1, =\PortAddr
	ldr \temp_r1, [\temp_r1]					@; temp_r1 =  current val
	cmp \ShiftVal_r, #15
	bhi 1f
	@; bit access:
	lsr \temp_r1, \temp_r1, \ShiftVal_r
	ldr \temp_r2, =0x00000001					@; mask
	and \temp_r1, \temp_r1, \temp_r2
1:	@; word access:
	mov \return_r, \temp_r1
.endm


.text

.global Set_PortA_MODER
.thumb_func
Set_PortA_MODER:
	SetVal_2bits_wl MY_GPIOA_MODER r0 r1 r2 r3 r4
	bx lr
.global Set_PortB_MODER
.thumb_func
Set_PortB_MODER:
	SetVal_2bits_wl MY_GPIOB_MODER r0 r1 r2 r3 r4
	bx lr
.global Set_PortC_MODER
.thumb_func
Set_PortC_MODER:
	SetVal_2bits_wl MY_GPIOC_MODER r0 r1 r2 r3 r4	
	bx lr
.global Set_PortD_MODER
.thumb_func
Set_PortD_MODER:
	SetVal_2bits_wl MY_GPIOD_MODER r0 r1 r2 r3 r4	
	bx lr


.global Set_PortA_OTYPER
.thumb_func
Set_PortA_OTYPER:
	SetVal_1bit_hwl MY_GPIOA_OTYPER r0 r1 r2 r3
	bx lr
.global Set_PortB_OTYPER
.thumb_func
Set_PortB_OTYPER:
	SetVal_1bit_hwl MY_GPIOB_OTYPER r0 r1 r2 r3
	bx lr
.global Set_PortC_OTYPER
.thumb_func
Set_PortC_OTYPER:
	SetVal_1bit_hwl MY_GPIOC_OTYPER r0 r1 r2 r3
	bx lr
.global Set_PortD_OTYPER
.thumb_func
Set_PortD_OTYPER:
	SetVal_1bit_hwl MY_GPIOD_OTYPER r0 r1 r2 r3
	bx lr
	
.global Set_PortA_OSPEEDER
.thumb_func
Set_PortA_OSPEEDER:
	SetVal_2bits_wl MY_GPIOA_OSPEEDER r0 r1 r2 r3 r4	
	bx lr
.global Set_PortB_OSPEEDER
.thumb_func
Set_PortB_OSPEEDER:
	SetVal_2bits_wl MY_GPIOB_OSPEEDER r0 r1 r2 r3 r4		
	bx lr
.global Set_PortC_OSPEEDER
.thumb_func
Set_PortC_OSPEEDER:
	SetVal_2bits_wl MY_GPIOC_OSPEEDER r0 r1 r2 r3 r4		
	bx lr
.global Set_PortD_OSPEEDER
.thumb_func
Set_PortD_OSPEEDER:
	SetVal_2bits_wl MY_GPIOD_OSPEEDER r0 r1 r2 r3 r4		
	bx lr
	
.global Set_PortA_PUPDR
.thumb_func
Set_PortA_PUPDR:
	SetVal_2bits_wl MY_GPIOA_PUPDR r0 r1 r2 r3 r4		
	bx lr
.global Set_PortB_PUPDR
.thumb_func
Set_PortB_PUPDR:
	SetVal_2bits_wl MY_GPIOB_PUPDR r0 r1 r2 r3 r4	
	bx lr
.global Set_PortC_PUPDR
.thumb_func
Set_PortC_PUPDR:
	SetVal_2bits_wl MY_GPIOC_PUPDR r0 r1 r2 r3 r4	
	bx lr
.global Set_PortD_PUPDR
.thumb_func
Set_PortD_PUPDR:
	SetVal_2bits_wl MY_GPIOD_PUPDR r0 r1 r2 r3 r4	
	bx lr

	
.global Set_PortA_ODR
.thumb_func
Set_PortA_ODR:
	SetVal_1bit_hwl MY_GPIOA_ODR r0 r1 r2 r3
	bx lr
.global Set_PortB_ODR
.thumb_func
Set_PortB_ODR:
	SetVal_1bit_hwl MY_GPIOB_ODR r0 r1 r2 r3
	bx lr
.global Set_PortC_ODR
.thumb_func
Set_PortC_ODR:
	SetVal_1bit_hwl MY_GPIOC_ODR r0 r1 r2 r3
	bx lr
.global Set_PortD_ODR
.thumb_func
Set_PortD_ODR:
	SetVal_1bit_hwl MY_GPIOD_ODR r0 r1 r2 r3
	bx lr
	
.global Set_PortA_Bit
.thumb_func
Set_PortA_Bit:
	SetVal_1bit_1_wl MY_GPIOA_BSRR r0 r1 r2 r3		
	bx lr
.global Set_PortB_Bit
.thumb_func
Set_PortB_Bit:
	SetVal_1bit_1_wl MY_GPIOB_BSRR r0 r1 r2 r3	
	bx lr
.global Set_PortC_Bit
.thumb_func
Set_PortC_Bit:
	SetVal_1bit_1_wl MY_GPIOC_BSRR r0 r1 r2 r3	
	bx lr
.global Set_PortD_Bit
.thumb_func
Set_PortD_Bit:
	SetVal_1bit_1_wl MY_GPIOD_BSRR r0 r1 r2 r3
	bx lr

.global Set_PortA_LCKR
.thumb_func
Set_PortA_LCKR:
	SetVal_1bit_17bitsl MY_GPIOA_LCKR r0 r1 r2 r3		
	bx lr
.global Set_PortB_LCKR
.thumb_func
Set_PortB_LCKR:
	SetVal_1bit_17bitsl MY_GPIOB_LCKR r0 r1 r2 r3	
	bx lr
.global Set_PortC_LCKR
.thumb_func
Set_PortC_LCKR:
	SetVal_1bit_17bitsl MY_GPIOC_LCKR r0 r1 r2 r3		
	bx lr
.global Set_PortD_LCKR
.thumb_func
Set_PortD_LCKR:
	SetVal_1bit_17bitsl MY_GPIOD_LCKR r0 r1 r2 r3		
	bx lr

.global Set_PortA_AFR
.thumb_func
Set_PortA_AFR:
	SetVal_4bits_2wl MY_GPIOA_AFRH MY_GPIOA_AFRL r0 r1 r2 r3 r4 	
	bx lr	
.global Set_PortB_AFR
.thumb_func
Set_PortB_AFR:
	SetVal_4bits_2wl MY_GPIOB_AFRH MY_GPIOB_AFRL r0 r1 r2 r3 r4 
	bx lr	
.global Set_PortC_AFR
.thumb_func
Set_PortC_AFR:
	SetVal_4bits_2wl MY_GPIOC_AFRH MY_GPIOC_AFRL r0 r1 r2 r3 r4 	
	bx lr	
.global Set_PortD_AFR
.thumb_func
Set_PortD_AFR:
	SetVal_4bits_2wl MY_GPIOD_AFRH MY_GPIOD_AFRL r0 r1 r2 r3 r4 
	bx lr	
	


.global Get_PortA_Bit
.thumb_func
Get_PortA_Bit:
	GetVal_1bit_hwl MY_GPIOA_IDR r0 r0 r1 r2	
	bx lr
.global Get_PortB_Bit
.thumb_func
Get_PortB_Bit:
	GetVal_1bit_hwl MY_GPIOB_IDR r0 r0 r1 r2	
	bx lr
.global Get_PortC_Bit
.thumb_func
Get_PortC_Bit:
	GetVal_1bit_hwl MY_GPIOC_IDR r0 r0 r1 r2	
	bx lr
.global Get_PortD_Bit
.thumb_func
Get_PortD_Bit:
	GetVal_1bit_hwl MY_GPIOD_IDR r0 r0 r1 r2	
	bx lr	
	
