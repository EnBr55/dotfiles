#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'No argument given'
    exit 0
fi

~/Scripts/themeswitch.py $1
echo $1 > ~/.theme
# Other behaviour (e.g. wallpaper switching) here
