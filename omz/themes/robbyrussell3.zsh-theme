NEWLINE=$'\n'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT='${NEWLINE}${NEWLINE}%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info) ${NEWLINE}❯ '
RPROMPT="%{$fg_bold[red]%}%*%{$reset_color%}"

