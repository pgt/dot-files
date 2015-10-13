#!/bin/bash

# Update the system
sudo apt-get update && sudo apt-get upgrade

sudo apt-get install build-essential

# Synapse
sudo add-apt-repository ppa:synapse-core/ppa
sudo apt-get update
sudo apt-get install synapse

# Git newest version
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
apt-get install git

# Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

# RAR e Unrar
sudo apt-get install rar unrar

# Gdebi
sudo apt-get install gdebi

# Google Chrome
# 64 bit download and install
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi google-chrome-stable_current_amd64.deb

# VLC
sudo apt-get install vlc
sudo apt-get install kubuntu-restricted-extras libavcodec-extra

# Skype
# download with wget
$ wget http://download.skype.com/linux/skype-ubuntu-precise_4.2.0.13-1_i386.deb

# install with gdebi
$ sudo gdebi skype-ubuntu-precise_4.2.0.13-1_i386.deb

# URxvt
mkdir -p ~/.urxvt/
cd ~/.urxvt/ && wget -O https://raw.githubusercontent.com/stepb/urxvt-tabbedex/master/tabbedex
sudo apt-get install rxvt-unicode-256color ncurses-term
cp .Xdefaults ~

alias start_urxvt_server = 'urxvtd -q -f -o'
alias myterm = 'urxvtc'

# Terminator
sudo apt-get install terminator

# PGadmin3
sudo apt-get install pgadmin3 -y

# Skype
wget http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
gdebi skype-ubuntu-precise_4.3.0.37-1_i386.deb

# ScudCloud
sudo apt-get update && sudo apt-get upgrade

sudo apt-add-repository -y ppa:rael-gc/scudcloud
sudo apt-get update
sudo apt-get install scudcloud

sudo apt-get install hunspell-en-us

sudo dpkg-divert --add --rename --divert /opt/scudcloud/resources/scudcloud.png.real /opt/scudcloud/resources/scudcloud.png
sudo cp ~/scudcloud.png /opt/scudcloud/resources/
sudo chmod +r /opt/scudcloud/resources/scudcloud.png

# Transmission
sudo apt-get install transmission

# Some servers
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
sudo apt-get install apache2 libapache2-php5
sudo apt-get install mongod
sudo apt-get install redis-server

# Popcorntime
wget https://get.popcorntime.io/build/Popcorn-Time-0.3.8-5-Linux-64.tar.xz
tar -xzvf Popcorn-Time-0.3.8-5-Linux-64.tar.xz
cd Popcorn-Time-0.3.8-5-Linux-64
./configure
make
make install

# Postgresql
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-common
sudo apt-get install postgresql-9.4 libpq-dev

# Spotify
wget http://repository-origin.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.15.137.gbdf68615_amd64.deb

dpkg -i spotify-client_1.0.15.137.gbdf68615_amd64.deb

# Pidgin
sudo apt-get install pidgin

# Ruby dependencies
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# Rbenv
mkdir -p ~/.rbenv
git clone git://github.com/sstephenson/rbenv.git .rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

rbenv update

# Now we tell Rubygems not to install the documentation for each package locally and then install Bundler
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Ruby versions
rbenv install 2.2.2
rbenv install 2.1.5
rbenv install 1.9.3
rbenv global 2.2.2

# Dbeaver
wget http://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb
gdebi dbeaver-ce_latest_amd64.deb

# Remmina - Remote Desktop Client
sudo apt-get install remmina

# Java8

# GoLang

# Vagrant
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
sudo dpkg -i vagrant_1.7.2_x86_64.deb
rm vagrant_*.deb

# VirtualBox
wget http://download.virtualbox.org/virtualbox/4.3.24/virtualbox-4.3_4.3.24-98716~Ubuntu~precise_amd64.deb
sudo dpkg -i virtualbox-4.3_4.3.24-98716~Ubuntu~precise_amd64.deb
rm virtualbox-*.deb

# Font SourceCodePro
wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip
unzip 1.017R.zip
$(MKDIR) -p ~/.fonts
cp source-code-pro-1.017R/OTF/*.otf ~/.fonts/
fc-cache -f -v
rm -rf source-code-pro-1.017R/ 1.017R.zip

# KDE Configurations
## Dolphin
.kde/share/config/dolphinrc

## KDE
.kde/share/config/kdeglobals

# "Emacs dependencies"
sudo apt-get install ag
sudo apt-get install ispell

# Packages
sudo apt-get install bash-completion
sudo apt-get install tree
sudo apt-get install htop
sudo apt-get install heroku-toolbelt
sudo apt-get install git
sudo apt-get install wget
sudo apt-get install node
sudo apt-get install imagemagick
sudo apt-get install ngrep
sudo apt-get install the_silver_searcher
sudo apt-get install hh
sudo apt-get install httrack
sudo apt-get install unrar


# todo: I will use this?
# Type `git open` to open the GitHub page or website for a repository.
npm install -g git-open
