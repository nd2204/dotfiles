local awful = require 'awful'
local wibox = require 'wibox'
local helpers = require 'helpers'
local beautiful = require 'beautiful'
local dpi = beautiful.xresources.apply_dpi
local gears = require 'gears'


local volume = wibox.widget {
    widget = wibox.widget.slider,
    bar_height = dpi(8),
    bar_shape = helpers.mkroundedrect(),
    bar_color = beautiful.bg_normal,
    bar_active_color = beautiful.accent,
    handle_width = 0,
    handle_cursor = "hand2",
    minimum = 0,
    maximum = 100,
    forced_width = 80,
}

local volume_container = wibox.widget {
    volume,
    widget = wibox.container.margin,
    margins = dpi(10),
}

local volume_popup = awful.popup {
    visible = false,
    ontop = true,
    widget = {
        {
            markup = "Volume control",
            align = "center",
            widget = wibox.widget.textbox,
        },
        {
            {
                {
                    {
                        markup = " Loudness",
                        align = "left",
                        widget = wibox.widget.textbox,
                    },
                    {
                        widget = volume_container,
                    },
                    layout = wibox.layout.fixed.horizontal
                },
                widget = wibox.container.background,
                forced_width = 200,
                forced_height = 80,
                shape = helpers.mkroundedrect(),
                bg = beautiful.bg_contrast,
            },
            widget = wibox.container.margin,
            margins = 10,
        },
        layout = wibox.layout.grid,
    },
    shape = helpers.mkroundedrect(),
}


local vol_icon = wibox.widget {
    widget = wibox.widget.textbox,
    text = " "
}

local cmd = [[pamixer --get-volume]]
-- function Update_volume()
--     awful.spawn.easy_async_with_shell(cmd, function (stdout)
--         local loudness = tonumber(stdout)
--         volume:set_value(loudness)
--     end)
-- end

gears.timer {
    timeout = 1,
    autostart = true,
    call_now = true,
    callback = function ()
        awful.spawn.easy_async_with_shell(cmd, function (stdout)
            local loudness = tonumber(stdout)
            volume:set_value(loudness)
        end)
    end
}

function Change_volume(value)
    awful.util.spawn("pamixer --set-volume ".. value)
end

-- update system volume when volume value change
volume:connect_signal("property::value", function ()
    return Change_volume(volume:get_value())
end)

local mute_status = false
local toggle_mute = awful.button({ }, 1, function ()
    if mute_status == true then
        awful.util.spawn("pamixer --mute")
        vol_icon:set_text(" ")
        volume_container:set_visible(false)
    else
        awful.util.spawn("pamixer --unmute")
        vol_icon:set_text(" ")
        volume_container:set_visible(true)
    end
    mute_status = not mute_status
end)

local open_volume_mixer = awful.button({ }, 3, function ()
    awful.util.spawn("pavucontrol")
end)

function volume_stat()
    return wibox.widget {
        {
            helpers.mkbutton({
                vol_icon,
                widget = wibox.container.margin,
                left = dpi(8),
                right = dpi(4),
                top = dpi(8),
                bottom = dpi(8),
                buttons = {toggle_mute, open_volume_mixer},
            }, beautiful.bg_contrast, beautiful.lightblack),
            {
                widget = volume_container,
            },
            layout = wibox.layout.fixed.horizontal,
            widget = wibox.container.margin,
            margins = dpi(10),
        },
        shape = helpers.mkroundedrect(),
        bg = beautiful.bg_contrast,
        widget = wibox.widget.background,
    }
end

return volume_stat
