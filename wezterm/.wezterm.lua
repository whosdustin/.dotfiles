local wezterm = require "wezterm"

local c = wezterm.config_builder()

c.color_scheme = "catppuccin-mocha"
c.font_size = 20
c.font = wezterm.font "JetBrains Mono"

c.window_decorations = "RESIZE"
c.enable_tab_bar = false

return c

