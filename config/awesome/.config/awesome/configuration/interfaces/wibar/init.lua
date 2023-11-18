local wibox = require 'wibox'
local beautiful = require 'beautiful'
local awful = require 'awful'
local gears = require 'gears'
local helpers = require 'helpers'
local dpi = require "beautiful.xresources".apply_dpi

local taglist = require 'configuration.interfaces.wibar.modules.taglist'
local tasklist = require 'configuration.interfaces.wibar.modules.tasklist'
local playerctl = require 'configuration.interfaces.wibar.modules.player'
local getlayoutbox = require 'configuration.interfaces.wibar.modules.layoutbox'
local clock = require 'configuration.interfaces.wibar.modules.clock'
local cpu = require 'configuration.interfaces.wibar.modules.cpu'
local cpu_temp = require 'configuration.interfaces.wibar.modules.cpu_temp'
local ram = require 'configuration.interfaces.wibar.modules.ram'
local storage = require 'configuration.interfaces.wibar.modules.storage'
local volume = require 'configuration.interfaces.wibar.modules.volume'
local powerbutton = require 'configuration.interfaces.wibar.modules.powerbutton'
local systray = require 'configuration.interfaces.wibar.modules.systray'

local change_wallpaper = helpers.mkbutton(wibox.widget {
  {
    widget = wibox.widget.textbox,
    font = beautiful.font_name .. " Mono 20",
    markup = '',
    align = 'center',
  },
  widget = wibox.container.background,
  forced_width = 36,
  fg = beautiful.powerbutton_fg,
  buttons = awful.button({ }, 1, function ()
    awful.spawn.with_shell("feh --bg-fill --randomize ~/Downloads/Media/wallpapers/gruvbox/")
  end)
}, beautiful.powerbutton_bg, beautiful.green)

screen.connect_signal('request::desktop_decoration', function (s)
  awful.tag(
    {'1', '2', '3', '4', '5', '6'},
    s, awful.layout.layouts[1]
  )

  s.mywibox = awful.wibar {
    position = 'top',
    align = 'center',
    restrict_workarea = true,
    -- border_width = beautiful.border_width,
    border_color = beautiful.border_focus,
    opacity = 0.95,
    screen = s,
    width = s.geometry.width - beautiful.useless_gap * 4,
    -- width = s.geometry.width,
    height = beautiful.bar_height,
    shape = gears.shape.rounded_rect,
    margins = {
      top = beautiful.useless_gap,
      bottom = 0,
    }
  }

  local hardware_stat = wibox.widget {
    {
      {
        cpu(),
        cpu_temp(),
        ram(),
        storage(),
        layout = wibox.layout.fixed.horizontal,
        spacing = 10,
      },
      widget = wibox.container.margin,
      margins = dpi(6),
    },
    widget = wibox.container.background,
    shape = helpers.mkroundedrect(),
    bg = beautiful.bg_contrast,
  }

  s.mywibox:setup {
    {
      {
        change_wallpaper,
        taglist(s),
        {
          widget = hardware_stat,
        },
        layout = wibox.layout.fixed.horizontal,
        spacing = 10,
      },
      widget = wibox.container.margin,
      margins = dpi(6),
    },
    {
      {
        playerctl,
        widget = wibox.container.margin,
        margins = dpi(6),
      },
      valign = "center",
      layout = wibox.container.place,
    },
    {
      {
        {
          systray(s),
          volume(),
          clock(),
          getlayoutbox(s),
          powerbutton,
          spacing = 10,
          layout = wibox.layout.fixed.horizontal,
        },
        widget = wibox.container.margin,
        margins = dpi(6),
      },
      layout = wibox.container.place,
      halign = "right"
    },
    layout = wibox.layout.stack,
    buttons = awful.button({ }, 2, function() awful.menu.client_list { theme = { width = 250 } } end),
  }
end)
