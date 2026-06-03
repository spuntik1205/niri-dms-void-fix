#!/bin/bash
# Niri Audio Startup script
# Check if pipewire is already running
if ! pgrep -x pipewire > /dev/null; then
    pipewire &
    sleep 1
fi
if ! pgrep -f wireplumber > /dev/null; then
    wireplumber &
    sleep 1
fi
if ! pgrep -f pipewire-pulse > /dev/null; then
    pipewire-pulse &
fi
