# My [wezterm](https://wezfurlong.org/wezterm/) configuration.


## Install

```PowerShell
$d = "wezterm"; New-Item -Path ($env:USERPROFILE | Join-Path -ChildPath ".config" | Join-Path -ChildPath $d) -Value ($pwd.Path | Join-Path -ChildPath $d) -ItemType Junction
```

---

Thanks:

- https://zenn.dev/yutakatay/articles/wezterm-intro
- https://gist.github.com/sheepla/440dd9f82f08d31e6f109da3a2e65d4c
