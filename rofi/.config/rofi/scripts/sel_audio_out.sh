#!/usr/bin/env bash

if [ $# -eq 0 ]; then

  options=$(pamixer --list-sinks | awk -F " \"" '{ if (NR!=1) { print substr($3, 1, length($3)-1) } }')

  echo "$options"

else

  selected_sink=$(pamixer --list-sinks | grep "$@" | awk '{ print $1 }')
  coproc ( pactl set-default-sink $selected_sink > /dev/null 2>1 )
  exit 0

fi