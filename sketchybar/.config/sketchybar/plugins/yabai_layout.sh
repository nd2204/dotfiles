#!/usr/bin/env bash

NEXT_LAYOUT=""
ICON="􀢌"

source $HOME/.config/sketchybar/animation.sh

update_layout_icon() {
  LAYOUT="$(yabai -m query --spaces --display | jq -r 'map(select(."has-focus"))[-1].type')"
  sketchybar --set $NAME icon=$ICON label="$LAYOUT"
}

update_next_layout() {
  LAYOUT="$(yabai -m query --spaces --display | jq -r 'map(select(."has-focus"))[-1].type')"
  case $LAYOUT in
    bsp)
      NEXT_LAYOUT="stack"
      # ICON="􀢌"
      ;;
    stack)
      NEXT_LAYOUT="float"
      # ICON="􀏭"
      ;;
    float)
      NEXT_LAYOUT="bsp"
      # ICON="􀢌"
      ;;
  esac
}

case "$SENDER" in
  "mouse.clicked")
    update_next_layout
    yabai -m config layout $NEXT_LAYOUT
    update_layout_icon
    ;;
  *)
    update_layout_icon
    ;;
esac
