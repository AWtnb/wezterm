
$src = (Get-Command wezterm-gui.exe -ErrorAction SilentlyContinue).Source
if ($src) {
    $startup = [Environment]::GetFolderPath("Startup")
    $lnk = Join-Path $startup "wezterm.lnk"
    $ws = New-Object -ComObject WScript.Shell
    $sc = $ws.CreateShortcut($lnk)
    $sc.TargetPath = $src
    $sc.Save()
}