#!/bin/bash
export LANG=en_US.UTF-8

query=$(echo "" |dmenu -p "DuckDuckGo: ")

w3m -dump_source $(urlform $query) > /tmp/ddg

result=$(urlsplit | cut -f1 -s | dmenu -i -l 10 -p 'Results') 
if [ -n "$result" ]; then
    exec chromium-browser --app=$result
fi
