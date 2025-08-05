@echo off
:: Get the current date and time
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)

for /f "tokens=1-2 delims=: " %%i in ("%time%") do (
    set "hour=%%i"
    set "minute=%%j"
)

:: Fix for 12-hour format and AM/PM
setlocal enabledelayedexpansion
set "timeStr=%time%"
set "AMPM=AM"
set "hour=%hour: =0%"
set "hourInt=%hour%"

if %hourInt% GEQ 12 (
    set "AMPM=PM"
    if not %hourInt%==12 (
        set /a hourInt=hourInt-12
    )
) else (
    if %hourInt%==0 set hourInt=12
)

:: Convert month number to name
set "monthName="
for /f "tokens=1-12" %%m in ("January February March April May June July August September October November December") do (
    if "!month!"=="01" set "monthName=%%m"
    if "!month!"=="1"  set "monthName=%%m"
    if "!month!"=="02" set "monthName=%%m"
    if "!month!"=="2"  set "monthName=%%m"
    if "!month!"=="03" set "monthName=%%m"
    if "!month!"=="3"  set "monthName=%%m"
    if "!month!"=="04" set "monthName=%%m"
    if "!month!"=="4"  set "monthName=%%m"
    if "!month!"=="05" set "monthName=%%m"
    if "!month!"=="5"  set "monthName=%%m"
    if "!month!"=="06" set "monthName=%%m"
    if "!month!"=="6"  set "monthName=%%m"
    if "!month!"=="07" set "monthName=%%m"
    if "!month!"=="7"  set "monthName=%%m"
    if "!month!"=="08" set "monthName=%%m"
    if "!month!"=="8"  set "monthName=%%m"
    if "!month!"=="09" set "monthName=%%m"
    if "!month!"=="9"  set "monthName=%%m"
    if "!month!"=="10" set "monthName=%%m"
    if "!month!"=="11" set "monthName=%%m"
    if "!month!"=="12" set "monthName=%%m"
)

:: Final folder name
set "folderName=%day%-%monthName%-%year%-%hourInt%-%minute%-%AMPM%"

:: Create folder
mkdir "D:\RAJDEEP\%folderName%"
echo Folder created: D:\RAJDEEP\%folderName%
pause
