# CTRL-W - Git log
fzf-git-log() {
  local selected
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(git log $@ --abbrev --oneline --decorate --color --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit | fzf --no-height --pointer='->' --header="`date`" -e --no-sort --reverse -m --ansi --preview-window="right:70%,wrap" --preview "git show {1} --color=always --abbrev --show-signature " | awk -F' ' {'print $1'}))
  local ret=$?
  echo -n $selected | pbcopy
  zle reset-prompt
  return $ret
}
zle     -N            fzf-git-log
bindkey -M emacs '^W' fzf-git-log
bindkey -M vicmd '^W' fzf-git-log
bindkey -M viins '^W' fzf-git-log

# CTRL-B - List the git branches
fzf-git-branch() {
  local selected
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(git branch | grep -v '/HEAD\s' | grep -v "*" | awk -F' ' {'print $1'} | fzf --pointer='->' --header="`date`" --height 30% --inline-info --layout reverse --border --no-sort --reverse -m --ansi))
  local ret=$?
  #echo $selected
  #zle accept-line
  echo -n $selected | pbcopy
  zle reset-prompt
  return $ret
}
zle     -N            fzf-git-branch
bindkey -M emacs '^B' fzf-git-branch
bindkey -M vicmd '^B' fzf-git-branch
bindkey -M viins '^B' fzf-git-branch

# CTRL-S - Git branch switch
fzf-git-switch() {
  local selected
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(git switch  $(git branch | grep -v '/HEAD\s' | grep -v "*" | awk -F' ' {'print $1'} | fzf --pointer='->' --header="`date`" --height 30% --inline-info --layout reverse --border --no-sort --reverse -m --ansi)))
  local ret=$?
  echo $selected
  zle accept-line
  return $ret
}
zle     -N            fzf-git-switch
bindkey -M emacs '^S' fzf-git-switch
bindkey -M vicmd '^S' fzf-git-switch
bindkey -M viins '^S' fzf-git-switch

# CTRL-P - Git pull
fzf-git-pull() {
  local selected
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(git pull -v --progress $(git remote | fzf --pointer='->' --header="`date`" --height 30% --inline-info --layout reverse --border --no-sort --reverse -m --ansi)))
  local ret=$?
  echo $selected
  zle accept-line
  return $ret
}
zle     -N            fzf-git-pull
bindkey -M emacs '^P' fzf-git-pull
bindkey -M vicmd '^P' fzf-git-pull
bindkey -M viins '^P' fzf-git-pull

