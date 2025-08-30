#!/usr/bin/env zsh

source $HOME/.config/sketchybar/globals.sh

sketchybar \
  --add item mem_usage q \
  --set      mem_usage script="$PLUGIN_SHARED_DIR/memory_usage.sh" \
                       update_freq=10 \
                       background.height=26 \
                       background.padding_right=4 \
                       background.padding_left=4 \
                       icon=􀫦  \
                       icon.padding_left=4 \
                       icon.padding_right=6 \
                       icon.color=$AQUA \
                       icon.y_offset=1 \
  --add graph mem_usage.graph q 30 \
  --set       mem_usage.graph graph.color=$AQUA \
                              graph.fill_color=0x448ec07c \
                              graph.line_width=1.5 \
                              background.color=0x00000000 \
                              background.height=15 \
                              icon.padding_left=-6 \
                              y_offset=-1 \
  --add item mem_usage.percentage q \
  --set      mem_usage.percentage label="0%"

sketchybar \
  --add bracket mem_usage_bracket mem_usage mem_usage.percentage mem_usage.graph \
