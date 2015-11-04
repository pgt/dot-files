#!/bin/bash

eval "$(rbenv init -)"

export HOME=~

export PATH="/Users/pedrotavares/.rbenv/shims:/Users/pedrotavares/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

# default editor
export EDITOR="emacs"

# Locale
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8

# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups

# Increase the maximum number of lines contained in the history file
# (default is 500)
export HISTFILESIZE=10000

# Increase the maximum number of commands to remember
# (default is 500)
export HISTSIZE=10000

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Paths to Go code
export GOROOT=/usr/local/go
export GOPATH=~/gocode
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# Bash configs
CDPATH=$CDPATH:$HOME/code:$HOME/Dropbox

shopt -s autocd # Autocomplete on bash
shopt -s cdspell # Autocorrect on bash

source ~/code/dot-files/functions.sh
source ~/code/dot-files/bash_exports.sh
red_green "Warning: Please copy the file bash_exports_secret.sh.example and do your version"
source ~/code/dot-files/bash_exports_secret.sh
source ~/code/dot-files/bash_options.sh
source ~/code/dot-files/bash_aliases.sh
source ~/code/dot-files/bash_powerline.sh
source ~/code/dot-files/bash_hh_configuration.sh

green_echo "Cleaning up the screen..."; clear

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
