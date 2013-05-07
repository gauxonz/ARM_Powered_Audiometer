.include "../basic/stm32f4xx_RegDef.h"
.syntax unified	@;to allow thumb-2 instruction set
.thumb						@; Use thmb instructions only
.data
.bss

.text

.global ST_P24_Display_On
.thumb_func
ST_P24_Display_On:
	DirectWrite_Data MY_GPIOA_BSRR 0x00400000 r4 r5	@; a6=0
	DirectWrite_Data MY_GPIOC_BSRR 0x00020000 r4 r5 @; c1=0
	bx lr
	
.global ST_P24_Display_Off
.thumb_func
ST_P24_Display_Off:
	DirectWrite_Data MY_GPIOA_BSRR 0x0040 r4 r5	@; a6=1
	DirectWrite_Data MY_GPIOC_BSRR 0x0002 r4 r5 @; c1=1
	bx lr

.global ST_P24_Display_SetChar
.thumb_func
ST_P24_Display_SetChar:
	and r0,r0,#0x1f
	mov r0, r0, lsl #1
	@;adr r2,ST_P24_Display_SetChar_BranchTable
	add pc,pc,r0
	nop
ST_P24_Display_SetChar_BranchTable:
	b ST_P24_Display_SetChar_0	@; 00
	b ST_P24_Display_SetChar_1	@; 01
	b ST_P24_Display_SetChar_2	@; 02
	b ST_P24_Display_SetChar_3	@; 03
	b ST_P24_Display_SetChar_4	@; 04
	b ST_P24_Display_SetChar_5	@; 05
	b ST_P24_Display_SetChar_6	@; 06
	b ST_P24_Display_SetChar_7	@; 07
	b ST_P24_Display_SetChar_8	@; 08
	b ST_P24_Display_SetChar_9	@; 09
	b ST_P24_Display_SetChar_a	@; 10
	b ST_P24_Display_SetChar_b	@; 11
	b ST_P24_Display_SetChar_c	@; 12
	b ST_P24_Display_SetChar_d	@; 13
	b ST_P24_Display_SetChar_e	@; 14
	b ST_P24_Display_SetChar_f	@; 15
	b ST_P24_Display_SetChar_dot	@; 16
	b ST_P24_Display_SetChar_colon	@; 17
	b ST_P24_Display_SetChar_qt		@; 18
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	b ST_P24_Display_SetChar_NULL	@; 19
	
ST_P24_Display_SetChar_0:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5	@;Set_PortC_Bit(2,0);
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 @;Set_PortA_Bit(0,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	@;Set_PortC_Bit(3,0);
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5	@;Set_PortA_Bit(7,0);
	DirectWrite_Data MY_GPIOA_BSRR 0x00100000 r4 r5	@;Set_PortA_Bit(4,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5	@;Set_PortC_Bit(0,0);
	DirectWrite_Data MY_GPIOA_BSRR 0x0002 r4 r5		@;Set_PortA_Bit(1,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		@;Set_PortA_Bit(5,1);
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_1:
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5		@;Set_PortC_Bit(2,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 @;Set_PortA_Bit(0,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	@;Set_PortC_Bit(3,0);
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5		@;Set_PortA_Bit(7,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		@;Set_PortA_Bit(4,1);
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5		@;Set_PortC_Bit(0,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0002 r4 r5		@;Set_PortA_Bit(1,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		@;Set_PortA_Bit(5,1);
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_2:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00100000 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_3:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_4:
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_5:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_6:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00100000 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_7:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0002 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_8:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00100000 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_9:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_a:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00100000 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_b:
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00100000 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_c:
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00100000 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_d:
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00100000 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_e:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x00800000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00100000 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_f:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00100000 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00020000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
	
ST_P24_Display_SetChar_dot:
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0002 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00200000 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_colon:
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0002 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_qt:
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5 
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5	
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0002 r4 r5		
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr
ST_P24_Display_SetChar_NULL:	
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5		@;Set_PortC_Bit(2,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5 	@;Set_PortA_Bit(0,1);
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5		@;Set_PortC_Bit(3,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5		@;Set_PortA_Bit(7,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		@;Set_PortA_Bit(4,1);
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5		@;Set_PortC_Bit(0,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0002 r4 r5		@;Set_PortA_Bit(1,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		@;Set_PortA_Bit(5,1);
	@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00200000 r4 r5	@;Set_PortC_Bit(5,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0020 r4 r5		@;Set_PortC_Bit(5,1);
	bx lr

.global ST_P24_Display_SlctSeg
.thumb_func
ST_P24_Display_SlctSeg:
	and r0,r0,#0x7
	mov r0, r0, lsl #1
	add pc,pc,r0
	nop
ST_P24_Display_SlctSeg_BranchTable:
	b ST_P24_Display_SlctSeg_0	@; 00
	b ST_P24_Display_SlctSeg_1	@; 01
	b ST_P24_Display_SlctSeg_2	@; 02
	b ST_P24_Display_SlctSeg_3	@; 03
	b ST_P24_Display_SlctSeg_4	@; 04
	b ST_P24_Display_SlctSeg_5	@; 04
	
ST_P24_Display_SlctSeg_0:
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5		@;Set_PortA_Bit(7,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5		@;Set_PortA_Bit(4,1);
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5		@;Set_PortA_Bit(5,1);
			@;
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5		@;Set_PortA_Bit(0,0);
	DirectWrite_Data MY_GPIOA_BSRR 0x0082 r4 r5		@;Set_PortA_Bit(1,1);
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5		@;Set_PortC_Bit(3,1);
	DirectWrite_Data MY_GPIOC_BSRR 0x00010000 r4 r5		@;Set_PortC_Bit(0,1);
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5		@;Set_PortC_Bit(2,1);
			@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00100000 r4 r5		@;Set_PortC_Bit(4,0);
	DirectWrite_Data MY_GPIOC_BSRR 0x0010 r4 r5		@;Set_PortC_Bit(4,1);
	bx lr
ST_P24_Display_SlctSeg_1:
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5
			@;
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0082 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x00080000 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5
			@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00100000 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0010 r4 r5
	bx lr
ST_P24_Display_SlctSeg_2:
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5
			@;
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x00820000 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5
			@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00100000 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0010 r4 r5
	bx lr
ST_P24_Display_SlctSeg_3:
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5
			@;
	DirectWrite_Data MY_GPIOA_BSRR 0x00010000 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0082 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5
			@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00100000 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0010 r4 r5	
	bx lr
ST_P24_Display_SlctSeg_4:
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5
			@;
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0082 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x00040000 r4 r5
			@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00100000 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0010 r4 r5	
	bx lr
ST_P24_Display_SlctSeg_5:@;close
	DirectWrite_Data MY_GPIOA_BSRR 0x0080 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0010 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0020 r4 r5
			@;
	DirectWrite_Data MY_GPIOA_BSRR 0x0001 r4 r5
	DirectWrite_Data MY_GPIOA_BSRR 0x0082 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0008 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0001 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0004 r4 r5
			@;
	DirectWrite_Data MY_GPIOC_BSRR 0x00100000 r4 r5
	DirectWrite_Data MY_GPIOC_BSRR 0x0010 r4 r5	
	bx lr
	
.global ST_P24_DisplayIni
.thumb_func
ST_P24_DisplayIni:
	movw	r2, #14384	@; 0x3830
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #1
	str	r1, [r2, #0]
	movw	r2, #14384	@; 0x3830
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #4
	str	r1, [r2, #0]
	movw	r2, #2048	@; 0x800
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #768	@; 0x300
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #256	@; 0x100
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #16
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #768	@; 0x300
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #512	@; 0x200
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #768	@; 0x300
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #256	@; 0x100
	str	r1, [r2, #12]
	movw	r2, #0
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #12288	@; 0x3000
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #4096	@; 0x1000
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #64	@; 0x40
	str	r1, [r2, #4]
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
	bic.w	r1, r1, #3072	@; 0xc00
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #1024	@; 0x400
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #32
	str	r1, [r2, #4]
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
	movw	r2, #2048	@; 0x800
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #12
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #4
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #2
	str	r1, [r2, #4]
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
	movw	r2, #2048	@; 0x800
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #48	@; 0x30
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #16
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #4
	str	r1, [r2, #4]
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
	movw	r2, #0
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #3
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #1
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #1
	str	r1, [r2, #4]
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
	movw	r2, #2048	@; 0x800
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #192	@; 0xc0
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #64	@; 0x40
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #8
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #192	@; 0xc0
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #128	@; 0x80
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #192	@; 0xc0
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #64	@; 0x40
	str	r1, [r2, #12]
	movw	r2, #0
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #49152	@; 0xc000
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #16384	@; 0x4000
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #128	@; 0x80
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #49152	@; 0xc000
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #32768	@; 0x8000
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #49152	@; 0xc000
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #16384	@; 0x4000
	str	r1, [r2, #12]
	movw	r2, #0
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #768	@; 0x300
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #256	@; 0x100
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #16
	str	r1, [r2, #4]
	ldr	r1, [r2, #8]
	bic.w	r1, r1, #768	@; 0x300
	str	r1, [r2, #8]
	ldr	r1, [r2, #8]
	orr.w	r1, r1, #512	@; 0x200
	str	r1, [r2, #8]
	ldr	r1, [r2, #12]
	bic.w	r1, r1, #768	@; 0x300
	str	r1, [r2, #12]
	ldr	r1, [r2, #12]
	orr.w	r1, r1, #256	@; 0x100
	str	r1, [r2, #12]
	movw	r2, #2048	@; 0x800
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #3
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #1
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #1
	str	r1, [r2, #4]
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
	movw	r2, #0
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #12
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #4
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #2
	str	r1, [r2, #4]
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
	movw	r2, #0
	movt	r2, #16386	@; 0x4002
	ldr	r1, [r2, #0]
	bic.w	r1, r1, #3072	@; 0xc00
	str	r1, [r2, #0]
	ldr	r1, [r2, #0]
	orr.w	r1, r1, #1024	@; 0x400
	str	r1, [r2, #0]
	ldr	r1, [r2, #4]
	bic.w	r1, r1, #32
	str	r1, [r2, #4]
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
	bx	lr

	