# Use Oh-my-zsh defaults
export ZSH=~/.oh-my-zsh
plugins=()
fpath=(/usr/local/share/zsh-completions $fpath)
source $ZSH/oh-my-zsh.sh

for file in ~/.{async,aliases,exports,functions,local,path,zsh_prompt}; do
	source "$file";
done;
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

setopt HIST_IGNORE_ALL_DUPS
HISTSIZE=4000
SAVEHIST=4000

setopt no_hist_verify
