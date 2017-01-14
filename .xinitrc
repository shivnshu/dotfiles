export LD_PRELOAD=/usr/lib/libfreetype.so.6 /* Guake was not working */
export TERMINAL=gnome-terminal
guake&
/*rehash*/
nm-applet&
dbus-launch i3 
