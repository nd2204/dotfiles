local beautiful = require 'beautiful'
local bling = require 'bling'
local awful = require 'awful'
local wibox = require 'wibox'
local helpers = require 'helpers'
local gears = require 'gears'
local dpi = beautiful.xresources.apply_dpi

playerctl = bling.signal.playerctl.lib {
    ignore = "firefox",
    player = {"ncspot", "%any"}
}

local next_button = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "󰒭",
    buttons = gears.table.join(
        awful.button({ }, 1, function ()
            playerctl:next()
        end)
    )
}

local prev_button = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "󰒮",
    buttons = gears.table.join(
        awful.button({ }, 1, function ()
            playerctl:previous()
        end)
    )
}

local play_pause = wibox.widget {
    widget = wibox.widget.textbox,
    font = beautiful.font_name .. ' 18',
    markup = "󰏤",
    buttons = gears.table.join(
        awful.button({ }, 1, function ()
            playerctl:play_pause()
        end)
    )
}

local player_buttons = wibox.widget {
    {
        prev_button,
        play_pause,
        next_button,
        layout = wibox.layout.fixed.horizontal,
        spacing = 10,
    },
    widget = wibox.container.background,
}


local album_art = wibox.widget {
    image = beautiful.images_placeholder,
    widget = wibox.widget.imagebox,
    resize = true,
    clip_shape = gears.shape.circle
}

local song_title = wibox.widget {
    markup = "Will you play a track?",
    widget = wibox.widget.textbox,
    font = beautiful.font_name .. ' Bold 10',
}

local open_spotify_button =gears.table.join(
    awful.button({ }, 1, function ()
        local c = awful.client.iterate(function (client) return client.class == "Spotify" end)()
        if c then
            c.minimized = false
            c:move_to_tag(mouse.screen.selected_tag)
            c:raise()
            client.focus = c
        else
            awful.spawn("spotify-launcher")
        end
    end)
)

local player_container = wibox.widget {
    {
        {
            {
                album_art,
                widget = wibox.container.margin,
                left = dpi(12),
                right = dpi(12),
                top = dpi(6),
                bottom = dpi(6),
                buttons = open_spotify_button,
            },
            {
                widget = song_title,
                buttons = open_spotify_button,
            },
            {
                player_buttons,
                widget = wibox.container.margin,
                left = dpi(14),
                right = dpi(14),
            },
            layout = wibox.layout.align.horizontal
        },
        widget = wibox.container.background,
        forced_height = beautiful.bar_height,
        forced_width = 400,
        bg = beautiful.bg_contrast,
    }, -- song progress
    widget = wibox.container.radialprogressbar,
    border_width = 1,
    border_color = beautiful.border_normal,
    color = beautiful.accent,
    min_value = 0,
    max_value = 223,
    value = 0,
    -- buttons = function ()

    -- end
}

-- Signals handling

playerctl:connect_signal('playback_status', function (_,playing)
    if playing then
        play_pause.markup = '󰏤'
    else
        play_pause.markup = '󰐊'
    end
end)

playerctl:connect_signal('position', function (_, interval_sec, length_sec)
    -- Set art widget
    player_container.value = (interval_sec/length_sec) * 100
end)

playerctl:connect_signal('metadata', function (_, title, artist, album_path, album, new)
    -- Set art widget
    -- name_widget:set_markup_silently(player_name)
    song_title:set_markup_silently(artist..' - '..title)
    album_art:set_image(gears.surface.load_uncached(album_path))
end)


return player_container
