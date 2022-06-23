#!/usr/bin/env bash

selectregion="Region"
selectactivewindow="Active window"
selectwholescreen="Whole screen"

if [ $# -eq 0 ]; then

  echo "$selectregion"
  echo "$selectactivewindow"
  echo "$selectwholescreen"

elif [ "$@" == "$selectregion" ]; then

  coproc ( maim -s -u | xclip -selection clipboard -t image/png -i && ~/.config/rofi/scripts/screen_cap_save.sh > /dev/null 3>1 )

elif [ "$@" == "$selectactivewindow" ]; then

  coproc ( maim -u -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png -i && ~/.config/rofi/scripts/screen_cap_save.sh > /dev/null 3>1 )

elif [ "$@" == "$selectwholescreen" ]; then

  coproc ( sleep 0.4; maim -u | xclip -selection clipboard -t image/png -i && ~/.config/rofi/scripts/screen_cap_save.sh > /dev/null 3>1 )

fi

