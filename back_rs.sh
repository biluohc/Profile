#!/usr/bin/env bash
function menu {
	clear 
	echo 
	echo  -e "\t\t\tProfiles Backup and Restore\n\n"
	echo  -e "\n\t\t\t\t\t 1.    Backup the Profiles"
	echo  -e "\n\t\t\t\t\t 2.    Restore the Profiles"
    echo  -e "\n\t\t\t\t\t 3.    Backup the homepgae"
    echo  -e "\n\t\t\t\t\t 4.    Restore the homepgae"
    echo  -e "\n\t\t\t\t\t q.    Quit the Script"
	echo -en "\n\t\t\tenter your option:    "
	read -n 1 option
	echo -e "\n\n"
}

#####
function bash_b {
	if [ -f ~/.bashrc ]
	then cp ~/.bashrc  . && echo  "Backup ~/.bashrc was succeed"
	else "~/.bashrc not exist"
	fi
}
function bash_r {
	if cp .bashrc ~/
	then echo "Restore bashrc was succeed"
	fi
}
##
function conky_b {
	if [ -f ~/.conkyrc ]
	then cp ~/.conkyrc . && echo "Backup ~/.conkyrc was succeed"
	else echo "~/.conkyrc is not exist"
	fi
}
function conky_r {
	if cp .conkyrc ~/ ;
	then echo "Restore .conkyrc was succeed"
	fi
}
##
function fbterm_b {
	if [ -f  ~/.fbtermrc ]
	then cp  ~/.fbtermrc . && echo "Backup .fbtermrc was succeed"
	else echo " ~/.fbtermrc is not exist"
	fi
}
function fbterm_r {
	if cp .fbtermrc ~/ ;
	then echo "Restore .fbtermrc was succeed"
	fi
}
##
function fish_b {
	if [ -f ~/.config/fish/config.fish ]
	then cp ~/.config/fish/config.fish . && echo "Backup ~/.config/fish/config.fish was backup succeed"
	else echo "~/.config/fish/config.fish is not exist"
	fi
}
function fish_r {
	if [ -d ~/.config/fish/ ]
	then echo -n
	mkdir -p ~/.config/fish && echo "~/.config/fish/ was not exist and created" 
	fi
	if cp config.fish ~/.config/fish/ 
	then echo "Restore ~/.config/fish/config.fish succeed" &&echo -e "You should to run \" \tsource ~/.config/fish/config.fish \t\" on fish"
	fi
	if [ ${SHELL##*/} != fish ]
	then echo -e "You maybe should to run \"\tsudo chsh \`which fish\`\t\""
	fi
}
##
function mpv_b {
	if [ -d  ~/.config/mpv ]
	then cp -r ~/.config/mpv .&&rm -rf mpv/watch_later && echo "Backup ~/.config/mpv was succeed"
	else echo "~/.config/mpv is not exist"
	fi
}
function mpv_r {
	if cp -r mpv ~/.config/
	then echo "Restore mpv was succeed"
	#https://github.com/mpv-player/mpv/wiki/User-Scripts
	curl -s -o ~/.config/mpv/scripts/autoload.lua  https://raw.githubusercontent.com/mpv-player/mpv/master/TOOLS/lua/autoload.lua &&echo "Update lua scripts was succeed by cURL"
	fi
}
##
function vim_b {
	if [ -f ~/.vimrc ]
	then cp ~/.vimrc . &&echo "Backup vimrc was succeed"
	else	echo "~/.vim_rc is not exist"
	fi
}
function vim_r {
	if cp .vimrc ~/ 
	then echo "Restore vimrc was succeed"
	fi
}
#####
function Backup {
	clear 
	bash_b
	conky_b
	fbterm_b
	fish_b
	mpv_b
	vim_b
}
function Restore {
	clear
	bash_r
	conky_r
	fbterm_r
	fish_r
	mpv_r
	vim_r
}
function Backup_homepage {
	clear
	if [ -d ~/public_html/Cloud\ home\ Page ]
	then cp -rL ~/public_html/Cloud\ home\ Page  .&& echo "Backup homepgae was succeed"
	fi
}
function Retore_homepage {
	clear
	if  [ -d ~/public_html/Cloud\ home\ Page ]
	then echo -n	
	else mkdir -p ~/public_html/Cloud\ home\ Page &&echo "~/public_html/Cloud\ home\ Page was not exist and created"
	fi
}
function quit {
	echo "Exit the Script,Bye"
	exit
}
function backerr {
    echo -e "\033[31m Error option , back to the menu \033[0m"
}

while [ 1 ]
do menu
	case $option in
	1)
		Backup;;
	2)
		Restore;;
	3)
		Backup_homepage;;
    4)
        Retore_homepage;;
	q)
		quit;;
	*)
		backerr;;
	esac
	echo -en "\n\t\t\tenter any key to continue:    "
	read -n 1 line
done
clear
