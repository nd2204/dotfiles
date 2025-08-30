#!/usr/bin/env zsh

source $HOME/.config/sketchybar/globals.sh

sketchybar \
  --add item clock.astronomy right \
  --set      clock.astronomy icon="􀐫 " \
                             icon.padding_left=0 \
                             icon.y_offset=1 \
  --add item clock right \
  --set      clock script="$PLUGIN_SHARED_DIR/clock.sh" \
                   update_freq=10 \
                   icon.padding_left=4 \
                   label.padding_right=10 \

sketchybar \
  --add bracket clock_bracket clock clock.astronomy

sketchybar \
  --subscribe clock mouse.entered mouse.exited mouse.clicked \
