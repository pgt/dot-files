#!/bin/bash

__install_nodejs() {
    # TODO: Verificar antes se já não está instalado
    cd /tmp && wget https://nodejs.org/dist/v5.3.0/node-v5.3.0.pkg
    open /tmp/node-v5.3.0.pkg
    cd - || exit
}

__install_npm_packages() {
    __install_nodejs

    packages=(
	git-open
	jsontool
	react-native-cli
	create-react-native-app
	react-devtools

	# Packages to switch automatically node version for each
	# project directory using nvm
	avn
	avn-nvm
	avn-n

	# Alfred3
	alfred-dark-mode
	alfred-fkill
    )

    npm install -g "${packages[@]}"
}

__install_npm_packages
