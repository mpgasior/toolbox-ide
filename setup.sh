#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

PACKAGES=(
	git
	neovim
	nnn
	ripgrep
	tmux
)

echo "Updating the packages ..."
dnf update -y

echo "Installing following packages: ${PACKAGES[@]}"
dnf install "${PACKAGES[@]}" -y

