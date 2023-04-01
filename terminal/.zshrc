#----------------------------------------------------------------------------------
# Set the theme
#----------------------------------------------------------------------------------
ZSH_THEME="robbyrussell3"

#----------------------------------------------------------------------------------
# Uncomment the following line to disable bi-weekly auto-update checks.
#----------------------------------------------------------------------------------
DISABLE_AUTO_UPDATE="true"

#----------------------------------------------------------------------------------
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
#----------------------------------------------------------------------------------
plugins=(
    git
    sudo
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

#----------------------------------------------------------------------------------
# Load configuration for omz
#----------------------------------------------------------------------------------
[ -f ~/.oh-my-zsh/oh-my-zsh.sh ] && source ~/.oh-my-zsh/oh-my-zsh.sh

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit -i

#----------------------------------------------------------------------------------
# Load custom configuration
#----------------------------------------------------------------------------------
[ -f ~/.alias ] && source ~/.alias
[ -f ~/.exports ] && source ~/.exports
[ -f ~/.functions ] && source ~/.functions
[ -f ~/.work ] && source ~/.work

#----------------------------------------------------------------------------------
# Load configuration for fzf
# if doesn't work try with: $(brew --prefix)/opt/fzf/install
#----------------------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
