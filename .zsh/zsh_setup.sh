#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

if [[ ! -f "${SCRIPT_DIR}/git-prompt.sh" || ! -f "${SCRIPT_DIR}/git-completion.bash" || ! -f "${SCRIPT_DIR}/_git" ]]; then
    curl -o "${SCRIPT_DIR}/git-prompt.sh" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
    curl -o "${SCRIPT_DIR}/git-completion.bash" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
    curl -o "${SCRIPT_DIR}/_git" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
fi
