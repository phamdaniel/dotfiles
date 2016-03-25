# Use Oh-my-zsh defaults
export ZSH=~/.oh-my-zsh
plugins=()
fpath=(/usr/local/share/zsh-completions $fpath)
source $ZSH/oh-my-zsh.sh

for file in ~/.{async,aliases,exports,functions,path,zsh_prompt}; do
    source "$file";
done;
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

setopt HIST_IGNORE_ALL_DUPS
HISTSIZE=400
SAVEHIST=400

setopt no_hist_verify
