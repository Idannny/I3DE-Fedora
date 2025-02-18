#!/bin/bash

# Check the current window state
mode=$(i3-msg -t get_tree | jq -r '.. | select(.focused? == true).floating')

if [ "$mode" == "auto_off" ] || [ "$mode" == "user_off" ]; then
    i3-msg floating enable
elif [ "$mode" == "user_on" ]; then
    i3-msg floating disable
fi

