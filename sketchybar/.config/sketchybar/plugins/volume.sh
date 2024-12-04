#!/bin/sh
#
# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
    [6-9][0-9]|100)
      ICON="󰕾"
      ICON_PADDING_RIGHT=6
      ;;
    [3-5][0-9])
      ICON="󰖀"
      ICON_PADDING_RIGHT=6
      ;;
    [1-9]|[1-2][0-9])
      ICON="󰕿"
      ICON_PADDING_RIGHT=6
      ;;
    *) ICON="󰖁"
      ICON_PADDING_RIGHT=6
      ;;
  esac

  sketchybar --set "$NAME" icon="$ICON" icon.padding_right=$ICON_PADDING_RIGHT label="$VOLUME%"
fi
