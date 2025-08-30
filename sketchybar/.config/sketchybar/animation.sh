#!/usr/bin/env zsh

source "$HOME/.config/sketchybar/globals.sh"

hover_border() {
  local SENDER="$1"
  local curve="$2"
  local duration="$3"
  local name="$4"
  local entered_color="$5"
  local exited_color="$6"

  case "$SENDER" in
    "mouse.entered")
      sketchybar --animate $curve $duration --set $name background.border_color=$entered_color
      ;;
    "mouse.exited")
      sketchybar --animate $curve $duration --set $name background.border_color=$exited_color
      ;;
  esac
}

hover_border_default() {
  hover_border "$1" "sin" "12" "$2" "$GREY_1" "$GREY"
}

blink() {
  local curve="$1"
  local name="$2"
  local blink_interval="$3"
  local blink_count=$(($4))
  local blink_color="$5"
  local base_color="$6"

  local blink_phase_timeout=$(echo "($blink_interval + 1) / 2" | bc)
  local wait_duration=$(echo "$blink_phase_timeout / 60" | bc -l)

  for ((i = 0; i < $blink_count; i++)); do
    sketchybar --animate $curve $blink_phase_timeout --set $name background.border_color=$blink_color
    sleep $wait_duration
    sketchybar --animate $curve $blink_phase_timeout --set $name background.border_color=$base_color
    sleep $wait_duration
  done
}

blink_default() {
  local name="$1"
  local blink_interval="$2"
  local blink_count=$(($3))
  blink "sin" $name $blink_interval $blink_count $FG $GREY
}
