if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
fi

source $HOME/bin/hk-bash-completion.sh

for file in ~/.{aliases,bash_prompt,functions}; do
    source "$file";
done;

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export GOPATH=$HOME/go_code
export HISTCONTROL=erasedups
export HISTIGNORE="clear*:history*:ll*:la*:ls*"

#PATH additions
PATH="/usr/local/bin:$HOME/bin:$PATH"
PATH+=":$HOME/sdk/android-sdk-macosx/platform-tools"
PATH+=":$HOME/sdk/go_appengine"
PATH+=":/usr/local/heroku/bin"
PATH+=":$GOPATH/bin"
export PATH
