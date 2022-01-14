
# 自動補完
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 色を使用出来るようにする
autoload -Uz colors
colors

# 直前に入力したコマンドと同じ場合、履歴に残さない
setopt HIST_IGNORE_DUPS

# ファイルの色の指定
export CLICOLOR=1



# コマンドの実行ごとに改行
function precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

# プロンプト
#PROMPT='[%n@%m]$ '
#RPROMPT='[%d]'
#FPROMPT=' '

# プロンプトを設定
function left-prompt {
name_t='087m%}'      # user name text clolr
name_b='023m%}'    # user name background color
path_t='255m%}'     # path text clolr
path_b='031m%}'   # path background color
arrow='087m%}'   # arrow color
text_color='%{\e[38;5;'    # set text color
back_color='%{\e[30;48;5;' # set background color
reset='%{\e[0m%}'   # reset
sharp='\uE0B0'      # triangle

user="${back_color}${name_b}${text_color}${name_t}"
dir="${back_color}${path_b}${text_color}${path_t}"
echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset}\n${text_color}${arrow}>${reset}"
}

PROMPT=`left-prompt`

# git ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
local branch_name st branch_status

branch='%{\ue0a0%}'
color='%{\e[38;5;%}' #  文字色を設定
green='%{114m%}'
red='%{001m%}'
yellow='%{227m%}'
blue='%{033m%}'
reset='\e[0m%}'   # reset

if [ ! -e  ".git" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
fi
branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
st=`git status 2> /dev/null`
if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${color}${green}${branch}"
elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${color}${red}${branch}?"
elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="${color}${red}${branch}+"
elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="${color}${yellow}${branch}!"
elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "${color}${red}${branch}!(no branch)${reset}"
    return
else
    # 上記以外の状態の場合
    branch_status="${color}${blue}${branch}"
fi
# ブランチ名を色付きで表示する
echo "${branch_status}$branch_name${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'


# rbenvにパスを通す
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"