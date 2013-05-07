REM cleanBlinky.bat wmh 2013-01-29 : cleans intermediate compiler results and output
set path=.\;C:\_software_installs\yagarto\bin;C:\_software_installs\yagarto\yagarto-tools-20100703\bin;

REM deleting
del /s *.o
del /s *.elf
del /s *.hex
del /s *.AXF
del /s *.dep
del /s *.map
del /s *.i
del /s *.s
del /s *.lst
pause
