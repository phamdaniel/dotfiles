if which brew > /dev/null && [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion  ]; then
	source /etc/bash_completion;
fi

source $HOME/bin/hk-bash-completion.sh

for file in ~/.{aliases,bash_prompt,exports,functions,path}; do
	source "$file";
done;
