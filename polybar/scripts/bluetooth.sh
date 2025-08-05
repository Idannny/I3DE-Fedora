#!/bin/bash

case "$1" in
--status)
    powered=$(bluetoothctl show | grep "Powered: yes")
    if [ -z "$powered" ]; then
        echo "Bluetooth: Off"
    else
        devices=$(bluetoothctl devices Connected | cut -d ' ' -f 3-)
        if [ -z "$devices" ]; then
            echo "Bluetooth: On"
        else
            echo "Bluetooth: $devices"
        fi
    fi
    ;;
--toggle)
    if [ -z "$(bluetui | grep 'Powered: yes')" ]; then
        bluetoothctl power on |
	bluetui
    else
        bluetoothctl power off 
    fi
    ;;
--manager)
    bluetui &
    ;;
esac

