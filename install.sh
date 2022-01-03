#!/bin/sh

# Full Upgrade
echo "https://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
echo "https://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

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
  openrc \
  openssh \
  exa \
  fd \
  ripgrep \
  xsel \
  ctags \
  bat \
  neovim \
  fzf-neovim \
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

# MANUAL: set root pw and change shell
# https://www.cyberciti.biz/faq/alpine-linux-install-bash-using-apk-command/

# Cleanup
apk cache clean

# PHP Dev
composer self-update --2
composer global require squizlabs/php_codesniffer
composer global require friendsofphp/php-cs-fixer

# SSH
rc-update add sshd
