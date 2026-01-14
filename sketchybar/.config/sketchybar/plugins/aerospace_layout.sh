#!/usr/bin/env bash

NEXT_LAYOUT=""
ICON="􀢌"

source $HOME/.config/sketchybar/animation.sh
update_layout_icon() {
  LAYOUT=$(aerospace list-windows --focused --format "%{window-layout}")
  sketchybar --set $NAME icon=$ICON label="$LAYOUT"
}

case "$SENDER" in
  "mouse.clicked")
    update_layout_icon
    ;;
  *)
    update_layout_icon
    ;;
esac
