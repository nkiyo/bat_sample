@echo off
cd %~dp0

:: https://github.com/bmrf/standalone_scripts/blob/master/Windows%20one-liners.bat

FOR /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') do set DTS=%%a
set CUR_DATE=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%
echo %CUR_DATE%

:: tokens=3* とすると、%%iにtoken3が、%%jにtoken4-が格納される
for /f "tokens=3*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName ^| find "ProductName"') do set WIN_VER=%%i %%j
echo %WIN_VER%

:: /f => force
:: /im => specify image name (= execution name)
:: taskkill /f /im msedge.exe
:: wmic process where name="msedge.exe" call terminate



:: TODO wmic, netsh, route
