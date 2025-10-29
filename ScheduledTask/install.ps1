$config = Get-Content -Path $($PSScriptRoot | Join-Path -ChildPath "config.json") | ConvertFrom-Json
$taskPath = ("\{0}\" -f $config.taskPath) -replace "^\\+", "\" -replace "\\+$", "\"

$dest = $env:APPDATA | Join-Path -ChildPath $config.appDirName
if (-not (Test-Path $dest -PathType Container)) {
    New-Item -Path $dest -ItemType Directory > $null
}

$src = $PSScriptRoot | Join-Path -ChildPath "run.ps1" | Copy-Item -Destination $dest -PassThru

$action = New-ScheduledTaskAction -Execute powershell.exe -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$src`""
$trigger = New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -TaskName "startup" `
    -TaskPath $taskPath `
    -Action $action `
    -Trigger $trigger `
    -Description "Run wezterm on startup." `
    -Settings $settings `
    -Force
