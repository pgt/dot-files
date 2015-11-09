#!/bin/bash

__install_dbeaver(){
    file="dbeaver-ce_latest_amd64.deb"
    url="http://dbeaver.jkiss.org/files/$file"

    wget "$url"
    gdebi "$file"
}

__install_dbeaver
