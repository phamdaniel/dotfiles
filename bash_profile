#git completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
    source `brew --prefix`/etc/bash_completion.d/go
fi

source $HOME/bin/hk-bash-completion.sh

BLUE="\e[0;34m"
CYAN="\e[0;36m"
GREEN="\e[0;32m"
RED="\e[0;31m"
MAGENTA="\e[0;35m"
VIOLET="\e[1;35m"
ORANGE="\e[1;31m"
YELLOW="\e[0;33m"
WHITE="\e[0;37m"
RESET="\e[00m"

remote_git_color() {
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then
        local LOCAL=$(git rev-parse @ 2>/dev/null)
        local REMOTE=$(git rev-parse @{u} 2>/dev/null)
        local BASE=$(git merge-base @ @{u} 2>/dev/null)

        if [ "$LOCAL" = "$REMOTE" ]; then
            # Up-to-date
            echo -e $CYAN
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
    fi
}

prompt_git() {
    local s='';
    local branchName='';

    # Check if the current directory is in a Git repository.
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null;

            # Check staged but uncommited changes
            if ! $(git diff --quiet --cached --exit-code); then
                s+='*';
            fi;

            # Check for unstaged changes in the index.
            if ! $(git diff --quiet --exit-code); then
                s+='+';
            fi;

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+='?';
            fi;

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+='$';
            fi;
        fi;

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                      git rev-parse --short HEAD 2> /dev/null || \
                      echo '(unknown)')";
        [ -n "${s}" ] && s="${s}";
        echo -e " (${branchName}${s})";
    else
        return;
    fi;
}

#command prompt
PS1="$VIOLET\u@\h $RED> "
PS1+="$YELLOW[\w]"
PS1+="\$(remote_git_color)\$(prompt_git)"
PS1+="$RESET\n$ "
export PS1

#PATH additions
PATH="/usr/local/bin:$HOME/bin:$PATH"
PATH+=":$HOME/sdk/android-sdk-macosx/platform-tools"
PATH+=":$HOME/sdk/go_appengine"
PATH+=":$HOME/go_code/bin"
export PATH
export GOPATH=$HOME/go_code


# Aliases
alias ls="ls -G"
alias ll="ls -la"
alias rm="rm -r"
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status -sb"
alias pcat="pygmentize -g"
alias dunnet="emacs -batch -l dunnet"
alias pyserver="python -m SimpleHTTPServer"