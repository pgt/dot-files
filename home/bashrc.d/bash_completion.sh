#!/bin/bash

__bash_completion() {
    platform=$(__platform)
    bash_version=$(__bash_version)

    if [[ $platform = "linux" ]]; then
	# enable programmable completion features (you don't need to enable
	# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
	# sources /etc/bash.bashrc).
	if ! shopt -oq posix; then # TODO: What's that means?
	    if [ -f /usr/share/bash-completion/bash_completion ]; then
		source /usr/share/bash-completion/bash_completion
	    elif [ -f /etc/bash_completion ]; then
		source /etc/bash_completion
	    fi
	fi
    elif [[ $platform = "macosx" ]]; then
	if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	    if [[ $bash_version == "4" ]]; then
		source "$(brew --prefix)/etc/bash_completion"
	    else
		__red_echo "Your bash version is $bash_version. You need bash newer than 4."
	    fi
	fi
    else
	__red_echo "This is not Linux or OSX, so what are you doing man?"
	exit 1; # Let's get out of this
    fi

}

__bash_completion
