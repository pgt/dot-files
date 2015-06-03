#!/bin/bash

source ~/code/.bash-powerline.sh
source ~/code/dot-files/functions.sh
source ~/code/dot-files/bash_exports.sh
red_green "Warning: Please copy the file bash_exports_secret.sh.example and do your version"
source ~/code/dot-files/bash_exports_secret.sh
source ~/code/dot-files/bash_options.sh
source ~/code/dot-files/bash_aliases.sh
source ~/code/dot-files/bash_powerline.sh
source ~/code/dot-files/bash_hh_configuration.sh

green_echo "Cleaning up the screen..."; clear
