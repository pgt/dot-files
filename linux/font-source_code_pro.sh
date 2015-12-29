#!/bin/bash

__install_fonts() {
    # The files are already on ~/.fonts we just need to reload the
    # fonts
    fc-cache -f -v
}

__install_fonts
