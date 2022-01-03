source ~/.git-completion.bash
source ~/.git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# MISC
alias ls="exa"

# NEOVIM
alias v="nvim"
alias vi="nvim"

# GIT
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'

# COMPOSER
export PATH="$PATH:$HOME/.composer/vendor/bin"
alias c="composer"
alias cda="composer dump-autoloader -o"

# ARTISAN
alias a="php artisan"
alias at="php artisan tinker"
alias am="php artisan migrate"
alias amf="php artisan migrate:fresh"

# PEST
alias p="vendor/bin/pest"
alias pf="vendor/bin/pest --filter"

# STARTSHIP
eval "$(starship init bash)"
