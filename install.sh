#!/bin/sh

sudo apt-get update
sudo apt-get -y install --no-install-recommends apt-utils dialog 2>&1
sudo apt-get install -y \
  curl \
  git \
  jq \
  sudo \
  less \
  wget \
  unzip \
  bat \
  exa \
  fd \
  ripgrep \ 
  neovim
  
# Install NerdFont Jetbrains Mono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
sudo unzip JetBrainsMono.zip -d /usr/share/fonts
sudo rm JetBrainsMono.zip
sudo fc-cache -f -v

# https://starship.rs/
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# Copy dotfiles
cp -af /workspaces/.codespaces/.persistedshare/dotfiles/. ~/

# Cleanup
sudo apt-get autoremove -y
