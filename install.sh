#!/bin/bash

for h in {ackrc,aliases,bash_profile,bash_prompt,bashrc,ctags,exports,functions,gitconfig,gitignore,git_template,inputrc,lessfilter,path,tmux.conf,vim,vimrc,zshrc}; do
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

ln -s $(pwd)/pure/async.zsh ~/.async
ln -s $(pwd)/pure/pure.zsh ~/.zsh_prompt
