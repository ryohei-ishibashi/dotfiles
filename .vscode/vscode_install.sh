#!/bin/sh

echo "VSCode setting started ==========================="

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# vscode設定ファイルの保存ディレクトリ
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

# 既存の設定ファイルがある場合は削除
if [ -e "$VSCODE_SETTING_DIR/settings.json" ]; then
    rm "$VSCODE_SETTING_DIR/settings.json"
fi
# シンボリックリンクを貼る
ln -snfv "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

# キーバインドの設定ファイル
if [ -e "$VSCODE_SETTING_DIR/keybindings.json" ]; then
    rm "$VSCODE_SETTING_DIR/keybindings.json"
fi
ln -snfv "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
cat "$SCRIPT_DIR/extension_lists" | while read line
do
 code --install-extension $line
done

code --list-extensions > "$SCRIPT_DIR/extension_lists"

echo "VSCode setting completed !! ========================"

