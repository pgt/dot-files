#!/bin/bash

__install_dbeaver(){
    local already_installed
    already_installed=$(__already_installed "heroku")

    if [[ $already_installed = "not_installed" ]]; then
	local file="dbeaver-ce_latest_amd64.deb"
	local url="http://dbeaver.jkiss.org/files/$file"

	wget "$url" --directory-prefix=/tmp
	sudo gdebi "/tmp/$file"
	rm -rf "/tmp/$file"
    else
	__green_echo "Already installed"
    fi

}

__install_dbeaver
