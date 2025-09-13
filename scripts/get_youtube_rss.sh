#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Error: No arguments provided."
    exit 1
fi

channel_id=$(curl -s $1 | ggrep -o -P '"https://www.youtube.com/feeds/videos.xml\?channel_id=[A-Za-z0-9_-]{24}"' | cut -d = -f 2 | cut -d \" -f 1 | awk 'NR==1' )
channel_name=$(echo $1 | cut -d @ -f 2)

echo $channel_id
echo $channel_name


echo -n "https://www.scriptbarrel.com/xml.cgi?channel_id=$channel_id&name=$channel_name" | pbcopy

