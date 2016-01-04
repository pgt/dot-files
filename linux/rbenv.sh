#!/bin/bash

__install_ruby_dependencies(){
    local ruby_dependencies=(
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

    __install "${ruby_dependencies[@]}"
}

__install_rbenv() {
    __install rbenv
}

__install_ruby_versions() {
    ruby_versions=(
	2.3.0
	2.2.2
	2.1.5
	1.9.3-p551
    )

    for ruby_version in "${ruby_versions[@]}"; do
	rbenv install "$ruby_version"

	__green_echo "Installed successfully ruby version [$ruby_version]"
    done
}

__set_default_ruby_version() {
    rbenv global 2.3.0
}

__install_ruby_dependencies
__install_rbenv
__install_ruby_versions
__set_default_ruby_version
