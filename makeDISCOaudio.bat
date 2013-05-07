REM  makeDISCOaudio.bat wmh 2013-04-28 : adding '-mfloat-abi=hard -mfpu=fpv4-sp-d16' compiler switches did not fix problem of bad 'blx' which keil saw as DCD
REM adding -L"C:\yagarto_gcc472\lib\gcc\arm-none-eabi\4.7.2\thumb\v7m" did fix the problem of blx/DCD but then we got NOCP (no coprocessor) exception
REM removing '-mfloat-abi=hard -mfpu=fpv4-sp-d16' but keeping -L"C:\yagarto_gcc472\lib\gcc\arm-none-eabi\4.7.2\thumb\v7m" got working program with software fp
REM added 'enable_FPU' to SimpleStartSTM32F4_02.asm, putting '-mfloat-abi=hard -mfpu=fpv4-sp-d16' back in compile commands and changing optimization to -O1
REM gives a nice triangle wave that Audacity says has the first fundamental at 221 Hz (221 Hz very close to A below middle C)

set path=.\;C:\yagarto\bin;

REM assemble with '-g' omitted where we want to hide things in the AXF
 arm-none-eabi-as -g -mcpu=cortex-m4 -o aStartup.o SimpleStartSTM32F4_02.asm

REM compiling C code
SET GCC_COMPILE=-c -mthumb -O1 -g -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -fsingle-precision-constant -save-temps
arm-none-eabi-gcc -I./ -I./STM32F4xx_StdPeriph_Driver\inc %GCC_COMPILE% DISCOaudio_01.c -o cMain.o
REM arm-none-eabi-gcc -I./  %GCC_COMPILE% codec.c -o cCodec.o
REM arm-none-eabi-gcc -I./  %GCC_COMPILE% stm32f4xx_gpio.c -o cGPIO.o
REM arm-none-eabi-gcc -I./  %GCC_COMPILE% stm32f4xx_i2c.c -o cI2C.o
REM arm-none-eabi-gcc -I./  %GCC_COMPILE% stm32f4xx_spi.c -o cSPI.o
REM arm-none-eabi-gcc -I./  %GCC_COMPILE% stm32f4xx_rcc.c -o cRCC.o

REM linking 
 SET GCC_LINK=-nostartfiles -g -Wl,--gc-sections -Wl,-Map,DISCOaudio.map -Wl,-T -L"C:\yagarto_gcc472\lib\gcc\arm-none-eabi\4.7.2\thumb\v7m"  linkSTM32F4_01.ld 
 arm-none-eabi-gcc %GCC_LINK% -oDISCOaudio.elf aStartup.o cMain.o -lgcc

REM hex file
arm-none-eabi-objcopy -O ihex DISCOaudio.elf DISCOaudio.hex

REM AXF file
copy DISCOaudio.elf DISCOaudio.AXF

REM list file
arm-none-eabi-objdump -S  DISCOaudio.axf >DISCOaudio.lst

REM check results
pause