# Executes commands at the start of an interactive session.

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

fpath=(/usr/local/share/zsh-completions $fpath)

for file in ~/.{async,aliases,exports,functions,local,path,zsh_prompt}; do
	source "$file";
done;
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

setopt HIST_IGNORE_ALL_DUPS
HISTSIZE=4000
SAVEHIST=4000

setopt no_hist_verify
