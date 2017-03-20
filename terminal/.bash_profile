#----------------------------------------------------------------------------------
# Git color setup
#----------------------------------------------------------------------------------
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt with Git branch
# Explanation of the weird lines: \u Username, \h Host, \w Path, tput setaf is the color definition
#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export PS1='\[$(tput setaf 7)\]\u@\[$(tput setaf 2)\]\h:\[$(tput setaf 4)\]\w\[$(tput setaf 1)\]$(parse_git_branch)\[$(tput sgr0)\] $ '

# Bonus track: SSH autocompleting hostnames, write ssh and press tab
complete -W "$(while read line; do echo ${line%%[, ]*}; done < ~/.ssh/known_hosts)" ssh

# Git autocompletion
# Requires that you execute the following commented line:
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
test -f ~/.git-completion.bash && . $_

#----------------------------------------------------------------------------------
# Maven setup
#----------------------------------------------------------------------------------
export M2_HOME=$HOME/Tools/apache-maven-3.3.9
export PATH=$PATH:$M2_HOME/bin

# Wrapper function for Maven's mvn command.
mvn-color()
{
    mvn $@ | sed -e "s/\(\[INFO\]\ \-.*\)/${BACKGROUND_WHITE}${TEXT_BLUE}\1/g" \
      -e "s/\(\[INFO\]\ \[.*\)/${RESET_FORMATTING}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[INFO\]\ BUILD SUCCESSFUL\)/${BACKGROUND_BLACK}${TEXT_CYAN}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[INFO\]\ Start.*\)/${BACKGROUND_BLACK}${TEXT_CYAN}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[WARNING\].*\)/${BACKGROUND_BLACK}${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[ERROR\].*\)/${BACKGROUND_WHITE}${TEXT_RED}\1${RESET_FORMATTING}/g" \
      -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${TEXT_GREEN}Tests run: \1${RESET_FORMATTING}, Failures: ${TEXT_RED}\2${RESET_FORMATTING}, Errors: ${TEXT_RED}\3${RESET_FORMATTING}, Skipped: ${TEXT_CYAN}\4${RESET_FORMATTING}/g"

  # Make sure formatting is reset
    echo -ne ${RESET_FORMATTING}
}

#Also for debuggins
mvnDebug-color()
{
    mvnDebug $@ | sed -e "s/\(\[INFO\]\ \-.*\)/${TEXT_BLUE}${BOLD}\1/g" \
      -e "s/\(\[INFO\]\ \[.*\)/${RESET_FORMATTING}${BOLD}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[INFO\]\ BUILD SUCCESSFUL\)/${BOLD}${TEXT_GREEN}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[INFO\]\ Start.*\)/${BOLD}${TEXT_GREEN}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[WARNING\].*\)/${BOLD}${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[ERROR\].*\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g" \
      -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${BOLD}${TEXT_GREEN}Tests run: \1${RESET_FORMATTING}, Failures: ${BOLD}${TEXT_RED}\2${RESET_FORMATTING}, Errors: ${BOLD}${TEXT_RED}\3${RESET_FORMATTING}, Skipped: ${BOLD}${TEXT_YELLOW}\4${RESET_FORMATTING}/g"

  # Make sure formatting is reset
    echo -ne ${RESET_FORMATTING}
}

# Override the mvn command with the colorized one.
alias mvn="mvn-color"

# Override the mvnDebug command with the colorized one.
alias mvnDebug="mvnDebug-color"

#----------------------------------------------------------------------------------
# Derby setup
#----------------------------------------------------------------------------------
#export DERBY_HOME=$HOME/Tools/db-derby-10.12.1.1-bin
#export PATH=$PATH:$DERBY_HOME/bin
#export CLASSPATH=$DERBY_HOME/lib/derby.jar:$DERBY_HOME/lib/derbytools.jar:

#----------------------------------------------------------------------------------
# Java setup
#----------------------------------------------------------------------------------
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME

#----------------------------------------------------------------------------------
# Nodejs setup
#----------------------------------------------------------------------------------
export NODE_MODULE_HOME=$HOME/Tools/node
export PATH=$PATH:$NODE_MODULE_HOME

#----------------------------------------------------------------------------------
# Python setup
#----------------------------------------------------------------------------------
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

#----------------------------------------------------------------------------------
export PATH

#----------------------------------------------------------------------------------
# WELCOME SCREEN
#----------------------------------------------------------------------------------
clear
echo "+----------------------------------------+"
echo -e "|          Juanca's mac station          |";
echo "+----------------------------------------+"
echo -n " > Today is: "; date; echo "";
