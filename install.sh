#!/bin/bash
# makelink src dest
# src is the name of the file in the repository
# dest is the name relative to $HOME
function makelink {
	dest="$HOME/$2"
	if [ -r "$dest" ]; then
		tmpdir="/tmp/`dirname $2`"
		mkdir -p "$tmpdir"
		mv "$dest" "$tmpdir"
	fi
	ln -s "$PWD/$1" "$dest"
}

makelink  bash_aliases           .bash_aliases
makelink  bash_profile           .bash_profile
makelink  bashrc                 .bashrc
makelink  gitconfig              .gitconfig
makelink  gitignore              .gitignore
makelink  inputrc                .inputrc
makelink  profile                .profile
makelink  tmux.conf              .tmux.conf
makelink  vim/vimrc              .vim/vimrc
makelink  vim/autoload/plug.vim  .vim/autoload/plug.vim
makelink  vim/after/ftplugin/javascript.vim  .vim/after/ftplugin/javascript.vim
