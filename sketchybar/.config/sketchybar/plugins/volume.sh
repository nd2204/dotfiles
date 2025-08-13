#!/bin/sh
#
# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

source $HOME/.config/sketchybar/animation.sh

hover_border_default $SENDER $NAME

case "$SENDER" in
  "mouse.clicked")
    osascript -e "set volume output muted not (output muted of (get volume settings))"
    ;;
  "volume_change")
    VOLUME="$INFO"
    VALUE="$VOLUME%"
    case "$VOLUME" in
      [6-9][0-9]|100)
        ICON="󰕾"
        ICON_PADDING_RIGHT=8
        ;;
      [1-9]|[1-5][0-9])
        ICON="󰖀"
        ICON_PADDING_RIGHT=8
        ;;
      *)
        if [ "$(osascript -e "output muted of (get volume settings)")" = 'true' && "$VOLUME" = "0" ]; then
          ICON="󰖁"
          VALUE="MUTED"
          ICON_PADDING_RIGHT=8
        else
          ICON="󰕿"
          ICON_PADDING_RIGHT=8
        fi
        ;;
    esac
    sketchybar --set "$NAME" icon="$ICON" icon.padding_right=$ICON_PADDING_RIGHT label=$VALUE
    blink_default $NAME 14 1
    ;;
esac
