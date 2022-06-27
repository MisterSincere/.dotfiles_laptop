#!/bin/bash

# Terminate already running bar instances and wait for them to terminate
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
echo "---" | tee -a /tmp/polybar_hdmi0_top.log /tmp/polybar_perf_bar.log /tmp/polybar_dp2_top.log
polybar -c ~/.config/polybar/config.ini hdmi0_top >> /tmp/polybar_hdmi0_top.log 2>&1 & disown
polybar -c ~/.config/polybar/config.ini perf_bar >> /tmp/polybar_perf_bar.log 2>&1 & disown
polybar -c ~/.config/polybar/config.ini dp2_top >> /tmp/polybar_dp2_top.log 2>&1 & disown 
