#!/bin/bash

__install_mac_apps() {
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
	# boot2docker
	# vmware-fusion
	# vagrant
	# google-chrome
	# firefox
	# evernote
	# skitch
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

# NOTICE: I found some issues installing apps with homebrew cask, so
# for while we will do this manually
#
# __install_mac_apps
__red_echo "I found some issues installing apps with homebrew cask, so for while we will do this manually"
