#!/bin/bash

__install_git_latest() {
    # TODO: Find a better place to add new source lists to call update source list just once and not everytime
    sudo add-apt-repository ppa:git-core/ppa
    __update_source_list

    __install git
}

__install_git_latest
