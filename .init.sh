#!/bin/bash

# FIRST DEPENDENCIES

green_echo "Installing Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

green_echo "Installing Homebrew Cask"
brew install caskroom/cask/brew-cask

green_echo "Updating 'brew' and 'brew cask'"
echo "brew update"; brew update
echo "brew upgrade"; brew upgrade --all
echo "brew-cask"; brew-cask
echo "brew cleanup"; brew cleanup
echo "brew cask cleanup"; brew cask cleanup

green_echo "Creating default dev dir ~/code"; mkdir -p ~/code

# It's necessary to my dev environment
green_echo "Configuring Xcode (running on background)" ; xcode-select —-install

# Loading all files
green_echo "Loading Exportations"; source "bash_exports.sh"
green_echo "Loading aliases"; source "bash_aliases.sh"
green_echo "Loading prompt"; source "bash_prompt.sh"

red_echo "Don't forget of the configurations on Github. Configure on file bashexports_secret.sh"
red_echo "https://help.github.com/articles/generating-ssh-keys/"
