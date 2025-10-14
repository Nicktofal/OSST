@echo off
REM Батник для синхронизации папки с Git

git init

git remote add origin "https://github.com/Nicktofal/OSST.git"

git add .

git commit -m "Auto-sync from bat script"

git push -u origin master

pause