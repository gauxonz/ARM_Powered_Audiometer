
@echo off
mode con cols=999 lines=99

set path=.\;C:\yagarto\bin;

REM deleting
rd /s /q "./objs" & md "objs"
del /s *.elf
del /s *.hex
del /s *.AXF
del /s *.dep
del /s *.map
del /s *.lst

echo compiling SimpleStartSTM32F4_01
arm-none-eabi-as -g -mcpu=cortex-m4 -o .\objs\aStartup.o .\sources\basic\SimpleStartSTM32F4_01.asm

SET GCC_COMPILE=-c -std=gnu99 -mthumb -O1 -g -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -fsingle-precision-constant

echo compiling system_stm32f4xx.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources ^
-I .\sources\basic ^
-I .\sources\drivers ^
-I .\sources\ST_Libraries\CMSIS\ST\STM32F4xx\Include ^
-I .\sources\ST_Libraries\CMSIS\Include ^
-I .\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\inc ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Core/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Class/MSC/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_OTG_Driver/inc/ ^
-I .\sources\ST_Utilities\STM32F4-Discovery ^
-I .\sources\ST_Utilities\Third_Party\fat_fs\inc ^
-D__MICROLIB ^
-DUSE_STDPERIPH_DRIVER ^
-DSTM32F4XX ^
.\sources\basic\system_stm32f4xx.c ^
-o .\objs\system_stm32f4xx.o

echo compiling main.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources ^
-I .\sources\basic ^
-I .\sources\drivers ^
-I .\sources\ST_Libraries\CMSIS\ST\STM32F4xx\Include ^
-I .\sources\ST_Libraries\CMSIS\Include ^
-I .\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\inc ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Core/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Class/MSC/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_OTG_Driver/inc/ ^
-I .\sources\ST_Utilities\STM32F4-Discovery ^
-I .\sources\ST_Utilities\Third_Party\fat_fs\inc ^
-D__MICROLIB ^
-DUSE_STDPERIPH_DRIVER ^
-DSTM32F4XX ^
.\sources\ProjectMain.c ^
-o .\objs\cMain.o

echo compiling GPIO.asm
arm-none-eabi-as -g -mcpu=cortex-m4 ^
-I .\sources\basic ^
.\sources\basic\GPIO.asm ^
-o .\objs\aGPIO.o

echo compiling ST_LED.asm
arm-none-eabi-as -g -mcpu=cortex-m4 ^
.\sources\drivers\ST_LED.asm ^
-o .\objs\aST_LED.o

echo compiling ST_BTN.asm
arm-none-eabi-as -g -mcpu=cortex-m4 ^
.\sources\drivers\ST_BTN.asm ^
-o .\objs\aST_BTN.o

echo compiling ST_P24_SWITCH.asm
arm-none-eabi-as -g -mcpu=cortex-m4 ^
-I .\sources\drivers ^
.\sources\drivers\ST_P24_SWITCH.asm ^
-o .\objs\aST_P24_SWITCH.o

echo compiling ST_P24_DISPLAY.asm
arm-none-eabi-as -g -mcpu=cortex-m4 ^
-I .\sources\drivers ^
.\sources\drivers\ST_P24_DISPLAY.asm ^
-o .\objs\aST_P24_DISPLAY.o

echo compiling ST_P24_LED.asm
arm-none-eabi-as -g -mcpu=cortex-m4 ^
-I .\sources\drivers ^
.\sources\drivers\ST_P24_LED.asm ^
-o .\objs\aST_P24_LED.o

::echo compiling TIM.asm
::arm-none-eabi-as -g -mcpu=cortex-m4 ^
::.\sources\basic\TIM.asm ^
::-o .\objs\aTIM.o

echo compiling TIM.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources ^
-I .\sources\basic ^
-I .\sources\drivers ^
-I .\sources\ST_Libraries\CMSIS\ST\STM32F4xx\Include ^
-I .\sources\ST_Libraries\CMSIS\Include ^
-I .\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\inc ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Core/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Class/MSC/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_OTG_Driver/inc/ ^
-I .\sources\ST_Utilities\STM32F4-Discovery ^
-I .\sources\ST_Utilities\Third_Party\fat_fs\inc ^
.\sources\basic\TIM.c ^
-o .\objs\aTIM.o

echo compiling ST_LED.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources ^
-I .\sources\basic ^
-I .\sources\drivers ^
-I .\sources\ST_Libraries\CMSIS\ST\STM32F4xx\Include ^
-I .\sources\ST_Libraries\CMSIS\Include ^
-I .\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\inc ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Core/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Class/MSC/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_OTG_Driver/inc/ ^
-I .\sources\ST_Utilities\STM32F4-Discovery ^
-I .\sources\ST_Utilities\Third_Party\fat_fs\inc ^
.\sources\drivers\ST_LED.c ^
-o .\objs\cST_LED.o

echo compiling misc.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources ^
-I .\sources\basic ^
-I .\sources\drivers ^
-I .\sources\ST_Libraries\CMSIS\ST\STM32F4xx\Include ^
-I .\sources\ST_Libraries\CMSIS\Include ^
-I .\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\inc ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Core/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Class/MSC/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_OTG_Driver/inc/ ^
-I .\sources\ST_Utilities\STM32F4-Discovery ^
-I .\sources\ST_Utilities\Third_Party\fat_fs\inc ^
-D__MICROLIB ^
-DUSE_STDPERIPH_DRIVER ^
-DSTM32F4XX ^
.\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\src\misc.c ^
-o .\objs\c_misc.o

echo compiling stm32f4xx_rcc.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources ^
-I .\sources\basic ^
-I .\sources\drivers ^
-I .\sources\ST_Libraries\CMSIS\ST\STM32F4xx\Include ^
-I .\sources\ST_Libraries\CMSIS\Include ^
-I .\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\inc ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Core/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Class/MSC/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_OTG_Driver/inc/ ^
-I .\sources\ST_Utilities\STM32F4-Discovery ^
-I .\sources\ST_Utilities\Third_Party\fat_fs\inc ^
-D__MICROLIB ^
-DUSE_STDPERIPH_DRIVER ^
-DSTM32F4XX ^
.\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\src\stm32f4xx_rcc.c ^
-o .\objs\c_stm32f4xx_rcc.o

echo compiling stm32f4xx_syscfg.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources ^
-I .\sources\basic ^
-I .\sources\drivers ^
-I .\sources\ST_Libraries\CMSIS\ST\STM32F4xx\Include ^
-I .\sources\ST_Libraries\CMSIS\Include ^
-I .\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\inc ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Core/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Class/MSC/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_OTG_Driver/inc/ ^
-I .\sources\ST_Utilities\STM32F4-Discovery ^
-I .\sources\ST_Utilities\Third_Party\fat_fs\inc ^
-D__MICROLIB ^
-DUSE_STDPERIPH_DRIVER ^
-DSTM32F4XX ^
.\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\src\stm32f4xx_syscfg.c ^
-o .\objs\c_stm32f4xx_syscfg.o

echo compiling stm32f4xx_gpio.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources ^
-I .\sources\basic ^
-I .\sources\drivers ^
-I .\sources\ST_Libraries\CMSIS\ST\STM32F4xx\Include ^
-I .\sources\ST_Libraries\CMSIS\Include ^
-I .\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\inc ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Core/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Class/MSC/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_OTG_Driver/inc/ ^
-I .\sources\ST_Utilities\STM32F4-Discovery ^
-I .\sources\ST_Utilities\Third_Party\fat_fs\inc ^
-D__MICROLIB ^
-DUSE_STDPERIPH_DRIVER ^
-DSTM32F4XX ^
.\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\src\stm32f4xx_gpio.c ^
-o .\objs\c_stm32f4xx_gpio.o

echo compiling stm32f4xx_exti.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources ^
-I .\sources\basic ^
-I .\sources\drivers ^
-I .\sources\ST_Libraries\CMSIS\ST\STM32F4xx\Include ^
-I .\sources\ST_Libraries\CMSIS\Include ^
-I .\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\inc ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Core/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_HOST_Library/Class/MSC/inc/ ^
-I .\sources\ST_Libraries/STM32_USB_OTG_Driver/inc/ ^
-I .\sources\ST_Utilities\STM32F4-Discovery ^
-I .\sources\ST_Utilities\Third_Party\fat_fs\inc ^
-D__MICROLIB ^
-DUSE_STDPERIPH_DRIVER ^
-DSTM32F4XX ^
.\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\src\stm32f4xx_exti.c ^
-o .\objs\c_stm32f4xx_exti.o

echo linking

SET GCC_LINK=-nostartfiles -g -Wl,--gc-sections -Wl,-Map,.\objs\Blinky.map -Wl,-T -L"C:\yagarto\lib\gcc\arm-none-eabi\4.6.2\thumb\v7m"  .\linkers\linkBlinkySTM32F4_01.ld
 
arm-none-eabi-gcc %GCC_LINK% ^
-o Blinky.elf ^
.\objs\c_stm32f4xx_syscfg.o ^
.\objs\c_stm32f4xx_gpio.o ^
.\objs\c_stm32f4xx_exti.o ^
.\objs\c_stm32f4xx_rcc.o ^
.\objs\c_misc.o ^
.\objs\cST_LED.o ^
.\objs\aTIM.o ^
.\objs\aST_P24_LED.o ^
.\objs\aST_P24_DISPLAY.o ^
.\objs\aST_P24_SWITCH.o ^
.\objs\aST_BTN.o ^
.\objs\aST_LED.o ^
.\objs\aGPIO.o ^
.\objs\cMain.o ^
.\objs\system_stm32f4xx.o ^
.\objs\aStartup.o  ^
-lgcc

echo generate hex file
arm-none-eabi-objcopy -O ihex Blinky.elf Blinky.hex

echo generate AXF file
copy Blinky.elf Blinky.AXF
pause

echo generate list file
arm-none-eabi-objdump -S Blinky.axf >Blinky.lst
pause