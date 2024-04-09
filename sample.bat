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

:: すべてのインストールされた製品に対して情報を表示
:: wmic product get name, vendor, version /all

:: Equivalent to linux diff
fc hoge.txt huga.txt
if %errorlevel% neq 0 (
  echo files are different.
)
:: one-liner version
:: FC File1.txt File2.txt >NUL && Echo Same || Echo Different or error

:: TODO wmic, netsh, route, forfiles

:: Wait for 60 seconds or until the "simon" signal is received on the local computer:
:: waitfor /t 60 simon
:: Activate the "simon" signal on the local computer:
:: waitfor /s %computername% /si simon

sort hoge.txt
sort /unique hoge.txt
dir /b | sort

echo before sleep 2sec
timeout /t 2
echo after sleep 2sec

