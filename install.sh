#!/bin/bash

set -euo pipefail

# Requiring functions
source "functions.sh"

# Requiring files and functions
require_dependencies

if linux
      link_files_at_home

   if mac
      green_echo "Configuring the environment on this Mac"
      source "osx/.init.sh"

      link_files_at_home

green_echo "Installing first dependencies"; source ".init.sh"

green_echo "Installing necessary apps, commands and packages"
source "install/.init.sh"


function __now() {
    # A lógica de início deve ficar aqui, assim na execução será feito
    # ./install __now
}
