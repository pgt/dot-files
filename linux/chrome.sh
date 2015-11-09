#!/bin/bash

# TODO: Would be a nice feature check for dependencies before all
# package installations (maybe use Makefile for this)
__install_chrome(){
    # 64 bit download and install
    if [[ -x "$(command -v gdebi)" ]]; then
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo gdebi google-chrome-stable_current_amd64.deb
    else
	source "utils.sh"
    fi
}

__install_chrome
