#!/bin/bash

__install_dropbox(){
    local already_installed
    already_installed=$(__already_installed "heroku")

    if [[ $already_installed = "not_installed" ]]; then
	wget "https://www.dropbox.com/download?plat=lnx.x86_64" -O "$HOME/dropbox.tar.gz"

	cd "$HOME" && tar -xzf dropbox.tar.gz && rm -rf dropbox.tar.gz

	~/.dropbox-dist/dropboxd &

	cd - || exit
    else
	__green_echo "Already installed"
    fi
}

__install_dropbox
