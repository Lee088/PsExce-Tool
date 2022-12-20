@echo off

:menu
echo.
echo ...............................................
echo PRESS 1, 2, 3, 4, 5, 6, to select your task, or 7 to EXIT.
echo ...............................................
echo.
echo 1 - Remote CMD
echo 2 - Remote CMD as admin
echo 3 - Run ipconfig /all on Remote PC
echo 4 - Run gpupdate /force on Remote PC
echo 5 - See Group Policy applied to Remote PC
echo 6 - See the uptime on a Remote PC
echo 7 - EXIT
echo.

set /p choice=Type 1, 2, 3, 4, 5, 6 or 7 then press ENTER:

if "%choice%" == "1" goto cmd
if "%choice%" == "2" goto cmdad
if "%choice%" == "3" goto ipconfigall
if "%choice%" == "4" goto gpupdateforce
if "%choice%" == "5" goto gpsee
if "%choice%" == "6" goto uptime
if "%choice%" == "7" goto eof

:cmd
cd "PATH_TO_PSTOOLS"
set /p computer=Enter the name or IP of the remote computer: 
psexec \\%computer% cmd
goto menu

:cmdad
cd "PATH_TO_PSTOOLS"
set /p computer=Enter the name or IP of the remote computer: 
set /p username=Enter your username: 
set /p password=Enter your password: 
psexec \\%computer% -h -u wvago\%username% -p %password% cmd
goto menu

:ipconfigall
cd "PATH_TO_PSTOOLS"
set /p computer=Enter the name or IP of the remote computer: 
psexec \\%computer% ipconfig /all
goto menu

:gpupdateforce
cd "PATH_TO_PSTOOLS"
set /p computer=Enter the name or IP of the remote computer: 
psexec \\%computer% gpupdate /force
goto menu

:gpsee
cd "PATH_TO_PSTOOLS"
set /p computer=Enter the name or IP of the remote computer: 
psexec \\%computer% gpresult /r /scope:computer
goto menu

:uptime
cd "PATH_TO_PSTOOLS"
set /p computer=Enter the name or IP of the remote computer: 
psexec \\%computer% wmic path Win32_OperatingSystem get LastBootUpTime
goto menu
