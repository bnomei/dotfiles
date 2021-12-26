#!/bin/sh

apk update && apk ugrade
apk add \
  bash bash-doc bash-completion \
  curl \
  git \
  jq \
  sudo \
  less \
  wget \
  unzip \
  exa \
  fd \
  ripgrep \
  ctags \
  bat \
  vim-scripts \
  neovim \
  nodejs \
  npm

# Install NerdFont Jetbrains Mono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d /usr/share/fonts
fc-cache -f -v

# https://starship.rs/
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# Copy dotfiles
cp -af /workspaces/.codespaces/.persistedshare/dotfiles/. ~/

# MANUAL: change shell
# https://www.cyberciti.biz/faq/alpine-linux-install-bash-using-apk-command/

# Cleanup
apk cache clean
