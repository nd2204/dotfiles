pcall(require, "luarocks.loader")

terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

require("theme")
require("configuration")
require("autolaunch")
