#!/usr/bin/env bash

LOGIN_URL="https://10.0.112.2:8090/login.xml"

USERNAME="vedant.k23@iiits.in"
PASSWORD="ObamaBinLaden@123"
MODE="191"
PRODUCTTYPE="0"

TIMEOUT=5
START_DELAY=20
INTERVAL=600   # 10 minutes

LOGFILE="$HOME/.iiits_wifi_keepalive.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOGFILE"
}

log "Script started, waiting ${START_DELAY}s before first login..."
sleep "$START_DELAY"

while true; do
    log "Sending keepalive login request..."

    http_code=$(curl -sk \
        --connect-timeout "$TIMEOUT" \
        --max-time "$TIMEOUT" \
        -X POST "$LOGIN_URL" \
        -d "username=$USERNAME" \
        -d "password=$PASSWORD" \
        -d "mode=$MODE" \
        -d "a=$(date +%s%3N)" \
        -d "producttype=$PRODUCTTYPE" \
        -o /dev/null \
        -w "%{http_code}")

    log "Request finished (HTTP $http_code)"

    log "Sleeping for 10 minutes..."
    sleep "$INTERVAL"
done
