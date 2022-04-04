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

# Set cursor
xsetroot -cursor_name left_ptr

# Set wallpaper
feh --bg-center ~/Pictures/wallpapers/shaded_landscape.png

# Launch applications
sxhkd &
picom &
dunst &
polybar &

# Clipboard manager
copyq &

# Startup script
zsh ~/.config/autostart/startup &

# Set keyboard layout to 'uk' (a.k.a. gb)
exec bspwm | setxkbmap gb
