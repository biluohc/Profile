#source   ~/.config/fish/config.fish

alias cc  "gcc  -W -O2"
alias l	"ls"
alias ll	"ls -ahl"   
alias la	"ls -ashl"  
alias fbterm  "env LANG=zh_CN.UTF-8 fbterm"
alias cdh "cd /home/mxo/Downloads/cache" 
alias cloc "loc --files" 

set fish_greeting '致虚极，守静笃。'

set -x CACHE $HOME/Downloads/cache/
set -x RUST_TMP $HOME/.cache/mozilla/cargo/

set PATH $PATH  ~/bin

# fcitx
set -x  XMODIFIERS  "@im=fcitx"
set -x QT_IM_MODULE  "fcitx"
set -x QT_IM_MODULE  "fcitx"
set -x GTK_IM_MODULE "fcitx"

# pg
set -x PGDATA  /var/lib/pgsql/data

# vagga
set PATH $PATH  ~/vagga/bin

# rls
set -x LD_LIBRARY_PATH  /~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib
# set -x RLS_ROOT /Source/rls

set -x RUST_BACKTRACE  1 
set PATH $PATH  ~/.cargo/bin  
set RUST_SRC_HOME  $HOME/.cargo/rust-source/rust
set RUST_SRC_PATH  $RUST_SRC_HOME/src

# yarn使用yarn的rpm源， node使用tum的，足够新。
# https://yarnpkg.com/zh-Hans/docs/install
set PATH $PATH /home/mxo/.yarn/bin

# go 
set -x  GOROOT $HOME/bin/go
set PATH $PATH  $GOROOT/bin
set PATH $PATH  $HOME/go/bin
set -x  GOPATH  $HOME/go:$HOME/Documents/languages/go:$HOME/Downloads/cache

# Haskell
set PATH $PATH  $HOME/ghc/bin

# kotlin
# set -x  SDKMAN_DIR /home/mxo/.sdkman
# set PATH $PATH /home/mxo/.sdkman/candidates/kotlin/current/bin

# 终端透明度，fish的math好残， 乘法都不支持，更别说进制了。。
# 80那个数越小越透明
if test -n "$WINDOWID";
    # 如果有那个变量就不重复操作，否则会报错
    and test -z "$_xtmp";
    and set _xtmp (echo 'ibase=16; obase=A; FFFFFFFF'  |bc); 
    and set _xtmp (echo "ibase=10; obase=16; $_xtmp*80/100" |bc); 
    and xprop -id "$WINDOWID" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "0x$_xtmp";
end;

