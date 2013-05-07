@;
.syntax unified	@;to allow thumb-2 instruction set
.thumb						@; Use thmb instructions only
.data
.text
.align 4

.global ST_BTN_init
.thumb_func
ST_BTN_init:
 	movw	r2, #14384	@; 0x3830
 	movt	r2, #16386	@; 0x4002
 	ldr	r1, [r2, #0]
 	orr.w	r1, r1, #1
 	str	r1, [r2, #0]
 	movw	r2, #0
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
	bx	lr
	
.global ST_BTN_Get
.thumb_func
ST_BTN_Get:	
 	movw	r2, #0
 	movt	r2, #16386	@; 0x4002
 	ldr	r0, [r2, #16]
 	ands.w	r0, r0, #1
 	mov.w	r0, r0
 	bx	lr
	