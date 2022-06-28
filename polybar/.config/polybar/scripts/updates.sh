#!/usr/bin/env bash

PACKAGE_ICON=""
AUR_ICON=" "
CHECK_ICON=""

n_all_updates=$( yay -Qu | grep -iv "\[ignored\]" | wc -l)
n_off_updates=$( pacman -Qu | grep -iv "\[ignored\]" | wc -l)
n_aur_updates=$(( ${n_all_updates} - ${n_off_updates} ))

if (( ${n_all_updates}== 0)); then
  echo $CHECK_ICON
else
  printf '%s %s/%s' ${PACKAGE_ICON} ${n_all_updates} ${n_aur_updates}
fi
