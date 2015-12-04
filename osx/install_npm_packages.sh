#!/bin/bash

__install_npm_packages() {
    packages=(
	git-open
	jsontool
    )

    npm install -g "${packages[@]}"
}

__install_npm_packages
