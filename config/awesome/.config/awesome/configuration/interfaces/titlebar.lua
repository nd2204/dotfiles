local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require 'beautiful'
local dpi = beautiful.xresources.apply_dpi

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local titlebar = awful.titlebar(c, {
        position = "top",
        size = 36,
        bg = beautiful.bg_contrast .. 'E6',
    })
    local buttons = gears.table.join(
        awful.button({ }, 1, function() c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    local ontopbutton = awful.titlebar.widget.ontopbutton(c)
    local closebutton = awful.titlebar.widget.closebutton(c)
    local minimizebutton = awful.titlebar.widget.minimizebutton (c)
    local maximizedbutton = awful.titlebar.widget.maximizedbutton(c)
    local margin = { left = dpi(6), right = dpi(6), top = dpi(11), bottom = dpi(11) }
    titlebar:setup {
        {
            awful.titlebar.widget.iconwidget(c),
            widget = wibox.container.margin,
            margins = dpi(8),
            buttons = buttons,
        },
        {
            {
                widget = awful.titlebar.widget.titlewidget(c),
                halign = "center",
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal,
        },
        {
            helpers.apply_margin(ontopbutton, margin),
            helpers.apply_margin(minimizebutton, margin),
            helpers.apply_margin(maximizedbutton, margin),
            helpers.apply_margin(closebutton, {
                left = margin.left,
                right = dpi(14),
                top = margin.top,
                bottom = margin.bottom,
            }),
            layout = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.align.horizontal
    }
end)
