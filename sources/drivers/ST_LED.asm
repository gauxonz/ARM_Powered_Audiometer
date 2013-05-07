@;
.syntax unified	@;to allow thumb-2 instruction set
.thumb						@; Use thmb instructions only
.data
.text
.align 4

.global ST_LED0_On			@; make this function visible everywhere
.thumb_func 			@; identify target type to linker
ST_LED0_On:
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #4096	@; 0x1000
	str	r1, [r2, #24]
	bx	lr

.global ST_LED1_On			@; make this function visible everywhere
.thumb_func 			@; identify target type to linker
ST_LED1_On:
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #0x2000	@; 0x1000
	str	r1, [r2, #24]
	bx	lr

.global ST_LED2_On			@; make this function visible everywhere
.thumb_func 			@; identify target type to linker
ST_LED2_On:
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #0x4000	@; 0x1000
	str	r1, [r2, #24]
	bx	lr

.global ST_LED3_On			@; make this function visible everywhere
.thumb_func 			@; identify target type to linker
ST_LED3_On:
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #0x8000	@; 0x8000
	str	r1, [r2, #24]
	bx	lr

.global ST_LED0_Off			@; make this function visible everywhere
.thumb_func 			@; identify target type to linker
ST_LED0_Off:
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #268435456	@; 0x8000
	str	r1, [r2, #24]
	bx	lr
	
.global ST_LED1_Off			@; make this function visible everywhere
.thumb_func 			@; identify target type to linker
ST_LED1_Off:
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #536870912	@; 0x8000
	str	r1, [r2, #24]
	bx	lr
	
.global ST_LED2_Off			@; make this function visible everywhere
.thumb_func 			@; identify target type to linker
ST_LED2_Off:
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #1073741824	@; 0x8000
	str	r1, [r2, #24]
	bx	lr	

.global ST_LED3_Off			@; make this function visible everywhere
.thumb_func 			@; identify target type to linker
ST_LED3_Off:
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	mov.w	r1, #2147483648	@; 0x8000
	str	r1, [r2, #24]
	bx	lr

.global ST_LED_init			@; make this function visible everywhere
.thumb_func 			@; identify target type to linker
ST_LED_init:
	movw	r2, #14384	@; 0x3830
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #8
	str	r1, [r2, #0]
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #50331648	@; 0x3000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #16777216	@; 0x1000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #4096	@; 0x1000
	str	r1, [r2, #4]
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
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #3221225472	@; 0xc0000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #1073741824	@; 0x40000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #32768	@; 0x8000
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #3221225472	@; 0xc0000000
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #2147483648	@; 0x80000000
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #3221225472	@; 0xc0000000
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #1073741824	@; 0x40000000
	str	r1, [r2, #12]
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #201326592	@; 0xc000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #67108864	@; 0x4000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #8192	@; 0x2000
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #201326592	@; 0xc000000
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #134217728	@; 0x8000000
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #201326592	@; 0xc000000
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #67108864	@; 0x4000000
	str	r1, [r2, #12]
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #805306368	@; 0x30000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #268435456	@; 0x10000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #16384	@; 0x4000
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #805306368	@; 0x30000000
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #536870912	@; 0x20000000
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #805306368	@; 0x30000000
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #268435456	@; 0x10000000
	str	r1, [r2, #12]
	movw	r2, #3072	@; 0xc00
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #3221225472	@; 0xc0000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #1073741824	@; 0x40000000
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #32768	@; 0x8000
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #3221225472	@; 0xc0000000
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #2147483648	@; 0x80000000
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #3221225472	@; 0xc0000000
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #1073741824	@; 0x40000000
	str	r1, [r2, #12]
	bx	lr

