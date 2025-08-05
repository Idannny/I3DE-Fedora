#!/bin/bash

status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$status" = "yes" ]; then
    bluetoothctl power off
    sudo systemctl stop bluetooth
    sudo rfkill block bluetooth
else
    sudo rfkill unblock bluetooth
    sudo systemctl start bluetooth
    sleep 1
    bluetoothctl power on
fi

