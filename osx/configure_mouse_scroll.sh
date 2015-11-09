#!/bin/bash

__configure_mouse_scroll() {
    __green_echo "Scroll: Disable “natural” (Lion-style) scrolling"
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
}

__configure_mouse_scroll
