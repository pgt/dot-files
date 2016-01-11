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

	# Beego ORM
	github.com/astaxie/beego/orm

	# PG Driver
        github.com/lib/pq

	# A good ORM
	github.com/jinzhu/gorm

	# Vet examines Go source code and reports suspicious
	# constructs, such as Printf calls whose arguments do not
	# align with the format string. Vet uses heuristics that do
	# not guarantee all reports are genuine problems, but it can
	# find errors not caught by the compilers.
	golang.org/x/tools/cmd/vet
    )

    for package in "${golang_packages[@]}"; do
	go get -u `# The -u flag instructs get to use the network to update` \
	   "$package"
    done
}

__install_gvm() {
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

    gvm install go1.3.3
    gvm install go1.5.2

    gvm use go1.5.2 # --default
}

__install_golang
__install_golang_packages
