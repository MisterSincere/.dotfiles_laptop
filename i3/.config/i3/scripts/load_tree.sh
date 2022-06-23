#!/bin/bash

# load workspace 1 layout and fill it with a tmux session within alacritty
i3-msg "workspace 1:  ; append_layout /home/kaffeekind/.config/i3/layout/wp1.json"
alacritty -e $HOME/.config/i3/scripts/tmux_open.sh &

# wp2 firefox
i3-msg "workspace 2:  ; append_layout /home/kaffeekind/.config/i3/layout/wp2.json"
firefox &

# wp4 spotify
i3-msg "workspace 4:  ; append_layout /home/kaffeekind/.config/i3/layout/wp4.json"
spotify &

# wp5 discord and slack
i3-msg "workspace 5:  ; append_layout /home/kaffeekind/.config/i3/layout/wp5.json"
discord &
slack &

