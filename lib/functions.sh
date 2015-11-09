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

    return 0;
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
    platform=$(__platform)

    if [[ $platform = "linux" ]]; then
	__install_on_linux "$@"

    elif [[ $platform = "macosx" ]]; then
	__install_on_macosx "$@"

    else
	exit 1; # Let's get out of this
    fi
}

__install_on_linux() {
    local packages_to_install=("$@") # This catches all args and build an array

    # Considering the package names as a array and install one by one
    for package_name in "${packages_to_install[@]}"; do
	sudo apt-get install \
	     -qq `# No output except for errors` \
	     -y `# Always assume yes` \
	     "$package_name" `# Arg with the name of the package`

	local exit_status_from_apt_get=$?

	## The exit status of the last command run is
	## saved automatically in the special variable $?.
	## Therefore, testing if its value is 0, is testing
	## whether the last command ran correctly.
	if [[ $exit_status_from_apt_get > 0 ]]; then
	    __red_echo "Can't install the package [$package_name]"
	else
	    __green_echo "Succesfully installed [$package_name]"
	fi
    done
}

__install_on_macosx() {
    local packages_to_install=("$@") # This catches all args and build an array

    for package_name in "${packages_to_install[@]}"; do
	brew install "$package_name"

	local exit_status_from_brew=$?

	## The exit status of the last command run is
	## saved automatically in the special variable $?.
	## Therefore, testing if its value is 0, is testing
	## whether the last command ran correctly.
	if [[ $exit_status_from_brew > 0 ]]; then
	    __red_echo "Can't install the package [$package_name]"
	else
	    __green_echo "Succesfully installed [$package_name]"
	fi
    done
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
	    cd -
	fi
    done
}

__update_source_list(){
    sudo apt-get update \
	 -qq `# No output except for errors` \
         -y `# Always assume yes`

    let exit_status = $?

    if [[ $exit_status > 0 ]]; then
	__red_echo "Error on update"
    else
	__green_echo "Successfully updated"
    fi
}

__upgrade_linux(){
    __update_source_list

    sudo apt-get upgrade \
	 -qq `# No output except for errors` \
         -y `# Always assume yes`

    let exit_status = $?

    if [[ $exit_status > 0 ]]; then
	__red_echo "Error on upgrade linux"
    else
	__green_echo "Successfully upgrade linux"
    fi
}

__upgrade_macosx(){
    # If brew is not installed, then install
    if [[ ! -x "$(command -v brew)" ]]; then
	__green_echo "Homebrew is not installed. Let's go install now"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    __green_echo "Installing Homebrew Cask" && \
	brew install caskroom/cask/brew-cask || true

    __green_echo "brew update" && \
	brew update || true

    __green_echo "brew upgrade" && \
	brew upgrade --all || true

    __green_echo "brew cleanup" && \
	brew cleanup || true

    __green_echo "brew cask cleanup" && \
	brew cask cleanup || true
}

__upgrade_system(){
    platform=$(__platform)

    if [[ $platform = "linux" ]]; then
	__upgrade_linux

    elif [[ $platform = "macosx" ]]; then
	__upgrade_macosx

    else
	exit 1; # Let's get out of this
    fi
}

__platform() {
    local platform=$OSTYPE
    local advice_for_the_future_me="Please, me of the future, if you are \
	  not in a MacOS and not in a Linux, what fuck are you doing? \
	  Are you out of your mind? Please kill yourself! \
	  Alright, alright, forget the last part... \
	  Please say me, this is a FreeBSD at least? I know it!!!"

    case $platform in
	darwin*) echo "macosx" ;;
	linux*) echo "linux" ;;
	*) __red_echo "$advice_for_the_future_me" ;;
    esac
}

__install_all_linux_packages(){
    linux_packages=(
	$(find linux -name "*.sh")
    )

    for package_file in "${linux_packages[@]}"; do
	__green_echo "Starting installation from file $package_file"
	source "$package_file"
    done
}

__install_all_packages(){
    platform=$(__platform)

    if [[ $platform = "linux" ]]; then
	__install_all_linux_packages

    elif [[ $platform = "macosx" ]]; then
	__install_all_macosx_packages

    else
	exit 1; # Let's get out of this
    fi
}

__install_all_macosx_packages(){
    pwd

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

	# TODO: Would be nice ask first if the user really wanna kill
	# the app, just saying.
	while true; do
	    echo "Do you wish to kill [$app]? Y or N"
	    read yn

	    case $yn in
		[Yy]* ) killall "${app}" || true; break;;
		[Nn]* ) __yellow_echo "I will not kill [$app]"; break;;
		*) "Please answer Y or N";;
	    esac
	done
    done

    __red_echo "Don't forget of the configurations on Github. Configure on file bashexports_secret.sh"
    __red_echo "https://help.github.com/articles/generating-ssh-keys/"

    __green_echo "Done. Note that some of these changes require a logout/restart to take effect."
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
    echo $BASH_VERSION | \
	head -c 1 `# Get first character`
}

__clone_my_repositories() {
    __red_echo "Better you do manually for while, sorry dude I don't have time to finish this..."
}
