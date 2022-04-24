#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Merge system resources
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

# System modmap
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

# Merge user resources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# User modmap
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Bluetooth
rfkill unblock 0
bluetoothctl power on

# Set wallpaper
feh --bg-fill ~/Pictures/wallpapers/evening-sky.png &

# Launch polybar early
polybar &

# Apps
dunst &
mpd-discord-rpc &
sxhkd &
picom --experimental-backends &
conky -c ~/.config/conky/config.conf &

# Set cursor
xsetroot -cursor_name left_ptr

# Startup script
zsh ~/.config/scripts/startup &

# Start bspwm
exec bspwm
