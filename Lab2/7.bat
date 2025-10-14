@echo off
REM Задание 7: Поиск общих файлов в двух каталогах

set /p "DIR1=Enter first directory: "
set /p "DIR2=Enter second directory: "

echo.
echo Searching for common files...

for %%F in ("%DIR1%\*") do (
    if exist "%DIR2%\%%~nxF" echo %%~nxF
)

echo.
echo Search completed.

pause