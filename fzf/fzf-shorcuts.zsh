# CTRL-W - Git log
fzf-git-log() {
  glogg
}
zle     -N            fzf-git-log
bindkey -M emacs '^W' fzf-git-log
bindkey -M vicmd '^W' fzf-git-log
bindkey -M viins '^W' fzf-git-log

# CTRL-B - List the git branches
fzf-git-branch() {
  gbranch
}
zle     -N            fzf-git-branch
bindkey -M emacs '^B' fzf-git-branch
bindkey -M vicmd '^B' fzf-git-branch
bindkey -M viins '^B' fzf-git-branch

# CTRL-S - Git branch switch
fzf-git-switch() {
  gswitch
}
zle     -N            fzf-git-switch
bindkey -M emacs '^S' fzf-git-switch
bindkey -M vicmd '^S' fzf-git-switch
bindkey -M viins '^S' fzf-git-switch

# CTRL-D - Git diff
fzf-git-diff() {
  gdiff
}
zle     -N            fzf-git-diff
bindkey -M emacs '^D' fzf-git-diff
bindkey -M vicmd '^D' fzf-git-diff
bindkey -M viins '^D' fzf-git-diff
