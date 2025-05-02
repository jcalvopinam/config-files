# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/bin"
fi

# Auto-completion
# ---------------
FZF_PATH=$(dirname $(readlink -f $(which fzf)))
[[ $- == *i* ]] && source $FZF_PATH"/../shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source $FZF_PATH"/../shell/key-bindings.zsh"

#----------------------------------------------------------------------------------
# Load configuration for custom fzf commands
#----------------------------------------------------------------------------------
[[ -f ~/.fzf-commands ]] && source ~/.fzf-commands
