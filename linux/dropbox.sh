#!/bin/bash

__install_dropbox(){
    # TODO: Baixar o arquivo para o /tmp instalar e depois excluir o arquivo. De alguma forma verificar se foi instalado corretamente.

    # cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - # TODO: não está funcionando o tar não consegue ler o retorno do wget
    # TODO: Verificar se tem um arquivo no ~/.dropbox-dist/dropboxd, isso confirma que foi instalado com sucesso
    true;
}

__install_dropbox
