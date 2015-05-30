#!/bin/bash

green_echo "bash_aliases.sh"
green_echo "Creating some aliases"
# Some aliases
alias code="cd ~/code"

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."

alias localip="ipconfig getifaddr en1"

# Flush DNS cache
alias flushdns="dscacheutil -flushcache"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Git
alias gs="git status"

# Rails
alias rs="bundle exec rails s"
alias rc="bundle exec rails c"

# Bundle
alias bi="bundle install"
alias be="bundle exec "

# View HTTP traffic
# TODO : It's necessary to see if ngrep and tcpdump is already installed by default. I don't guess...
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Emacs GUI
alias emacs="open -a /Applications/Emacs.app $1"
