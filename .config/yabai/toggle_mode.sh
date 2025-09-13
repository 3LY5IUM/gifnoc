#!/bin/bash

# Get the current space layout
current_layout=$(yabai -m query --spaces --space | jq -r '.type')

# Cycle through layouts: bsp -> stack -> float -> bsp
if [ "$current_layout" = "bsp" ]; then
    yabai -m space --layout stack
elif [ "$current_layout" = "stack" ]; then
    yabai -m space --layout float
else
    yabai -m space --layout bsp
fi

