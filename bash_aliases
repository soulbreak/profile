if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias psc='ps xawf -eo pid,user,cgroup,args'
alias vi="vim"
alias _reload_profile=". ~/.bashrc"
alias dotfiles="cd ~/workspace/dotfiles"
alias tmp="cd ~/workspace/tmp"
alias _load_virtualenv=". ~/workspace/env/bin/activate"
