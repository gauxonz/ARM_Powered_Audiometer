
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
echo compiling system_stm32f4xx
arm-none-eabi-gcc -I./  -c -mthumb -O0 -g -mcpu=cortex-m4  .\sources\basic\system_stm32f4xx.c -o .\objs\system_stm32f4xx.o

echo compiling basic drivers in asm
arm-none-eabi-as -g -mcpu=cortex-m4 -I .\sources\basic .\sources\basic\GPIO.asm -o .\objs\aGPIO.o

arm-none-eabi-as -g -mcpu=cortex-m4 .\sources\drivers\ST_LED.asm -o .\objs\aST_LED.o
arm-none-eabi-as -g -mcpu=cortex-m4 .\sources\drivers\ST_BTN.asm -o .\objs\aST_BTN.o
arm-none-eabi-as -g -mcpu=cortex-m4 -I .\sources\drivers ^
.\sources\drivers\ST_P24_SWITCH.asm -o .\objs\aST_P24_SWITCH.o
arm-none-eabi-as -g -mcpu=cortex-m4 -I .\sources\drivers ^
.\sources\drivers\ST_P24_DISPLAY.asm -o .\objs\aST_P24_DISPLAY.o
arm-none-eabi-as -g -mcpu=cortex-m4 -I .\sources\drivers ^
.\sources\drivers\ST_P24_LED.asm -o .\objs\aST_P24_LED.o
arm-none-eabi-gcc -I./  -c -mthumb -O0 -g -mcpu=cortex-m4 ^
.\sources\basic\TIM.c -o .\objs\aTIM.o
::arm-none-eabi-as -g -mcpu=cortex-m4 .\sources\basic\TIM.asm -o aTIM.o


echo compiling basic drivers in c
arm-none-eabi-gcc -I./  -c -mthumb -O0 -g -mcpu=cortex-m4 .\sources\drivers\ST_LED.c -o .\objs\cST_LED.o



echo compiling main C
arm-none-eabi-gcc -I./ -std=c99 -c -mthumb -O0 -g -mcpu=cortex-m4 .\sources\ProjectMain.c -o .\objs\cMain.o

echo linking
arm-none-eabi-gcc -nostartfiles -g -Wl,--no-gc-sections -Wl,-Map,.\objs\Blinky.map -Wl,-T ^
.\linkers\linkBlinkySTM32F4_01.ld ^
-o Blinky.elf ^
.\objs\aStartup.o .\objs\system_stm32f4xx.o .\objs\aST_LED.o .\objs\aTIM.o ^
.\objs\cST_LED.o .\objs\aST_BTN.o .\objs\aST_P24_SWITCH.o .\objs\aST_P24_DISPLAY.o ^
.\objs\aGPIO.o .\objs\aST_P24_LED.o .\objs\cMain.o ^
-lgcc

echo generate hex file
arm-none-eabi-objcopy -O ihex Blinky.elf Blinky.hex

echo generate AXF file
copy Blinky.elf Blinky.AXF
pause

echo generate list file
arm-none-eabi-objdump -S Blinky.axf >Blinky.lst
pause