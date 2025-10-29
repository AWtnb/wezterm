$config = Get-Content -Path $($PSScriptRoot | Join-Path -ChildPath "config.json") | ConvertFrom-Json
$taskPath = $config.taskPath
if (-not $taskPath.StartsWith("\")) {
    $taskPath = "\" + $taskPath
}
if (-not $taskPath.EndsWith("\")) {
    $taskPath = $taskPath + "\"
}

$src = (Get-Command wezterm-gui.exe -ErrorAction SilentlyContinue).Source.Replace("shims", "apps\wezterm\current")
if (-not (Test-Path $src)) {
    "Wezterm not found." | Write-Host
}
else {
    $action = New-ScheduledTaskAction -Execute $src
    $trigger = New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
    Register-ScheduledTask -TaskName "startup" `
        -TaskPath $taskPath `
        -Action $action `
        -Trigger $trigger `
        -Description "Run wezterm on startup." `
        -Settings $settings `
        -Force
}
