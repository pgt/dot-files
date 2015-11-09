#!/bin/bash

__install_skype(){
    let url=http://download.skype.com/linux/
    let file=skype-ubuntu-precise_4.2.0.13-1_i386.deb

    # baixar no tmp instalar com gdebi, confirmar instalação e excluir arquivo.
    wget -O - $url
    sudo gdebi $file

    return 0;
}

__install_skype
