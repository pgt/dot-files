#!/bin/bash

__install_spotify(){
    local already_installed
    already_installed=$(__already_installed "spotify")

    if [[ $already_installed = "not_installed" ]]; then
	# 1. Add the Spotify repository signing key to be able to verify downloaded packages
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

	# 2. Add the Spotify repository
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

	# 3. Update list of available packages
	__update_source_list

	# 4. Install Spotify
	__install spotify-client
    else
	__green_echo "Already installed"
    fi

}

__install_spotify
