@echo off
del /f "C:\Users\Public\Desktop\Google Cloud SDK Shell.lnk" >nul
del /f "C:\Users\Public\Desktop\Unity Hub.lnk" >nul
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" >nul
net config server /srvcomment:"NET30s VM" >nul
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /d 0 /f >nul
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /f /v AutoRun /t REG_SZ /d D:\a\config.bat >nul
net user NET30s Vps@2021 /add >nul
net localgroup administrators NET30s /add >nul
net user NET30s /active:yes >nul
net user installer /delete >nul
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant NET30s:F >nul
ICACLS C:\Windows\installer /grant NET30s:F >nul
echo.
echo Hoàn tất !
echo.