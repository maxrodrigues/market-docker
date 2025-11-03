#!/bin/bash

source ./utils/config.sh

draw_line_separator
echo -e "===== CLONANDO REPOSITORIOS ====="

repos_list=$(tr -d '\n' < ./utils/json/repos.json | tr -d '[]" ' | sed 's/,/ /g')
read -a REPOS_TO_CREATE <<< "$repos_list"

for repos in "${REPOS_TO_CREATE[@]}"; do
  if [ ! -e "./${repos}" ]; then
    echo -e $repos
  else
    sleep 1
    printf "\n ${information}O projeto ${repos} já existe.${nocolor}"
  fi
done