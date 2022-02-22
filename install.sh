#!/usr/bin/env bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update


echo "start setup..."

for f in .??*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitconfig.local.template" ] && continue
  [ "$f" = ".require_oh-my-zsh" ] && continue
  [ "$f" = ".gitmodules" ] && continue
  [ "$f" = "..DS_Store" ] && continue

  ln -snfv ~/dotfiles/"$f" ~/
done

# change shell
chsh -s $(which zsh)


# vscode settings
cd .vscode/
chmod 766 vscode_install.sh
./vscode_install.sh
cd $THIS_DIR


cat << END
******************************************************************
DOTFILES SETUP FINISHED! bye.
******************************************************************

END

