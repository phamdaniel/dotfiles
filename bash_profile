#requires https://github.com/djl/vcprompt

#git completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

BLUE="\033[0;34m"
CYAN="\033[0;36m"
GREEN="\033[0;32m"
RED="\033[0:31m"
MAGENTA="\033[0;35m"
RESET="\033[00m"

function remote-git-color {
	
    local LOCAL=$(git rev-parse @ 2>/dev/null)
    local REMOTE=$(git rev-parse @{u} 2>/dev/null)
    local BASE=$(git merge-base @ @{u} 2>/dev/null)

    if [ "$LOCAL" = "$REMOTE" ]; then
        # Up-to-date
        echo -e $BLUE
    elif [ "$LOCAL" = "$BASE" ]; then
        # Need to pull
        echo -e $MAGENTA
    elif [ "$REMOTE" = "$BASE" ]; then
        # Need to push
        echo -e $GREEN
    else
        # Diverged
        echo -e $RED
    fi
}

#command prompt
export PS1="${GREEN}\u@\h > ${CYAN}[\w]\[\$(remote-git-color)\$(vcprompt -f ' (%b%m%a%u)')${RESET}\n$ "

#PATH additions
export PATH="$PATH:$HOME/bin:/usr/local/bin"

# Aliases
alias ls="ls -G"
alias lsa="ls -la"
alias ..="cd .."
alias cat="pygmentize"
