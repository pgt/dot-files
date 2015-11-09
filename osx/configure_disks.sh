#!/bin/bash

__configure_disks() {
    __green_echo "Disks: avoid creating .DS_Store files on network volumes"
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    __green_echo "Disks: Save to disk (not to iCloud) by default"
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

    __green_echo "Disks: Disable the 'Are you sure you want to open this application?' dialog"
    defaults write com.apple.LaunchServices LSQuarantine -bool false
}

__configure_disks
