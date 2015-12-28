#!/bin/bash

__install_fonts(){
    # TODO: Mandar esses arquivos para /home e só fazer aqui o fc-cache -f -v
    wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip
    unzip 1.017R.zip
    mkdir -p ~/.fonts
    cp source-code-pro-1.017R/OTF/*.otf ~/.fonts/
    fc-cache -f -v
    rm -rf source-code-pro-1.017R/ 1.017R.zip
}

__install_fonts
