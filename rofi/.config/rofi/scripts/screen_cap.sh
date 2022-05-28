#!/usr/bin/env bash

selectregion="Region"
selectactivewindow="Active window"
selectwholescreen="Whole screen"

if [ $# -eq 0 ]; then

  echo "$selectactivewindow"
  echo "$selectwholescreen"
  echo "$selectregion"

elif [ "$@" == "$selectregion" ]; then

  coproc ( maim -s -u | xclip -selection clipboard -t image/png -i > /dev/null 2>1 )
  exit 0

elif [ "$@" == "$selectactivewindow" ]; then

  coproc ( maim -u -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png -i 2>1 )

elif [ "$@" == "$selectwholescreen" ]; then

  coproc ( sleep 0.4; maim -u | xclip -selection clipboard -t image/png -i 2>1 )

fi

