#!/bin/bash

__bash_completion() {
    bash_version=$(__bash_version)

    if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	if [[ $bash_version == "4" ]]; then
	    source "$(brew --prefix)/etc/bash_completion"
	else
	    __red_echo "Your bash version is $bash_version. You need bash newer than 4."
	fi
    fi
}

__bash_completion_docker() {
    if [ -d "$(brew --prefix)/etc/bash_completion.d" ]; then
	pushd "$(brew --prefix)/etc/bash_completion.d" > /dev/null
	ln -sf /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
	ln -sf /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
	ln -sf /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
	popd > /dev/null
    else
	__red_echo "bash_completion is problably not installed. Was not possible to install docker completions."
    fi
}

__bash_completion
__bash_completion_docker
