@echo off
:MENU

ECHO.
ECHO ...............................................
ECHO PRESS 1, 2, 3, 4, 5, 6, to select your task, or 7 to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - Remote CMD
ECHO 2 - Remote CMD as admin
ECHO 3 - Run IP ipconfig /all Remote PC
ECHO 4 - Run gpupdate /force on Remote PC
ECHO 5 - See Group Policy applied to Remote PC
ECHO 6 - See The Up Time on a Remote PC
ECHO 7 - EXIT
ECHO.

SET /P M=Type 1, 2, 3, 4, 5, 6 or 7 then press ENTER:
IF %M%==1 GOTO CMD
IF %M%==2 GOTO CMDAD
IF %M%==3 GOTO IPCONALL
IF %M%==4 GOTO GPFORCE
IF %M%==5 GOTO GPSEE
IF %M%==6 GOTO UPTIME
IF %M%==7 GOTO EOF

:CMD
cd C:\PSTools
echo "Please Enter PC IP or Name"
set /p input=""
psexec \\%input% cmd
GOTO MENU

:CMDAD
cd C:\PSTools
echo "Please Enter PC IP or Name"
set /p ip=""
echo "Please Enter Your Username"
set /p un=""
echo "Please Enter Your Password"
set /p pw=""

:: Replace domain with your domain
psexec \\%ip% -h -u domain\%un%  -p %pw% cmd
GOTO MENU

:IPCONALL
cd C:\PSTools
echo "Please Enter PC IP or Name"
set /p ip=""
psexec \\%ip% ipconfig /all
GOTO MENU

:GPFORCE
cd C:\PSTools
echo "Please Enter PC IP or Name"
set /p ip=""
psexec \\%ip% gpupdate /force
GOTO MENU

:GPSEE
cd C:\PSTools
echo "Please Enter PC IP or Name"
set /p ip=""
psexec \\%ip% gpresult /r /scope:computer
GOTO MENU

:UPTIME
cd C:\PSTools
echo "Please Enter PC IP or Name"
set /p ip=""
psexec \\%ip% wmic path Win32_OperatingSystem get LastBootUpTime
GOTO MENU