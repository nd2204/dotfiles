#!/usr/bin/env zsh

source $HOME/.config/sketchybar/animation.sh

sketchybar --set $NAME label="$(date '+%a %b %-d %-H:%M')"

case "$SENDER" in
  "mouse.clicked")
    osascript -e "tell app \"System Event\" to tell app \"Calendar\" to activate"
    ;;
esac

hover_border_default "$SENDER" "$NAME"
