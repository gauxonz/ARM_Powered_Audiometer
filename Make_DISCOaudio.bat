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
::@echo on
echo compiling start-up code
arm-none-eabi-as -g -mcpu=cortex-m4 -o .\objs\a_Startup.o .\sources\basic\SimpleStartSTM32F4_01_disco.asm


SET GCC_COMPILE=-c -mthumb -O1 -g -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -fsingle-precision-constant

echo compiling DISCOaudio_01.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources\DISOCO_DemoCode ^
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
./sources/DISOCO_DemoCode/DISCOaudio_01.c ^
-o ./objs/cMain.o

echo compiling codec.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources\DISOCO_DemoCode ^
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
./sources/DISOCO_DemoCode/codec.c ^
-o ./objs/cCodec.o

echo compiling stm32f4xx_gpio.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources\DISOCO_DemoCode ^
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

echo compiling stm32f4xx_i2c.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources\DISOCO_DemoCode ^
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
.\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\src\stm32f4xx_i2c.c ^
-o .\objs\c_stm32f4xx_i2c.o

echo compiling stm32f4xx_spi.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources\DISOCO_DemoCode ^
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
.\sources\ST_Libraries\STM32F4xx_StdPeriph_Driver\src\stm32f4xx_spi.c ^
-o .\objs\c_stm32f4xx_spi.o

echo compiling stm32f4xx_rcc.c
arm-none-eabi-gcc %GCC_COMPILE% ^
-I .\sources\DISOCO_DemoCode ^
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

echo linking 

 SET GCC_LINK=-nostartfiles -g -Wl,--gc-sections -Wl,-Map,.\objs\Blinky.map -Wl,-T -L"C:\yagarto\lib\gcc\arm-none-eabi\4.6.2\thumb\v7m"  .\linkers\linkBlinkySTM32F4_01.ld
 
 arm-none-eabi-gcc %GCC_LINK% ^
 -o Blinky.elf ^
 .\objs\a_Startup.o ^
 ./objs/cMain.o ^
 ./objs/cCodec.o ^
 .\objs\c_stm32f4xx_gpio.o ^
 .\objs\c_stm32f4xx_i2c.o ^
 .\objs\c_stm32f4xx_spi.o ^
 .\objs\c_stm32f4xx_rcc.o ^
 -lgcc

echo hex file
arm-none-eabi-objcopy -O ihex Blinky.elf Blinky.hex

echo AXF file
copy Blinky.elf Blinky.AXF

echo list file
arm-none-eabi-objdump -S  Blinky.axf >Blinky.lst

echo check results
pause