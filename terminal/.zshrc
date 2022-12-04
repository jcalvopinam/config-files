# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME"/.oh-my-zsh"

# Set the theme
ZSH_THEME="robbyrussell2"

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    git
    sudo
    z
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    #zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh
source $HOME/.alias
source $HOME/.exports
source $HOME/.functions
source $HOME/.work
source /usr/local/opt/fzf/shell/completion.zsh && source /usr/local/opt/fzf/shell/key-bindings.zsh

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit -i

#----------------------------------------------------------------------------------
# keymap
#----------------------------------------------------------------------------------
#bindkey "^[[H" beginning-of-line
#bindkey "^[[F" end-of-line
#bindkey "^[[3~" delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

