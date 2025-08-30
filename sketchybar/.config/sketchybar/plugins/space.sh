#!/bin/bash

case $SENDER in
  *)
    # get current space index
    current_index=$(yabai -m query --spaces --space | jq -r '.index')
    num=${NAME#*.}
    if [ "$current_index" -eq "$num" ]; then
      sketchybar -m --animate quadratic 5 --set $NAME icon.highlight=on
    else
      sketchybar -m --animate quadratic 5 --set $NAME icon.highlight=off
    fi
    ;;

esac
