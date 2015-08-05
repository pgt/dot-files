#!/bin/bash

green_echo "bash_exports.sh"
green_echo "Exporting some variables"

# default editor
export EDITOR="emacs"

# Locale
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8

# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups

# Increase the maximum number of lines contained in the history file
# (default is 500)
export HISTFILESIZE=10000

# Increase the maximum number of commands to remember
# (default is 500)
export HISTSIZE=10000

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# GO env vars
export GOROOT=$HOME/go
export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOROOT/bin
