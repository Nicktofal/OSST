@echo off

:START

echo Current:
git config --global user.name
git config --global user.email
echo.

set /p action="Enter (1 - My config) (2 - Clear): "

if "%action%"=="1" goto SET_CONFIG
if "%action%"=="2" goto CLEAR_CONFIG
goto START

:SET_CONFIG
git config --global user.name "Aziz Yuldashev"
git config --global user.email "nicktofal@gmail.com"
echo.
echo Configurated
echo.
goto START

:CLEAR_CONFIG
git config --global --unset user.name
git config --global --unset user.email
echo.
echo Cleared
echo.
goto START