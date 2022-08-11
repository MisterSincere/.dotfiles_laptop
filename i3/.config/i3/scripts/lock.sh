#!/bin/sh

B='#00000000' # blank
C='#ffffff22' # clear ish
D='#ff00ffcc' # default
T='#ee00eeee' # text
W='#880000bb' # wrong
V='#bb00bbbb' # verifying

i3lock            \
-i ~/.config/i3/lock_image.png \
--insidever-color=$C     \
--ringver-color=$V       \
\
--insidewrong-color=$C   \
--ringwrong-color=$W     \
\
--inside-color=$B        \
--ring-color=$D          \
--line-color=$B          \
--separator-color=$D     \
\
--verif-color=$T         \
--wrong-color=$T         \
--time-color=$T          \
--date-color=$T          \
--layout-color=$T        \
--keyhl-color=$W         \
--bshl-color=$W          \
\
--screen 2              \
--clock                 \
--indicator             \
--time-str="%H:%M:%S"    \
--date-str="%A, %m %Y"   \
--keylayout 1           \
\
--verif-text="Neat!"     \
--wrong-text="Nope!"
