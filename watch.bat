:: https://superuser.com/a/191068 の改良版
:: 実行例: watch.bat 2 dir *.txt
@echo off
cd %~d0

set args=0
for %%x in (%*) do set /A args+=1

if %args% lss 2 (
  echo specify seconds and command
  exit 1
)

set sec=%1
:: 第2引数以降(=コマンド部分)のを取得する
:: https://stackoverflow.com/a/26732879/6389347
for /f "tokens=1,* delims= " %%a in ("%*") do set command=%%b

:loop
  cls
  echo Every %sec%s: %command% at %date% %time%
  %command%
  timeout /t %sec% > NUL
goto loop
