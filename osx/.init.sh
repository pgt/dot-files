#!/bin/bash

# Mac Configs
source "${HOME}/dot-files/osx/disks.sh"
source "${HOME}/dot-files/osx/dock.sh"
source "${HOME}/dot-files/osx/finder.sh"
source "${HOME}/dot-files/osx/keyboard.sh"
source "${HOME}/dot-files/osx/spotlight.sh"
source "${HOME}/dot-files/osx/mouse_scroll.sh"
source "${HOME}/dot-files/osx/mac_app_store.sh"
source "${HOME}/dot-files/osx/screensaver.sh"
source "${HOME}/dot-files/osx/activity_monitor.sh"

# Apps
source "${HOME}/dot-files/osx/iterm.app.sh"
source "${HOME}/dot-files/osx/spectacle.app.sh"
source "${HOME}/dot-files/osx/transmission.app.sh"
source "${HOME}/dot-files/osx/itunes.app.sh"

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "cfprefsd" \
	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" \
        "SizeUp" "Spectacle" "SystemUIServer" \
	"Transmission" "iCal"; do
	killall "${app}" > /dev/null 2>&1
done

green_echo "Done. Note that some of these changes require a logout/restart to take effect."
