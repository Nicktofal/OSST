@echo off
echo Removing broken Lab2 submodule...

REM Удаляем папку Lab2
rmdir /s /q "Lab2"

REM Скачиваем заново только Lab2
git submodule update --init --recursive

echo Lab2 fixed!
pause