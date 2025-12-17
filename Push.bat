@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Конфигурация
set REPO_URL=https://github.com/Nicktofal/OSST.git
set USER_NAME=Aziz Yuldashev
set USER_EMAIL=nicktofal@gmail.com

echo ========================================
echo GitHub Auto Push для Aziz Yuldashev
echo ========================================
echo.

:: Исправление проблемы с безопасностью Git для пути с запятой
echo Проверка настроек безопасности Git...
git config --global --add safe.directory "%CD%" 2>nul
git config --global --add safe.directory "C:/Users/Aziz/Documents/,Dox/ОССТ" 2>nul

:: Проверка и инициализация репозитория
if not exist ".git" (
    echo Инициализация нового репозитория...
    git init
    echo [OK] Репозиторий создан
) else (
    echo [OK] Репозиторий уже инициализирован
)

:: Настройка пользователя
git config user.name "%USER_NAME%"
git config user.email "%USER_EMAIL%"
echo [OK] Пользователь настроен: %USER_NAME%

:: Настройка удаленного репозитория
git remote | findstr "origin" >nul
if errorlevel 1 (
    git remote add origin "%REPO_URL%"
    echo [OK] Удаленный репозиторий добавлен
) else (
    git remote set-url origin "%REPO_URL%"
    echo [OK] Удаленный репозиторий обновлен
)

echo.
echo Текущие изменения:
git status --short

echo.
set /p ADD_FILES="Добавить все файлы? (Y/N, по умолчанию Y): "
if /i "!ADD_FILES!"=="N" (
    set /p FILE_PATTERN="Введите шаблон файлов для добавления: "
    git add "!FILE_PATTERN!"
) else (
    git add .
)
echo [OK] Файлы добавлены в индекс

echo.
:: Проверка наличия изменений для коммита
git diff --cached --quiet >nul 2>&1
if !errorlevel! equ 0 (
    echo Нет изменений для коммита.
    pause
    exit /b 0
)

:: Сообщение коммита
echo Введите сообщение коммита (или Enter для стандартного):
set /p COMMIT_MSG=
if "!COMMIT_MSG!"=="" (
    for /f "tokens=1-3 delims=./- " %%a in ("%date%") do (
        set DAY=%%a
        set MON=%%b
        set YEAR=%%c
    )
    set COMMIT_MSG=Update: !YEAR!-!MON!-!DAY!
)

:: Создание коммита
git commit -m "!COMMIT_MSG!"
echo [OK] Коммит создан

echo.
echo Отправка на GitHub...
git push -u origin master 2>nul
if errorlevel 1 (
    echo Попытка отправить в ветку main...
    git push -u origin main 2>nul
)

if !errorlevel! equ 0 (
    echo.
    echo ========================================
    echo [УСПЕХ] Файлы загружены на GitHub
    echo Репозиторий: %REPO_URL%
    echo ========================================
) else (
    echo.
    echo ========================================
    echo [ОШИБКА] При отправке
    echo Проверьте:
    echo 1. Подключение к интернету
    echo 2. Токен доступа GitHub
    echo ========================================
)

echo.
pause