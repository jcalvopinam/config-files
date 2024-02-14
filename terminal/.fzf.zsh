# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/Cellar/fzf/0.46.1/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/Cellar/fzf/0.46.1/shell/key-bindings.zsh"

#----------------------------------------------------------------------------------
# Load configuration for custom fzf commands
#----------------------------------------------------------------------------------
[ -f ~/.fzf-commands ] && source ~/.fzf-commands
