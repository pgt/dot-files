#!/bin/bash

__git_config() {
    __green_echo "Setting .gitignore global"
    git config --global core.excludesfile ~/.gitignore
}

__git_config
