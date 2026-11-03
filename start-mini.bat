@echo off
rem Shangban Guliqi - open index.html as a small app window (Chrome or Edge).
rem Usage: double-click, or:  start-mini.bat "demo=offwork"   or   start-mini.bat "demo=100&speed=60"
rem The URL is built by PowerShell so folders with Chinese names or spaces work.
setlocal
set "LSK_HERE=%~dp0"
set "LSK_HASH=%*"
if defined LSK_HASH set "LSK_HASH=%LSK_HASH:"=%"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$u=([Uri](Join-Path $env:LSK_HERE 'index.html')).AbsoluteUri; if($env:LSK_HASH){$u+='#'+$env:LSK_HASH};" ^
  "$c=@(\"$env:ProgramFiles\Google\Chrome\Application\chrome.exe\",\"${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe\",\"$env:LocalAppData\Google\Chrome\Application\chrome.exe\",\"${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe\",\"$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe\") | ?{ $_ -and (Test-Path $_) } | select -First 1;" ^
  "if($c){ Start-Process $c -ArgumentList ('--app=\"'+$u+'\"'),'--window-size=400,640' } else { Write-Host 'Chrome / Edge not found, opening with the default browser...'; Start-Process (Join-Path $env:LSK_HERE 'index.html') }"
endlocal
