#!/bin/bash

__install_golang(){
    local already_installed
    already_installed=$(__already_installed "go")

    if [[ $already_installed = "not_installed" ]]; then
	cd /tmp && curl -O https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz

	sudo tar -C /usr/local -xzf /tmp/go1.4.2.linux-amd64.tar.gz

	cd - || exit

	# Create default directories for $GOPATH
	mkdir -p "$HOME/gocode/bin"
	mkdir -p "$HOME/gocode/pkg"
	mkdir -p "$HOME/gocode/src"
    else
	__green_echo "Already installed"
    fi
}

__install_golang
