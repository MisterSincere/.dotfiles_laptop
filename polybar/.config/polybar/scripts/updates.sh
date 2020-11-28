#!/usr/bin/env bash

BAR_ICON=""
CHECK_ICON=""
amount_updates=$( pacman -Qu | wc -l )

if (( amount_updates == 0)); then
  echo $CHECK_ICON" UpToDate"
else
  echo $BAR_ICON $amount_updates" Updates"
fi
