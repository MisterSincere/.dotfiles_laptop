#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Xorg - Display Setup 
#xrandr --output HDMI-0 --panning 1920x1080+0+0
#xrandr --output DP-2 --mode 2560x1440 --panning 2560x1440+1920+0 --primary

# X Key Bindings 
xbindkeys &

# Keyboard Layout
setxkbmap de &

# compositor
picom -i 1 -f -b --config ~/.config/picom/picom.conf &

# Window Manager
exec i3
#exec xmonad
