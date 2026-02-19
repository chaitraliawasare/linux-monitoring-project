#!/bin/bash

CONFIG_FILE="/app/config/monitor.conf"

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Config file not found!"
    exit 1
fi

source "$CONFIG_FILE"
if [[ -z "$SLACK_WEBHOOK" ]]; then
    echo "Slack webhook not set. Skipping alert."
fi

USAGE=$(df / --output=pcent 2>/dev/null | tail -1 | tr -dc '0-9')
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "DEBUG: USAGE=$USAGE, THRESHOLD=$THRESHOLD"

if [[ -z "$USAGE" ]]; then
    echo "$TIMESTAMP ERROR: Could not determine disk usage." >> "$LOG_FILE"
    exit 1
fi

if (( USAGE > THRESHOLD )); then
    MESSAGE="🚨 Disk usage is $USAGE% at $TIMESTAMP"

    echo "$TIMESTAMP WARNING: Disk usage is $USAGE%" >> "$LOG_FILE"

    curl -X POST -H 'Content-type: application/json' \
    --data "{\"text\":\"$MESSAGE\"}" \
    "$SLACK_WEBHOOK"
else
    echo "$TIMESTAMP INFO: Disk usage is $USAGE%" >> "$LOG_FILE"
fi

