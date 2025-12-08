$d = "wezterm"
$dataPath = $env:USERPROFILE | Join-Path -ChildPath ".config" | Join-Path -ChildPath $d
$srcPath = $PSScriptRoot | Join-Path -ChildPath $d
New-Item -Path $dataPath -Value $srcPath -ItemType Junction -Confirm -Force
