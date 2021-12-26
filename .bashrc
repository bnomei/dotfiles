source ~/.git-completion.bash
source ~/.git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

eval "$(starship init bash)"
