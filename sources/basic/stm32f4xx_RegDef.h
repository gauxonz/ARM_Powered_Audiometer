.ifndef __STM32F4XX_REGDEF_ASM
.equ __STM32F4XX_REGDEF_ASM, 0
	.equ MY_GPIOA_MODER, 0x40020000
	.equ MY_GPIOB_MODER, 0x40020400
	.equ MY_GPIOC_MODER, 0x40020800
	.equ MY_GPIOD_MODER, 0x40020c00
	
	.equ MY_GPIOA_OTYPER, 0x40020004
	.equ MY_GPIOB_OTYPER, 0x40020404
	.equ MY_GPIOC_OTYPER, 0x40020804
	.equ MY_GPIOD_OTYPER, 0x40020c04
	
	.equ MY_GPIOA_OSPEEDER, 0x40020008
	.equ MY_GPIOB_OSPEEDER, 0x40020408
	.equ MY_GPIOC_OSPEEDER, 0x40020808
	.equ MY_GPIOD_OSPEEDER, 0x40020c08
	
	.equ MY_GPIOA_PUPDR, 0x4002000c
	.equ MY_GPIOB_PUPDR, 0x4002040c
	.equ MY_GPIOC_PUPDR, 0x4002080c
	.equ MY_GPIOD_PUPDR, 0x40020c0c
	
	.equ MY_GPIOA_IDR, 0x40020010
	.equ MY_GPIOB_IDR, 0x40020410
	.equ MY_GPIOC_IDR, 0x40020810
	.equ MY_GPIOD_IDR, 0x40020c10
	
	.equ MY_GPIOA_ODR, 0x40020014
	.equ MY_GPIOB_ODR, 0x40020414
	.equ MY_GPIOC_ODR, 0x40020814
	.equ MY_GPIOD_ODR, 0x40020c14
	
	.equ MY_GPIOA_BSRR, 0x40020018
	.equ MY_GPIOB_BSRR, 0x40020418
	.equ MY_GPIOC_BSRR, 0x40020818
	.equ MY_GPIOD_BSRR, 0x40020c18
	
	.equ MY_GPIOA_LCKR, 0x4002001c
	.equ MY_GPIOB_LCKR, 0x4002041c
	.equ MY_GPIOC_LCKR, 0x4002081c
	.equ MY_GPIOD_LCKR, 0x40020c1c
	
	.equ MY_GPIOA_AFRL, 0x40020020
	.equ MY_GPIOB_AFRL, 0x40020420
	.equ MY_GPIOC_AFRL, 0x40020820
	.equ MY_GPIOD_AFRL, 0x40020c20
	
	.equ MY_GPIOA_AFRH, 0x40020024
	.equ MY_GPIOB_AFRH, 0x40020424
	.equ MY_GPIOC_AFRH, 0x40020824
	.equ MY_GPIOD_AFRH, 0x40020c24
	
.macro DirectWrite_Reg PortFooAddr data_r temp_r1 @; data in reg1
	ldr \temp_r1, =\PortFooAddr
	str \data_r,[\temp_r1]
	
.endm

.macro DirectWrite_Data PortFooAddr data temp_r1 temp_r2 @; data in reg1
	ldr \temp_r1, =\PortFooAddr
	ldr \temp_r2, =\data
	str \temp_r2,[\temp_r1]
.endm

.macro DirectRead PortFooAddr return_r temp_r1
	ldr \temp_r1, =\PortFooAddr
	ldr \return_r,[\temp_r1]
.endm
.endif
