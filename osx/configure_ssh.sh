#!/bin/bash

__configure_ssh() {
    __green_echo "Configuring ssh home directory copying files from Dropbox"
    cd "$HOME" || exit # in case of cd fails exits
    sudo rm -riv "$HOME/.ssh"

    ln -s "$HOME/Dropbox/.ssh" .ssh
    cd - || exit
}

__configure_ssh
