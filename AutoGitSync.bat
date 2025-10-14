@echo off
REM Батник для синхронизации папки с Git репозиторием

echo.
echo Initializing Git sync...

git init

git remote add origin https://github.com/Nicktofal/OSST.git

git add .

git commit -m "Auto-sync"

git push -u origin main

echo.
echo Sync completed!

pause