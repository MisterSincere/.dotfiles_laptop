#!/usr/bin/env bash

dir="$HOME/.config/rofi/styles"

# dark
ALPHA="#00000000"
BG="#000000ff"
FG="#FFFFFFff"
SELECT="#101010ff"
ACCENT='#D840D8FF'

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

rofi -show "Select audio out" -modi "Select audio out:~/.config/rofi/scripts/sel_audio_out.sh" -i -theme "$dir/dialog.rasi"
