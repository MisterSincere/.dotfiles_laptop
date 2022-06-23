#!/bin/bash

BAR_ICON=""
CHECK_ICON=""

dunstify -r 42 -i pacman_nom "Updating databases..."

kdesu pacman -Syy
query_updates=$( yay -Qu )
amount_updates=$( echo ${query_updates} | wc -l )
amount_ignored_updates=$( ${query_updates} | grep -i "\[ignored\]" | wc -l )

if (( amount_updates == 0 )); then
  dunstify -r 42 -i pacman "No new updates"
else
  text="Found $amount_updates updates"
  if (( amount_ignored_updates > 0 ));  then
    text="$text (ignoring $amount_ignored_updates)"
  fi
  dunstify -r 42 -i pacman "$text"
fi
