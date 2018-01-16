#!/bin/bash

vim_dir=$HOME/.vim
vim_conf=$HOME/.vimrc

if [ -d vim_dir ]
then
	read -p "An existing vim directory has been found. It will be overwritten if you proceed. Do you want to proceed?(yes/no)" yn
	case $yn in
		yes)
			rm -rf $vim_dir
			mkdir $vimdir
			mkdir $vimdir/bundle
		        mkdir $vimdir/bundle/Vundle.vim
		        cp -r ./Vundle/* $vimdir/bundle/Vundle.vim/
			;;
		no)
			echo -e "installation cancelled"
			exit
			;;
		*)
			echo -e "Wrong input"
			exit
			;;
	esac
else
    mkdir $HOME/.vim
    mkdir $HOME/.vim/bundle
    mkdir $HOME/.vim/bundle/Vundle.vim
    cp -r ./Vundle/* $HOME/.vim/bundle/Vundle.vim/

fi

if [ -e vim_conf ]
then
	read -p "An existing vimrc file been found. It will be overwritten if you proceed. Do you want to proceed?(yes/no)" yn
	case $yn in
 	 	yes)
			rm $vim_conf
		        cp -r ./vimrc $vim_conf 
			;;
		no)
			echo -e "installation cancelled"
			exit
			;;
		*)
			echo -e "Wrong input"
			exit
			;;
	esac


else
    cp -r ./vimrc $vim_conf
fi

vi -c "PluginInstall" -c "qa!"


