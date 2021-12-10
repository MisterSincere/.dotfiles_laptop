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

rofi -show "Screen Capture" -modi "Screen Capture:~/.config/rofi/scripts/screen_cap.sh" -i -theme "$dir/cap_dialog.rasi"
