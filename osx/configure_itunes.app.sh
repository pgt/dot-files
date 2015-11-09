#!/bin/bash

__configure_itunes() {
    __green_echo "iTunes: Stop iTunes from responding to the keyboard media keys"
    launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null
}

__configure_itunes
