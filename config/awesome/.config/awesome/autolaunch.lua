local awful = require 'awful'

awful.spawn.with_shell("nvidia-settings --load-config-only")
awful.spawn.with_shell("picom --experimental-backend")
awful.spawn.with_shell("discord")
awful.spawn.with_shell("redshift -l 21.0283333:105.8541667") -- Hanoi geolocation
-- awful.spawn.with_shell(os.getenv("HOME") .. "/.config/polybar/launch.sh")
