#source   ~/.config/fish/config.fish
alias l 	"ls"
alias ll	"ls -ahl"   
alias la	"ls -ashl"   
alias cdh	"cd /home/viw/Downloads/cache"   
function sdl
  eval command sudo $history[1]
end
