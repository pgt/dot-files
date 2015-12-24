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

	time_before="$(date +%s)"
	source "$bashrc_path"
	time_total="$(($(date +%s)-time_before))"

	__green_echo "Loaded file [$bashrc_path], it took ${time_total} seconds"
	clear
    done
}

__setup
