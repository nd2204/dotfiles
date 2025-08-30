#!/bin/sh

WIDTH=80

volume_change() {
  source "$HOME/.config/sketchybar/icons.sh"
  case $INFO in
    [6-9][0-9]|100) ICON=$ICON_VOLUME_MAX
    ;;
    [1-5][0-9]) ICON=$ICON_VOLUME_MED
    ;;
    [1-9]) ICON=$ICON_VOLUME_MIN
    ;;
    0) ICON=$ICON_VOLUME_MUTED
    ;;
    *) ICON=$ICON_VOLUME_MAX
  esac

  sketchybar --set $NAME.icon icon=$ICON \

  sketchybar --set $NAME slider.percentage=$INFO \
             --animate tanh 30 --set $NAME slider.width=$WIDTH \
                               --set $NAME.icon icon.padding_right=8

  sleep 2

  # Check wether the volume was changed another time while sleeping
  FINAL_PERCENTAGE=$(sketchybar --query $NAME | jq -r ".slider.percentage")
  if [ "$FINAL_PERCENTAGE" -eq "$INFO" ]; then
    sketchybar --animate tanh 30 --set $NAME slider.width=0 \
                                 --set $NAME.icon icon.padding_right=0
  fi
}

mouse_clicked() {
  osascript -e "set volume output volume $PERCENTAGE"
}

mouse_entered() {
  sketchybar --set $NAME slider.knob.drawing=on
}

mouse_exited() {
  sketchybar --set $NAME slider.knob.drawing=off
}

case "$SENDER" in
  "mouse.clicked")
    mouse_clicked
    ;;
  "mouse.entered")
    mouse_entered
    ;;
  "mouse.exited")
    mouse_exited
    ;;
  "volume_change")
    volume_change
    ;;
esac
