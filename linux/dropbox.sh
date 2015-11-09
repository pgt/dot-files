#!/bin/bash

__install_dropbox(){
    # Baixar o arquivo para o /tmp instalar e depois excluir o arquivo. De alguma forma verificar se foi instalado corretamente.

    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd

    return 0;
}

__install_dropbox
