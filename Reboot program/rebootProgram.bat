@echo off

set i=testConsole.exe

:loop

start "" %i%

timeout /t 86400 /nobreak

taskkill /f /im %i%

goto loop