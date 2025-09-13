#!/bin/bash

main_page=$(curl -s https://learnxinyminutes.com/)

topic=$(echo "$main_page" | grep  -E 'href=\"\/' | grep -v 'title' | grep -v 'link'| awk -v FS=/ '{print $2}' | fzf)

topic_page=$(curl -s "https://learnxinyminutes.com/$topic")

endoflink=$(echo "$topic_page"| grep -A 2 'Get the code' | grep -v 'Get the code' | ggrep -P -o '(?<=")\/.*\/.*(?=")')

filetype=$(echo $endoflink | awk -v FS=. '{print $NF}')

# curl -s https://learnxinyminutes.com$endoflink | nvim -R -c "set filetype=$filetype" - 

curl -s https://learnxinyminutes.com$endoflink | bat --style=numbers -l "$filetype"
