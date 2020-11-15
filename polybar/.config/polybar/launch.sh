#!/usr/bin/env bash

# terminate already running bar instances
killall -q polybar
# if all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# launch bar1 and bar2
echo "---" | tee -a /tmp/polybar_dp2.log /tmp/polybar_hdmi0.log
polybar dp2 >>/tmp/polybar_dp2.log 2>&1 & disown
polybar hdmi0 >>/tmp/polybar_hdmi0.log 2>&1 & disown

echo "Bars launched..."
