-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, hard (base16)'

config.font = wezterm.font {
  family = 'RobotoMono Nerd Font',
  weight = 'DemiBold'
}
config.font_size = 15

config.window_background_opacity = 1.80
config.window_decorations = "TITLE | RESIZE | MACOS_FORCE_ENABLE_SHADOW"
config.macos_window_background_blur = 50
config.line_height = 1.1
config.default_cursor_style = 'SteadyBlock'

config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'

config.window_frame = {
  -- border_left_width    = 2,
  -- border_right_width   = 2,
  -- border_bottom_height = 2,
  -- border_top_height    = 2,
  -- border_left_color    = '#b8bb26',
  -- border_right_color   = '#b8bb26',
  -- border_bottom_color  = '#b8bb26',
  -- border_top_color     = '#b8bb26',
  font = wezterm.font { family = 'RobotoMono Nerd Font', weight = 'Bold' },
  font_size = 12.0,
  active_titlebar_bg = '#333333',
  inactive_titlebar_bg = '#333333',
}

config.window_padding = {
  left   = 12,
  right  = 8,
  top    = 12,
  bottom = 0,
}

config.colors = {
  background = "#1b1b1b",
  foreground = "#d5c4a1",

  ansi = {
    "#45403d",
    "#e67e80",
    "#b8bb26",
    "#fabd2f",
    "#83a598",
    "#d3869b",
    "#8ec07c",
    "#d5c4a1",
  },

  brights = {
    "#282828",
    "#fe8019",
    "#b8bb26",
    "#f28534",
    "#bdae93",
    "#d5c4a1",
    "#d65d0e",
    "#d5c4a1",
  },

  cursor_bg  = "#d5c4a1",
  cursor_fg  = "#282828",
}

return config
