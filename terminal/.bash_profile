# Load the shell dotfiles, and then some:
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Bonus track: SSH autocompleting hostnames, write ssh and press tab
complete -W "$(while read line; do echo ${line%%[, ]*}; done < ~/.ssh/known_hosts)" ssh

# Git autocompletion
# Requires that you execute the following commented line:
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
test -f ~/.git-completion.bash && . $_


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