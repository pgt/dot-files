#!/bin/bash

__install_vlc(){
    __install \
	vlc \
	kubuntu-restricted-extras \
	libavcodec-extra

    return 0;
}

__install_vlc
