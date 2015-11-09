#!/bin/bash

__configure_keyboard() {
    __green_echo "Keyboard: Enable key repeat"
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

    __green_echo "Keyboard: Set a blazingly fast keyboard repeat rate"
    defaults write NSGlobalDomain KeyRepeat -int 0
}

__configure_keyboard
