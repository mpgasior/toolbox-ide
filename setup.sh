#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

PACKAGES=(
    fd
    git
    htop
    lazygit
    neovim
    nnn
    ripgrep
    tmux
    rustup
)

COPR_REPOS=(
    "atim/lazygit"
)

echo "Enabling COPR repositories: ${COPR_REPOS[@]}"

for repo in "${COPR_REPOS[@]}"; do
    echo "Attempting to enable COPR: $repo"
    sudo dnf copr enable -y "$repo"
    if [ $? -eq 0 ]; then
        echo "Successfully enabled $repo"
    else
        echo "Failed to enable $repo. Please check the COPR name and your internet connection."
    fi
    echo "---"
done

echo "Updating the packages ..."
dnf update --refresh -y

echo "Installing following packages: ${PACKAGES[@]}"
dnf install "${PACKAGES[@]}" -y

if [ $? -eq 0 ]; then
    echo "Successfully installed packages."
else
    echo "Failed to install packages"
fi
