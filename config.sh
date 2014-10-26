#!/usr/bin/env sh
set -efu

VIM_DEFAULT_PREFIX=$HOME"/.vim"

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

CONFIG_INSTALL () {
	VIM_PREFIX=${1:-$VIM_DEFAULT_PREFIX}
	vundle_setup
	plugin_setup
	ln -s ${VIM_PREFIX} $HOME/.vim
}

CONFIG_HELP () {
	echo 'Usage: config.sh {install [prefix_path]|help}'
	return $(($? || $#))
}

if [ $# -gt 0 ]; then
	OP=$1
	shift
fi
case ${OP:-} in
	"install")
		CONFIG_INSTALL $@
		;;
	"help")
		CONFIG_HELP $@
		;;
	*)
		CONFIG_HELP $@
		exit $(($? || 1))
		;;
esac
