#!/bin/bash

__install_rbenv(){
    local rbenv_directory="$HOME/.rbenv"
    local rbenv_url="git://github.com/sstephenson/rbenv.git"
    local ruby_build_url=git://github.com/sstephenson/ruby-build.git
    local rbenv_gem_rehash_url="https://github.com/sstephenson/rbenv-gem-rehash.git"

    mkdir -p $rbenv_directory && \
	__green_echo "Creating rbenv default directory [$rbenv_directory]"

    git clone $rbenv_url .rbenv
    git clone $ruby_build_url ~/.rbenv/plugins/ruby-build
    git clone $rbenv_gem_rehash_url ~/.rbenv/plugins/rbenv-gem-rehash

    rbenv update
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
