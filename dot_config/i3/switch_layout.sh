#!/bin/bash

current=$(setxkbmap -query | grep layout | sed 's/[ ]*//g' | cut -d ':' -f 2)
if [ $current == "us" ]; then
    setxkbmap fr;
else
    setxkbmap us;
fi
