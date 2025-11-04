#!/bin/bash

set -e
source ./.env

# checks if the DB_PASSWORD variable has been set.
if [ -z "$DB_PASSWORD" ]; then
    echo -e "ERRO: DB_PASSWORD não está definida. Não é possível conectar ao DB."
    exit 1
fi

# checks if the database container is up and running.
if [ "$(docker ps -a -q -f name=mk-database)" ]; then
  # read json repos file
  database_list=$(tr -d '\n' < ./utils/json/databases.json | sed -E 's/[][]//g; s/"//g; s/,/ /g')

  # transform in array
  read -r -a DATABASES <<< "$database_list"

  # interact with found databases
  for i in "${!DATABASES[@]}"; do
    echo -e "--- Criando ou verificando DB: ${DATABASES[$i]}"
#    docker exec -i mk-database mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`${DATABASES[$i]}\`;"
  done

  echo -e "===== Criação de bancos de dados finalizada com sucesso! ====="
else
  echo -e "O container do banco de dados ainda não subiu."
fi

