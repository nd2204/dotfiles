local awful = require("awful")
local beautiful = require("beautiful")
local helpers = require 'helpers'
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = { },
    properties = { border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      shape = helpers.mkroundedrect(beautiful.border_radius),
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },

  -- Floating clients.
  { rule_any = {
    instance = {
      "DTA",  -- Firefox addon DownThemAll.
      "copyq",  -- Includes session name in class.
      "pinentry",
    },
    class = {
      "Arandr",
      "Blueman-manager",
      "Gpick",
      "Kruler",
      "MessageWin",  -- kalarm.
      "Sxiv",
      "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
      "Wpa_gui",
      "veromix",
      "xtightvncviewer"
    },

    -- Note that the name property shown in xprop might be set slightly after creation of the client
    -- and the name shown there might not match defined rules here.
    name = {
      "Event Tester",  -- xev.
    },
    role = {
      "AlarmWindow",  -- Thunderbird's calendar.
      "ConfigManager",  -- Thunderbird's about:config.
      "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
    }
  }, properties = { floating = true }},

  -- Add titlebars to normal clients and dialogs
  {   rule_any = {type = { "normal", "dialog" }},
    properties = { titlebars_enabled = true }
  },

  -- exclude titlebars to terminals
  { rule_any = { class = {"kitty","Alacritty","XTerm","UXTerm","popup"} },
    properties = { titlebars_enabled = false }
  },

  -- set floating client (no tilling)
  { rule_any = { class = {"Thunar", "discord", "Caprine", "Spotify", "Spotify Premium"} },
    properties = { floating = true, placement = awful.placement.centered }
  },

  { rule = {class = "Thunar"},
    properties = { ontop = true},
  },

  { rule_any = { class = {"Polybar", "firefox", "Spotify"} },
    properties = { border_width = 0 } }
}

