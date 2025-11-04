#!/bin/bash

source ./utils/config.sh

draw_line_separator
echo -e "===== CLONANDO REPOSITORIOS ====="

# read json repos file
repos_list=$(tr -d '\n' < ./utils/json/repos.json | sed -E 's/[][]//g; s/"//g; s/,/ /g')

# transform in array
read -r -a REPOS_TO_CREATE <<< "$repos_list"

# count repos
echo "Repositórios encontrados: ${#REPOS_TO_CREATE[@]}"

# interact with found repos
for i in "${!REPOS_TO_CREATE[@]}"; do
  # check repo exists
  if [ ! -e "./${REPOS_TO_CREATE[$i]}" ]; then
    # message and clone repo
    echo -e "Clonando repositório: ${REPOS_TO_CREATE[$i]}"
    git clone git@github.com:maxrodrigues/${REPOS_TO_CREATE[$i]}
  else
    # wait and message
    sleep 1
    echo -e "O projeto ${REPOS_TO_CREATE[$i]} já existe."
  fi
done