#!/bin/bash

__install_chrome(){
    # Google Chrome
    # 64 bit download and install
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo gdebi google-chrome-stable_current_amd64.deb

    return 0;
}

__install_chrome
