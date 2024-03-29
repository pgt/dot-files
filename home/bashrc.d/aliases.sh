#!/bin/bash

# Some aliases
alias code="cd ~/code"

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."

# Colors
alias ls='ls -GFh'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias localip="ipconfig getifaddr en1"

# Flush DNS cache
alias flushdns="dscacheutil -flushcache"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Git
alias gs="git status"

# Rails
alias rs="bin/rails s"
alias rc="bin/rails c"

# Bundle
alias bi="bundle install"
alias be="bundle exec "

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Lock the screen (when going AFK) only for OSX
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Emacs GUI only for OSX
alias emacs="open -a /Applications/Emacs.app"

# PG installation
alias install_pg="gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.4/bin/pg_config"

# Locaweb alias
alias gw1='ssh -i ~/.ssh/id_rsa_gateway _ptavares@nibbler0001.linux.locaweb.com.br'
alias gw2='ssh -i ~/.ssh/id_rsa_gateway _ptavares@nibbler0002.linux.locaweb.com.br'

# Colourized JSON
# Example of use:
# $ curl https://graph.facebook.com/v2.5/me?fields=id,name | to_json
#
# {
#   "error": {
#     "message": "An active access token must be used to query information about the current user.",
#     "type": "OAuthException",
#     "code": 2500,
#     "fbtrace_id": "HMNZT6RxHBZ"
#   }
# }
#
alias to_json='json | pygmentize -l json'

# Show most useds commands, this allow you to make some changes like aliases to increase productivity
# TODO: Fix this command
alias top_commands=history | awk '{print $2}' | awk 'BEGIN {FS="|"}{print $1}' | sort | uniq -c | sort -nr | head

# For mistyped corrections
alias sl=ls

# Alerts for Mac
alias ialert='terminal-notifier -title "Terminal" -message "Done with task!"'

# This is defined as single quote for to be evaluated when called,
# when using double quotes is evaluated at the read time (Shellcheck
# SC2139 https://github.com/koalaman/shellcheck/wiki/SC2139)
alias pgt-project-switch='cd $(pgt-project-directory)'

# Projectile find file
#
# Examples of use:
# $ cat `ff`
# $ rm -rf $(ff)
# $ ff | xargs cat
alias pgt-project-find-file="find . | grep -v .git | peco | xargs"
alias pgt-find-spec="find ./spec -name '*.rb' | grep -v .git | peco | xargs"

# mx to run all commands available
alias all_commands='$(compgen -ac | peco)'

# Keep the computer wake for 1 hour
# Only for MacOSX
alias caffeine='$(caffeinate -t 3600 &)'

# Open a web server in the current directory in port 8000 // requires Python 2
alias webserverhere='python -m SimpleHTTPServer'

# Using fpp to edit last execution
alias pgt-edit_last_execution='fc -e : -1 | fpp -ni -c="open -a /Applications/Emacs.app"'

# Check who created the branch
# Usage:
# $ branch-creator $name
alias branch-creator='git for-each-ref --format="%(committerdate) %09 %(authorname) %09 %(refname)" | sort -k5n -k2M -k3n -k4n | grep '

alias rn='react-native'
