#!/bin/bash

__install_spotify(){
    # TODO: tornar esse script resiliente para que mesmo que o nome do
    # file troque no servidor deles, o script não seja interrompido e
    # eu possa arrumar isso posteriormente, ou ainda melhor tentar
    # descobrir automaticamente qual o nome certo do pacote
    local file="spotify-client_1.0.17.75.g8f111100_amd64.deb"
    local url="http://repository-origin.spotify.com/pool/non-free/s/spotify-client/$file"

    wget "$url"
    sudo dpkg -i "$file"
    # TODO: remover o pacote após instalação ser concluída!
}

__install_spotify
