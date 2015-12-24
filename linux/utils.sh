#!/bin/bash

__install_utils() {
    packages=(
	gcc
	build-essential
	bash-completion
	tree
	htop
	wget
	nodejs
	imagemagick
	ngrep
	httrack
	unrar
	markdown
	silversearcher-ag
	ispell
	rar
	unrar
	gdebi
	python
	freetds-dev
    )

    __install "${packages[@]}"
}

__install_utils
