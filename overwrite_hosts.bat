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
echo.�ɱ�������������cuntom.txt�У�����ӵ��µ�hosts��ĩβ��
color 2e
echo.-------------------------------------------------------------------------
echo.���������Ӧ�������ѡ��ʹ�á�
echo.
echo. 1.�״�ʹ�ã��Ӿ����ȡhosts�ļ���
echo.
echo. 2.ʹ�þ����hosts������޶ȷ���Google��
echo.
echo. 3.ʹ��������hosts������ȫ��Google����
echo.
echo. 4.�ָ�Ĭ��hosts
echo.-------------------------------------------------------------------------

if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p select=���������ֲ����س���ȷ��:

echo.
if %select%==4 goto defaultHost
if %select%==3 goto replaceHostSourceFull
if %select%==2 goto replaceHostSoureeCompact
if %select%==1 goto replaceHostFirstTimeFull
cls
echo ����������������ѡ��
ping 127.0.1 -n "2">nul
goto main

:Win7Choice
choice /c 1234 /n /m "��������Ӧ���֣�"
if errorlevel 4 goto defaultHost
if errorlevel 3 goto replaceHostSourceFull
if errorlevel 2 goto replaceHostSoureeCompact
if errorlevel 1 goto replaceHostFirstTimeFull
cls
goto main

:replaceHostFirstTimeFull
wget -q --no-check-certificate https://coding.net/u/scaffrey/p/hosts/git/raw/master/hosts-files/hosts -O "%SystemRoot%\System32\drivers\etc\hosts"
@echo. >> "%SystemRoot%\System32\drivers\etc\hosts"
type custom.txt >> "%SystemRoot%\System32\drivers\etc\hosts"
goto replaceSuccess

:replaceHostSoureeCompact
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