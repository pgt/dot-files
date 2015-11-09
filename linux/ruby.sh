#!/bin/bash

# Ruby dependencies
__install_ruby(){
    ruby_dependencies=(
	git-core
	curl
	zlib1g-dev
	libssl-dev
	libreadline-dev
	libyaml-dev
	libsqlite3-dev
	sqlite3
	libxml2-dev
	libxslt1-dev
	libcurl4-openssl-dev
	python-software-properties
	libffi-dev
    )

    __install $ruby_dependencies

    return 0;
}

__install_ruby
