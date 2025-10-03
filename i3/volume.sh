
#!/bin/bash

PULSEAUDIO=/usr/bin/pactl
NOTIFY=/usr/bin/dunstify

get_volume() {
    $PULSEAUDIO get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%'
}

is_mute() {
    $PULSEAUDIO get-sink-mute @DEFAULT_SINK@ | grep -q "yes"
}

send_notification() {
    volume=$(get_volume)
    bar=$(seq -s "─" $((volume / 5)) | sed 's/[0-9]//g')
    $NOTIFY -i audio-volume-high -t 1500 -r 2593 -u normal "Vol: ${volume}%    $bar"
}

case $1 in
    up)
        $PULSEAUDIO set-sink-mute @DEFAULT_SINK@ 0
        $PULSEAUDIO set-sink-volume @DEFAULT_SINK@ +5%
        send_notification
        ;;
    down)
        $PULSEAUDIO set-sink-mute @DEFAULT_SINK@ 0
        $PULSEAUDIO set-sink-volume @DEFAULT_SINK@ -5%
        send_notification
        ;;
    mute)
        $PULSEAUDIO set-sink-mute @DEFAULT_SINK@ toggle
        if is_mute; then
            $NOTIFY -i audio-volume-muted -t 1500 -r 2593 -u normal "Mute"
        else
            send_notification
        fi
        ;;
esac
