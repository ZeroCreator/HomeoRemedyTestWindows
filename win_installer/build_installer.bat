@echo off
chcp 65001 >nul
REM HomeoRemedyTest Installer Build Script
REM Creates Windows Installer using Inno Setup

echo ============================================================
echo HomeoRemedyTest - Создание установщика Windows
echo ============================================================
echo.

REM Check if Inno Setup is installed
set "INNO_SETUP=C:\Program Files (x86)\Inno Setup 6\ISCC.exe"
if not exist "%INNO_SETUP%" (
    set "INNO_SETUP=C:\Program Files\Inno Setup 6\ISCC.exe"
)

if not exist "%INNO_SETUP%" (
    echo ⚠️  Inno Setup не найден!
    echo.
    echo 📥 Установите Inno Setup:
    echo    https://jrsoftware.org/isdl.php#stable
    echo.
    echo Или используйте альтернативный метод:
    echo    1. Сначала запустите build.bat для создания executable
    echo    2. Затем вручную создайте установщик
    echo.
    pause
    exit /b 1
)

echo ✅ Inno Setup найден: %INNO_SETUP%
echo.

REM Check if dist folder exists
if not exist "dist\HomeoRemedyTest" (
    echo ❌ Папка dist\HomeoRemedyTest не найдена!
    echo Сначала запустите build.bat для сборки приложения.
    pause
    exit /b 1
)

echo 📦 Создание установщика...
echo.

REM Compile the installer
"%INNO_SETUP%" homeoremedytest_installer.iss
if errorlevel 1 (
    echo ❌ Ошибка создания установщика!
    pause
    exit /b 1
)

echo.
echo ============================================================
echo ✅ Установщик создан успешно!
echo ============================================================
echo.
echo 📁 Файл установщика находится в: Output\HomeoRemedyTest-Setup.exe
echo.
echo ▶️  Запустите установщик для установки приложения
echo.
echo ============================================================
pause
