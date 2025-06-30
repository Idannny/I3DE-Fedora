#!/bin/bash

# Path to your background image
BACKGROUND="/home/dannybwoi/.config/i3/background/zhengfanzi.png"

# Lock screen appearance options
i3lock \
--image=$BACKGROUND \


# Directory containing the frames of the animation
#FRAME_DIR="/path/to/frames"
#FRAMES=($FRAME_DIR/*.png)
#NUM_FRAMES=${#FRAMES[@]}
#INTERVAL=0.05  # Interval in seconds

#while true; do
#    for ((i=0; i<NUM_FRAMES; i++)); do
#        i3lock-fancy -p -i "${FRAMES[$i]}"
#        sleep $INTERVAL
#    done
#done


