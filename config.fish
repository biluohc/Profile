#source   ~/.config/fish/config.fish

alias cc  "gcc  -W -O2"
alias l	"ls"
alias ll	"ls -ahl"   
alias la	"ls -ashl"   
alias fbterm  "env LANG=zh_CN.UTF-8 fbterm"
alias cdh	"cd /home/mxo/Downloads/cache"   

set fish_greeting '致虚极，守静笃。'

set PATH $PATH  ~/bin

set -x RUST_BACKTRACE  1 
set PATH $PATH  ~/.cargo/bin  
set RUST_SRC_HOME  $HOME/.cargo/rust-source/rust
set RUST_SRC_PATH  $RUST_SRC_HOME/src
# rls
set -x LD_LIBRARY_PATH  /home/mxo/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib
set -x RLS_ROOT /Source/rls

# go 
set -x  GOROOT $HOME/bin/go
set PATH $PATH  $GOROOT/bin
set PATH $PATH  $HOME/go/bin
set -x  GOPATH   /home/mxo/go:/home/mxo/Documents/languages/go

# contln
set -x  SDKMAN_DIR /home/mxo/.sdkman
set PATH $PATH /home/mxo/.sdkman/candidates/kotlin/current/bin

function sdl
  eval command sudo $history[1]
end

