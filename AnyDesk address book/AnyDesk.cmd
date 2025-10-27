@echo off

if exist "C:\Program Files (x86)\AnyDesk\" (
	set PathToAnyDesk="C:\Program Files (x86)\AnyDesk\"
	set run=AnyDesk.exe
) else if exist "C:\Program Files (x86)\AnyDeskMSI\" (
	set PathToAnyDesk=C:\"Program Files (x86)"\AnyDeskMSI\
	set run=AnyDeskMSI.exe
) else ( 
echo dir not fount.
timeout 5
EXIT 0 )

if exist "address.csv" (
powershell "Import-Csv .\address.csv -Encoding UTF8 | Sort-Object Name"
) else ( echo "address.csv not found")

set /p addr=
set "addr=%addr: =%"

%PathToAnyDesk%\%run% %addr% --plain

taskkill.exe /im anydesk* /f /t
