local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local helpers   = require 'helpers'
local gears = require 'gears'

function getTasklist(s)
    local tasklist = awful.widget.tasklist {
        screen = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        style = {
            shape = helpers.mkroundedrect(),
            spacing = 10,
        },
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            -- awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            -- awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        },
        widget_template = {
            {
                id = "background_role",
                forced_height = 10,
                bg = beautiful.bg_contrast,
                widget = wibox.container.background,
            },
            {
                awful.widget.clienticon,
                margins = 5,
                widget = wibox.container.margin
            },
            layout = wibox.layout.stack,
            align = "center"
        },
    }
    return tasklist
end

return getTasklist
