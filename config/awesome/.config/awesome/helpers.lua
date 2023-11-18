local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local helpers = {}

-- create shapes
function helpers.create_circle(radius)
    radius = radius or dpi(7)
    return function (cr,w,h)
        return gears.shape.circle(cr,w,h,radius)
    end
end


function helpers.mkroundedrect(radius)
    radius = radius or dpi(7)
    return function (cr,w,h)
        return gears.shape.rounded_rect(cr,w,h,radius)
    end
end

function helpers.apply_margin(widget,opts)
    return wibox.widget {
        widget,
        margins = opts.margins,
        top = opts.top,
        right = opts.right,
        bottom = opts.bottom,
        left = opts.left,
        widget = wibox.container.margin
    }
end

function helpers.add_hover(element, bg, bgh)
    element:connect_signal('mouse::enter', function(self)
        self.bg=bgh
    end)
    element:connect_signal('mouse::leave', function(self)
        self.bg=bg
    end)
end

-- buttons
function helpers.mkbutton(template,bg,bgh,radius)
    local button = wibox.widget {
        template,
        bg = bg or beautiful.lightblack,
        widget = wibox.container.background,
        shape = helpers.mkroundedrect(radius)
    }
    if bg and bgh then
        helpers.add_hover(button,bg,bgh)
    end

    return button
end

function helpers.add_buttons(widget, buttons)
    for _, button in ipairs(buttons) do
        widget:add_button(button)
    end
end

return helpers
