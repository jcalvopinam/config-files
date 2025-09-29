#----------------------------------------------------------------------------------
# Color scheme
#----------------------------------------------------------------------------------
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

#----------------------------------------------------------------------------------
# Setup fzf
#----------------------------------------------------------------------------------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

show_file_or_dir_preview="if [ -d {} ]; then ls -1a --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

FZF_CTRL_T_OPTS="\
    --ansi \
    --style full \
    --prompt '❯ ' \
    --preview-window='right,60%,wrap' \
    --tiebreak begin \
    --layout reverse \
    --color 'input-border:#996666,input-label:#ffcccc' \
    --color 'list-border:#669966,list-label:#99cc99' \
    --color 'preview-border:#9999cc,preview-label:#ccccff' \
    --preview '$show_file_or_dir_preview'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)
      # Custom preview for 'cd', use the common fzf options
      fzf --ansi --style full --prompt '❯ ' --preview-window='right,60%,wrap' --tiebreak begin --layout reverse --color 'input-border:#996666,input-label:#ffcccc' --color 'list-border:#669966,list-label:#99cc99' --color 'preview-border:#9999cc,preview-label:#ccccff' --preview 'ls -1a --color=always {} | head -200' "$@" ;;
    export|unset)
      # Custom preview for 'export' or 'unset'
      fzf --ansi --style full --prompt '❯ ' --preview-window='right,70%,wrap' --tiebreak begin --layout reverse --color 'input-border:#996666,input-label:#ffcccc' --color 'list-border:#669966,list-label:#99cc99' --color 'preview-border:#9999cc,preview-label:#ccccff' --preview "eval 'echo \${}'" "$@" ;;
    ssh)
      # Custom preview for 'ssh'
      fzf --ansi --style full --prompt '❯ ' --preview-window='right,70%,wrap' --tiebreak begin --layout reverse --color 'input-border:#996666,input-label:#ffcccc' --color 'list-border:#669966,list-label:#99cc99' --color 'preview-border:#9999cc,preview-label:#ccccff' --preview 'dig {}' "$@" ;;
    *)
      # Default case with the generic preview
      fzf --ansi --style full --prompt '❯ ' --preview-window='right,60%,wrap' --tiebreak begin --layout reverse --color 'input-border:#996666,input-label:#ffcccc' --color 'list-border:#669966,list-label:#99cc99' --color 'preview-border:#9999cc,preview-label:#ccccff'  --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

#----------------------------------------------------------------------------------
# Auto-completion
#----------------------------------------------------------------------------------
FZF_PATH=$(dirname $(readlink -f $(which fzf)))
[[ $- == *i* ]] && source $FZF_PATH"/../shell/completion.zsh" 2> /dev/null

#----------------------------------------------------------------------------------
# Key bindings
#----------------------------------------------------------------------------------
source $FZF_PATH"/../shell/key-bindings.zsh"

#----------------------------------------------------------------------------------
# Load configuration for custom fzf commands
#----------------------------------------------------------------------------------
[[ -f ~/.fzf-commands ]] && source ~/.fzf-commands
