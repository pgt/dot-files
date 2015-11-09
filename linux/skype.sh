#!/bin/bash

__install_skype(){
    local file="skype-ubuntu-precise_4.2.0.13-1_i386.deb"
    local url="http://download.skype.com/linux/$file"

    # baixar no tmp instalar com gdebi, confirmar instalação e excluir arquivo.
    wget "$url"
    sudo gdebi "$file"
}

__install_skype
