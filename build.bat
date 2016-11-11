@echo off
color 0F
:A
echo Assembling . . .
echo.
tools\tniasm simple.asm simple.com
echo Completed Assembling
pause
