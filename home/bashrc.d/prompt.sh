#!/bin/bash

rbenv_ruby_version_func () {
    rbenv_ruby_version="ruby-$(rbenv version | sed -e 's/ .*//')"
    red="\e[1;31m"

    if [ "$rbenv_ruby_version" == "ruby-system" ]; then
	return
    else
	printf "$red$rbenv_ruby_version"
    fi
}

prompt_git() {
    local s=""
    local branchName=""

    # check if the current directory is in a git repository
    if [ "$(git rev-parse --is-inside-work-tree &>/dev/null; printf "%s" $?)" == 0 ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == "false" ]; then

            # ensure index is up to date
            git update-index --really-refresh  -q &>/dev/null

            # check for uncommitted changes in the index
            if ! "$(git diff --quiet --ignore-submodules --cached)"; then
                s="$s C";
            fi

            # check for unstaged changes
            if ! "$(git diff-files --quiet --ignore-submodules --)"; then
                s="$s S";
            fi

            # check for untracked files
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s="$s T";
            fi

            # check for stashed files
            if "$(git rev-parse --verify refs/stash &>/dev/null)"; then
                s="$s H";
            fi

        fi

        # get the short symbolic ref
        # if HEAD isn't a symbolic ref, get the short SHA
        # otherwise, just give up
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                      git rev-parse --short HEAD 2> /dev/null || \
                      printf "(unknown)")"

        [ -n "$s" ] && s=" [$s ]"

        printf "%s" "$1$branchName$s "
    else
        return
    fi
}

set_prompts() {
    local black=""
    local blue=""
    local bold=""
    local cyan=""
    local green=""
    local orange=""
    local purple=""
    local red=""
    local reset=""
    local white=""
    local yellow=""

    local hostStyle=""
    local userStyle=""

    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        tput sgr0 # reset colors

        bold=$(tput bold)
        reset=$(tput sgr0)

        # Solarized colors
        # (https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized#the-values)
        # black=$(tput setaf 0) # unused for while
        blue=$(tput setaf 33)
        cyan=$(tput setaf 37)
        green=$(tput setaf 64)
        # orange=$(tput setaf 166) # unused for while
        # purple=$(tput setaf 125) # unused for while
        red=$(tput setaf 124)
        white=$(tput setaf 15)
        yellow=$(tput setaf 136)
    else
        bold=""
        reset="\e[0m"

        # black="\e[1;30m" # unused for while
        blue="\e[1;34m"
        cyan="\e[1;36m"
        green="\e[1;32m"
        # orange="\e[1;33m" # unused for while
        # purple="\e[1;35m" # unused for while
        red="\e[1;31m"
        white="\e[1;37m"
        yellow="\e[1;33m"
    fi

    # build the prompt

    # logged in as root
    if [[ "$USER" == "root" ]]; then
        userStyle="\[$bold$red\]"
    else
	userStyle="\[$bold$cyan\]"
    fi

    # connected via ssh
    SSH_TTY="${SSH_TTY:-disconnected}"

    if [[ "$SSH_TTY" = "disconnected" ]]; then
        hostStyle="\[$yellow\]"
    else
        hostStyle="\[$bold$red\]"
    fi

    # set the terminal title to the current working directory
    PS1="\[\033]0;\w\007\]"

    PS1+="\[$userStyle\]\u " # username
    PS1+="\[$reset$white\]"
    PS1+="\[$blue\]\w" # working directory
    PS1+="\$(prompt_git \" $green\")" # git repository details
    PS1+="\$(rbenv_ruby_version_func \" $red\") " # git repository details
    PS1+="\[$reset$cyan\]\$ \[$reset\]" # $ (and reset color)

    export PS1
}

set_prompts
unset set_prompts
