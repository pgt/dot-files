#!/bin/bash

green_echo "Spotlight: Hide Spotlight tray-icon (and subsequent helper)"
red_echo "TODO: It's necessary more tests, cause appearently doesn't work, maybe works after reboot"
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
