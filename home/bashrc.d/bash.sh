#!/bin/bash

__bash_configs() {
    bash_options=(
	# Autocomplete on bash
	autocd

	# Autocorrect typos in path names when using `cd`
	cdspell

	# Check the window size after each command and, if necessary,
	# update the values of LINES and COLUMNS.
	checkwinsize

	# Append to the Bash history file, rather than overwriting it
	histappend

	# Case-insensitive globbing (used in pathname expansion)
	nocaseglob
    )

    for bash_option in "${bash_options[@]}"; do
	shopt -s "$bash_option" > 2&>1 || \
	    __yellow_echo "The option $bash_option is only available \
in interactive shells. Maybe your bash is old and needs some update..."

	__green_echo "Enabled with success [$bash_option]"
    done
}

__bash_configs
