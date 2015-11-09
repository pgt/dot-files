#!/bin/bash

__configure_mac_app_store() {
    __green_echo "Mac App Store: Enable the WebKit Developer Tools in the Mac App Store"
    defaults write com.apple.appstore WebKitDeveloperExtras -bool true
``
    __green_echo "Mac App Store: Enable Debug Menu in the Mac App Store"
    defaults write com.apple.appstore ShowDebugMenu -bool true
}

__configure_mac_app_store
