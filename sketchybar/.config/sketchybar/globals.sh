#!/usr/bin/env zsh

FONT_FACE="JetBrainsMono Nerd Font"
ITEMS_DIR="$HOME/.config/sketchybar/items"
PLUGIN_LAPTOP_DIR="$HOME/.config/sketchybar/plugins-laptop"
PLUGIN_SHARED_DIR="$HOME/.config/sketchybar/plugins"

HAS_CUSTOM_THEME=1
BG_HEIGHT=34
DEFAULT_ICON_PADDING=10

# AQUA=0xff8ec07c
# BLACK_DIM=0xff000000
# BLACK_0=0xff191919
# BLACK_1=0xff282828
# FG=0xffebdbb2
# BLUE=0xff8AA98A
# GREEN=0xffb8bb26
# YELLOW=0xffE5AF48
# ORANGE=0xffe78a4e
# PURPLE=0xffd3869b
# RED=0xffe67e80
# GREY=0xff3f3f3f
# GREY_1=0xff4d4d4d
# ACCENT=$GREY

AQUA=0xff8ec07c
BLACK_DIM=0xff000000
BLACK_0=0xff191919
BLACK_1=0xff282828
FG=0xffebdbb2
BLUE=0xff8AA98A
GREEN=0xffb8bb26
YELLOW=0xffE5AF48
ORANGE=0xffe78a4e
PURPLE=0xffd3869b
RED=0xffe67e80
GREY=0xff3f3f3f
GREY_1=0xff4d4d4d
ACCENT=$GREY

BORDER=$GREY
BACKGROUND_DIM=$BLACK_DIM
BACKGROUND_0=$BLACK_0
BACKGROUND_1=$BLACK_1

set_alpha() {
    local rgb=$1
    local alpha=${2:-0xFF}
    printf "0x%08X\n" $(( (alpha << 24) | (rgb & 0xFFFFFF) ))
}

bracket_default_styles=(
  background.height=26
  background.color=0xff646464
  background.border_width=1
  background.border_color=0xffffffff
  background.drawing=on
)
