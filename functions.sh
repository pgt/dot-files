#!/bin/bash

echo "functions.sh"
echo "Evaluating useful functions"

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

green_echo() {
    echo -e "${green}===> $1 ${reset}"
}

red_echo() {
    echo -e "${red}===> $1 ${reset}"
}
