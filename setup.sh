#!/bin/bash

PACKAGES=(
  btop
  fd
  flatpak-xdg-utils
  git
  go
  htop
  lazygit
  neovim
  nnn
  node
  ripgrep
  rustup
  stow
  tmux
  yazi
  zoxide
)

COPR_REPOS=(
  "atim/lazygit"
  "lihaohong/yazi"
)

echo "Enabling COPR repositories: ${COPR_REPOS[@]}"

for repo in "${COPR_REPOS[@]}"; do
  echo "Attempting to enable COPR: $repo"
  sudo dnf copr enable -y "$repo"
  if [ $? -eq 0 ]; then
    echo "Successfully enabled $repo"
  else
    echo "Failed to enable $repo. Please check the COPR name and your internet connection."
    exit 1
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
  exit 1
fi

echo "Link flatpak-xdg-open with xdg-open ..."
ln -sf /usr/bin/flatpak-xdg-open /usr/bin/xdg-open

TPM_DIR="~/.tmux/plugins/tpm"
if [[ -d "$TPM_DIR" ]]; then
  echo "TMUX plugin manager already installed"
else
  echo "Installing TMUX Package Manager ..."
  git clone https://github.com/tmux-plugins/tpm $TPM_DIR
  if [ $? -eq 0 ]; then
    echo "Successfully installed TMUX Package Manager."
  else
    echo "Failed to install packages"
    exit 1
  fi
fi

echo "Done."
