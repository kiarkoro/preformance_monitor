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
    if [[ "$user_input" == "2" ]]; then
      echo "(1) Sort by CPU"
      echo "(2) Sort by Memory"
      echo "(3) Back to main menu"
      read -p "Enter your choice: " resource_choice
  if [[ "$resource_choice" == "3" ]]; then
    clear && printf '\033[3J'
    exit 0
  fi
    if [[ "$resource_choice" == "1" ]]; then
      ps -e -o comm,%cpu --sort=-%cpu | uniq | awk '$2 > 0.0 {print}' | head -n 10
      read -p "List all processes? (y/n): " list_all
  if [[ "$list_all" == "y" ]]; then
    ps -e -o comm,%cpu --sort=-%cpu | uniq
  fi
  if [[ "$list_all" == "n" ]]; then
    clear && printf '\033[3J'
    exit 0
  fi
  elif [[ "$resource_choice" == "2" ]]; then
    ps -e -o comm,%mem --sort=-%mem | uniq | awk '$2 > 0.0 {print}' | head -n 10
    read -p "List all processes? (y/n): " list_all_mem
  if [[ "$list_all_mem" == "y" ]]; then
    ps -e -o comm,%mem --sort=-%mem | uniq
  fi
  if [[ "$list_all_mem" == "n" ]]; then
    clear && printf '\033[3J'
    exit 0
  fi
  else
    echo "Invalid choice. Exiting."
    exit 1
  fi

  elif [[ "$user_input" == "3" ]]; then
  echo "(1) List longest running processes"
  echo "(2) List shortest running processes"
  echo "(3) List all processes"
  echo "(4) Close"
  read -p "Enter your choice: " time_choice
  if [[ "$time_choice" == "1" ]]; then
    ps -e -o comm,etime --sort=etime | uniq | awk '$2 > 0.0 {print}' | tail -n 10
  elif [[ "$time_choice" == "2" ]]; then
    ps -e -o comm,etime --sort=-etime | uniq | tail -n 10
  elif [[ "$time_choice" == "3" ]]; then
    ps -e -o comm,etime --sort=-etime | uniq | awk '$2 > 0.0 {print}'
  elif [[ "$time_choice" == "4" ]]; then
    clear && printf '\033[3J'
    exit 0
  fi
  else
    echo "Invalid choice. Exiting."
    exit 1
 fi