#!/bin/bash

echo "(1) Sort alphabetically"
echo "(2) Sort by usage"
echo "(3) Sort by run time"
echo "(4) Exit"

read -p "Enter your choice: " user_input

if [[ "$user_input" == "4" ]]; then
  clear && printf '\033[3J']
  exit 0
elif [[ "$user_input" == "1" ]]; then
  # list alphebetically
  apps=($(ps -e -o comm | sort | uniq))
  for i in "${!apps[@]}"; do
    echo "$((i+1))) ${apps[$i]}"
    done

    echo '-------------------------'
    echo 'Do you want to search using words/letters? (y/n)'
    read search_choice
    if [[ "$search_choice" == "y" ]]; then
      read -p "Search: " search_term
      echo "Found: "
      ps -e -o comm | sort | uniq | grep "$search_term"
        
    elif [[ "$search_choice" == "n" ]]; then
      clear && printf '\033[3J'
      exit 0
    fi
    echo '-------------------------'
    echo 'Exit search (y/n)'
    read exit_search
    if [[ "$exit_search" == "y" ]]; then
      clear && printf '\033[3J'
      exit 0
    fi
    read -p "Search: " search_term
      if [[ "${apps[$i]}" == *"$search_term"* ]]; then
        echo "Found: ${apps[$i]}"
      fi
  fi