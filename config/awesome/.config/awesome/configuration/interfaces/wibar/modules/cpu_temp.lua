local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local gears = require 'gears'
local helpers = require 'helpers'

local cpu_temp = wibox.widget {
  widget = wibox.container.arcchart,
  min_value = 0,
  max_value = 100,
  thickness = 2,
  bg = beautiful.lightblack, -- radial/ring colors
  rounded_edge = true,
  start_angle = math.pi * 0.25,
}

local cmd = [[sensors | grep "Core 0" | awk '{printf("%d"), $3}']]

gears.timer {
  timeout = 3,
  call_now = true,
  autostart = true,
  callback = function ()
    awful.spawn.easy_async_with_shell(cmd, function(stdout)
      local temp = tonumber(stdout)
      if temp < 65 then
        cpu_temp:set_colors({beautiful.green})
      elseif temp < 75 then
        cpu_temp:set_colors({beautiful.yellow})
      else
        cpu_temp:set_colors({beautiful.red})
      end
      cpu_temp:set_value(temp)
    end)
  end
}

function cpu_temp_widget()
  return wibox.widget {
    {
      {
        cpu_temp,
        widget = wibox.container.background,
      },
      {
        text = "󰏈", -- 󰏈 
        font = "10",
        align = "center",
        widget = wibox.widget.textbox,
      },
      layout = wibox.layout.stack,
    },
    layout = wibox.layout.fixed.horizontal
  }
end

return cpu_temp_widget
