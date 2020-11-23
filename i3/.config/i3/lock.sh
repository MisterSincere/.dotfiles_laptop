#!/bin/sh

B='#00000000' # blank
C='#ffffff22' # clear ish
D='#ff00ffcc' # default
T='#ee00eeee' # text
W='#880000bb' # wrong
V='#bb00bbbb' # verifying

i3lock                  \
-i ~/.config/i3/lock_image.png \
--insidevercolor=$C     \
--ringvercolor=$V       \
\
--insidewrongcolor=$C   \
--ringwrongcolor=$W     \
\
--insidecolor=$B        \
--ringcolor=$D          \
--linecolor=$B          \
--separatorcolor=$D     \
\
--verifcolor=$T         \
--wrongcolor=$T         \
--timecolor=$T          \
--datecolor=$T          \
--layoutcolor=$T        \
--keyhlcolor=$W         \
--bshlcolor=$W          \
\
--screen 2              \
--clock                 \
--indicator             \
--timestr="%H:%M:%S"    \
--datestr="%A, %m %Y"   \
--keylayout 1           \
\
--veriftext="Neat!"     \
--wrongtext="Nope!"
