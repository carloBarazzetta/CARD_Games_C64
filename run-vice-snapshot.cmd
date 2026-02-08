@echo off
set VICE=D:\App\GTK3VICE-win64\bin\x64sc.exe

rem Se passato da riga di comando, usa direttamente il parametro
if not "%~1"=="" (
    set SNAP=%~1
    goto :resolve
)

echo ============================================
echo   VICE C64 Emulator - Load Snapshot VSF
echo ============================================
echo.
echo File .vsf disponibili nella cartella corrente:
echo.
dir /b *-vice-snapshot.vsf 2>nul
if errorlevel 1 echo   (nessun file .vsf trovato)
echo.
echo ============================================
echo.
set /p SNAP="Nome del gioco (senza -vice-snapshot.vsf): "

if "%SNAP%"=="" (
    echo Nessun snapshot specificato.
    exit /b 1
)

:resolve
rem Rimuove -vice-snapshot.vsf se presente, poi lo riaggiunge sempre
if /i "%SNAP:~-19%"=="-vice-snapshot.vsf" set SNAP=%SNAP:~0,-19%

rem Se non ha path completa, cerca nella cartella corrente
echo %SNAP% | findstr /r "^[A-Za-z]:\\ ^\\\\">nul
if errorlevel 1 (
    set SNAP=%CD%\%SNAP%
)

set SNAP=%SNAP%-vice-snapshot.vsf

if not exist "%SNAP%" (
    echo File non trovato: %SNAP%
    exit /b 1
)

echo Avvio: %SNAP%
start "" "%VICE%" -autostart "%SNAP%"
