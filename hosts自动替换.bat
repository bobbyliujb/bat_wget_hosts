chcp 936 &gt;nul
@echo off
mode con lines=42 cols=80
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

:main
cls
color 2f
echo        �̡�    �̡�  �̡̡�      �̡̡̡�  �̡̡̡̡�    �̡̡̡�
echo          ��    ��  ��      ��  ��      ��  ��  ��  ��  ��      ��
echo          ��    ��  ��      ��  ��              ��      ��
echo          �̡̡̡�  ��      ��    �̡�          ��        �̡�
echo          ��    ��  ��      ��        ��        ��            ��
echo          ��    ��  ��      ��          ��      ��              ��
echo          ��    ��  ��      ��  ��      ��      ��      ��      ��
echo        �̡�    �̡�  �̡̡�    �̡̡̡�      �̡̡�    �̡̡̡�
echo.-------------------------------------------------------------------------
echo.����360�����ԹܼҵȰ�ȫ������ѣ��빴ѡ��������Ͳ������ѣ�
echo.
echo.���棺ִ�и����� ����hosts�����Զ��滻���ǣ�
echo.����ԭ�ȵ�hosts���Լ��޸Ĺ�����Ҫ��Ϣ�������б��ݣ�
color 2e
echo.-------------------------------------------------------------------------
echo.���������Ӧ�������ѡ��ʹ�á�
echo.
echo. 1.�״�ʹ��/ʹ����ͨhosts��Google+FB+Gmail...��
echo.
echo. 2.ʹ����ǿhosts��Google+FB+Gmail... + Youtube��
echo.
echo. 3.ʹ�ð���hosts��Google+FB+Gmail... + Youtube + GooglePlay��
echo.
echo. 4.�ָ�Ĭ��hosts
echo.-------------------------------------------------------------------------

if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p select=���������ֲ����س���ȷ��:

echo.
if %select%==4 goto defaultHost
if %select%==3 goto replaceHostGYP
if %select%==2 goto replaceHostGY
if %select%==1 goto replaceHostG
cls
echo ����������������ѡ��
ping 127.0.1 -n "2">nul
goto main

:Win7Choice
choice /c 1234 /n /m "��������Ӧ���֣�"
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
echo ��ϲ�������Ǳ���hosts��ˢ�±���DNS��������ɹ�!
echo.
echo.�ȸ���Щ��վ�ǵ�ʹ��https���м��ܷ��ʣ�
echo.
echo.����https://www.google.com
echo.
echo.���ߣ�https://www.google.com/ncr
echo.      https://www.google.com.hk/ncr
echo.
goto end


:defaultHost
cls
color 2f
@echo # Localhost (DO NOT REMOVE!!!) > %SystemRoot%\System32\drivers\etc\hosts
@echo 127.0.0.1	localhost >> %SystemRoot%\System32\drivers\etc\hosts
@echo ::1	localhost ip6-localhost ip6-loopback >> %SystemRoot%\System32\drivers\etc\hosts
echo ��ϲ����hosts�ָ��ɹ�!
echo.
goto end

:end
echo �밴������˳���
@Pause>nul