local wibox = require 'wibox'
local awful = require 'awful'
local beautiful = require 'beautiful'
local dpi = require 'beautiful.xresources'.apply_dpi
local helpers =require 'helpers'
local gears = require 'gears'

local clock_formats = {
    hour = '󱑒 %I:%M %p',
    day = ' %d-%m-%Y',
}

local clock = wibox.widget {
    format = clock_formats.hour,
    font = beautiful.font_name..' ExtraBold 13',
    widget = wibox.widget.textclock
}

local month_calendar = awful.widget.calendar_popup.month({
    margin = beautiful.useless_gap * 2,
    style_normal = {
        border_width = 0,
        bg_color = beautiful.bg_contrast,
        shape = gears.shape.rounded_rect,
        padding = 8,
    },
    style_weekday = {
        border_width = 0,
        bg_color = '#00000000',
    },
    style_header = {
        border_width = 1,
        bg_color = beautiful.bg_contrast,
        shape = gears.shape.rounded_rect,
    },
    style_month = {
        border_width = 2,
        shape = gears.shape.rounded_rect,
        bg_color = beautiful.bg_darker,
        padding = 12,
    },
    style_focus = {
        shape = helpers.mkroundedrect(),
        bg_color = beautiful.green,
        border_width = 0,
        fg_color = beautiful.bg_darker,
        padding = 8,
    }
})
month_calendar:attach( clock, "tr" , {on_hover = false})

local toggle_format_button = awful.button({ }, 3, function ()
    clock.format = clock.format == clock_formats.hour
        and clock_formats.day
        or clock_formats.hour
end)

helpers.add_buttons(clock, {
    toggle_format_button,
})

local date = wibox.widget {
    {
        clock,
        widget = wibox.container.margin,
        margins = dpi(10),
    },
    shape = helpers.mkroundedrect(),
    border_width = 1,
    border_color = beautiful.border_normal,
    forced_height = beautiful.bar_height,
    widget = wibox.container.background,
}

local function getclock()
    return helpers.mkbutton(date, beautiful.bg_contrast, beautiful.lightblack)
end

return getclock
