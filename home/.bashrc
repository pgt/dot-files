#!/bin/bash

# This file is only a link to the main configuration file
if [ -f "$HOME/.bash_profile" ]; then
    source "$HOME/.bash_profile"
else
    __red_echo "Not found $HOME/.bash_profile "
fi
