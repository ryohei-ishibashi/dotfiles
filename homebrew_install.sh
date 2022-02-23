#!/usr/bin/env bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew updrade..."

brew upgrade --all

# インストールするモジュール群
formulas=(
    ansible
    emacs
    heroku-node
    libtiff
    m4
    peco
    tree
    apr
    fontconfig
    hub
    libtool
    markdown
    php
    tree-sitter
    apr-util
    fontforge
    icu4c
    libuninameslist
    mecab
    php@7.4
    unbound
    argon2
    freetds
    jansson
    libunistring
    mpdecimal
    pixman
    unibilium
    aspell
    freetype
    jpeg
    libuv
    msgpack
    pkg-config
    unixodbc
    autoconf
    fribidi
    krb5
    libvterm
    mysql
    protobuf
    webp
    bdw-gc
    gd
    lha
    libx11
    ncurses
    pstree
    wget
    brotli
    gdbm
    libevent
    libxau
    neovim
    python@3.10
    xorgproto
    c-ares
    gettext
    libffi
    libxcb
    nettle
    python@3.9
    xz
    ca-certificates
    giflib
    libidn2
    libxdmcp
    node
    rbenv
    z
    cairo
    git
    libnghttp2
    libxext
    nodebrew
    readline
    zsh
    cask
    glib
    libpng
    libxrender
    oniguruma
    rtmpdump
    zsh-completions
    colordiff
    gmp
    libpq
    libyaml
    openldap
    ruby-build
    zstd
    composer
    gnutls
    libpthread-stubs
    libzip
    openssl@1.1
    six
    coreutils
    gobject-introspection
    libsodium
    lua
    openssl@3
    sqlite
    ctags
    graphite2
    libspiro
    luajit-openresty
    p11-kit
    ssh-copy-id
    curl
    guile
    libssh2
    luv
    pango
    thefuck
    deno
    harfbuzz
    libtasn1
    lz4
    pcre
    tidy-html5
    diff-so-fancy
    heroku
    libtermkey
    lzo
    pcre2
    tig
)

"brew tap..."
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap homebrew/apache
brew tap sanemat/font

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
brew install $formula || brew upgrade $formula
done

cask=(
    chromedriver
    phantomjs
    iterm2
    "visual-studio-code"
)

echo "start brew cask install apps..."

for cask in "${casks[@]}"; do
brew cask install $cask
done

brew cleanup
brew cask cleanup

cat << END

******************************************************************
HOMEBREW INSTALLED! bye.
******************************************************************

END
