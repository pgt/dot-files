#!/bin/bash

__install_pip_packages() {
    local already_installed
    already_installed=$(__already_installed "pip")

    if [[ $already_installed = "not_installed" ]]; then
	wget https://bootstrap.pypa.io/get-pip.py --directory-prefix=/tmp
	sudo python /tmp/get-pip.py
	rm -rf /tmp/get-pip.py

	__green_echo "Upgrading pip" && pip install -U pip

	__green_echo "Installing pip packages"
	local pip_packages=(
	    pygments
	)
	sudo pip install "${pip_packages[@]}"
    else
	__green_echo "Already installed"
    fi
}

__install_pip_packages
