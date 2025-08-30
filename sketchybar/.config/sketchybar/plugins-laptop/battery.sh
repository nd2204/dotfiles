#!/usr/bin/env sh

# Battery is here bcause the ICON_COLOR doesn't play well with all background colors

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

source "$HOME/.config/sketchybar/globals.sh"

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
  [8-9][0-9] | 100)
    ICON="􀛨"
    ICON_COLOR=${GREEN}
    ;;
  7[0-9])
    ICON="􀺸"
    ICON_COLOR=${AQUA}
    ;;
  [4-6][0-9])
    ICON="􀺶"
    ICON_COLOR=${YELLOW}
    ;;
  [1-3][0-9])
    ICON="􀛩"
    ICON_COLOR=${ORANGE}
    ;;
  [0-9])
    ICON="􀛪"
    ICON_COLOR=${RED}
    ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON="􀢋"
  ICON_COLOR=${YELLOW}
fi

sketchybar --set $NAME \
  icon=$ICON \
  label="${PERCENTAGE}%" \
  icon.color=${ICON_COLOR}
