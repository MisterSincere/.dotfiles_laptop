#!/bin/bash

dunstify -r 42 -i pacman_nom "Updating databases..."

yay -Syy > /dev/null
n_all_updates=$( yay -Qu | grep -iv "\[ignored\]" | wc -l)
n_off_updates=$( pacman -Qu | grep -iv "\[ignored\]" | wc -l)
n_aur_updates=$(( ${n_all_updates} - ${n_off_updates} ))

if (( ${n_all_updates} == 0 )); then
  dunstify -r 42 -i pacman "No new updates"
else
  text="Found $n_off_updates official and $n_aur_updates AUR updates"
  if (( ${amount_ignored_updates} > 0 ));  then
    text="$text (ignoring $amount_ignored_updates)"
  fi
  dunstify -r 42 -i pacman "$text"
fi
