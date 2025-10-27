#!/bin/bash

ps -e -o comm
ps -e -o comm | sort | uniq
apps=($(ps -e -o comm | sort | uniq))
for i in "${!apps[@]}"; do
  echo "$((i+1))) ${apps[$i]}"
done
