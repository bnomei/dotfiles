#!/bin/sh

apk update
apk add -y \
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
  ctags \
  bat \
  vim-scripts \
  neovim

# Install NerdFont Jetbrains Mono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d /usr/share/fonts
fc-cache -f -v

# https://starship.rs/
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# Copy dotfiles
cp -af /workspaces/.codespaces/.persistedshare/dotfiles/. ~/

# Cleanup
apk cache clean
