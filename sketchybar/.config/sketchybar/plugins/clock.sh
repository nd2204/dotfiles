#!/usr/bin/env zsh

source $HOME/.config/sketchybar/animation.sh

time_to_minutes() {
    local t=$1
    local h=${t%%:*}
    local m=${t##*:}
    echo $((10#$h * 60 + 10#$m))  # 10# prevents octal errors
}

case "$SENDER" in
  "mouse.clicked")
    osascript -e "tell app \"System Event\" to tell app \"Calendar\" to activate"
    ;;
  *)
    ASTRONOMY_ICON=""
    t=$(time_to_minutes "$(date '+%-H:%M')")
    tday=$(time_to_minutes "17:00")
    if ((t < tday)); then
      sketchybar --set $NAME.astronomy icon="􀆬"
    else
      sketchybar --set $NAME.astronomy icon="􀆺"
    fi

    sketchybar --set $NAME label="$(date "+%a %b %d %-H:%M")"
    ;;
esac

hover_border_default "$SENDER" "$NAME"
