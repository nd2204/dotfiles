#!/usr/bin/env zsh

ICON=
LABEL="No Data"

set_label_and_icon() {
  sketchybar --set $NAME label="$LABEL"
  sketchybar --set $NAME.moon icon=$ICON
}

set_label_and_icon

IP=$(curl -s https://ipinfo.io/ip)
LOCATION_JSON=$(curl -s https://ipinfo.io/$IP/json)

if [ $? -ne 0 ]; then
  LABEL="No Location Info"
  set_label_and_icon
fi

LOCATION="$(echo $LOCATION_JSON | jq '.city' | tr -d '"')"
REGION="$(echo $LOCATION_JSON | jq '.region' | tr -d '"')"
COUNTRY="$(echo $LOCATION_JSON | jq '.country' | tr -d '"')"

# Line below replaces spaces with +
LOCATION_ESCAPED="${LOCATION// /+}+${REGION// /+}"
WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION_ESCAPED?format=j1")

if [ -z $WEATHER_JSON ]; then
  LABEL="$LOCATION"
  set_label_and_icon
  return
fi

TEMPERATURE=$(echo $WEATHER_JSON | jq '.current_condition[0].temp_C' | tr -d '"')
WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.current_condition[0].weatherDesc[0].value' | tr -d '"' | sed 's/\(.\{25\}\).*/\1.../')
MOON_PHASE=$(echo $WEATHER_JSON | jq '.weather[0].astronomy[0].moon_phase' | tr -d '"')

case ${MOON_PHASE} in
  "New Moon")
    ICON=
    ;;
  "Waxing Crescent")
    ICON=
    ;;
  "First Quarter")
    ICON=
    ;;
  "Waxing Gibbous")
    ICON=
    ;;
  "Full Moon")
    ICON=
    ;;
  "Waning Gibbous")
    ICON=
    ;;
  "Last Quarter")
    ICON=
    ;;
  "Waning Crescent")
    ICON=
    ;;
esac

LABEL="$LOCATION  $TEMPERATURE℃ $WEATHER_DESCRIPTION"
set_label_and_icon
