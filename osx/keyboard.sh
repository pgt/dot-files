#!/bin/bash

green_echo "Keyboard: Enable key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

green_echo "Keyboard: Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0
