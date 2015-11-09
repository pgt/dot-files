#!/bin/bash

__install_servers(){
    __install_mysql # TODO: configurar um mysql.conf padrão para copiar daqui
    __install_apache
    __install_mongod
    # __install_postgres # TODO: configurar um mysql.conf padrão para copiar daqui
}

__install_mysql(){
    local packages=(
	mysql-server
	mysql-client
	libmysqlclient-dev
    )

    __install "$packages"
}

__install_apache(){
    local packages=(
	apache2
	libapache2-php5
    )

    __install "$packages"
}

__install_mongod(){
    __install mongodb
}

__install_redis(){
    __install redis-server
}

__install_servers
