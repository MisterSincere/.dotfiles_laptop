#!/bin/bash

BAR_ICON=""
CHECK_ICON=""

dunstify -r 42 -i pacman_nom "Updating databases..."

sudo pacman -Syy
amount_updates=$( pacman -Qu | wc -l )
amount_ignored_updates=$( pacman -Qu | grep -i "\[ignored\]" | wc -l )

if (( amount_updates == 0 )); then
  dunstify -r 42 -i pacman "No new updates"
else
  text="Found $amount_updates updates"
  if (( amount_ignored_updates > 0 ));  then
    text="$text (ignoring $amount_ignored_updates)"
  fi
  dunstify -r 42 -i pacman "$text"
fi
