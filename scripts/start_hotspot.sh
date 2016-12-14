#/bin/bash

#First install create_ap 'pacman -S create_ap'

if [ "$#" -lt "2" ]; then
    echo "Usage: cmd 'ssid' 'passwd' (Assuming wlp2s0 as wireless iface and enp3s0 as sharing iface)"
else
    sudo create_ap wlp2s0 enp3s0 $1 $2 
fi
