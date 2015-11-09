#!/bin/bash

__configure_iterm() {
    __green_echo "iTerm.app: Don’t display the annoying prompt when quitting iTerm"
    defaults write com.googlecode.iterm2 PromptOnQuit -bool false
}

__configure_iterm
