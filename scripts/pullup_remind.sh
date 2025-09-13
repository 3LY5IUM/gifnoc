#!/bin/bash

# Check if Do Not Disturb is enabled
dnd_status=$(defaults read com.apple.notificationcenterui doNotDisturb)

if [ "$dnd_status" -eq 1 ]; then
    exit 0  # Exit if Do Not Disturb is on
fi

osascript -e 'display notification "Time to stand up!" with title "Pull Up Reminder"'
