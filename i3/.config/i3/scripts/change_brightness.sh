#!/bin/bash

msg_tag="brightnessbar"
brightness=$(brightnessctl -d intel_backlight -m | awk -F "," '{ print $4}')

echo $brightness
dunstify -a "change_brightness" -u low -h string:x-dunst-stack-tag:$msg_tag -h int:value:"${brightness}" "Brightness: ${brightness}"
