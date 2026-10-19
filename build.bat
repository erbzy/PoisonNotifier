@echo off
call "%~dp0tools\gradle-bootstrap.bat" clean build
exit /b %ERRORLEVEL%
