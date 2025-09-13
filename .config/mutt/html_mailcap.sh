#!/usr/bin/env bash

# html_opener.sh: Prompt to open HTML with Firefox or Lynx

file="$1"

echo "Choose browser for ${file}:"
echo "  firefox"
echo "  lynx"
read choice

case "$choice" in
  1)
    open -a Firefox "$file";;
  2)
    lynx \
      -assume_charset="${CHARSET:-utf-8}" \
      -display_charset=utf-8 \
      -dump -width=1024 "$file";;
  *)
    echo "Invalid choice. Exiting." >&2
    exit 1;;
esac
