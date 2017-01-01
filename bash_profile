export PATH="${HOME}/bin:${PATH}"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -la'
alias lt='ls -lt'

