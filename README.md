### set up

```
git clone https://github.com/ryohei-ishibashi/dotfiles.git
cd ~/dotfiles
./install.sh
./homebrew_install.sh
```
### font
nerd-fonts

https://github.com/ryanoasis/nerd-fonts

### 補足
install.shの実行により以下設定が反映される
- vscode設定（拡張機能、シンボリックリンク、キーバインド）
※codeコマンドが有効になっていることが前提条件
- シェルをzshに変更
- vimの設定反映

vscodeの拡張機能のlistを最新にする

```
code --list-extensions > .vscode/extension_lists
```


