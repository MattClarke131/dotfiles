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

lines=$(wc -l <<< "$ascii_art")
cols=$(tput cols)
rows=$(tput lines)

v_padding=$(( (rows - lines) / 2 ))
for ((i=2; i<v_padding; i++)); do echo; done
while IFS= read -r line; do
  h_padding=$(( (cols - ${#line}) / 2 ))
  printf "%*s%s\n" $h_padding "" "$line"
done <<< "$ascii_art"
for ((i=0; i<v_padding; i++)); do echo; done
