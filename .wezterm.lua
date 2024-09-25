local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'One Dark (Gogh)'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 18
config.window_decorations = 'RESIZE'
config.initial_cols = 200
config.initial_rows = 50
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.colors = {
  tab_bar = {
    background = '#1D2128',
    active_tab = {
      bg_color = '#78A2C4',
      fg_color = '#1D222B',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#1D2128',
      fg_color = '#A9B2C0'
    },
    inactive_tab_hover = {
      bg_color = '#21262F',
      fg_color = '#A9B2C0',
      italic = false
    },
    new_tab = {
      bg_color = '#1D2128',
      fg_color = '#A9B2C0',
      intensity = 'Bold'
    },
    new_tab_hover = {
      bg_color = '#8CC570',
      fg_color = '#1D222B',
      italic = false
    }
  }
}
return config
