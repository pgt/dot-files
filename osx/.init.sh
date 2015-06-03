#!/bin/bash

# Mac Configs
source ~/code/dot-files/osx/disks.sh
source ~/code/dot-files/osx/dock.sh
source ~/code/dot-files/osx/finder.sh
source ~/code/dot-files/osx/keyboard.sh
source ~/code/dot-files/osx/spotlight.sh
source ~/code/dot-files/osx/mouse_scroll.sh
source ~/code/dot-files/osx/mac_app_store.sh
source ~/code/dot-files/osx/screensaver.sh
source ~/code/dot-files/osx/activity_monitor.sh

# Apps
source ~/code/dot-files/osx/iterm.app.sh
source ~/code/dot-files/osx/spectacle.app.sh
source ~/code/dot-files/osx/transmission.app.sh
source ~/code/dot-files/osx/itunes.app.sh

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
