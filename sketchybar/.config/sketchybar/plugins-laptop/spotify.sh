#!/bin/sh

source $HOME/.config/sketchybar/globals.sh
source $HOME/.config/sketchybar/animation.sh

# Max number of characters so it fits nicely to the right of the notch
# MAY NOT WORK WITH NON-ENGLISH CHARACTERS

MAX_LENGTH=20

# Logic starts here, do not modify
HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))

# Spotify JSON / $INFO comes in malformed, line below sanitizes it
SPOTIFY_JSON="$INFO"

setbar() {
  PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')

  if [ $PLAYER_STATE = "Paused" ]; then
    sketchybar --set $NAME icon=""  icon.color=$AQUA
  else
    sketchybar --set $NAME icon=""  icon.color=$AQUA
  fi
}

# Calculations so it fits nicely
set_label() {
  TRACK=$1
  ARTIST=$2

  TRACK_LENGTH=${#TRACK}
  ARTIST_LENGTH=${#ARTIST}

  if [ $((TRACK_LENGTH + ARTIST_LENGTH)) -gt $MAX_LENGTH ]; then
      # If the total length exceeds the max
      if [ $TRACK_LENGTH -gt $HALF_LENGTH ] && [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
          # If both the track and artist are too long, cut both at half length - 1

          # If MAX_LENGTH is odd, HALF_LENGTH is calculated with an extra space, so give it an extra char
          TRACK="${TRACK:0:$((MAX_LENGTH % 2 == 0 ? HALF_LENGTH - 2 : HALF_LENGTH - 1))}…"
          ARTIST="${ARTIST:0:$((HALF_LENGTH - 2))}…"

      elif [ $TRACK_LENGTH -gt $HALF_LENGTH ]; then
          # Else if only the track is too long, cut it by the difference of the max length and artist length
          TRACK="${TRACK:0:$((MAX_LENGTH - ARTIST_LENGTH - 1))}…"
      elif [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
          ARTIST="${ARTIST:0:$((MAX_LENGTH - TRACK_LENGTH - 1))}…"
      fi
  fi
  setbar
  if [ $TRACK_LENGTH -eq 0 ] || [ $ARTIST_LENGTH -eq 0 ]; then
    sketchybar --set $NAME label="${TRACK}${ARTIST}" label.drawing=yes
  else
    sketchybar --set $NAME label="${TRACK} < ${ARTIST}" label.drawing=yes
  fi
}

update_track() {
  if [[ -z $SPOTIFY_JSON ]]; then
    if [ -z $TRACK ] || [ -z $ARTIST ]; then
      set_label "No Track" 
    fi
    return
  fi

  TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
  ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"

  PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')

  if [ $PLAYER_STATE = "Playing" ]; then
    set_label "$TRACK" "$ARTIST"
    blink_default $NAME 32 2
  else
    setbar
  fi

}


case "$SENDER" in
  "mouse.clicked")
    osascript -e 'tell application "Spotify" to playpause'
    ;;
  "mouse.entered" | "mouse.exited")
    hover_border "$SENDER" "sin" "12" "$NAME" "$AQUA" "$GREY"
    ;;
  *)
    update_track
    ;;
esac
