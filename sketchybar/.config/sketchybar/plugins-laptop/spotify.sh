#!/bin/sh

# Max number of characters so it fits nicely to the right of the notch
# MAY NOT WORK WITH NON-ENGLISH CHARACTERS

MAX_LENGTH=20

# Logic starts here, do not modify
HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))

# Spotify JSON / $INFO comes in malformed, line below sanitizes it
SPOTIFY_JSON="$INFO"

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
  sketchybar --set $NAME label="${TRACK} < ${ARTIST}" label.drawing=yes icon.color=0xffa6da95
}

update_track() {

  TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
  ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"

  if [[ -z $SPOTIFY_JSON ]]; then
    TRACK=$(osascript -e 'tell application "Spotify" to name of current track')
    ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track')
    set_label "$TRACK" "$ARTIST"
    return
  fi

  PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')

  if [ $PLAYER_STATE = "Playing" ]; then
    set_label "$TRACK" "$ARTIST"
  elif [ $PLAYER_STATE = "Paused" ]; then
    sketchybar --set $NAME icon.color=0xffeed49f
  elif [ $PLAYER_STATE = "Stopped" ]; then
    sketchybar --set $NAME label="${TRACK} < ${ARTIST}" label.drawing=yes icon.color=0xffeed49f
  else
    sketchybar --set $NAME label="No Track Currently Playing" label.drawing=yes icon.color=0xffeed49f
  fi
}

case "$SENDER" in
  "mouse.clicked")
    osascript -e 'tell application "Spotify" to playpause'
    ;;
  *)
    update_track
    ;;
esac
