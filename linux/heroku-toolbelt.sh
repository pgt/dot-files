#!/bin/bash

__install_heroku_toolbelt() {
    local already_installed
    already_installed=$(__already_installed "heroku")

    if [[ $already_installed = "not_installed" ]]; then
	wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
    else
	__green_echo "Already installed"
    fi
}

__install_heroku_toolbelt
