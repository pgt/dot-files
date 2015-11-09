#!/bin/bash

__configure_finder() {
    __green_echo "Finder: show all filename extensions"
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    __green_echo "Finder: disable the warning when changing a file extension"
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    __green_echo "Finder: show hidden files by default"
    defaults write com.apple.finder AppleShowAllFiles -bool true

    __green_echo "Finder: Show icons for hard drives, servers, and removable media on the desktop"
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

    __green_echo "Finder: show status bar"
    defaults write com.apple.finder ShowStatusBar -bool true

    __green_echo "Finder: show path bar"
    defaults write com.apple.finder ShowPathbar -bool true

    __green_echo "Finder: Set Desktop as the default location for new Finder windows"
    # For other paths, use `PfLo` and `file:///full/path/here/`
    defaults write com.apple.finder NewWindowTarget -string "PfDe"
    defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"
}

__configure_finder
