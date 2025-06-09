local wezterm = require "wezterm";

wezterm.on("format-window-title", function()
    return "PowerShell"
end)

local act = wezterm.action
local config = {}

config.font = wezterm.font_with_fallback({{
    family = "PlemolJP Console",
    weight = "Medium"
}, {
    family = "HackGen",
    weight = "Regular"
}, {
    family = "UDEV Gothic",
    weight = "Regular"
}, {
    family = "MS Gothic"
}})

config.font_size = 14.0

config.front_end = "OpenGL"

config.hide_tab_bar_if_only_one_tab = true

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Molokai (Gogh)"

config.disable_default_key_bindings = true
config.use_ime = true
config.default_prog = {"pwsh.exe", "-WorkingDirectory", string.format("C:\\Users\\%s\\Desktop", os.getenv("USERNAME"))}

config.default_cursor_style = "SteadyBar"

-- https://wezfurlong.org/wezterm/config/default-keys.html
config.keys = {{
    key = "c",
    mods = "CTRL|SHIFT",
    action = act {
        CopyTo = "Clipboard"
    }
}, {
    key = "v",
    mods = "CTRL",
    action = act {
        PasteFrom = "Clipboard"
    }
}, {
    key = "U",
    mods = "CTRL|SHIFT",
    action = act.ActivateCopyMode
}, {
    key = "t",
    mods = "CTRL",
    action = act {
        SpawnTab = "CurrentPaneDomain"
    }
}, {
    key = "Tab",
    mods = "CTRL",
    action = act {
        ActivateTabRelative = 1
    }
}, {
    key = "Tab",
    mods = "CTRL|SHIFT",
    action = act {
        ActivateTabRelative = -1
    }
}, {
    key = "w",
    mods = "CTRL",
    action = act.CloseCurrentTab {
        confirm = true
    }
}, {
    key = "0",
    mods = "CTRL|ALT",
    action = act.ResetFontSize
}}

config.mouse_bindings = {{
    -- Bind 'Up' event of CTRL-Click to open hyperlinks
    event = {
        Up = {
            streak = 1,
            button = "Left"
        }
    },
    mods = "CTRL",
    action = act.OpenLinkAtMouseCursor
}, {
    -- Scrolling up while holding CTRL increases the font size
    event = {
        Down = {
            streak = 1,
            button = {
                WheelUp = 1
            }
        }
    },
    mods = "CTRL",
    action = act.IncreaseFontSize
}, {
    -- Scrolling down while holding CTRL decreases the font size
    event = {
        Down = {
            streak = 1,
            button = {
                WheelDown = 1
            }
        }
    },
    mods = "CTRL",
    action = act.DecreaseFontSize
}}

return config
