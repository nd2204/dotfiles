#!/usr/bin/env zsh

update_space() {
    SPACE_ID=$(echo "$INFO" | jq -r '."display-1"')

    ICON=$SPACE_ID

    sketchybar --set $NAME \
        icon=$ICON \
}

case "$SENDER" in
  "mouse.clicked")
    # Reload sketchybar
    sketchybar --remove '/.*/'
    source $HOME/.config/sketchybar/sketchybarrc
    ;;
  *)
    update_space
    ;;
esac
