#!/bin/sh -eu

DOTVIM_ROOT="$HOME/.vim"
: ${VIMRC_LINK:=$HOME/.vimrc}

vundle_setup(){
	if [ ! -d "bundle" ]
	then
		mkdir bundle
	fi
	cd bundle
	if [ ! -d "vundle" ]
	then
		git clone https://github.com/gmarik/vundle.git
	else
		echo "vundle already cloned."
	fi
}

plugin_setup(){
	if [ -d "vundle" ]
	then
		vim -c BundleInstall -c qa
	fi
}


if [ $PWD != "$HOME/.vim" ]
then
	echo "This should be executed from .vim directory."
	exit 1
fi

if [ -e $VIMRC_LINK ]
then
	echo "$HOME/.vimrc already exists."
else
	ln -s .vim/vimrc $VIMRC_LINK
fi

vundle_setup
plugin_setup
