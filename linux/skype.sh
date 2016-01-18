#!/bin/bash

__install_skype(){
    local already_installed
    already_installed=$(__already_installed "skype")

    if [[ $already_installed = "not_installed" ]]; then
	local file="skype-ubuntu-precise_4.2.0.13-1_i386.deb"
	local url="http://download.skype.com/linux/$file"

	wget "$url" --directory-prefix=/tmp
	sudo gdebi "/tmp/$file"
	rm -rf "/tmp/$file"
    else
	__green_echo "Already installed"
    fi
}

__install_skype
