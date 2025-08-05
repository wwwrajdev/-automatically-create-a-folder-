@echo off
:: Set drive and parent folder
set "parent=E:\RAJDEEP"

:: Get date and format it
for /f "tokens=1-3 delims=/.- " %%a in ('date /t') do (
    set day=%%a
    set month=%%b
    set year=%%c
)

:: Handle different regional date formats (like DD-MM-YYYY or MM-DD-YYYY)
:: Try to detect the year based on length (assuming 4-digit year)
if "%year:~2,1%"=="" (
    :: Year is probably %%a
    set "year=%day%"
    set "day=%b%"
    set "month=%c%"
)

:: Convert numeric month to name
set monthname=
for %%M in (
    "01 JANUARY" "02 FEBRUARY" "03 MARCH" "04 APRIL"
    "05 MAY" "06 JUNE" "07 JULY" "08 AUGUST"
    "09 SEPTEMBER" "10 OCTOBER" "11 NOVEMBER" "12 DECEMBER"
) do (
    for /f "tokens=1,2" %%x in (%%M) do (
        if "%%x"=="%month%" set monthname=%%y
    )
)

:: Format final folder name like 05-JULY-2025
set foldername=%day%-%monthname%-%year%

:: Create folder if not exist
set "target=%parent%\%foldername%"
if not exist "%target%" (
    mkdir "%target%"
    echo Folder created: %target%
) else (
    echo Folder already exists: %target%
)

pause
