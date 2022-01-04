#!/bin/bash

brightness_file="$HOME/.config/i3/scripts/brightness_tmp"
brightness=$(brightnessctl -d intel_backlight -m | awk -F "," '{ print substr($4, 1, length($4)-1) }')

if (( $brightness == 0 )); then
  brightness=$(cat $brightness_file)
  brightnessctl s $brightness%
else
  echo $brightness > $brightness_file
  brightnessctl s 0%
fi
