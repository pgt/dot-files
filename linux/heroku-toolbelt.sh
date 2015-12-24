#!/bin/bash

__install_heroku_toolbelt() {
    wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
}

__install_heroku_toolbelt
