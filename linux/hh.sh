#!/bin/bash

__install_hh() {
    sudo add-apt-repository ppa:ultradvorka/ppa
    __update_source_list
    # __install hh # TODO: I need to see how to fix this installation
}

__install_hh
