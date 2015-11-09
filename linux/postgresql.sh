#!/bin/bash

# TODO: Ter um arquivo pg_hba.conf pré-configurado. https://github.com/rranelli/linuxsetup/blob/master/scripts/pg_hba.conf

__install_postgresql() {
    sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"

    wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -

    __update_source_list

    __install postgresql-common
    __install postgresql-9.4 libpq-dev
}

__install_postgresql
