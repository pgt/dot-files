#!/bin/bash

__install_servers(){
    __install_mysql
    __install_apache
    __install_mongod
}

__install_mysql(){
    packages=(
	mysql-server
	mysql-client
	libmysqlclient-dev
    )

    __install $packages

    return 0;
}

__install_apache(){
    packages=(
	apache2
	libapache2-php5
    )

    __install $packages

    return 0;
}

__install_mongod(){
    __install mongod

    return 0;
}

__install_redis(){
    __install redis-server

    return 0;
}

__install_servers
