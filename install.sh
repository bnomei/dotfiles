#!/bin/sh

apk update && apk upgrade

apk add --no-cache \
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
  nodejs \
  npm

# Get some packages from edge
cp  /etc/apk/repositories  /etc/apk/repositories.bak
echo "https://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
echo "https://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
apk update

apk add --no-cache \
  neovim \
  neovim-doc \
  fzf-neovim \
  python3

cp /etc/apk/repositories.bak  /etc/apk/repositories
apk cache clean

# Install NerdFont Jetbrains Mono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d /usr/share/fonts
fc-cache -f -v

# https://starship.rs/
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# NEOVIM
python3 -m ensurepip --upgrade
python3 -m pip install --user --upgrade pip pynvim
python3 -m pip cache purge
npm install -g neovim

# Copy dotfiles
cp -af /workspaces/.codespaces/.persistedshare/dotfiles/. ~/

# MANUAL: set root pw and change shell
# https://www.cyberciti.biz/faq/alpine-linux-install-bash-using-apk-command/

# PHP Dev
composer self-update --2
composer global require squizlabs/php_codesniffer
composer global require friendsofphp/php-cs-fixer
composer clear-cache

# SSH
rc-update add sshd
