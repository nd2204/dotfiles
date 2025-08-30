#!/bin/bash


# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
space=(
  icon=􀀁
  associated_display=main
  ignore_association=on
  icon.font="$FONT_FACE:Regular:12.0"
  icon.color=$BACKGROUND_1
  icon.highlight_color=$GREEN
  icon.y_offset=1
  icon.padding_left=4
  icon.padding_right=4
  script="$PLUGIN_SHARED_DIR/space.sh"
)

for i in {1..5}
do
  sketchybar --add item space.$i left \
              --set      space.$i "${space[@]}" associated_space=$i \
              --subscribe space.$i space_change
  [ $i -eq 1 ] && sketchybar --set space.$i icon.padding_left=8
  [ $i -eq 5 ] && sketchybar --set space.$i icon.padding_right=8
done


spaces=(
  ${bracket_default_styles[@]}
)

# separator=(
#   icon=􀆊
#   icon.font="$FONT:Heavy:16.0"
#   padding_left=15
#   padding_right=15
#   label.drawing=off
#   associated_display=active
#   click_script='yabai -m space --create && sketchybar --trigger space_change'
#   icon.color=$WHITE
# )

sketchybar --add bracket spaces_bracket '/space\..*/'  \
           --set         spaces_bracket "${spaces[@]}" \
