#!/bin/bash

nocolor='\033[0m'
green='\033[0;32m'
red='\033[0;31m'
cyan='\033[0;36m'
error='\033[1;31m'
information='\033[4;35m'

TERMCOLUMNS=$(tput cols)

draw_line_separator () {
  echo -e -n "\n"
  for i in $(seq ${TERMCOLUMNS});
  do
    echo -n =
  done
  echo -e "\n"
}

center_text () {
  printf "%*s\n" $(((${#1} + $COLUMNS)/2)) "${1}"
}