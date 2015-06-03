#!/bin/bash

echo "Loading functions"; source "functions.sh"

green_echo "Linking files to your home directory"

green_echo ".bash_profile"
rm -rf ~/.bash_profile
ln -s ~/code/dot-files/.bash_profile ~/.bash_profile

green_echo ".git_config"
rm -rf ~/.git_config
ln -s ~/code/dot-files/.git_config ~/.git_config

green_echo "Installing first dependencies"; source ".init.sh"

green_echo "Installing necessary apps, commands and packages"
source "install/.init.sh"

green_echo "Configuring the environment on this Mac"
source "osx/.init.sh"

red_echo "Run the command 'source ~/.bash_profile'"
green_echo "Finished installation. Have fun :)"
