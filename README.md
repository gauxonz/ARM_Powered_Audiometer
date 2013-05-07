_readme.txt wmh 2013-03-27 : info on work in C:\_umd\_2013-01-01\440_S13\_work\0327\02_obfuscated\

obfs_makeST32F4_P24IO_Blinky.bat : script to make the obfuscated (no source for P24 IO operations) version of the demo

aIOtest.obj : STM32F4_P24v04IO_04.asm object file (source is _not_ included) containing P24 display and switch input functions 

STM32F4main04.c : exercises STM32F4-DISCOVERY/P24 displays and switch inputs

LED_02.c : source for STM32F4-DISCOVERY onboard LED exercise

KeilSimulatorDebugMap_ATM32F4_01.ini : map needed by Keil simulator to permit simulated access to certain regions
of address space and avoid errors occuring in simulator such as "*** error 65: access violation at 0x40023830 : no 'read' permission"
Simulator .ini map uses info from ST Cortex-M4F manual DM00037051.pdf.


 