#!/bin/bash

__install_scudcloud(){
    sudo apt-add-repository -y ppa:rael-gc/scudcloud
    __update_source_list
    __install scudcloud
    __install hunspell-en-us

    # Change default icon for the real one from Slack
    sudo dpkg-divert --add --rename --divert /opt/scudcloud/resources/scudcloud.png.real /opt/scudcloud/resources/scudcloud.png
    sudo cp ~/scudcloud.png /opt/scudcloud/resources/
    sudo chmod +r /opt/scudcloud/resources/scudcloud.png
}

__install_scudcloud
