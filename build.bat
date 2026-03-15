@echo off
setlocal

REM Define the path to the virtual environment
set "VENV_DIR=.venv"

REM --- 1. Setup Virtual Environment ---
echo Checking for virtual environment...
if not exist "%VENV_DIR%\Scripts\python.exe" (
    echo Virtual environment not found. Creating one...
    python -m venv %VENV_DIR%
    if %errorlevel% neq 0 (
        echo Failed to create virtual environment.
        pause
        exit /b %errorlevel%
    )
    echo Virtual environment created.
) else (
    echo Virtual environment already exists.
)

REM --- 2. Install Requirements ---
echo Installing requirements from requirements.txt...
call %VENV_DIR%\Scripts\activate.bat
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo Failed to install requirements.
    pause
    exit /b %errorlevel%
)
echo Requirements installed.

REM --- 3. Build Executable ---
REM Create directories beforehand to prevent potential path-not-found errors.
if not exist "build" mkdir build
if not exist "dist" mkdir dist

echo Building discord_notifier.exe...
pyinstaller --onefile --name discord_notifier main.py
if %errorlevel% neq 0 (
    echo Failed to build the executable.
    pause
    exit /b %errorlevel%
)

echo.
echo Build finished!
echo The executable file 'discord_notifier.exe' can be found in the 'dist' folder.
echo.
pause
endlocal

