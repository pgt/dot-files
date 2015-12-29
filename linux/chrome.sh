#!/bin/bash

__install_chrome() {
    local already_installed
    already_installed=$(__already_installed "google-chrome")

    if [[ $already_installed = "not_installed" ]]; then
	local file="google-chrome-stable_current_amd64.deb"
	local url="https://dl.google.com/linux/direct/$file"

        wget "$url" --directory-prefix=/tmp
	sudo gdebi "/tmp/$file" # gdebi here already solve the conflicts
	rm -rf "/tmp/$file"
    else
	__green_echo "Already installed"
    fi
}

__install_chrome
