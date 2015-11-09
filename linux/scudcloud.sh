#!/bin/bash

__install_scudcloud(){
    # ScudCloud
    sudo apt-get update && sudo apt-get upgrade

    sudo apt-add-repository -y ppa:rael-gc/scudcloud
    sudo apt-get update
    sudo apt-get install scudcloud

    sudo apt-get install hunspell-en-us

    sudo dpkg-divert --add --rename --divert /opt/scudcloud/resources/scudcloud.png.real /opt/scudcloud/resources/scudcloud.png
    sudo cp ~/scudcloud.png /opt/scudcloud/resources/
    sudo chmod +r /opt/scudcloud/resources/scudcloud.png

    return 0;
}

__install_scudcloud
