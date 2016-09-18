set nocompatible 		" be iMproved, required
filetype off                  " required 

"有问题先清空 	rm -rf 	~/.vim/bundle/	
"安装		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim	    --depth 1
" 启用vundle来管理vim插件
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()												" 安装插件写在这之后 
Plugin 'VundleVim/Vundle.vim'							"Vundle.vim本身

Plugin 'rking/ag.vim'												"ag.vim: 搜索工具
"Plugin 'altercation/vim-colors-solarized'			" Solarized: 非常流行的配色。
Plugin 'bling/vim-airline'										" Airline: 小巧美观的状态栏。
Plugin 'godlygeek/tabular'										" Tabular: 自动对齐。
Plugin 'ervandew/supertab'									"基于上下文的补全.


" 安装插件写在这之前 
call vundle#end() 		" required
filetype plugin on    " required 

" 常用命令
" :PluginList 			- 查看已经安装的插件 
" :PluginInstall    	- 安装插件
" :PluginUpdate 	- 更新插件 
" :PluginSearch   	  - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean		 	- 删除插件，把安装插件对应行删除，然后执行这个命令即可 
" h: vundle        		 - 获取帮助

" vundle的配置到此结束，下面是你自己的配置

:set tabstop=4
:set shiftwidth=4
:set number
:set sm
:set cin
:set paste
:syntax on

