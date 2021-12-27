#!/bin/bash

BAR_ICON=""
CHECK_ICON=""

dunstify -r 42 -i pacman_nom "Updating databases..."

amount_updates_old=$( pacman -Qu | wc -l )
sudo pacman -Syy
amount_updates_now=$( pacman -Qu | wc -l )
amount_ignored_updates=$( pacman -Qu | grep -i "\[ignored\]" | wc -l )

if (( amount_updates_now == 0 )); then
  dunstify -r 42 -i pacman "No new updates"
else
  text="${amount_updates_now} updates ($(($amount_updates_now - $amount_updates_old)) new"
  if (( amount_ignored_updates > 0 ));  then
    text="$text, ignoring $amount_ignored_updates)"
  else
    text="$text)"
  fi
  dunstify -r 42 -i pacman "$text"
fi
