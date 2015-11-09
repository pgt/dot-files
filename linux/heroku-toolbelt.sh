#!/bin/bash

__install_heroku_toolbelt() {
    __green_echo "Installing Heroku toolbelt"
    wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
}

__install_heroku_toolbelt
