#!/bin/bash

__configure_dock() {
    __green_echo "Dock: Automatically hide and show the Dock"
    defaults write com.apple.dock autohide -bool true
}

__configure_dock
