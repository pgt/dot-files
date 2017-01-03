#!/bin/bash

__green_echo() {
    local green="$(tput setaf 2)"
    local reset="$(tput sgr0)"
    local message=$1 # First argument
    local function_callee=${FUNCNAME[ 1 ]}

    echo -e `# Enable interpretation of backslash scapes` \
	 "${green}[SUCCESS]===> " \
	 "[$(date +"%Y-%m-%d %H:%M:%S %Z")] " \
	 "[FUNCTION: $function_callee] " \
	 "$message ${reset}"
}

__yellow_echo() {
    local yellow="$(tput setaf 3)"
    local reset="$(tput sgr0)"
    local message=$1 # First argument
    local function_callee=${FUNCNAME[ 1 ]}

    echo -e `# Enable interpretation of backslash scapes` \
	 "${yellow}[INFO]===> " \
	 "[$(date +"%Y-%m-%d %H:%M:%S %Z")] " \
	 "[FUNCTION: $function_callee] " \
	 "$message ${reset}"
}

__red_echo() {
    local red="$(tput setaf 1)"
    local reset="$(tput sgr0)"
    local message=$1 # First argument
    local function_callee=${FUNCNAME[ 1 ]}

    echo -e `# Enable interpretation of backslash scapes` \
	 "${red}[ERROR]===> " \
	 "[$(date +"%Y-%m-%d %H:%M:%S %Z")] " \
	 "[FUNCTION: $function_callee] " \
	 "$message ${reset}" \
	 >&2 # Send to STDERR
}

__install() {
    local packages_to_install=("$@") # This catches all args and build an array

    for package_name in "${packages_to_install[@]}"; do
	brew install "$package_name"

	local exit_status_from_brew=$?

	## The exit status of the last command run is
	## saved automatically in the special variable $?.
	## Therefore, testing if its value is 0, is testing
	## whether the last command ran correctly.
	if [[ $exit_status_from_brew -gt 0 ]]; then
	    __red_echo "Can't install the package [$package_name]"
	else
	    __green_echo "Successfully installed [$package_name]"
	fi
    done
}

__already_installed() {
    local app_name=$1

    # This also could be [ -x "$(command -v $app_name)" ]
    command -v "$app_name" && echo "installed" || echo "not_installed"
}

__require_dependencies() {
    lib_files=(
	$(ls -A lib/*.sh)
    )

    for file in "${lib_files[@]}" ; do
	__green_echo "Requiring file $file"

	source "$file"
    done
}

__link_files_at_home() {
    local path="$HOME/code/dot-files/home"
    dot_files=(
	$(ls -A "$path")
    )

    # Removing existing files and creating symbolic links to the new ones
    for filename in "${dot_files[@]}" ; do
	local filename_path="$HOME/$filename"

	# Check if file exists or if is a symbolic link
	if [ -e "$filename_path" ] || [ -L "$filename_path" ] ; then
	    __yellow_echo "Removing actual file [$filename] from home [$HOME]"
	    sudo rm -r `# recursive` \
		 -i `# ask permission before delete` \
		 -v `# verbose` \
		 "$filename_path"
	fi

	if [ -e "$filename_path" ] || [ -L "$filename_path" ] ; then
	    __yellow_echo "Let's keep the old version of [$filename]"
	else
	    __green_echo "Creating symbolic link to filename [$filename]"

	    cd "$HOME" # Go to home`
	    ln -s `# Create symbolic link` \
	       "$HOME/code/dot-files/home/$filename" `# from ORIGIN` \
	       "$filename" `# to DESTINATION`
	    cd - || exit
	fi
    done
}

__quit_on_error() {
    let exit_status=$?

    if [ $exit_status -gt 0 ]; then
	__red_echo "\n\n $* ...FAIL"
	# exit 10
    else
	__green_echo "$* ...OK"
    fi
}

__upgrade_system(){
    # If brew is not installed, then install
    if [[ ! -x "$(command -v brew)" ]]; then
	__green_echo "Homebrew is not installed. Let's go install now"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    __green_echo "Installing Homebrew Cask"
    brew install caskroom/cask/brew-cask || true

    __green_echo "brew update"
    brew update || true

    __green_echo "brew upgrade"
    brew upgrade --all || true

    __green_echo "brew cleanup"
    brew cleanup || true

    __green_echo "brew cask cleanup"
    brew cask cleanup || true
}

__install_all_packages(){
    macosx_packages=(
	$(find osx -name "*.sh")
    )

    for package_file in "${macosx_packages[@]}"; do
	__green_echo "Starting installation from file $package_file"
	source "$package_file"
    done

    __kill_macosx_affected_apps
}

__kill_macosx_affected_apps() {
    affected_apps=(
	"Activity Monitor"
	"cfprefsd"
	"Dock"
	"Finder"
	"Google Chrome"
	"Google Chrome Canary"
	"Spectacle"
	"SystemUIServer"
	"Transmission"
	"iCal"
    )

    for app in "${affected_apps[@]}"; do
	__green_echo "Killing app [$app]"

	while true; do
	    echo "Do you wish to kill [$app]? Y or N"
	    read -r yn

	    case $yn in
		[Yy]* ) killall "${app}" || true; break;;
		[Nn]* ) __yellow_echo "I will not kill [$app]"; break;;
		*) __yellow_echo "I'll take this as a no"; break;;
	    esac
	done
    done

    __yellow_echo "Done. Note that some of these changes require a logout/restart to take effect."
}

__reload_dotfiles() {
    cd "$HOME"
    source "$HOME/.bash_profile"

    local exit_status=$?

    if [[ $exit_status > 0 ]]; then
	__green_echo "Successfully realoaded .bash_profile"
    else
	__red_echo "Could not reload .bash_profile"
    fi

    cd -
}

__bash_version() {
    echo "$BASH_VERSION" | \
	head -c 1 `# Get first character`
}

__clone_my_repositories() {
    __red_echo "Better you do manually for while, sorry dude I don't have time to finish this..."
}
