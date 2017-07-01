#!/bin/bash

__install_mac_apps() {
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

    apps=(
	adium
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
	cord
	# Android
	android-file-transfer # Transfer files from Android device
	android-platform-tools
	grammarly # English study
	itsycal # Calendar in the menu bar
	# vmware-fusion
	# google-chrome
	# firefox
	# microsoft-office
	wireshark

	# If your list of available capture interfaces is empty
	# (default OS X behavior), try installing ChmodBPF from
	# homebrew cask: brew cask install wireshark-chmodbpf This
	# creates an 'access_bpf' group and adds a launch daemon that
	# changes the permissions of your BPF devices so that all
	# users in that group have both read and write access to those
	# devices.
	wireshark-chmodbpf
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

__install_mac_apps
