#!/bin/sh

sudo apt-get update
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
sudo fc-cache -f -v

# https://starship.rs/
yes | sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Copy dotfiles
cp -af ~/dotfiles/. ~/

# Cleanup
sudo apt-get autoremove -y
