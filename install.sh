#!/bin/sh

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update


echo "Start setup..."

for f in .??*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue
  [ "$f" = ".gitconfig.local.template" ] && continue
  [ "$f" = ".require_oh-my-zsh" ] && continue
  [ "$f" = ".gitmodules" ] && continue
  [ "$f" = "..DS_Store" ] && continue

  if [ -e ~/"$f" ]; then
    rm -rf ~/"$f"
  fi

  ln -snfv ~/dotfiles/"$f" ~/
done

# change shell
echo "Start \"zsh\" setup..."
if !(type zsh > /dev/null 2>&1); then
  echo "Error: zsh is not found."
  exit;
fi
chsh -s $(which zsh)
# zsh setup
sh .zsh/zsh_setup.sh
echo "\"zsh\" setup completed."

# vscode settings
echo "Start \"Visual Studio Code\" setup..."
sh .vscode/vscode_setup.sh
echo "\"Visual Studio Code\" setup completed."


cat << END
==================================================================
DOTFILES SETUP FINISHED! bye.
==================================================================
END

