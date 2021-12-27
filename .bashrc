source ~/.git-completion.bash
source ~/.git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export PATH="$PATH:$HOME/.composer/vendor/bin"

eval "$(starship init bash)"
