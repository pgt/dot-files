#!/bin/bash

__install_spotify(){
    let url=http://repository-origin.spotify.com/pool/non-free/s/spotify-client/
    let file=spotify-client_1.0.15.137.gbdf68615_amd64.deb

    wget $file

    dpkg -i spotify-client_1.0.15.137.gbdf68615_amd64.deb

    return 0;
}

__install_spotify
