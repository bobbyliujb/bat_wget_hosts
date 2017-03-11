chcp 936 &gt;nul
@echo off
mode con lines=42 cols=80
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

:main
cls
color 2f
echo        √√    √√  √√√      √√√√  √√√√√    √√√√
echo          √    √  √      √  √      √  √  √  √  √      √
echo          √    √  √      √  √              √      √
echo          √√√√  √      √    √√          √        √√
echo          √    √  √      √        √        √            √
echo          √    √  √      √          √      √              √
echo          √    √  √      √  √      √      √      √      √
echo        √√    √√  √√√    √√√√      √√√    √√√√
echo.-------------------------------------------------------------------------
echo.如有360、电脑管家等安全软件提醒，请勾选信任允许和不再提醒！
echo.
echo.警告：执行该命令 您的hosts将被自动替换覆盖！
echo.如您原先的hosts有自己修改过的重要信息，请自行备份！
color 2e
echo.-------------------------------------------------------------------------
echo.【请输入对应数字序号选择使用】
echo.
echo. 1.首次使用/使用普通hosts（Google+FB+Gmail...）
echo.
echo. 2.使用增强hosts（Google+FB+Gmail... + Youtube）
echo.
echo. 3.使用霸王hosts（Google+FB+Gmail... + Youtube + GooglePlay）
echo.
echo. 4.恢复默认hosts
echo.-------------------------------------------------------------------------

if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p select=请输入数字并按回车键确认:

echo.
if %select%==4 goto defaultHost
if %select%==3 goto replaceHostGYP
if %select%==2 goto replaceHostGY
if %select%==1 goto replaceHostG
cls
echo 您输入有误，请重新选择。
ping 127.0.1 -n "2">nul
goto main

:Win7Choice
choice /c 1234 /n /m "请输入相应数字："
if errorlevel 4 goto defaultHost
if errorlevel 3 goto replaceHostGYP
if errorlevel 2 goto replaceHostGY
if errorlevel 1 goto replaceHostG
cls
goto main

:replaceHostG
wget -q --no-check-certificate https://coding.net/u/scaffrey/p/hosts/git/raw/master/hosts -O "%SystemRoot%\System32\drivers\etc\hosts"
goto replaceSuccess

:replaceHostGY
wget -q --no-check-certificate https://raw.githubusercontent.com/racaljk/hosts/master/hosts -O "%SystemRoot%\System32\drivers\etc\hosts"
wget -q --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/y -O hosts_ytb
@echo. >> "%SystemRoot%\System32\drivers\etc\hosts"
type hosts_ytb >> "%SystemRoot%\System32\drivers\etc\hosts"
del hosts_ytb
goto replaceSuccess

:replaceHostGYP
wget -q --no-check-certificate https://raw.githubusercontent.com/racaljk/hosts/master/hosts -O "%SystemRoot%\System32\drivers\etc\hosts"
wget -q --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/y -O hosts_ytb
wget -q --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/p -O hosts_play
@echo. >> "%SystemRoot%\System32\drivers\etc\hosts"
type hosts_ytb >> "%SystemRoot%\System32\drivers\etc\hosts"
@echo. >> "%SystemRoot%\System32\drivers\etc\hosts"
type hosts_play >> "%SystemRoot%\System32\drivers\etc\hosts"
del hosts_ytb
del hosts_play
goto replaceSuccess

:replaceSuccess
ipconfig /flushdns
cls
color 2f
echo.-------------------------------------------------------------------------
echo.
echo 恭喜您，覆盖本地hosts并刷新本地DNS解析缓存成功!
echo.
echo.谷歌这些网站记得使用https进行加密访问！
echo.
echo.即：https://www.google.com
echo.
echo.或者：https://www.google.com/ncr
echo.      https://www.google.com.hk/ncr
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