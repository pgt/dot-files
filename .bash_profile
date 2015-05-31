#!/bin/bash

export HOME="/Users/pgt"

source ~/.bash-powerline.sh
source ~/dot-files/functions.sh
source ~/dot-files/bash_exports.sh
red_green "Warning: Please copy the file bash_exports_secret.sh.example and do your version"
source ~/dot-files/bash_exports_secret.sh
source ~/dot-files/bash_options.sh
source ~/dot-files/bash_aliases.sh
source ~/dot-files/bash_powerline.sh

green_echo "Cleaning up the screen..."; clear
