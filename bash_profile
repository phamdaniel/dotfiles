if which brew > /dev/null && [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion  ]; then
    source /etc/bash_completion;
fi

source $HOME/bin/hk-bash-completion.sh

for file in ~/.{aliases,bash_prompt,functions,path}; do
    source "$file";
done;

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export GOPATH=$HOME/go_code
export HISTCONTROL=erasedups
export HISTIGNORE="clear*:history*:ll*:la*:ls*"
export LS_COLORS='di=34;34:ln=34;35:ex=34;31:'
