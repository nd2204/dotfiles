#!/bin/bash

case $SENDER in
  *)
    # get current space index
    current_index=$(aerospace list-workspaces --focused)
    echo "${current_index}"
    num=${NAME#*.}
    if [ "$current_index" -eq "$num" ]; then
      sketchybar -m --set $NAME icon.highlight=on
      # sketchybar -m --animate quadratic 5 --set $NAME icon.highlight=on
    else
      sketchybar -m --set $NAME icon.highlight=off
    fi
    ;;

esac
