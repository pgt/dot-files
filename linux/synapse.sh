#!/bin/bash

__install_synapse() {
    sudo add-apt-repository ppa:synapse-core/ppa
    __update_source_list
    __install synapse

    return 0;
}

__install_synapse
