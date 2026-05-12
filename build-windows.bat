@echo off
REM Build Windows EXE locally (Windows)

setlocal enabledelayedexpansion

echo.
echo 0x20 Building Hotspot Bypass VPN - Windows EXE
echo ==============================================

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH.
    exit /b 1
)

REM Check if windows_app directory exists
if not exist "windows_app" (
    echo Error: windows_app directory not found.
    exit /b 1
)

cd windows_app

REM Install dependencies
echo Installing dependencies...
pip install --upgrade pip
pip install pyinstaller pyside6 requests

REM Build EXE
echo Building PhoneProxyManager.exe with PyInstaller...
pyinstaller --onefile --windowed --name "PhoneProxyManager" PhoneProxyManager.py

echo.
echo ✓ Build Complete!
echo ==============================================
echo Executable located at:
echo    dist\PhoneProxyManager.exe
echo.
