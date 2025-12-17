@echo off
chcp 65001 >nul
echo Загрузка файлов в GitHub...
echo.

:: Настройки
git config --global --add safe.directory "%CD%"
git config --global --add safe.directory "C:/Users/Aziz/Documents/Dox/ОССТ"
git config user.name "Aziz Yuldashev"
git config user.email "nicktofal@gmail.com"

:: Сначала pull (получить изменения с GitHub)
echo Получаю изменения с GitHub...
git pull origin main --allow-unrelated-histories

:: Добавить файлы
echo Добавляю файлы...
git add .

:: Коммит
echo Создаю коммит...
git commit -m "Update: %date%"

:: Push
echo Отправляю на GitHub...
git push origin main

echo.
echo =============================
echo ✓ Файлы успешно загружены!
echo =============================
pause