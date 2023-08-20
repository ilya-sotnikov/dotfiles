#!/bin/sh

while getopts "idmq" option; do
    case $option in
        i)
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
            statusbar-update.sh
            ;;
        d)
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
            statusbar-update.sh
            ;;
        m)
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            statusbar-update.sh
            ;;
        q)
            wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d " " -f 2- | sed "s/MUTED/M/"
            ;;
        *)
            echo "Usage $0 [-i] [-d] [-m] [-q]"
            exit 1
            ;;
    esac
done
