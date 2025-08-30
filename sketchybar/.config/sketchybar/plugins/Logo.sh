#!/usr/bin/env zsh

source $HOME/.config/sketchybar/animation.sh
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
    ;;
esac

hover_border "$SENDER" "quadratic" "5" "$NAME" "$GREEN" "$BORDER"
