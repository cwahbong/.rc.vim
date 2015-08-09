update:
	git pull --rebase
	vim --noplugin -c BundleUpdate -c qa

BUNDLE_PATH = ./bundle

install:
	ln --backup=numbered -n -s -r . $(HOME)/.vim
	mkdir -p $(BUNDLE_PATH)
	@if [ ! -d "$(BUNDLE_PATH)/vundle" ]; then\
		git clone https://github.com/gmarik/vundle.git bundle/vundle;\
	else\
		echo "Vundle clready cloned.";\
	fi
	vim --noplugin -c BundleInstall -c qa

Makefile: ; # Do not remake makefile.

.PHONY: all update install clean
