#!/bin/bash

if ["$#" -lt "2"]; then
    echo "Usage: cmd ssid password"
else

    wpa_passphrase $1 $2 > temp.conf

    sudo wpa_supplicant -B -i wlp2s0 -c temp.conf

    rm temp.conf

    sudo dhcpcd wlp2s0

fi
