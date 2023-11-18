local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local helpers = require 'helpers'
local gears = require 'gears'
local dpi = require 'beautiful.xresources'.apply_dpi

local total_usage = wibox.widget {
    widget = wibox.container.arcchart,
    max_value = 200,
    thickness = 2,
    bg = beautiful.lightblack, -- radial/ring colors
    rounded_edge = true,
    start_angle = math.pi * 0.25,
}

local cmd_rootusage = [[df / | awk 'NR>1 {printf("%d"), $5}']]
local cmd_homeusage = [[df /home | awk 'NR>1 {printf("%d"), $5}']]

function Update_storage_usage()
    local root,home
    local root_color, home_color
    awful.spawn.easy_async_with_shell(cmd_rootusage, function(stdout)
        root = tonumber(stdout)
        if root < 65 then
            root_color = beautiful.green .. "80" -- 50% transparency elseif root < 80 then
            root_color = beautiful.yellow
        else
            root_color = beautiful.red
        end
        total_usage:set_colors({root_color,home_color})
        total_usage:set_values({root,home})
    end)

    awful.spawn.easy_async_with_shell(cmd_homeusage, function(stdout)
        home = tonumber(stdout)
        if home < 50 then
            home_color = beautiful.green
        elseif home < 70 then
            home_color = beautiful.yellow
        else
            home_color = beautiful.red
        end
        total_usage:set_colors({root_color,home_color})
        total_usage:set_values({root,home})
    end)
end

Update_storage_usage()

function Get_storage_usage()
    return wibox.widget {
        {
            {
                text = "", -- 
                font = "10",
                align = "center",
                widget = wibox.widget.textbox,
            },
            {
                total_usage,
                widget = wibox.container.background,
            },
            layout = wibox.layout.stack,
        },
        layout = wibox.layout.fixed.horizontal
    }
end

return Get_storage_usage
