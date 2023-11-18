local beautiful = require("beautiful")
local awful = require("awful")
-- local theme_name = os.getenv(THEME)
local theme_name = "gruvbox"
-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.

beautiful.init(os.getenv("HOME").."/.config/awesome/themes/default/"..theme_name..".lua")

local wallpapersDir
if theme_name == 'catppuccin' then
  wallpapersDir = 'rose-pine'
else
  wallpapersDir = theme_name
end

awful.spawn.with_shell("feh --bg-fill --randomize ~/Downloads/Media/wallpapers/"..wallpapersDir)
