@echo off
call "%~dp0tools\gradle-bootstrap.bat" shadowJar
if errorlevel 1 exit /b %ERRORLEVEL%
echo.
echo Development launcher JAR created at:
echo %~dp0build\libs\poison-resistance-notifier-1.0.0-all.jar
exit /b 0
