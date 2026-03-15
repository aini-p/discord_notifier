@echo off
echo Building discord_notifier.exe...

REM Activate virtualenv if you want to run python scripts before, but for pyinstaller it's often easier to just call the executable directly.
call .\.venv\Scripts\pyinstaller.exe --onefile --name discord_notifier main.py

echo.
echo Build finished!
echo The executable file 'discord_notifier.exe' can be found in the 'dist' folder.
echo.
pause
