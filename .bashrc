# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export PS1="\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w \[\033[31m\](\$(git symbolic-ref --short HEAD 2>/dev/null))\[\033[00m\]\$ "

# original alias
alias gl='grep -rn -C 1 --exclude-dir={.git,storage,vendor,public,node_modules}'
