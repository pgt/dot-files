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
	rbenv-default-gems
	ruby-build
	rbenv-gemset
	node
	imagemagick
	ngrep
	tcpdump
	the_silver_searcher
	hh
	httrack
	unrar
	gpg
	ag
	ispell
	nvm
	python
	aspell # Spell checker for emacs use
	freetds
	jq # command-line JSON processor
	peco # fuzzy finder for command-line
	ack # for find filter
	hg # Mercurial control version system
	bzr # Bazaar control version system
	terminal-notifier # Notifications from the terminal
	markdown # Will be used by emacs to control markdown
	elixir # elixir lang
	fpp # Facebook Path Picker
	s3cmd # S3 command line tool
	elasticsearch
	nmap
	daemonize # command daemon / turns commands into daemons
	pv # Show progress
	dialog # Nice GUI for shell
	leiningen # Clojure lang and his builder
    )

    __install "${packages_to_install[@]}"
}

__install_utils
