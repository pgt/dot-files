#!/bin/bash

###############################################################################
# Transmission.app                                                            #
###############################################################################

green_echo "Transmission: Use ~/Documents/torrents to store incomplete downloads"
green_echo "Creating directory"; mkdir -p ~/Downloads/torrents
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/torrents"

green_echo "Transmission: Don’t prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false

green_echo "Transmission: Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

green_echo "Transmission: Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

green_echo "Transmission: Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false
