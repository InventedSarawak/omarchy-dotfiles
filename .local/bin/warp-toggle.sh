#!/usr/bin/env bash

status=$(warp-cli status | grep -i "Status" | awk '{print $3}')

if [ "$status" = "Connected" ]; then
  warp-cli disconnect
  notify-send "Cloudflare WARP" "Disconnected"
else
  warp-cli connect
  notify-send "Cloudflare WARP" "Connected"
fi
