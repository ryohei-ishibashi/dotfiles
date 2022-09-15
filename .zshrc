# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# prompt options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# ディレクトリ、シンボリックリンクに色を付ける
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f:%F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# alias
alias ll='ls -l'
alias la='ls -A'
alias la='ls -a'

alias cdot='cd ~/.dotfiles'
alias cdown='cd ~/Downloads/'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ....='cd ../../..'
alias ....='cd ../../..'
alias ....='cd ../../..'
alias ....='cd ../../..'

alias gbr='git branch'
alias gdi='git diff'
alias gst='git status'
alias gch='git checkout'
alias gpl='git pull'
alias gad='git add'
alias gco='git commit'
alias gpu='git push'

# other
export DOCKER_CONTENT_TRUST=1

