#!/usr/bin/env zsh
#
source $HOME/.config/sketchybar/animation.sh

case "$SENDER" in
  "mouse.clicked")
    pmset displaysleepnow
  ;;
esac

hover_border_default "$SENDER" "$NAME"
