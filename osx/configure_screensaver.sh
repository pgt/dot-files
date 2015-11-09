#!/bin/bash

__configure_screensaver() {
    __green_echo "Screensaver: require password immediately after sleep or screen saver begins"
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0
}

__configure_screensaver
