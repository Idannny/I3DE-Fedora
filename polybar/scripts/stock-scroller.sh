#!/bin/bash

API_KEY="cr3p59pr01ql234h73s0cr3p59pr01ql234h73sg"

stocks=("BTC" "IBM" "AAPL" "GOOGL" "BABA" "RIVN" "TCEHY" "BKNG" "SB" "RUT" "MSCI" "HPP" "TSM" "EWT" )
separator=" | "
update_interval=200  # Update data every 5 minutes (300 seconds)

get_stock_data() {
    local data=""
    for stock in "${stocks[@]}"; do
        response=$(curl -s "https://finnhub.io/api/v1/quote?symbol=$stock&token=$API_KEY")
        current_price=$(echo "$response" | jq -r '.c')
        previous_close=$(echo "$response" | jq -r '.pc')
        timestamp=$(echo "$response" | jq -r '.t')

        if [ -z "$current_price" ] || [ "$current_price" = "null" ]; then
            data+="$stock: No data$separator"
        else
            # Convert Unix timestamp to readable format
            last_update=$(date -d @$timestamp "+%H:%M:%S")
            
            # Compare current price with previous close
            if (( $(echo "$current_price > $previous_close" | bc -l) )); then
                color="%{B#00FF00}"  # Green background
            elif (( $(echo "$current_price < $previous_close" | bc -l) )); then
                color="%{B#FF0000}"  # Red background
            else
                color="%{B-}"  # Default background
            fi
            
            data+="${color}$stock: $current_price (at $last_update)%{B-}$separator"
        fi
    done
    echo "${data%$separator}"  # Remove the last separator
}

scroll_text() {
    local text="$1"
    local width=${#text}
    local padded_text="$text$separator$text"

    # Adjust the width of the scrolling window here
    local scroll_window_width=300  # Adjust this value for wider scrolling
    for ((i=0; i<width; i++)); do
        echo "${padded_text:$i:$scroll_window_width}"  # Use the adjusted width
        sleep 0.7  # Increase this value to slow down the scrolling
    done
}

last_update=0
stock_data=""

while true; do
    current_time=$(date +%s)

    # Update data if it's time
    if ((current_time - last_update >= update_interval)); then
        stock_data=$(get_stock_data)
        last_update=$current_time
    fi

    # Scroll the text
    scroll_text "$stock_data"
done
