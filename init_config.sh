#!/bin/bash

set -e
clear
echo ""

source utils/repos.sh

echo -e "\n"
echo -e "===== SUBINDO TODOS OS CONTAINERES =====";
echo -e "... Isso pode demorar um pouco, aproveite para pegar um café!"
docker-compose up -d --build >/dev/null 2>&1 || exit 1
echo -e "\n"

source utils/database.sh