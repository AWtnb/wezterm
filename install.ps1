$d = "wezterm"
$dataPath = $env:USERPROFILE | Join-Path -ChildPath ".config" | Join-Path -ChildPath $d
Remove-Item -Path $dataPath -Force -Recurse -ErrorAction SilentlyContinue > $null
$srcPath = $PSScriptRoot | Join-Path -ChildPath $d
New-Item -Path $dataPath -Value $srcPath -ItemType Junction -Force
