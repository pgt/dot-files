#!/bin/bash

# To configure this I used the solarized dir theme located on this
# link https://github.com/seebi/dircolors-solarized
local platform
platform=$(__platform)

if [ "$platform" = "linux" ]; then
    eval `dircolors $HOME/.dir_colors`
fi
