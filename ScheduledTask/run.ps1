function logWrite {
    $log = $input -join ""
    $log = (Get-Date -Format "yyyyMMdd-HH:mm:ss ") + $log
    $log | Out-File -FilePath ($env:USERPROFILE | Join-Path -ChildPath "Desktop\Keyhac-startup-error.log") -Append
}

$src = (Get-Command wezterm-gui.exe -ErrorAction SilentlyContinue).Source.Replace("shims", "apps\wezterm\current")
if (-not (Test-Path $src)) {
    "Wezterm not found." | logWrite
    [System.Environment]::exit(1)
}

try {
    Start-Process -FilePath $src -ErrorAction Stop -NoNewWindow
    Write-Host "Starting Wezterm.exe..."
    [System.Environment]::exit(0)
}
catch {
    $_ | logWrite
    [System.Environment]::exit(1)
}
