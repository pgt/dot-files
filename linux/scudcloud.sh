#!/bin/bash

__install_scudcloud(){
    sudo apt-add-repository -y ppa:rael-gc/scudcloud
    __update_source_list
    __install scudcloud
    __install hunspell-en-us
}

__install_scudcloud
