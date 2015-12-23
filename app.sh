#!/bin/bash

# TODO: Start using this shit here
# https://github.com/koalaman/shellcheck
# https://github.com/rylnd/shpec
# https://github.com/sstephenson/bats

set -euo pipefail

# Check if we receive some argument to start something
program_name="$0";

__usage() {
    echo "usage: $program_name option"
    echo -e "\t start \t\t\t initialize program"
    echo -e "\t static_analysis_tool \t use shellsheck to see if there's some syntax error"
}

start() {
    __check_if_is_bash
    __add_ssh_key
    __create_home_code_directory
    __git_clone_my_dot_files

    __require
    __link_files_at_home
    __upgrade_system
    __install_all_packages

    __reload_dotfiles

    __clone_my_repositories

    __green_echo "FINISHED!"
}

static_analysis_tool() {
    __require
    __install shellcheck

    all_shell_files=(
	$(find . -name "*.sh")
    )

    for filename in "${all_shell_files[@]}"; do
	__green_echo "Checking for file [$filename]"

	# The OR conditional is necessary because when shellcheck
	# find errors in a file it exists with on error status and
	# not go to the next file
	shellcheck "$filename" || true
    done

    return 0;
}

__add_ssh_key() {
    # Prompt user to add ssh-key to github account.
    # This is needed for code-base cloning
    local directory="$HOME/code/dot-files/"

    # Directory not exists? then generate ssh
    if [[ ! -d $directory ]]; then
	# generate private and public keys if doesn't exists
	if [ ! -f ~/.ssh/id_rsa.pub ]; then
            ssh-keygen -t rsa \
		       -b 4096 \
		       -C "pgtnetwork@gmail.com"

	    echo "Add this ssh key to your github account!"
	    cat ~/.ssh/id_rsa.pub
	    echo "Press [Enter] to continue..." && read
	fi
    else
	echo "Not necessary create SSH key to clone repository dot-files"
    fi
}

__create_home_code_directory() {
    local path="$HOME/code"

    mkdir -p "$path"
    echo "Ensure creation of home code directory [$path] and going inside"

    cd "$path"
    echo "Now I'm inside of [$(pwd)]"
}

__git_clone_my_dot_files() {
    local directory="$HOME/code/dot-files/"

    # Directory exists? then clone the project
    if [[ -d $directory ]]; then
        echo "Project dot-files already cloned let's go inside of [$directory]"
	cd "$directory"
    else
	echo "Cloning the dot-files project"

	cd "$HOME/code"
	git clone git@github.com:pgt/dot-files.git

	cd "$directory"
	echo "Now I'm inside of [$(pwd)]"
    fi
}

__require() {
    # check if everything is already cloned and if it's not clone
    __git_clone_my_dot_files

    # Requiring functions
    source lib/functions.sh

    # Requiring files and functions
    __require_dependencies
}

__check_if_is_bash(){
    if [[ $SHELL =~ *bash* ]]; then
        echo "Please it's necessary to use bash instead of $SHELL"
	exit 0
    fi
}

if [ ${#@} == 0 ]; then
    __usage

    exit 1;
fi

case $1 in
    start) start;;
    static_analysis_tool) static_analysis_tool;;
    *) __usage;;
esac
