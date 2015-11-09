#!/bin/bash

__configure_google_chrome() {
    __green_echo "Google Chrome: Make default browser"

    # TODO: This changes the window in the middle of the script, this
    # is annoying... What can I do?
    open -a "Google Chrome" --args --make-default-browser &
}

__configure_google_chrome
