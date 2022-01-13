#!/usr/bin/env bash

BAR_ICON=""
CHECK_ICON=""
amount_updates=$( yay -Qu | grep -v "\[ignored\]" | wc -l )

if (( amount_updates == 0)); then
  echo $CHECK_ICON
else
  echo $BAR_ICON$amount_updates
fi
