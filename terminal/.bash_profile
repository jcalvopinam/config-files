#----------------------------------------------------------------------------------
# export the bash shell if bash exist
#----------------------------------------------------------------------------------
if type /bin/bash >/dev/null 2>&1; then
    export SHELL="/bin/bash"
elif type /usr/bin/bash >/dev/null 2>&1; then
    export SHELL="/usr/bin/bash"
fi

#----------------------------------------------------------------------------------
# Load .bashrc configuration
#----------------------------------------------------------------------------------
[[ -f ~/.bashrc ]] && . ~/.bashrc

#----------------------------------------------------------------------------------
# Prompt with Git branch
# Where: \u Username, \h Host, \w Path, tput setaf is the color
#----------------------------------------------------------------------------------
#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "                                        # e.g: jcalvopinam@macos-home ~ $
export PS1='\n\[$(tput setaf 10)\]λ: \[$(tput setaf 4)\]\w\[$(tput setaf 1)\]$(parse_git_branch)\[$(tput sgr0)\] \n$ '   # e.g: λ: ~

#----------------------------------------------------------------------------------
# SSH autocompleting hostnames
#----------------------------------------------------------------------------------
[[ -s $HOME"/.ssh/known_hosts" ]] && complete -W "$(while read line; do echo ${line%%[, ]*}; done <~/.ssh/known_hosts)" ssh

#----------------------------------------------------------------------------------
# Git autocompletion
#----------------------------------------------------------------------------------
[[ ! -f ~/.git-completion.bash ]] && curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
. ~/.git-completion.bash

#----------------------------------------------------------------------------------
# welcome screen for bash terminal
#----------------------------------------------------------------------------------
echo -e "+----------------------------------------+"
echo -e "|             Juan's station             |"
echo -e "+----------------------------------------+"
