@echo off
REM Задание 6: Подсчет общего количества подкаталогов

set /p "TARGET_DIR=Enter directory path: "

echo.
echo Counting subdirectories...

set /a "DIR_COUNT=0"

for /f "delims=" %%D in ('dir "%TARGET_DIR%" /ad') do (
    set /a "DIR_COUNT+=1"
)

echo %DIR_COUNT%

pause