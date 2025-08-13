#!/usr/bin/env zsh

ICON_PADDING_RIGHT=5

if [ "$SENDER" = "front_app_switched" ]; then
  case $INFO in
    "Arc")
      ICON_PADDING_RIGHT=8
      ICON=󰞍
      ;;
    "Code")
      ICON_PADDING_RIGHT=8
      ICON=󰨞
      ;;
    "Calendar")
      ICON_PADDING_RIGHT=8
      ICON=
      ;;
    "Discord")
      ICON=
      ;;
    "FaceTime")
      ICON_PADDING_RIGHT=8
      ICON=
      ;;
    "Finder")
      ICON=󰀶
      ;;
    "Google Chrome")
      ICON_PADDING_RIGHT=8
      ICON=
      ;;
    "IINA")
      ICON_PADDING_RIGHT=8
      ICON=󰕼
      ;;
    "kitty")
      ICON=󰄛
      ;;
    "Messages")
      ICON=
      ;;
    "Notion")
      ICON_PADDING_RIGHT=8
      ICON=󰎚
      ;;
    "Preview")
      ICON_PADDING_RIGHT=8
      ICON=󰋩
      ;;
    "PS Remote Play")
      ICON_PADDING_RIGHT=8
      ICON=
      ;;
    "Spotify")
      ICON_PADDING_RIGHT=8
      ICON=
      ;;
    "TextEdit")
      ICON_PADDING_RIGHT=8
      ICON=
      ;;
    "Microsoft Edge")
      ICON_PADDING_RIGHT=8
      ICON=󰇩
      ;;
    "Ghostty")
      ICON_PADDING_RIGHT=8
      ICON=󰊠
      ;;
    "Transmission")
      ICON_PADDING_RIGHT=8
      ICON=󰶘
      ;;
    "Calculator")
      ICON_PADDING_RIGHT=8
      ICON=
      ;;
    *)
      ICON_PADDING_RIGHT=8
      ICON=
      ;;
  esac
  sketchybar --set $NAME \
      icon=$ICON \
      icon.padding_right=$ICON_PADDING_RIGHT \
      icon.padding_left=8
  sketchybar --set $NAME.name label="$INFO"
fi

