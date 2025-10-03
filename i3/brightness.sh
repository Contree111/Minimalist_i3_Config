#!/bin/bash

BRIGHTNESSCTL=/usr/bin/brightnessctl
NOTIFY=/usr/bin/dunstify

get_brightness() {
    $BRIGHTNESSCTL get
}

get_max_brightness() {
    $BRIGHTNESSCTL max
}

send_notification() {
    current=$(get_brightness)
    max=$(get_max_brightness)
    percent=$((100 * current / max))
    bar=$(seq -s "─" $((percent / 5)) | sed 's/[0-9]//g')
    $NOTIFY -i display-brightness -t 1500 -r 2594 -u normal "Brightness: ${percent}%    $bar"
}

case $1 in
    up)
        $BRIGHTNESSCTL set +5%
        send_notification
        ;;
    down)
        $BRIGHTNESSCTL set 5%-
        send_notification
        ;;
    *)
        echo "Usage: $0 {up|down}"
        ;;
esac
