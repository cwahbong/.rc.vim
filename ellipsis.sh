#!/usr/bin/env bash

pkg.install() {
  mkdir bundle
  git.clone https://github.com/VundleVim/Vundle.vim bundle/vundle
  fs.link_rfile "${PKG_PATH}" ~/.vim
  vim -u vimrc --noplugin -c PluginInstall -c qa
}

pkg.link() {
  fs.link_file vimrc
}

pkg.pull() {
  hooks.pull
  vim -u vimrc --noplugin -c PluginUpdate -c qa
}

pkg.uninstall() {
  rm -rf bundle
}
