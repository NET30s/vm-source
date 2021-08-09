@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo Looking for Admin Access!
goto UACPrompt
) else ( goto Meet Admin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:Meet Admin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\" /V Hostname /T REG_SZ /D NET30s /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\" /V AD Host /T REG_SZ /D NET30s /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarSmallIcons /T REG_DWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V HideFileExt /T REG_DWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarGlomLevel /T REG_DWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /V {20D04FE0-3AEA-1069-A2D8-08002B30309D} /T REG_DWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /V {20D04FE0-3AEA-1069-A2D8-08002B30309D} /T REG_DWORD /D 0 /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /F
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /F
DEL /F /Q "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Internet Explorer.lnk"
taskkill.exe /f /im explorer.exe
start explorer.exe
