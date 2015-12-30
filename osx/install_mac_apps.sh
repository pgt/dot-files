#!/bin/bash

__install_mac_apps() {
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

    apps=(
	adium
	fluid
	vlc
	skype
	transmission
	flash-player
	dropbox
	postgres
	spectacle
	iterm2
	slack
	emacs
	spotify
	telegram
	screenhero
	cord
	# boot2docker
	# vmware-fusion
	# vagrant
	# google-chrome
	# firefox
	# microsoft-office
    )

    for app in "${apps[@]}"; do
	__green_echo "Installing [$app]"
	brew cask install "$app"
    done

    __red_echo "Hey, install the Pocket.app on AppStore cause here on cask isn't possible"
}

# SOME APPS THAT CAN GO INTO THIS LIST
# Fireworks
# Photoshop
# Adobe Illustrator
# alfred; brew cask install alfred
# Handbrake

__install_mac_apps
