#!/bin/bash

__configure_ssh() {
    __green_echo "Configuring ssh home directory copying files from Dropbox"

    local ssh_path="$HOME/.ssh"

    # Check if file exists or if is a symbolic link
    if [ -e "$ssh_path" ] || [ -L "$ssh_path" ] ; then
	__yellow_echo "Removing actual file [$ssh_path] from home [$HOME]"
	sudo rm -r `# recursive` \
	     -i `# ask permission before delete` \
	     -v `# verbose` \
	     "$ssh_path"
    fi

    if [ -e "$ssh_path" ] || [ -L "$ssh_path" ] ; then
	__yellow_echo "Let's keep the old version of [$ssh_path]"
    else
	__green_echo "Creating symbolic link to directory [$ssh_path]"

	cd "$HOME" || exit # in case of cd fails exits

	ln -s `# Create symbolic link` \
	   "$HOME/Dropbox/.ssh" `# from ORIGIN` \
	   .ssh `# to DESTINATION`

	cd - || exit
    fi
}

__configure_ssh
