#!/bin/bash

# Common files
for h in {ackrc,aliases,ctags,exports,functions,lessfilter,path,tmux.conf}; do
	ln -s $(pwd)/common/$h ~/.$h
done

# Visible files
for v in bin; do
	if [ ! -d ~/$v ]; then
		ln -s $(pwd)/$v ~/$v
	else
		echo ln: ~/$v: File exists.
	fi
done

# Bash files
for b in {bash_profile,bash_prompt,bashrc,inputrc}; do
	ln -s $(pwd)/bash/$b ~/.$b
done

# Zsh files
for z in {zpreztorc,zshrc}; do
	ln -s $(pwd)/zsh/$z ~/.$z
done

# Vim files
for v in {vim,vimrc}; do
	if [ ! -d ~/.$v ]; then
		ln -s $(pwd)/vim/$v ~/.$v
	else
		echo ln: ~/.$v: File exists.
	fi
done

# Git files
for g in {gitconfig,gitignore,git_template}; do
	if [ ! -d ~/.$g ]; then
		ln -s $(pwd)/git/$g ~/.$g
	else
		echo ln: ~/.$g: File exists.
	fi
done

# Submodules
ln -s $(pwd)/pure/async.zsh ~/.async
ln -s $(pwd)/pure/pure.zsh ~/.zsh_prompt
if [ ! -d ~/.zprezto ]; then
	ln -s $(pwd)/prezto ~/.zprezto
fi
