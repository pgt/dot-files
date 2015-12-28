#!/bin/bash

__install_golang(){
    local already_installed
    already_installed=$(__already_installed "go")

    if [[ $already_installed = "not_installed" ]]; then
	__install golang # version 1.5.1

	# Create default directories for $GOPATH
	mkdir -p "$HOME/gocode/bin"
	mkdir -p "$HOME/gocode/pkg"
	mkdir -p "$HOME/gocode/src"
    else
	__green_echo "Already installed"
    fi
}

__install_golang
