---@diagnostic disable: undefined-global
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local dpi = require 'beautiful.xresources'.apply_dpi
local awful = require 'awful'
local helpers = require 'helpers'

function get_systray(s)
    local systray = wibox.widget {
        {
            {
                widget = wibox.widget.systray,
                horizontal = false,
                screen = s,
            },
            widget = wibox.container.margin,
            margins = dpi(8),
        },
        widget = wibox.container.background,
        bg = beautiful.bg_contrast,
        shape = helpers.mkroundedrect(),
    }
    return systray
end

return get_systray
