#----------------------------------------------------------------------------------
# Git color setup
#----------------------------------------------------------------------------------
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt with Git branch
# Explanation of the weird lines: \u Username, \h Host, \w Path, tput setaf is the color definition
#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export PS1='\n\[$(tput setaf 10)\]λ: \[$(tput setaf 4)\]\w\[$(tput setaf 1)\]$(parse_git_branch)\[$(tput sgr0)\] \n$ '

# Bonus track: SSH autocompleting hostnames, write ssh and press tab
complete -W "$(while read line; do echo ${line%%[, ]*}; done < ~/.ssh/known_hosts)" ssh

# Git autocompletion
# Requires that you execute the following commented line:
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
test -f ~/.git-completion.bash && . $_

#----------------------------------------------------------------------------------
# Alias
#----------------------------------------------------------------------------------
alias ls='ls -F -G'

#----------------------------------------------------------------------------------
# Maven setup
#----------------------------------------------------------------------------------
export M2_HOME=$HOME/Tools/apache-maven-3.3.9
export PATH=$PATH:$M2_HOME/bin


#----------------------------------------------------------------------------------
# Derby setup
#----------------------------------------------------------------------------------
#export DERBY_HOME=$HOME/Tools/db-derby-10.12.1.1-bin
#export PATH=$PATH:$DERBY_HOME/bin
#export CLASSPATH=$DERBY_HOME/lib/derby.jar:$DERBY_HOME/lib/derbytools.jar:


#----------------------------------------------------------------------------------
# Java setup
#----------------------------------------------------------------------------------
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home
#export PATH=$PATH:$JAVA_HOME


#----------------------------------------------------------------------------------
# Nodejs setup
#----------------------------------------------------------------------------------
export NODEJS_HOME=$HOME/Tools/node/bin
export PATH=$PATH:$NODEJS_HOME


#----------------------------------------------------------------------------------
# Angular-cli
#----------------------------------------------------------------------------------
alias ng="/Volumes/Stonehall/juanca/Tools/node/lib/node_modules/@angular/cli/bin/ng"


#----------------------------------------------------------------------------------
# Python setup
#----------------------------------------------------------------------------------
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

#----------------------------------------------------------------------------------
export PATH


#----------------------------------------------------------------------------------
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#----------------------------------------------------------------------------------
export SDKMAN_DIR="/Volumes/Stonehall/juanca/.sdkman"
[[ -s "/Volumes/Stonehall/juanca/.sdkman/bin/sdkman-init.sh" ]] && source "/Volumes/Stonehall/juanca/.sdkman/bin/sdkman-init.sh"


# WELCOME SCREEN
#----------------------------------------------------------------------------------
clear
echo "+----------------------------------------+"
echo -e "|           Juan's mac station           |";
echo "+----------------------------------------+"
echo -n " > Today is: "; date; echo "";

#echo -e "${LIGHTRED}"; cal;
#echo -e "${LIGHTRED}";echo ""; cal ; echo "";
#echo ""; cal ; echo ""; bash -version

export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

#GCP Credentials
export GOOGLE_APPLICATION_CREDENTIALS="/Users/jcalvopina/Downloads/siseg-ecuador-a8e0b760cb7f.json"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jcalvopina/.sdkman"
[[ -s "/Users/jcalvopina/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jcalvopina/.sdkman/bin/sdkman-init.sh"
