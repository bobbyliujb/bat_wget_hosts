chcp 936 &gt;nul
@echo off
mode con lines=42 cols=80
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

:main
cls
color 2f
echo. Please turn off the AntiVirus software such as 360.
echo. 

echo. Please back up your current hosts if needed.

color 2e
echo.-------------------------------------------------------------------------
echo. Please choose from the following command
echo.
echo. 1. First time use: initialize
echo.
echo. 2. Use compact hosts
echo.
echo. 3. Use complete hosts
echo.
echo. 4. Restore default hosts
echo.-------------------------------------------------------------------------

if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p select=Please choose:

echo.
if %select%==4 goto defaultHost
if %select%==3 goto replaceHostSourceFull
if %select%==2 goto replaceHostSourceCompact
if %select%==1 goto replaceHostFirstTimeFull
cls
echo Please enter 1 2 3 or 4
ping 127.0.1 -n "2">nul
goto main

:Win7Choice
choice /c 1234 /n /m "Please choose:"
if errorlevel 4 goto defaultHost
if errorlevel 3 goto replaceHostSourceFull
if errorlevel 2 goto replaceHostSourceCompact
if errorlevel 1 goto replaceHostFirstTimeFull
cls
goto main

:replaceHostFirstTimeFull
wget -q --no-check-certificate https://coding.net/u/scaffrey/p/hosts/git/raw/master/hosts-files/hosts -O "%SystemRoot%\System32\drivers\etc\hosts"
@echo. >> "%SystemRoot%\System32\drivers\etc\hosts"
type custom.txt >> "%SystemRoot%\System32\drivers\etc\hosts"
goto replaceSuccess

:replaceHostSourceCompact
wget -q --no-check-certificate https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts-compact -O "%SystemRoot%\System32\drivers\etc\hosts"
@echo. >> "%SystemRoot%\System32\drivers\etc\hosts"
type custom.txt >> "%SystemRoot%\System32\drivers\etc\hosts"
goto replaceSuccess

:replaceHostSourceFull
wget -q --no-check-certificate https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts -O "%SystemRoot%\System32\drivers\etc\hosts"
@echo. >> "%SystemRoot%\System32\drivers\etc\hosts"
type custom.txt >> "%SystemRoot%\System32\drivers\etc\hosts"
goto replaceSuccess

:replaceSuccess
ipconfig /flushdns
cls
color 2f
echo.-------------------------------------------------------------------------
echo.
echo. Congrats! You've updated the hosts file.
echo.
echo.
echo.
echo. Please access google websites with https.
echo.
goto end


:defaultHost
cls
color 2f
@echo # Localhost (DO NOT REMOVE!!!) > %SystemRoot%\System32\drivers\etc\hosts
@echo 127.0.0.1	localhost >> %SystemRoot%\System32\drivers\etc\hosts
@echo ::1	localhost ip6-localhost ip6-loopback >> %SystemRoot%\System32\drivers\etc\hosts
echo 恭喜您，hosts恢复成功!
echo.
goto end

:end
echo 请按任意键退出。
@Pause>nul
