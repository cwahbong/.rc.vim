#!/bin/bash

set -e -u

VIMRC_LINK="${HOME}/.vimrc"

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

# font settings
if [ ! -d ~/.fonts ]
then
	mkdir ~/.fonts
fi
cp fonts/*.otf ~/.fonts
if [ ! -d ~/.fonts.conf.d ]
then
	mkdir ~/.fonts.conf.d
fi
cp fonts/*.conf ~/.fonts.conf.d
fc-cache -vf ~/.fonts

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
if [ -d "vundle" ]
then
	vim -c BundleInstall -c qa
fi
