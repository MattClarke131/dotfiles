#!/bin/bash

ascii_art="
  ⢀⡴⠁⠀⠀⣿⡏⠀⠀⠱⣄   
⢀⣴⡟⠁⠀⠀⠀⣿⡇⠀⠀⠀⠙⣷⣄ 
⠙⢿⣷⣄⠀⠀⠀⣿⡇⠀⠀⢀⣴⣿⠋ 
⠀⠀⠙⢿⣷⣄⠀⢻⡇⢀⣴⣿⠋   
⠀⠀⠀⠀⠈⠻⣷⣾⣷⡿⠋     
⠀⠀⠀⠀⠀⢀⣼⣿⣿⣷⣄     
⠀⠀⠀⢀⣶⣿⠟⢹⣏⠻⢿⣷⣄   
⠀⢀⣼⣿⠟⠁⠀⢸⣿⠀⠈⠙⢿⣷⣄ 
⣴⣿⡟⠁⠀⠀⠀⢸⣿⠀⠀⠀⠀⣹⣿⡷
⠈⠻⣿⣦⡀⠀⠀⢸⣿⠀⠀⢀⣼⣿⠏ 
⠀⠀⠈⠻⣿⣦⡀⢸⣿⠀⣴⣿⠟⠁  
⠀⠀⠀⠀⠈⠻⣿⣾⣿⣾⡿⠃⠀   
⠀⠀⠀⠀⠀⠀⠈⠻⡿⠋      
"

local lines=$(wc -l <<< "$ascii_art")
local cols=$(tput cols)
local rows=$(tput lines)
local v_padding=$(( (rows - lines) / 2 - 1))

for ((i=1; i<v_padding; i++)); do echo; done

while IFS= read -r line; do
  local h_padding=$(( (cols - ${#line}) / 2 ))
  printf "\e[38;5;88m%*s%s\e[0m\n" $h_padding "" "$line"
done <<< "$ascii_art"

for ((i=2; i<v_padding; i++)); do echo; done
