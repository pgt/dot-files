#!/bin/bash

__install_golang() {
    local already_installed
    already_installed=$(__already_installed "go")

    if [[ $already_installed = "not_installed" ]]; then
	__install golang # version 1.5.1
    else
	__green_echo "Already installed"
    fi

    # Create default directories for $GOPATH
    sudo mkdir -p "$HOME/gocode/bin"
    sudo mkdir -p "$HOME/gocode/pkg"
    sudo mkdir -p "$HOME/gocode/src"

    # Paths to Go code
    sudo mkdir -p /usr/local/go
    sudo mkdir -p "$HOME/gocode"
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/gocode
}

__install_golang_packages() {
    local golang_packages=(
	# An open source framework to build and develop your
	# applications in the Go way
	github.com/astaxie/beego

	# bee tool is a project that helps develop beego rapidly. With
	# bee tool we can create, auto compile and reload, develop,
	# test, and deploy beego applications easily
	github.com/beego/bee

	# Command line REPL for golang
	github.com/motemen/gore

	# Godoc extracts and generates documentation for Go programs
	golang.org/x/tools/cmd/godoc

	# Pretty print for output of golang https://github.com/k0kubun/pp
	github.com/k0kubun/pp

	# Is a source analysis tool that answers questions about Go
	# programs
	golang.org/x/tools/cmd/oracle
    )

    for package in "${golang_packages[@]}"; do
	go get -u `# The -u flag instructs get to use the network to update` \
	   "$package"
    done
}

__install_golang
__install_golang_packages
