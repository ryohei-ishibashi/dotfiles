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
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f:%F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# alias
alias ls='ls -GF'
alias ll='ls -l'
alias lA='ls -A'
alias la='ls -a'

alias cdot='cd ~/dotfiles'
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
alias gsh='git show'
alias glo='git log'
alias gloG='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'
alias gdiD='git diff develop HEAD'
alias gdiM='git diff master HEAD'

alias dc='docker compose'
alias dcps='docker compose ps'
alias dcup='docker compose up -d'
alias dcdown='docker compose down'

# other
export DOCKER_CONTENT_TRUST=1

