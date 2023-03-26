
# ---------------------------------------
# Custom shorcuts
# ---------------------------------------

# ALT-W - Git log
fzf-git-log() {
  glogg
}
zle     -N             fzf-git-log
bindkey -M emacs '\ew' fzf-git-log
bindkey -M vicmd '\ew' fzf-git-log
bindkey -M viins '\ew' fzf-git-log


# ALT-A - List all git branches
fzf-git-branch() {
  gbranch
}
zle     -N             fzf-git-branch
bindkey -M emacs '\ea' fzf-git-branch
bindkey -M vicmd '\ea' fzf-git-branch
bindkey -M viins '\ea' fzf-git-branch


# ALT-E - Git branch switch
fzf-git-switch() {
  gswitch
}
zle     -N             fzf-git-switch
bindkey -M emacs '\ee' fzf-git-switch
bindkey -M vicmd '\ee' fzf-git-switch
bindkey -M viins '\ee' fzf-git-switch


# ALT-D - Git diff
fzf-git-diff() {
  gdiff
}
zle     -N             fzf-git-diff
bindkey -M emacs '\ed' fzf-git-diff
bindkey -M vicmd '\ed' fzf-git-diff
bindkey -M viins '\ed' fzf-git-diff

# ALT-S - Git log
fzf-git-status() {
  gstatus
}
zle     -N             fzf-git-status
bindkey -M emacs '\es' fzf-git-status
bindkey -M vicmd '\es' fzf-git-status
bindkey -M viins '\es' fzf-git-status

# ALT-P - Git parent
fzf-git-parent() {
  gparent
}
zle     -N             fzf-git-parent
bindkey -M emacs '\ep' fzf-git-parent
bindkey -M vicmd '\ep' fzf-git-parent
bindkey -M viins '\ep' fzf-git-parent

