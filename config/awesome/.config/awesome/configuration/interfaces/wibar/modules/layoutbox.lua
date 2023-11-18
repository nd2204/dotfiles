local wibox = require 'wibox'
local awful = require 'awful'
local helpers = require 'helpers'
local beautiful = require 'beautiful'
local gears = require 'gears'

awesome.connect_signal("layout::toggle", function ()
    return awful.screen.focused().layout_popup.toggle()
end)

awesome.connect_signal("layout::visibility", function (v)
    if v then
        awful.screen.focused().layout_popup.show()
    else
        awful.screen.focused().layout_popup.hide()
    end
end)

local function get_layoutbox(s)
    s.layout_popup = awful.popup {
        widget = awful.widget.layoutlist {
            screen = s,
        },
        visible = false,
        ontop = true,
        onclick = function ()
            awesome.emit_signal('layout::toggle', true)
        end,
        maximum_height = #awful.layout.layouts * 24,
        minimum_height = #awful.layout.layouts * 24,
        placement      = awful.placement.centered,
    }

    function s.layout_popup.toggle()
        if  s.layout_popup.visible then
            s.layout_popup.visible = false
        else
            s.layout_popup.visible = true
        end
    end

    local layout = awful.widget.layoutbox {
        screen = s,
        forced_height = 16,
        forced_width = 16,
    }
    helpers.add_buttons(layout, {
        awful.button({}, 1, function () awful.layout.inc(1) end),
        awful.button({}, 2 ,function () awesome.emit_signal("layout::toggle") end),
        awful.button({}, 3, function () awful.layout.inc(-1) end),
        awful.button({}, 4, function () awful.layout.inc(-1) end),
        awful.button({}, 5, function () awful.layout.inc(1) end),
    })

    local layoutbox = wibox.widget {
        {
            layout,
            valign = 'center',
            halign = 'center',
            layout = wibox.container.place,
        },
        bottom = 6,
        top = 6,
        right = 10,
        left = 10,
        widget = wibox.container.margin,
    }
    return helpers.mkbutton(layoutbox, beautiful.bg_contrast, beautiful.lightblack)
end

return get_layoutbox
