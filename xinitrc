#!/bin/bash

# Using Nvidia for X server
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#xrandr --dpi 96 # fix high resolution

# Load resources
xrdb -merge .Xresources

export WM=xmonad
#export WM=i3

#if [ "$WM" == "xmonad" ]; then

# Set up icon tray
#    trayer --edge top --align right --SetDockType true --SetPartialStrut true \
#    --expand true --width 10 --transparent true --tint 0x191970 --height 12 &

#fi;

# Set the background color
xsetroot -solid midnightblue

feh --bg-scale /home/shivnshu/Pictures/wallpaper.png

# fix java issues
#wmname LG3D

# Fire up apps
compton -f &
#guake &
#slack &
#thunderbird&
blueman-applet&
urxvtd --quiet --opendisplay --fork

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

# For nvidia-docker
#sudo -b nohup nvidia-docker-plugin > /tmp/nvidia-docker.log

dbus-launch $WM 
