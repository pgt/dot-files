#!/bin/bash

echo "functions.sh"
echo "Evaluating useful functions"

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

__green_echo() {
    echo -e "${green}===> $1 ${reset}"
}

__red_echo() {
    echo -e "${red}===> $1 ${reset}"
}

# HOW TO PASS ARGS HERE?
__install() {
    result =
    apt-get install \
	    -qq \ # No output except for errors
    -y \ # Always assume yes

    if result == success
       green_echo 'Installed package XYZ'
       elsif
       yellow_echo 'Already installed'
       else
	   red_echo 'Not installed'
}

__require_dependencies() {
    source require.sh # Iterar no diretório lib e fazer source em todos arquivos.

    green_echo 'required with success' # ?? Foi mesmo com sucesso
}

__link_files_at_home() {
    green_echo "Linking files to your home directory"

    green_echo ".bash_profile"
    rm -rf ~/.bash_profile
    ln -s ~/code/dot-files/.bash_profile ~/.bash_profile

    green_echo ".git_config"
    rm -rf ~/.git_config
    ln -s ~/code/dot-files/.gitconfig ~/.gitconfig
}

__update_source_list(){
    apt-get update \
	    -qq \ # No output except for errors
            -y # Always assume yes
}
