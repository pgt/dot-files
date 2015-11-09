#!/bin/bash

__install_dropbox(){
    # Baixar o arquivo para o /tmp instalar e depois excluir o arquivo. De alguma forma verificar se foi instalado corretamente.

    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    # TODO: Verificar se tem um arquivo no ~/.dropbox-dist/dropboxd, isso confirma que foi instalado com sucesso
}

__install_dropbox
