#!/bin/sh

apt-get update
apt-get -y install --no-install-recommends apt-utils dialog 2>&1
apt-get install -y \
  curl \
  git \
  jq \
  sudo \
  less \
  wget \
  unzip \
  exa \
  fd-find \
  ripgrep \ 
  neovim

# does not work on webdevops docker images based on debian 10
# apt-get install -y \
#  bat

# Install NerdFont Jetbrains Mono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d /usr/share/fonts
fc-cache -f -v

# https://starship.rs/
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# Copy dotfiles
cp -af /workspaces/.codespaces/.persistedshare/dotfiles/. ~/

# Cleanup
apt-get autoremove -y
