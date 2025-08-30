#!/bin/bash

volume_slider=(
  script="$PLUGIN_SHARED_DIR/volume_slider.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$BLUE
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$GREY
  slider.knob=􀀁
  slider.knob.color=$BLUE
  slider.knob.drawing=off
)

volume_icon=(
  click_script="$PLUGIN_SHARED_DIR/volume_icon.sh"
  padding_left=10
  padding_right=0
  icon.padding_left=0
  icon.padding_right=0
  icon=$ICON_VOLUME_MAX
  icon.color=$BLUE
  icon.y_offset=1
)

status_bracket=(
  # background.color=$BLACK_0
  # background.border_color=$BLACK_1
  # background.height=26
  # background.border_width=2
)

sketchybar --add slider volume right                   \
           --set        volume "${volume_slider[@]}"   \
           --subscribe  volume volume_change           \
                               mouse.clicked           \
                               mouse.entered           \
                               mouse.exited            \
           --add item volume.icon right                \
           --set      volume.icon "${volume_icon[@]}"

sketchybar --add bracket volume_bracket volume volume.icon \
           --set         volume_bracket "${status_bracket[@]}"
