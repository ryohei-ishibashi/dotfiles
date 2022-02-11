#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# vscode設定ファイルの保存ディレクトリ
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

# 既存の設定ファイルがある場合は削除
rm "$VSCODE_SETTING_DIR/settings.json"
# シンボリックリンクを貼る
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

# キーバインドの設定ファイル
rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
cat extension_lists | while read line
do
 code --install-extension $line
done

code --list-extensions > extension_lists
