# Shangban Guliqi - open index.html as a 400x640 app window (Chrome or Edge).
# Called by start-mini.vbs / start-mini.bat. Reads LSK_HERE and LSK_HASH from env.
$Here = $env:LSK_HERE
if (-not $Here) {
  $Here = Split-Path -Parent $MyInvocation.MyCommand.Path
}
$Hash = $env:LSK_HASH
$u = ([Uri](Join-Path $Here 'index.html')).AbsoluteUri
if ($Hash) { $u = $u + '#' + $Hash }
$candidates = @(
  (Join-Path $env:ProgramFiles 'Google\Chrome\Application\chrome.exe'),
  (Join-Path ${env:ProgramFiles(x86)} 'Google\Chrome\Application\chrome.exe'),
  (Join-Path $env:LocalAppData 'Google\Chrome\Application\chrome.exe'),
  (Join-Path ${env:ProgramFiles(x86)} 'Microsoft\Edge\Application\msedge.exe'),
  (Join-Path $env:ProgramFiles 'Microsoft\Edge\Application\msedge.exe')
)
$c = $candidates | Where-Object { $_ -and (Test-Path -LiteralPath $_) } | Select-Object -First 1
if ($c) {
  Start-Process -FilePath $c -ArgumentList @('--app=' + $u, '--window-size=400,640')
} else {
  Write-Host 'Chrome / Edge not found, opening with the default browser...'
  Start-Process -FilePath (Join-Path $Here 'index.html')
}
