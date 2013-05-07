.include "../basic/stm32f4xx_RegDef.h"
@;
.syntax unified	@;to allow thumb-2 instruction set
.thumb						@; Use thmb instructions only
.data
.text
.align 4

.global ST_P24SWITCH_init
.thumb_func
ST_P24SWITCH_init:
	movw	r2, #14384	@; 0x3830
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #2
	str	r1, [r2, #0]
	movw	r2, #14384	@; 0x3830
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #4
	str	r1, [r2, #0]
	movw	r2, #14384	@; 0x3830
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #8
	str	r1, [r2, #0]
	movw	r2, #1024	@; 0x400
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #786432	@; 0xc0000
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #262144	@; 0x40000
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #512	@; 0x200
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #786432	@; 0xc0000
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #524288	@; 0x80000
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #786432	@; 0xc0000
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #262144	@; 0x40000
	str	r1, [r2, #12]
	movw	r2, #1024	@; 0x400
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #3
	str	r1, [r2, #0]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #3
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #2
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #3
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #1
	str	r1, [r2, #12]
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #48	@; 0x30
	str	r1, [r2, #0]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #48	@; 0x30
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #32
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #48	@; 0x30
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #16
	str	r1, [r2, #12]
	movw	r2, #1024	@; 0x400
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #12
	str	r1, [r2, #0]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #12
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #8
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #12
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #4
	str	r1, [r2, #12]
	movw	r2, #1024	@; 0x400
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #12288	@; 0x3000
	str	r1, [r2, #0]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #12288	@; 0x3000
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #8192	@; 0x2000
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #12288	@; 0x3000
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #4096	@; 0x1000
	str	r1, [r2, #12]
	movw	r2, #2048	@; 0x800
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #3145728	@; 0x300000
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #1048576	@; 0x100000
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #1024	@; 0x400
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #3145728	@; 0x300000
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #2097152	@; 0x200000
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #3145728	@; 0x300000
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #1048576	@; 0x100000
	str	r1, [r2, #12]
	movw	r2, #2048	@; 0x800
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #12582912	@; 0xc00000
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #4194304	@; 0x400000
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #2048	@; 0x800
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #12582912	@; 0xc00000
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #8388608	@; 0x800000
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #12582912	@; 0xc00000
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #4194304	@; 0x400000
	str	r1, [r2, #12]
	movw	r2, #2048	@; 0x800
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #50331648	@; 0x3000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #50331648	@; 0x3000000
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #33554432	@; 0x2000000
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #50331648	@; 0x3000000
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #16777216	@; 0x1000000
	str	r1, [r2, #12]
	movw	r2, #1024	@; 0x400
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #3072	@; 0xc00
	str	r1, [r2, #0]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #3072	@; 0xc00
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #2048	@; 0x800
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #3072	@; 0xc00
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #1024	@; 0x400
	str	r1, [r2, #12]
	movw	r2, #1024	@; 0x400
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #512	@; 0x200
	str	r1, [r2, #24]
	movw	r2, #2048	@; 0x800
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #1024	@; 0x400
	str	r1, [r2, #24]
	movw	r2, #2048	@; 0x800
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #2048	@; 0x800
	str	r1, [r2, #24]
	bx	lr

.global ST_P24_GetSwitch
.thumb_func
ST_P24_GetSwitch:

.global ST_P24_GetSwitch
.thumb_func
ST_P24_GetSwitch:
	sub r1,r0,#1
	and r1,r1,#0xf
	mov r1, r1, lsl #1
	add pc,pc,r1
	nop
ST_P24_Display_GetSwitch_BranchTable:
	b ST_P24_GetSwitch_1	@; 00
	b ST_P24_GetSwitch_2	@; 00
	b ST_P24_GetSwitch_3	@; 00
	b ST_P24_GetSwitch_4	@; 00
	b ST_P24_GetSwitch_5	@; 00
	b ST_P24_GetSwitch_6	@; 00
	b ST_P24_GetSwitch_7	@; 00
	b ST_P24_GetSwitch_8	@; 00
	b ST_P24_GetSwitch_9	@; 00
	b ST_P24_GetSwitch_10	@; 00
	b ST_P24_GetSwitch_11	@; 00
	b ST_P24_GetSwitch_12	@; 00
ST_P24_GetSwitch_1:
	DirectWrite_Data MY_GPIOB_BSRR 0x02000000 r4 r5	 @; b9 = 0
	DirectRead MY_GPIOB_IDR r0 r1
	ands r0,r0,#0x01
	mov r0,r0										@; return b0
	DirectWrite_Data MY_GPIOB_BSRR 0x0200 r4 r5	 @; b9 = 1
	bx lr
ST_P24_GetSwitch_2:
	DirectWrite_Data MY_GPIOB_BSRR 0x02000000 r4 r5	 @; b9 = 0
	DirectRead MY_GPIOD_IDR r0 r1
	ands r0,r0,#0x04
	mov r0,r0, lsr #2										@; return d2
	DirectWrite_Data MY_GPIOB_BSRR 0x0200 r4 r5	 @; b9 = 1
	bx lr
ST_P24_GetSwitch_3:
	DirectWrite_Data MY_GPIOB_BSRR 0x02000000 r4 r5	 @; b9 = 0
	DirectRead MY_GPIOB_IDR r0 r1
	ands r0,r0,#0x02
	mov r0,r0, lsr #1										@; return b1
	DirectWrite_Data MY_GPIOB_BSRR 0x0200 r4 r5	 @; b9 = 1
	bx lr
ST_P24_GetSwitch_4:
	DirectWrite_Data MY_GPIOB_BSRR 0x02000000 r4 r5	 @; b9 = 0
	DirectRead MY_GPIOB_IDR r0 r1
	ands r0,r0,#0x40
	mov r0,r0, lsr #6										@; return b6
	DirectWrite_Data MY_GPIOB_BSRR 0x0200 r4 r5	 @; b9 = 1
	bx lr
ST_P24_GetSwitch_5:
	DirectWrite_Data MY_GPIOC_BSRR 0x04000000 r4 r5	 @; c10 = 0
	DirectRead MY_GPIOB_IDR r0 r1
	ands r0,r0,#0x01
	mov r0,r0, lsr #0										@; return b0
	DirectWrite_Data MY_GPIOC_BSRR 0x0400 r4 r5	 @; c10 = 1
	bx lr
ST_P24_GetSwitch_6:
	DirectWrite_Data MY_GPIOC_BSRR 0x04000000 r4 r5	 @; c10 = 0
	DirectRead MY_GPIOD_IDR r0 r1
	ands r0,r0,#0x04
	mov r0,r0, lsr #2										@; return d2
	DirectWrite_Data MY_GPIOC_BSRR 0x0400 r4 r5	 @; c10 = 1
	bx lr
ST_P24_GetSwitch_7:
	DirectWrite_Data MY_GPIOC_BSRR 0x04000000 r4 r5	 @; c10 = 0
	DirectRead MY_GPIOB_IDR r0 r1
	ands r0,r0,#0x02
	mov r0,r0, lsr #1										@; return b1
	DirectWrite_Data MY_GPIOC_BSRR 0x0400 r4 r5	 @; c10 = 1
	bx lr
ST_P24_GetSwitch_8:
	DirectWrite_Data MY_GPIOC_BSRR 0x04000000 r4 r5	 @; c10 = 0
	DirectRead MY_GPIOB_IDR r0 r1
	ands r0,r0,#0x40
	mov r0,r0, lsr #6										@; return b6
	DirectWrite_Data MY_GPIOC_BSRR 0x0400 r4 r5	 @; c10 = 1
	bx lr
ST_P24_GetSwitch_9:
	DirectWrite_Data MY_GPIOC_BSRR 0x08000000 r4 r5	 @; c11 = 0
	DirectRead MY_GPIOB_IDR r0 r1
	ands r0,r0,#0x01
	mov r0,r0, lsr #0									@; return b0
	DirectWrite_Data MY_GPIOC_BSRR 0x0800 r4 r5	 @; c11 = 1
	bx lr
ST_P24_GetSwitch_10:
	DirectWrite_Data MY_GPIOC_BSRR 0x08000000 r4 r5	 @; c11 = 0
	DirectRead MY_GPIOD_IDR r0 r1
	ands r0,r0,#0x04
	mov r0,r0, lsr #2									@; return d2
	DirectWrite_Data MY_GPIOC_BSRR 0x0800 r4 r5	 @; c11 = 1
	bx lr
ST_P24_GetSwitch_11:
	DirectWrite_Data MY_GPIOC_BSRR 0x08000000 r4 r5	 @; c11 = 0
	DirectRead MY_GPIOB_IDR r0 r1
	ands r0,r0,#0x02
	mov r0,r0, lsr #1									@; return b1
	DirectWrite_Data MY_GPIOC_BSRR 0x0800 r4 r5	 @; c11 = 1
	bx lr
ST_P24_GetSwitch_12:
	DirectWrite_Data MY_GPIOC_BSRR 0x08000000 r4 r5	 @; c11 = 0
	DirectRead MY_GPIOB_IDR r0 r1
	ands r0,r0,#0x40
	mov r0,r0, lsr #6									@; return b6
	DirectWrite_Data MY_GPIOC_BSRR 0x0800 r4 r5	 @; c11 = 1
	bx lr