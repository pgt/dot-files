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
# Autocorrect typos in path names when using `cd`
# shopt -s cdspell

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
# shopt -s checkwinsize

# Append to the Bash history file, rather than overwriting it
# shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob

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

### Configuring HH
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh \C-j"'; fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
