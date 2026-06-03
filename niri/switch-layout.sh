#!/bin/bash
# Switch the layout
niri msg action switch-layout next

# Wait a brief moment for Niri to register the switch
sleep 0.1

# Get the current active layout (the one with the asterisk)
LAYOUT=$(niri msg keyboard-layouts | awk '/\*/ { $1=""; $2=""; sub(/^[ \t]+/, ""); print }')

# Show a notification replacing any previous layout notification
notify-send -t 1500 -h string:x-canonical-private-synchronous:keyboard-layout "Keyboard Layout" "$LAYOUT"
