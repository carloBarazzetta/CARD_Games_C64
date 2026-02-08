@echo off
set VICE=D:\App\GTK3VICE-win64\bin\x64sc.exe

rem Se passato da riga di comando, usa direttamente il parametro
if not "%~1"=="" (
    set DISK=%~1
    goto :resolve
)

echo ============================================
echo   VICE C64 Emulator - Autostart D64
echo ============================================
echo.
echo File .D64 disponibili nella cartella corrente:
echo.
dir /b *.D64 2>nul
if errorlevel 1 echo   (nessun file .D64 trovato)
echo.
echo ============================================
echo.
set /p DISK="Nome del disco (senza .D64): "

if "%DISK%"=="" (
    echo Nessun disco specificato.
    exit /b 1
)

:resolve

rem Rimuove .D64 se presente, poi la riaggiunge sempre
if /i "%DISK:~-4%"==".D64" set DISK=%DISK:~0,-4%

rem Se non ha path completa, cerca nella cartella corrente
echo %DISK% | findstr /r "^[A-Za-z]:\\ ^\\\\">nul
if errorlevel 1 (
    set DISK=%CD%\%DISK%
)

set DISK=%DISK%.D64

if not exist "%DISK%" (
    echo File non trovato: %DISK%
    exit /b 1
)

echo Avvio: %DISK%
start "" "%VICE%" -autostart "%DISK%"
