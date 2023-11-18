local awful = require 'awful'
local wibox = require 'wibox'
local helpers = require 'helpers'
local beautiful = require 'beautiful'
local gears = require 'gears'
local dpi = beautiful.xresources.apply_dpi

local function gettaglist(s)
  local taglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    style = {
      shape = gears.shape.squircle,
    },
    layout = {
      layout = wibox.layout.fixed.horizontal,
      spacing = dpi(8),
    },
    buttons = {
      awful.button({}, 1, function (t)
        t:view_only()
      end),
    },
    widget_template = {
      {
        -- {
        {
          id = "text_role",
          widget = wibox.widget.textbox,
          align = "center",
          forced_width = 20,
        },
        halign = "center",
        widget = wibox.container.place,
        -- },
        -- widget = wibox.container.margin,
        -- margins = dpi(8),
      },
      id = 'background_role',
      forced_width = 24,
      widget = wibox.container.background,
    }
  }
  return wibox.widget {
    {
      taglist,
      widget = wibox.container.margin,
      margins = dpi(6)
    },
    widget = wibox.container.background,
    shape = helpers.mkroundedrect(),
    border_width = 1,
    border_color = beautiful.border_normal,
    bg = beautiful.bg_contrast,
  }
end

return gettaglist
