#!/bin/bash

green_echo "bash-options.sh"
green_echo "Default options"

red_echo "TODO: Check this commands to see with any of them it's really necessary"
# Autocorrect typos in path names when using `cd`
# shopt -s cdspell

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
# shopt -s checkwinsize

# Append to the Bash history file, rather than overwriting it
# shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob

red_echo "TODO: Wrong place to put rbenv configuration"
# rbenv
eval "$(rbenv init -)"

green_echo "Configuring bash-completion"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
