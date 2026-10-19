```bat
@echo off
setlocal
cd /d "%~dp0"

call gradlew.bat --stop
call gradlew.bat run

pause
```