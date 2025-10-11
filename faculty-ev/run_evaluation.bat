@echo off
title UNIPLEX Faculty Evaluation Auto-Filler
color 0A

echo =========================================
echo   FACULTY EVALUATION AUTO-FILLER
echo =========================================
echo.

:: Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH
    echo Please install Python from https://www.python.org/
    pause
    exit /b 1
)

:: Check if pip is available
pip --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] pip is not installed
    pause
    exit /b 1
)

:: Install required packages if not already installed
echo [*] Checking and installing required packages...
echo.

pip show selenium >nul 2>&1
if errorlevel 1 (
    echo Installing Selenium...
    pip install selenium
)

:: Check if ChromeDriver is needed
echo.
echo [*] Make sure you have:
echo     1. Google Chrome installed
echo     2. ChromeDriver downloaded and in PATH
echo        Download from: https://chromedriver.chromium.org/
echo.
echo Press any key to continue...
pause >nul

:: Run the Python script
echo.
echo [*] Starting Faculty Evaluation Auto-Filler...
echo =========================================
python faculty_evaluation_autofiller.py

:: Keep window open after completion
echo.
echo =========================================
echo Process completed!
pause