#!/bin/bash
function colors_init() {
options=(
	style=round
	width=5.0
	hidpi=on
	blacklist=OBS,Finder
	active_color="glow(0xFFFF1493)"
	# active_color="glow(0xFF7B68EE)"
	# active_color="glow(0xFF000000)"
	# background_color="glow(0xFF7B68EE)"

	# inactive_color="glow(0xFF000000)"
)

borders "${options[@]}" &
}





# path to file that keeps track of the current state
STATE_FILE="$XDG_CONFIG_HOME/borders/.borders_state"


# Check if the state file exists, if not create it and set the initial state to on
if [ ! -f "$STATE_FILE" ]; then
    echo "on" > "$STATE_FILE"
fi

# reads the current state
STATE=$(cat "$STATE_FILE")

if [ "$STATE" == "on" ]; then
    # Turn borders off
     pkill borders
    echo "off" > "$STATE_FILE"
elif [[ "$STATE" == "off" ]]; then
    # Turn borders on
    colors_init 
    echo "on" > "$STATE_FILE"
fi
