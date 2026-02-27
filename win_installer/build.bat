@echo off
chcp 65001 >nul
REM HomeoRemedyTest Build Script for Windows
REM This script builds the executable using PyInstaller

echo ============================================================
echo HomeoRemedyTest - Сборка Windows приложения
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

REM Upgrade pip
echo 📦 Обновление pip...
python -m pip install --upgrade pip --quiet

REM Install dependencies
echo 📦 Установка зависимостей...
pip install -r requirements.txt --quiet
pip install pyinstaller==6.11.1 --quiet
echo ✅ Зависимости установлены
echo.

REM Clean previous builds
echo 🧹 Очистка предыдущих сборок...
if exist "build" rmdir /s /q "build"
if exist "dist" rmdir /s /q "dist"

REM Build with PyInstaller
echo 🔨 Сборка приложения с помощью PyInstaller...
pyinstaller homeoremedytest.spec --clean
if errorlevel 1 (
    echo ❌ Ошибка сборки!
    echo Проверьте логи выше для деталей.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo ✅ Сборка завершена успешно!
echo ============================================================
echo.
echo 📁 Исполняемый файл находится в папке: dist\HomeoRemedyTest
echo.
echo ▶️  Для запуска приложения выполните:
echo    dist\HomeoRemedyTest\HomeoRemedyTest.exe
echo.
echo 📝 Для создания установщика запустите:
echo    build_installer.bat
echo.
echo ============================================================
pause
