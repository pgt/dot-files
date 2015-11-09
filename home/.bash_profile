#!/bin/bash

__setup() {
    # Here are useful functions to be used in other places
    local path="$HOME/code/dot-files/lib/functions.sh"
    echo "Loading file [$path]"
    source "$path"

    bashrc=(
	$(ls -A "$HOME/bashrc.d")
    )

    for file in "${bashrc[@]}"; do
	local bashrc_path="$HOME/bashrc.d/$file"

	__green_echo "Loading file [$bashrc_path]"
	source "$bashrc_path"
	clear
    done
}

__setup
