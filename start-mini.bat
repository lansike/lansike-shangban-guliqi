@echo off
rem Shangban Guliqi - open index.html as a small app window (Chrome or Edge).
rem Usage: double-click, or:  start-mini.bat "demo=offwork"   (optional URL params)
setlocal
set "HERE=%~dp0"
set "P=%HERE:\=/%"
set "URL=file:///%P%index.html"
if not "%~1"=="" set "URL=%URL%#%~1"
set "B="
for %%X in ("%ProgramFiles%\Google\Chrome\Application\chrome.exe" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" "%LocalAppData%\Google\Chrome\Application\chrome.exe" "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" "%LocalAppData%\Microsoft\Edge\Application\msedge.exe") do call :pick "%%~X"
if not defined B goto fallback
start "" "%B%" --app="%URL%" --window-size=400,640
goto end
:pick
if defined B goto :eof
if exist "%~1" set "B=%~1"
goto :eof
:fallback
echo Chrome / Edge not found, opening with the default browser...
start "" "%HERE%index.html"
:end
endlocal
