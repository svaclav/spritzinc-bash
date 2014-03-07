#!/bin/bash
echo -ne "Insert you text: "
read words
echo -ne "Set speed of text in seconds (it can be floating number): "
read speed
for tmp in $words; do
    printf "%80s\033[0K\r" "$tmp"
    sleep $speed
done
echo
