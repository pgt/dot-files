#!/bin/bash

__install_spotify(){
    local url=http://repository-origin.spotify.com/pool/non-free/s/spotify-client
    local file=spotify-client_1.0.15.137.gbdf68615_amd64.deb

    wget "$url$/$file"

    dpkg -i "$file"
}

__install_spotify
