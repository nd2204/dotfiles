local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local gears = require 'gears'

local ram_chart = wibox.widget {
    max_value = 100,
    value = 0,
    thickness = 2,
    bg = beautiful.lightblack, -- radial/ring colors
    rounded_edge = true,
    start_angle = math.pi * 0.25,
    colors = {beautiful.blue}, -- arch chart inner fg colors
    widget = wibox.container.arcchart
}

local cmd = [[free | awk '/Mem/{printf("%.2f"), $3/$2*100}']]

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
                ram_chart:set_colors({beautiful.green})
            elseif usage < 75 then
                ram_chart:set_colors({beautiful.yellow})
            else
                ram_chart:set_colors({beautiful.red})
            end
            ram_chart:set_value(usage)
            -- end
        end)
    end;
}

function ram_stat()
    return wibox.widget {
        {
            {
                text = "", --
                font = "10",
                align = "center",
                widget = wibox.widget.textbox,
            },
            {
                ram_chart,
                widget = wibox.container.background,
            },
            layout = wibox.layout.stack,
        },
        layout = wibox.layout.align.horizontal
    }
end

return ram_stat
