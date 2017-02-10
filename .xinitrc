#!/bin/bash

# Load resources
xrdb -merge .Xresources

#export WM=xmonad
export WM=i3

if ["$WM"=="xmonad"]; then

# Set up icon tray
    trayer --edge top --align right --SetDockType true --SetPartialStrut true \
    --expand true --width 10 --transparent true --tint 0x191970 --height 12 &

fi;

# Set the background color
xsetroot -solid midnightblue

# Fire up apps
guake &
#slack &

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi


dbus-launch $WM 
