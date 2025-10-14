@echo off
echo Fixing Lab2 submodule...

REM Инициализируем и обновляем субмодули
git submodule update --init --recursive

echo Lab2 should now be accessible!
pause