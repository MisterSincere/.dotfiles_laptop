#!/usr/bin/env sh

# Terminate already running bar instances and wait for them to terminate
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
echo "---" | tee -a /tmp/polybar_edp2_top.log
polybar -c ~/.config/polybar/config.ini edp1_top >> /tmp/polybar_edp2_top.log 2>&1 & disown 
