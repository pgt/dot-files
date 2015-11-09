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
	gpg
	the_silver_searcher
	ag
	ispell
	rar
	unrar
	gdebi
    )

    __install "${packages[@]}"

    return 0;
}

__install_utils
