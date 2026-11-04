@echo off
rem Shangban Guliqi - open index.html as a small app window (Chrome or Edge).
rem Usage (keep the quotes): double-click, or:  start-mini.bat "demo=offwork"   or   start-mini.bat "demo=100&speed=60"
rem Double-click with no args hands off to start-mini.vbs (no black CMD for the user).
rem Agent / CLI with hash args: keep this bat path; PowerShell runs hidden.
setlocal
set "LSK_HERE=%~dp0"
set "LSK_HASH=%~1"
if "%~1"=="" (
  if not defined LSK_SILENT (
    start "" wscript //nologo "%~dp0start-mini.vbs"
    exit /b 0
  )
  wscript //nologo "%~dp0start-mini.vbs"
  exit /b 0
)
powershell -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File "%~dp0open-mini.ps1"
endlocal
