#!/bin/bash

# Load resources
xrdb -merge .Xresources

# Set up icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x191970 --height 12 &

# Set the background color
xsetroot -solid midnightblue

# Fire up apps
xscreensaver -no-splash &
#guake &

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

if [ -x /usr/bin/gnome-power-manager ] ; then
   sleep 3
   gnome-power-manager &
fi

export WM=xmonad
#export WM=i3
export TERMINAL=gnome-terminal

/*slack&*/
dbus-launch $WM 
