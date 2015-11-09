#!/bin/bash

__install_bash() {
    __install bash

    # TODO: Later, we can check before do the change below if the
    # version of current bash is newer than 4
    __green_echo "Change the default shell to a newer version of bash"
    echo /usr/local/bin/bash | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/bash

    # The code above doesn't work because on Mac it's necessary configure
    # the default shell by app settings
    # Reference: http://apple.stackexchange.com/questions/88278/change-default-shell-from-bash-to-zsh
    # __red_echo "You will need to set the default shell on settings app. Your new current version is located in /usr/local/bin/bash. Reference to configure: http://apple.stackexchange.com/questions/88278/change-default-shell-from-bash-to-zsh"
}

__install_bash
