#!/bin/bash

playerctl play-pause

CMD=$(playerctl status);

if [ "$CMD" == "Playing" ]; then
  dunstify "$(playerctl metadata xesam:title)"
fi
