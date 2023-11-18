local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local gears = require 'gears'
local helpers = require 'helpers'

local cpu_chart = wibox.widget {
    widget = wibox.container.arcchart,
    min_value = 0,
    max_value = 100,
    thickness = 2,
    bg = beautiful.lightblack, -- radial/ring colors
    rounded_edge = true,
    start_angle = math.pi * 0.25,
}

local cmd = [[top -bn1 | grep '%Cpu(s):' | awk '{print $2+$4+$6}']]

gears.timer {
    timeout = 5;
    autostart = true;
    call_now = true,
    callback = function()
        awful.spawn.easy_async_with_shell(cmd,
        function(stdout)
            local usage = tonumber(stdout)
            -- if usage ~= nil then
            if usage < 50 then
                cpu_chart:set_colors({beautiful.green})
            elseif usage < 75 then
                cpu_chart:set_colors({beautiful.yellow})
            else
                cpu_chart:set_colors({beautiful.red})
            end
            cpu_chart:set_value(usage)
            -- end
        end)
    end;
}

function cpu_stat()
    return wibox.widget {
        {
            {
                cpu_chart,
                widget = wibox.container.background,
            },
            {
                text = "󰍛", -- 󰍛
                font = "10",
                align = "center",
                widget = wibox.widget.textbox,
            },
            layout = wibox.layout.stack,
        },
        layout = wibox.layout.fixed.horizontal
    }
end

return cpu_stat
