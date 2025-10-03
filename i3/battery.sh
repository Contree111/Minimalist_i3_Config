#!/bin/bash

NOTIFY=/usr/bin/dunstify
BAT_PATH=/sys/class/power_supply/BAT0

# Read battery percentage
capacity=$(cat $BAT_PATH/capacity)
status=$(cat $BAT_PATH/status)

# Thresholds
LOW=20
CRITICAL=10

if [ "$status" = "Discharging" ]; then
    if [ "$capacity" -le $CRITICAL ]; then
        $NOTIFY -i battery-caution -u critical -r 2595 "Battery Critical: ${capacity}%"
    elif [ "$capacity" -le $LOW ]; then
        $NOTIFY -i battery-low -u normal -r 2595 "Battery Low: ${capacity}%"
    fi
fi
