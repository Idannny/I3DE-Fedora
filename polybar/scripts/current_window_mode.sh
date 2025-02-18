#!/bin/bash

mode=$(i3-msg -t get_tree | jq -r '.. | select(.focused? == true).floating')

if [ "$mode" == "user_on" ]; then
    echo "Floating"
else
    echo "Tiling"
fi

