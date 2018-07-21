#source   ~/.config/fish/config.fish

alias cc  "gcc  -W -O2"
alias l	"ls"
alias ll	"ls -ahl"   
alias la	"ls -ashl"  
alias fbterm  "env LANG=zh_CN.UTF-8 fbterm"
alias cdh "cd /home/mxo/Downloads/cache" 
alias cloc "loc --files" 
alias ssha "ssh mxoo@47.106.124.200"
alias sftpa "sftp mxoo@47.106.124.200"

alias gitpm "git push origin -f;  and echo -e '\033[33m 1. push origin/master success. \033[0m';
             and git push bb -f;  and echo -e '\033[33m 2. push bb/master success. \033[0m'"

alias gitppm "git pull up master; and echo -e '\033[33m 1. pull up/master success. \033[0m';
             and git push origin -f;  and echo -e '\033[33m 2. push origin/master success. \033[0m';
             and git push bb -f;  and echo -e '\033[33m 3. push bb/master success. \033[0m'"

alias xmr "xmrig --max-cpu-usage 85 --cpu-priority 2 -t 6 -o xmr-cn.sparkpool.com:11000 -u 45vRMuXRo9DMu66RcjhzT8FJAngbmnftaATvCnLqTH1DZgJusiyn2sWUgkvPy2pUvFNjZsSSA6JPEQEUuevX3jmZPtJ3HRE.mio -p x -k"

set fish_greeting '致虚极，守静笃。'

set -x CACHE $HOME/Downloads/cache/
set -x RUST_TMP $HOME/.cache/mozilla/cargo/

set PATH $PATH  ~/bin

# fcitx
set -x  XMODIFIERS  "@im=fcitx"
set -x QT_IM_MODULE  "fcitx"
set -x QT_IM_MODULE  "fcitx"
set -x GTK_IM_MODULE "fcitx"

# 日狗的 effitask
set -x DONE_FILE "$TODO_DIR/done.txt"
set -x TODO_FILE "$TODO_DIR/todo.txt"
set -x TODO_DIR "$HOME/.local/opt/share/todo"

# pg
set -x PGDATA  /var/lib/pgsql/data

# vagga
set PATH $PATH  ~/vagga/bin

set -x RUST_BACKTRACE  1 
set PATH $PATH  ~/.cargo/bin  
set RUST_SRC_HOME  $HOME/.cargo/rust-source/rust
set RUST_SRC_PATH  $RUST_SRC_HOME/src

# yarn使用yarn的rpm源， node使用tum的，足够新。
# https://yarnpkg.com/zh-Hans/docs/install 未签名签名，每次刷新源都报警。。
# zypper ar -fc http://download.opensuse.org/repositories/Virtualization:/containers:/Portus/openSUSE_Tumbleweed/ Yarn
set PATH $PATH /home/mxo/.yarn/bin

# go 
set -x  GOROOT $HOME/bin/go
set PATH $PATH  $GOROOT/bin
set PATH $PATH  $HOME/go/bin
set -x  GOPATH  $HOME/go:$HOME/Documents/languages/go:$HOME/Downloads/cache

# Haskell -> Idris
# sudo zypper in -t pattern haskell_platform
# cabal update; cabal install idris
# http://idris-zh.readthedocs.io/zh_CN/latest/tutorial/starting.html
# https://github.com/idris-lang/Idris-dev/wiki/Idris-on-Debian
set PATH $PATH $HOME/.cabal/bin/

# if test (ps -aux|grep fht2p|wc -l) -le 2;
#     fht2p &;
# end;

# 终端透明度，fish的math好残， 乘法都不支持，更别说进制了。。
# 80那个数越小越透明
# 如果有那个变量就不重复操作，否则切回后会不停的报错
if test -z "$WINDOWID";
    # wayland+3.28就彻底没有id, xorg+3.28+就没有这个环境变量了，感觉Gnome好脑残，原生支持透明多好啊。。
    and set WINDOWIDS (wmctrl -lx |grep -e 'gnome-terminal-server\.Gnome-terminal.*'|awk '{ print $1 }');
    and set WINDOWID $WINDOWIDS[(count $WINDOWIDS)-1];
    and set _xtmp (echo 'ibase=16; obase=A; FFFFFFFF'  |bc); 
    and set _xtmp (echo "ibase=10; obase=16; $_xtmp*80/100" |bc); 
    and xprop -id "$WINDOWID" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "0x$_xtmp";
end
