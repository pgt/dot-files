#!/bin/bash

__configure_activity_monitor() {
    __green_echo "Activity Monitor: Visualize CPU usage in the Activity Monitor Dock icon"
    defaults write com.apple.ActivityMonitor IconType -int 5

    __green_echo "Activity Monitor: Show all processes in Activity Monitor"
    defaults write com.apple.ActivityMonitor ShowCategory -int 0

    __green_echo "Activity Monitor: Sort Activity Monitor results by CPU usage"
    defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
    defaults write com.apple.ActivityMonitor SortDirection -int 0
}

__configure_activity_monitor
