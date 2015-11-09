#!/bin/bash

__hh_configs() {
    export HH_CONFIG=hicolor # get more colors

    # if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
    if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh \C-j"'; fi
}

__hh_configs
