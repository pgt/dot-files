#!/bin/bash

__install_nvm() {
    local already_installed
    already_installed=$(__already_installed "nvm")

    if [[ $already_installed = "not_installed" ]]; then
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

	export NVM_DIR=~/.nvm
	[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
    else
	__green_echo "Already installed"
    fi
}

__install_nodejs() {
    local already_installed
    already_installed=$(__already_installed "node")

    if [[ $already_installed = "not_installed" ]]; then
	local nodejs_versions=(
	    5.3
	)

	nvm install "${nodejs_versions[@]}"
    else
	__green_echo "Already installed"
    fi
}

# npm is part of nodejs installation
__install_npm_packages() {
    local already_installed
    already_installed=$(__already_installed "npm")

    if [[ $already_installed = "not_installed" ]]; then
	packages=(
	    git-open # Type `git open` to open the GitHub page or website
	    # for a repository. TODO: I will use this?
	    jsontool
	)

	npm install -g "${packages[@]}"
    else
	__green_echo "Already installed"
    fi
}

__install_nvm
__install_nodejs
__install_npm_packages
