---------------------------
-- Default awesome theme --
---------------------------

local xresources = require("beautiful.xresources")
local gfs = require("gears.filesystem") local gears = require("gears")
local dpi = xresources.apply_dpi

local theme_assets = require("beautiful.theme_assets")

local themes_path = gfs.get_themes_dir()
local assets_path = gfs.get_configuration_dir() .. "assets/"

-- assets
local icons_path = assets_path .. "icons/"
local shapes_path = assets_path .. "shapes/"
local titlebar_usr_path = assets_path .. "titlebar/"

local theme = {}
-- base
theme.fg_normal = "#f5e0dc" -- #cdd6f4
theme.fg_unfocus = "#6c7086"
theme.black = "#11111b"
theme.dimblack = "#1e1e2e"
theme.lightblack = "#313244"
theme.grey = '#45475a'
theme.red = '#f38ba8'
theme.yellow = '#f6c177'
theme.magenta = '#cba6f7'
theme.green = '#a6e3a1'
theme.blue = '#89b4fa'
theme.cyan = '#fab387'
theme.aqua = '#94e2d5'

-- backgrounds
theme.bg_darker = "#11111b"
theme.bg_normal  = "#1e1e2e"
theme.bg_contrast = "#11111b"
theme.bg_lighter = "#313244"

theme.font_name     = 'JetBrainsMono Nerd Font'
theme.font_size     = '13'
theme.font          = theme.font_name .. " Bold " .. theme.font_size

-- bars
theme.bar_height = 48
theme.bar_width = 48
theme.taglist_bg = theme.lightblack
theme.taglist_bg_focus = theme.aqua
theme.taglist_fg_focus = theme.black
theme.taglist_bg_occupied = theme.lightblack
theme.taglist_bg_empty = theme.bg_contrast
theme.taglist_fg_empty = theme.fg_unfocus

theme.bg_focus      = theme.bg_normal
theme.bg_urgent     = theme.red
theme.bg_minimize   = theme.bg_normal

-- foregrounds
theme.fg_normal     = theme.fg_normal
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = theme.fg_normal
theme.fg_minimize   = theme.fg_normal

theme.actions = {
    bg = theme.bg_normal,
    contrast = theme.bg_contrast,
    lighter = theme.bg_lighter,
    fg = theme.fg_normal,
}

theme.accent = theme.aqua

-- gaps and borders
theme.useless_gap   = dpi(4)
theme.border_color  = theme.aqua
theme.border_width  = 1
theme.border_normal = theme.lightblack
theme.border_focus  = theme.green.."4D"
theme.border_marked = theme.bg_normal
theme.border_radius = 12

-- tasklist
theme.tasklist_plain_task_name = true
theme.tasklist_bg = theme.bg_normal
theme.tasklist_bg_focus = theme.bg_contrast
theme.tasklist_bg_urgent = theme.red .. '4D' -- 30% of transparency

-- systray
theme.bg_systray    = theme.bg_contrast
theme.systray_icon_spacing = dpi(12)
theme.systray_max_rows = 3

-- menu
theme.menu_font = theme.font
-- theme.menu_submenu_icon = gears.color.recolor_image(shapes_path .. "triangle.png", theme.fg_normal)
theme.menu_submenu_icon = ''
theme.menu_height = dpi(40)
theme.menu_width = dpi(180)
theme.menu_bg_focus = theme.aqua
theme.menu_fg_focus = theme.bg_normal
theme.menu_border_color = theme.green
theme.menu_border_width = 0

theme.titlebar_bg = theme.bg_contrast
theme.titlebar_bg_focus = theme.bg_normal
theme.titlebar_fg = theme.fg_normal

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Calendar 
theme.calendar_font = theme.font
theme.calendar_spacing = theme.font_size
theme.calendar_long_weekdays = true

-- Powerbutton
theme.powerbutton_bg = theme.aqua
theme.powerbutton_fg = theme.bg_normal

------------------------ titlebar ------------------------ 
-- ontop
-- theme.titlebar_ontop_button_normal = gears.color.recolor_image(titlebar_usr_path .. "arrow.png")

-- close
theme.titlebar_close_button_normal = gears.color.recolor_image(titlebar_usr_path .. "circle.png", theme.bg_lighter)
theme.titlebar_close_button_focus = gears.color.recolor_image(titlebar_usr_path .. "circle.png", theme.red)

-- maximized
theme.titlebar_maximized_button_normal_active = gears.color.recolor_image(titlebar_usr_path .. "circle.png", theme.bg_lighter)
theme.titlebar_maximized_button_normal_inactive = gears.color.recolor_image(titlebar_usr_path .. "circle.png", theme.bg_lighter)
theme.titlebar_maximized_button_focus_active = gears.color.recolor_image(titlebar_usr_path .. "circle.png", theme.green)
theme.titlebar_maximized_button_focus_inactive = gears.color.recolor_image(titlebar_usr_path .. "circle.png", theme.green)

-- minimize
theme.titlebar_minimize_button_normal = gears.color.recolor_image(titlebar_usr_path .. "circle.png", theme.bg_lighter)
theme.titlebar_minimize_button_focus = gears.color.recolor_image(titlebar_usr_path .. "circle.png", theme.yellow)

------------------------ layouts ------------------------ 
theme.layout_fairh = gears.color.recolor_image(themes_path.."default/layouts/fairhw.png", theme.fg_normal)
theme.layout_fairv = gears.color.recolor_image(themes_path.."default/layouts/fairvw.png", theme.fg_normal)
theme.layout_floating  = gears.color.recolor_image(themes_path.."default/layouts/floatingw.png", theme.fg_normal)
theme.layout_magnifier = gears.color.recolor_image(themes_path.."default/layouts/magnifierw.png", theme.fg_normal)
theme.layout_max = gears.color.recolor_image(themes_path.."default/layouts/maxw.png", theme.fg_normal)
theme.layout_fullscreen = gears.color.recolor_image(themes_path.."default/layouts/fullscreenw.png", theme.fg_normal)
theme.layout_tilebottom = gears.color.recolor_image(themes_path.."default/layouts/tilebottomw.png", theme.fg_normal)
theme.layout_tileleft   = gears.color.recolor_image(themes_path.."default/layouts/tileleftw.png", theme.fg_normal)
theme.layout_tile = gears.color.recolor_image(themes_path.."default/layouts/tilew.png", theme.fg_normal)
theme.layout_tiletop = gears.color.recolor_image(themes_path.."default/layouts/tiletopw.png", theme.fg_normal)
theme.layout_spiral  = gears.color.recolor_image(themes_path.."default/layouts/spiralw.png", theme.fg_normal)
theme.layout_dwindle = gears.color.recolor_image(themes_path.."default/layouts/dwindlew.png", theme.fg_normal)
theme.layout_cornernw = gears.color.recolor_image(themes_path.."default/layouts/cornernww.png", theme.fg_normal)
theme.layout_cornerne = gears.color.recolor_image(themes_path.."default/layouts/cornernew.png", theme.fg_normal)
theme.layout_cornersw = gears.color.recolor_image(themes_path.."default/layouts/cornersww.png", theme.fg_normal)
theme.layout_cornerse = gears.color.recolor_image(themes_path.."default/layouts/cornersew.png", theme.fg_normal)

-- playerctl (bling)
theme.playerctl_position_update_interval = 2

-- profile pic
theme.profile_pic = assets_path..'pfp.png'
theme.images_placeholder = gears.color.recolor_image(assets_path..'sound.svg', theme.fg_unfocus)

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
