#!/bin/bash

# Define a unique name for the stockbar
STOCKBAR_NAME="polybar stockbar"

if pgrep -f "$STOCKBAR_NAME" > /dev/null; then
    # Kill the existing stockbar
    pkill -f "$STOCKBAR_NAME"
    echo "Stockbar killed"
else
    # Launch the stockbar
    polybar stockbar &
    echo "Stockbar launched with PID $!"
fi
