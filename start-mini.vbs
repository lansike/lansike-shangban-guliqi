Option Explicit
' Silent launcher: hide PowerShell window, open mini Chrome/Edge app.
Dim fso, sh, here, ps1, cmd
Set fso = CreateObject("Scripting.FileSystemObject")
Set sh = CreateObject("WScript.Shell")
here = fso.GetParentFolderName(WScript.ScriptFullName)
ps1 = fso.BuildPath(here, "open-mini.ps1")
sh.Environment("Process")("LSK_HERE") = here
sh.Environment("Process")("LSK_HASH") = ""
cmd = "powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & ps1 & """"
sh.Run cmd, 0, False
