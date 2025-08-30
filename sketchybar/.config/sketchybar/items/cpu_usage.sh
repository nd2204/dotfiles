#!/usr/bin/env zsh

source $HOME/.config/sketchybar/globals.sh

sketchybar \
  --add item cpu_usage q \
  --set      cpu_usage script="$PLUGIN_SHARED_DIR/cpu_usage.sh" \
                       update_freq=10 \
                       background.height=26 \
                       background.padding_right=4 \
                       background.padding_left=4 \
                       icon=􀫥  \
                       icon.padding_left=4 \
                       icon.padding_right=6 \
                       icon.color=$GREEN \
                       icon.y_offset=1 \
  --add graph cpu_usage.graph q 30 \
  --set       cpu_usage.graph graph.color=$GREEN \
                              graph.fill_color=0x44b8bb26 \
                              graph.line_width=1.5 \
                              background.color=0x00000000 \
                              background.height=15 \
                              icon.padding_left=-6 \
                              y_offset=-1 \
  --add item cpu_usage.percentage q \
  --set      cpu_usage.percentage label="0%" \
                                  icon.padding_left=0 \
                                  icon.padding_right=0 \

sketchybar \
  --add bracket cpu_usage_bracket cpu_usage cpu_usage.percentage cpu_usage.graph \
