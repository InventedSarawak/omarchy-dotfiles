#!/usr/bin/env bash

# Get status, grab the last word (Connected/Disconnected), remove dots
status=$(warp-cli status 2>/dev/null | grep -i "Status" | awk '{print $NF}' | tr -d '.')

if [[ "$status" == "Connected" ]]; then
    # class: used by CSS for color
    # alt: used by Config for Icon selection
    echo '{"text": "WARP", "class": "connected", "alt": "connected", "tooltip": "WARP is Connected"}'
elif [[ "$status" == "Disconnected" ]]; then
    echo '{"text": "WARP", "class": "disconnected", "alt": "disconnected", "tooltip": "WARP is Disconnected"}'
else
    echo '{"text": "Error", "class": "disconnected", "alt": "default", "tooltip": "WARP Service Error"}'
fi