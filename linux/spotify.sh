#!/bin/bash

__install_spotify(){
    local url=http://repository-origin.spotify.com/pool/non-free/s/spotify-client
    local file=spotify-client_1.0.17.75.g8f111100_amd64.deb

    wget "$url$/$file"

    dpkg -i "$file"
}

__install_spotify
