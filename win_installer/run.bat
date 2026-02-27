@echo off
chcp 65001 >nul
REM HomeoRemedyTest Quick Start Script
REM Quick way to run the application without building

echo ============================================================
echo HomeoRemedyTest - Быстрый запуск
echo ============================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python не найден! Установите Python 3.10 или выше.
    echo Download from: https://www.python.org/downloads/
    pause
    exit /b 1
)

echo ✅ Python найден
python --version
echo.

REM Create virtual environment if it doesn't exist
if not exist "venv" (
    echo 📦 Создание виртуального окружения...
    python -m venv venv
    if errorlevel 1 (
        echo ❌ Ошибка создания виртуального окружения
        pause
        exit /b 1
    )
    echo ✅ Виртуальное окружение создано
) else (
    echo ✅ Виртуальное окружение уже существует
)
echo.

REM Activate virtual environment
echo 🔧 Активация виртуального окружения...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo ❌ Ошибка активации виртуального окружения
    pause
    exit /b 1
)

REM Install dependencies
echo 📦 Проверка зависимостей...
pip install -r requirements.txt --quiet
echo ✅ Зависимости установлены
echo.

REM Run the application
echo 🚀 Запуск приложения...
echo.
echo 📱 Откройте браузер: http://localhost:5001
echo.
echo 💡 Нажмите Ctrl+C для остановки сервера
echo ============================================================
echo.

python app.py

pause
