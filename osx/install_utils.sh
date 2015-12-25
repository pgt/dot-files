#!/bin/bash

__install_utils() {
    local packages_to_install=(
	bash-completion
	tree
	htop
	heroku-toolbelt
	git
	wget
	rbenv
	ruby-build
	rbenv-gemset
	node
	imagemagick
	ngrep
	the_silver_searcher
	hh
	httrack
	unrar
	gpg
	ag
	ispell
	npm
	python
	aspell # Spell checker for emacs use
	freetds
	jq # command-line JSON processor
	peco # fuzzy finder for command-line
    )

    __install "${packages_to_install[@]}"
}

__install_utils
