@echo off
setlocal enabledelayedexpansion

REM ============================================================
REM  build-d64.bat - Build a C64 .D64 disk image from sources
REM  Usage: build-d64.bat <game-folder> [--norun]
REM ============================================================

set VICE_DIR=D:\App\GTK3VICE-win64\bin
set PETCAT=%VICE_DIR%\petcat.exe
set C1541=%VICE_DIR%\c1541.exe
set X64SC=%VICE_DIR%\x64sc.exe
set BASE_DIR=%~dp0
set EXTRACTED_DIR=%BASE_DIR%

if "%~1"=="" (
    echo Usage: build-d64.bat ^<game-folder^> [--norun]
    echo   --norun: skip launching VICE after building
    exit /b 1
)

set GAME=%~1
set GAME_DIR=%EXTRACTED_DIR%\%GAME%
set RUN_VICE=1
if "%~2"=="--norun" set RUN_VICE=0

if not exist "%GAME_DIR%" (
    echo ERROR: Game folder not found: %GAME_DIR%
    exit /b 1
)
if not exist "%GAME_DIR%\build.cfg" (
    echo ERROR: build.cfg not found in %GAME_DIR%
    exit /b 1
)

echo ============================================================
echo  Building %GAME%
echo ============================================================

REM Parse build.cfg
set D64_NAME=
set DISK_LABEL=
set FILE_COUNT=0

for /f "usebackq tokens=1,* delims==" %%A in ("%GAME_DIR%\build.cfg") do call :parse_line "%%A" "%%B"

if "%D64_NAME%"=="" (
    echo ERROR: D64_NAME not defined in build.cfg
    exit /b 1
)

set OUTPUT_D64=%BASE_DIR%..\%D64_NAME%

REM Step 1: Tokenize .bas files
echo.
echo [1/3] Tokenizing BASIC sources...
for /L %%I in (1,1,%FILE_COUNT%) do call :tokenize %%I

REM Step 2: Create D64 and write files
echo.
echo [2/3] Creating %D64_NAME%...
set C1541_ARGS=-format "%DISK_LABEL%" d64 "%OUTPUT_D64%"
for /L %%I in (1,1,%FILE_COUNT%) do call :add_file %%I

"%C1541%" %C1541_ARGS%
if errorlevel 1 (
    echo ERROR: Failed to create D64
    exit /b 1
)

REM Step 3: Verify
echo.
echo [3/3] Verifying disk contents...
"%C1541%" -attach "%OUTPUT_D64%" -list

echo.
echo ============================================================
echo  Build complete: %OUTPUT_D64%
echo ============================================================

if %RUN_VICE%==1 (
    echo.
    echo Launching VICE...
    start "" "%X64SC%" -autostart "%OUTPUT_D64%"
)

endlocal
exit /b 0

REM ============================================================
REM  Subroutines
REM ============================================================

:parse_line
set KEY=%~1
set VAL=%~2
if "%KEY%"=="DISK_LABEL" set DISK_LABEL=%VAL%
if "%KEY%"=="D64_NAME" set D64_NAME=%VAL%
if "%KEY%"=="FILE" (
    set /a FILE_COUNT+=1
    set "FLINE_!FILE_COUNT!=%VAL%"
)
if "%KEY%"=="COPY" (
    set /a FILE_COUNT+=1
    set "FLINE_!FILE_COUNT!=COPY:%VAL%"
)
exit /b 0

:tokenize
set "LINE=!FLINE_%1!"
echo !LINE! | findstr /b "COPY:" >nul
if !errorlevel!==0 exit /b 0
for /f "tokens=1,2,3 delims=," %%a in ("!LINE!") do (
    if "%%c"=="basic" (
        set "BASFILE=%%a"
        set "PRGFILE=!BASFILE:.bas=.prg!"
        echo   petcat: !BASFILE! -^> !PRGFILE!
        "%PETCAT%" -w2 -o "%GAME_DIR%\!PRGFILE!" -- "%GAME_DIR%\!BASFILE!"
    )
)
exit /b 0

:add_file
set "LINE=!FLINE_%1!"
echo !LINE! | findstr /b "COPY:" >nul
if !errorlevel!==0 (
    set "LINE=!LINE:COPY:=!"
    for /f "tokens=1,2,3 delims=," %%a in ("!LINE!") do (
        echo   write: %%a as "%%b"
        set C1541_ARGS=!C1541_ARGS! -write "%EXTRACTED_DIR%\%%a" "%%b"
    )
) else (
    for /f "tokens=1,2,3 delims=," %%a in ("!LINE!") do (
        set "SRCFILE=%%a"
        if "%%c"=="basic" set "SRCFILE=!SRCFILE:.bas=.prg!"
        echo   write: !SRCFILE! as "%%b"
        set C1541_ARGS=!C1541_ARGS! -write "%GAME_DIR%\!SRCFILE!" "%%b"
    )
)
exit /b 0
