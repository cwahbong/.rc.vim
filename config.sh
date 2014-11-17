#!/usr/bin/env sh
set -u

VIM_DEFAULT_PREFIX="${HOME}/.vim"

CONFIG_INSTALL () {
	VIM_PREFIX=${1:-$VIM_DEFAULT_PREFIX}
	VIM_CONF="$HOME/.vim"

	BUNDLE_PATH=${VIM_PREFIX}/bundle
	if [ ! -d "$BUNDLE_PATH" ]; then
		mkdir -p $BUNDLE_PATH
	fi

	VUNDLE_PATH="${BUNDLE_PATH}/vundle"
	if [ ! -d "$VUNDLE_PATH" ]; then
		git clone https://github.com/gmarik/vundle.git $VUNDLE_PATH
	else
		echo "vundle already cloned."
	fi

	if [ -d "$VUNDLE_PATH" ]
	then
		vim -c BundleInstall -c qa
	fi

	if [ -L "$VIM_CONF" ]; then
		rm "$VIM_CONF"
		echo "Found old symlink and removed it..."
	fi

	ln -s ${VIM_PREFIX} $HOME/.vim
}

CONFIG_HELP () {
	echo 'Usage: config.sh {install [prefix_path]|help}'
}

if [ $# -gt 0 ]; then
	OP=$1
	shift
fi
case ${OP:-} in
	install)
		CONFIG_INSTALL $@
		;;
	help)
		CONFIG_HELP $@
		;;
	*)
		CONFIG_HELP $@
		exit 1
		;;
esac
