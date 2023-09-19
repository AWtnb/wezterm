local wezterm = require "wezterm";
local config = {}

config.font = wezterm.font_with_fallback({{
    family = "HackGen",
    weight = "Regular"
}, {
    family = "PlemolJP Console",
    weight = "Medium"
}, {
    family = "MS Gothic"
}})

config.font_size = 14.0

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Bamboo"

config.disable_default_key_bindings = true
config.use_ime = true
config.default_prog = {"pwsh.exe", "-WorkingDirectory", string.format("C:\\Users\\%s\\Desktop", os.getenv("USERNAME"))}

config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- https://wezfurlong.org/wezterm/config/default-keys.html
config.keys = {{
    key = "t",
    mods = "CTRL",
    action = wezterm.action {
        SpawnTab = "CurrentPaneDomain"
    }
}, {
    key = "Tab",
    mods = "CTRL",
    action = wezterm.action {
        ActivateTabRelative = 1
    }
}, {
    key = "Tab",
    mods = "CTRL|SHIFT",
    action = wezterm.action {
        ActivateTabRelative = -1
    }
}, {
    key = "w",
    mods = "CTRL",
    action = wezterm.action.CloseCurrentTab {
        confirm = true
    }
}}

config.mouse_bindings = {
{
    event = {
        Up = {
            streak = 1,
            button = "Left"
        }
    },
    mods = "CTRL",
    action = wezterm.action.OpenLinkAtMouseCursor
}}

return config
