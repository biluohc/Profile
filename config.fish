#source   ~/.config/fish/config.fish

alias cc  "gcc  -W -O2"
alias l 	"ls"
alias ll	"ls -ahl"   
alias la	"ls -ashl"   
alias fbterm  "env LANG=zh_CN.UTF-8 fbterm"
alias cdh	"cd /home/viw/Downloads/cache"   
set PATH $PATH  /home/viw/.cargo/bin  
set RUST_SRC_HOME  $HOME/.cargo/rust-source/rust
set RUST_SRC_PATH  $RUST_SRC_HOME/src

function sdl
  eval command sudo $history[1]
end

