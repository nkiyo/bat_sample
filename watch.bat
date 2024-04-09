@ECHO OFF
echo %0
echo %1
echo %*
for /f "tokens=1,* delims= " %%a in ("%*") do set ALL_BUT_FIRST=%%b
echo all but first: %ALL_BUT_FIRST%
:: :loop
::   cls
::   %*
::   timeout /t 5 > NUL
:: goto loop
