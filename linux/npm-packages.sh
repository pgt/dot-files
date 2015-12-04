#!/bin/bash

__install_npm_packages() {
    packages=(
	git-open # Type `git open` to open the GitHub page or website
		 # for a repository. TODO: I will use this?
	jsontool
    )

    npm install -g "${packages[@]}"
}

__install_npm_packages
