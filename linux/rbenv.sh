#!/bin/bash

__install_rbenv(){
    __install rbenv
}

__install_ruby_versions(){
    ruby_versions=(
	2.2.2
	2.1.5
	1.9.3
    )

    for ruby_version in "${ruby_versions[@]}"; do
	rbenv install "$ruby_version"

	__green_echo "Installed successfully ruby version [$ruby_version]"
    done
}

__set_default_ruby_version(){
    rbenv global 2.2.2
}

__install_rbenv
__install_ruby_versions
__set_default_ruby_version
