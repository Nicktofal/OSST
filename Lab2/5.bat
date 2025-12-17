@echo off
REM Задание 5: Поиск минимального и максимального числа

setlocal enabledelayedexpansion

:input_loop
    set /p "INPUT=Enter number: "
    if "%INPUT%"=="-" GOTO end
    set /a "NUMBER=%INPUT%"

    if not defined MIN (
        set /a "MIN=%NUMBER%"
        set /a "MAX=%NUMBER%"
    ) else (
        if !NUMBER! lss !MIN! set /a "MIN=!NUMBER!"
        if !NUMBER! gtr !MAX! set /a "MAX=!NUMBER!"
    )
GOTO input_loop

:end
echo.
echo Minimum: %MIN%
echo Maximum: %MAX%

pause