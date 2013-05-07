.syntax unified	@;to allow thumb-2 instruction set
.thumb						@; Use thmb instructions only
.text

.global TIM2_Init
.thumb_func
TIM2_Init:
	push	{r7}
	add	r7, sp, #0
	mov.w	r3, #14336	@; 0x3800
	movt	r3, #16386	@; 0x4002
	mov.w	r2, #14336	@; 0x3800
	movt	r2, #16386	@; 0x4002
	ldr	r2, [r2, #64]	@; 0x40
	orr.w	r2, r2, #1
	str	r2, [r3, #64]	@; 0x40
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	
.global TIM2_Config
.thumb_func
TIM2_Config:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	mov.w	r3, #1073741824	@; 0x40000000
	ldr	r2, [r7, #4]
	uxth	r2, r2
	strh	r2, [r3, #40]	@; 0x28
	mov.w	r3, #1073741824	@; 0x40000000
	ldr	r2, [r7, #0]
	str	r2, [r3, #44]	@; 0x2c
	add.w	r7, r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop

.global TIM2_Start
.thumb_func
TIM2_Start:
	push	{r7, lr}
	add	r7, sp, #0
	mov.w	r3, #1073741824	@; 0x40000000
	mov.w	r2, #1073741824	@; 0x40000000
	ldrh	r2, [r2, #20]
	uxth	r2, r2
	orr.w	r2, r2, #1
	uxth	r2, r2
	strh	r2, [r3, #20]
	mov.w	r3, #1073741824	@; 0x40000000
	mov.w	r2, #1073741824	@; 0x40000000
	ldrh	r2, [r2, #16]
	uxth	r2, r2
	bic.w	r2, r2, #1
	uxth	r2, r2
	strh	r2, [r3, #16]
	mov.w	r3, #1073741824	@; 0x40000000
	mov.w	r2, #1073741824	@; 0x40000000
	ldrh	r2, [r2, #12]
	uxth	r2, r2
	orr.w	r2, r2, #1
	uxth	r2, r2
	strh	r2, [r3, #12]
	mov.w	r0, #28
	bl	MY_NVIC_EnableIRQ
	mov.w	r3, #1073741824	@; 0x40000000
	mov.w	r2, #1073741824	@; 0x40000000
	ldrh	r2, [r2, #0]
	uxth	r2, r2
	orr.w	r2, r2, #1
	uxth	r2, r2
	strh	r2, [r3, #0]
	pop	{r7, pc}
	nop
	
.thumb_func
MY_NVIC_EnableIRQ:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	mov.w	r3, #57600	@; 0xe100
	movt	r3, #57344	@; 0xe000
	ldrsb.w	r2, [r7, #7]
	mov.w	r2, r2, lsr #5
	ldrb	r1, [r7, #7]
	and.w	r1, r1, #31
	mov.w	r0, #1
	lsl.w	r1, r0, r1
	str.w	r1, [r3, r2, lsl #2]
	add.w	r7, r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
