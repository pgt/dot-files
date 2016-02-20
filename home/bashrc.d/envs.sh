#!/bin/bash

__envs() {
    export HOME=~

    # Default editor
    export EDITOR="emacs"

    # TERM
    export TERM=xterm-256color

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
    export HISTSIZE=${HISTFILESIZE}

    # Make new shells get the history lines from all previous
    # shells instead of the default "last window closed" history
    export PROMPT_COMMAND="" # Just initializing for solve unbound variable problem
    export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

    # Paths to Go code
    export GOROOT=/usr/local/go
    mkdir -p "$HOME/gocode"
    export GOPATH=$HOME/gocode

    # Bash configs
    CDPATH="" # Just initializing for solve unbound variable problem
    export CDPATH="$CDPATH:$HOME/code"
    export CDPATH="$CDPATH:$HOME/Dropbox"
    export CDPATH="$CDPATH:$HOME/gocode/src/bitbucket.org/pgtnetwork/"

    # NVM(Node Version Manager)
    export NVM_DIR="$HOME/.nvm"

    # Just for MacOSX, colorfy ls output
    export CLICOLOR=1
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

    # Homebrew Cask Options Other options
    # "--caskroom=/usr/local/Caskroom" the default is
    # /opt/homebrew-cask/
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

    # My default projects directories
    export PROJECTS="$HOME/code $HOME/gocode/src/bitbucket.org/pgtnetwork/"

    # Configuring PATH
    export PATH="$PATH:$HOME/.rbenv/shims"
    export PATH="$PATH:$HOME/.rbenv/shims"
    export PATH="$PATH:/usr/local/bin"
    export PATH="$PATH:/usr/bin"
    export PATH="$PATH:/bin"
    export PATH="$PATH:/usr/sbin"
    export PATH="$PATH:/sbin"
    export PATH="$PATH:/opt/X11/bin"
    export PATH="$PATH:/usr/local/heroku/bin"
    export PATH="$PATH:$GOROOT/bin"
    export PATH="$PATH:$GOPATH/bin"
    export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin"
    export PATH="$PATH:$HOME/code/dot-files/bin"

    # Rails spring turn it off forever :)
    export DISABLE_SPRING=true
}

__envs
