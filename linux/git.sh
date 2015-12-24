#!/bin/bash

__install_git_latest() {
    # TODO: Find a better place to add new source lists to call update source list just once and not everytime
    # TODO: Não quero ser perguntado se eu quero instalar, eu quero que instale sem perguntar nada.
    sudo add-apt-repository ppa:git-core/ppa
    __update_source_list

    __install git
}

__install_git_latest
