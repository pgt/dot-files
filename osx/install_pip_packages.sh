#!/bin/bash

__install_pip_packages() {
    __green_echo "Installing pip"
    cd /tmp && wget https://bootstrap.pypa.io/get-pip.py
    sudo python /tmp/get-pip.py
    rm -rf /tmp/get-pip.py
    cd - || exit

    __green_echo "Upgrading pip" && pip install -U pip

    __green_echo "Installing pip packages"
    local pip_packages=(
	pygments
    )
    sudo pip install "${pip_packages[@]}"
}

__install_pip_packages
