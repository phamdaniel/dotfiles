#!/bin/bash

for h in {ackrc,aliases,bash_profile,bash_prompt,bashrc,ctags,functions,gitconfig,gitignore,inputrc,lessfilter,tmux.conf,vim,vimrc,zshrc}; do
    if [ ! -d ~/.$h ]; then
        ln -s $(pwd)/$h ~/.$h
    else
        echo ln: ~/.$h: File exists.
    fi
done

for v in bin; do
    if [ ! -d ~/$v ]; then
        ln -s $(pwd)/$v ~/$v
    else
        echo ln: ~/$v: File exists.
    fi
done
