#!/bin/bash

# npm is part of nodejs installation
__install_nodejs() {
    # TODO: Verificar antes se já não está instalado
    cd /tmp && wget https://nodejs.org/dist/v5.3.0/node-v5.3.0-linux-x64.tar.gz

    tar -xvzf node-v5.3.0-linux-x64.tar.gz
    cd /tmp/node-v5.3.0-linux-x64 || exit

    ./configure
    make
    sudo make install

    cd - || exit
}

__install_npm_packages() {
    __install_nodejs

    packages=(
	git-open # Type `git open` to open the GitHub page or website
		 # for a repository. TODO: I will use this?
	jsontool
    )

    npm install -g "${packages[@]}"
}

__install_npm_packages
