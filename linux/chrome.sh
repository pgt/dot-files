#!/bin/bash

# TODO: Would be a nice feature check for dependencies before all
# package installations (maybe use Makefile for this)
__install_chrome(){
    local file="google-chrome-stable_current_amd64.deb"
    local url="https://dl.google.com/linux/direct/$file"

    # 64 bit download and install
    if [[ ! -x "$(command -v gdebi)" ]]; then
	source "linux/utils.sh"
    fi

    wget "$url"
    sudo gdebi "$file"
}

__install_chrome
