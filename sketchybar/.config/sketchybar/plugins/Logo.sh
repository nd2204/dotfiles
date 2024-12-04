#!/usr/bin/env zsh

case "$SENDER" in
  "mouse.clicked")
    # Reload sketchybar
    # sketchybar -m --update
    sketchybar --remove '/.*/'
    source $HOME/.config/sketchybar/sketchybarrc
    sketchybar --trigger space_change
    ;;
  *)
    sketchybar --set $NAME \
      icon=󰀵 \
      icon.padding_left=7 \
      icon.padding_right=6 \
    ;;
esac
