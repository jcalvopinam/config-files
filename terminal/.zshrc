#----------------------------------------------------------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#----------------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#----------------------------------------------------------------------------------
# Set the theme
#----------------------------------------------------------------------------------
if [[ -f ~/.p10k.zsh ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
  source ~/.p10k.zsh
else
  ZSH_THEME="robbyrussell3"
fi

#----------------------------------------------------------------------------------
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
#----------------------------------------------------------------------------------
plugins=(
    copybuffer               # ctrl + o
    git
    sudo
    z
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

#----------------------------------------------------------------------------------
# Load configuration for omz
#----------------------------------------------------------------------------------
if [[ -f ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
  source ~/.oh-my-zsh/oh-my-zsh.sh
  fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
  autoload -Uz compinit
  [[ "$(whoami)" = "jcalvopinam" ]] && compinit -i || compinit
fi

#----------------------------------------------------------------------------------
# Load custom configuration
#----------------------------------------------------------------------------------
[[ -f ~/.exports ]] && source ~/.exports
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.functions ]] && source ~/.functions
[[ -f ~/.keybindings ]] && source ~/.keybindings
[[ -f ~/.docker-commands ]] && source ~/.docker-commands
[[ -f ~/.work ]] && source ~/.work

#----------------------------------------------------------------------------------
# Load configuration for fzf
# if doesn't work try with: $(brew --prefix)/opt/fzf/install
#----------------------------------------------------------------------------------
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

#----------------------------------------------------------------------------------
# autoload
#----------------------------------------------------------------------------------
czsh
themeToggle