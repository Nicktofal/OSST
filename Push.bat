@echo off
chcp 65001 >nul
git config --global --add safe.directory "%CD%"
git config --global --add safe.directory "C:/Users/Aziz/Documents/Dox/ОССТ"
git config user.name "Aziz Yuldashev"
git config user.email "nicktofal@gmail.com"
git add .
git commit -m "Update"
git push -u origin main
pause