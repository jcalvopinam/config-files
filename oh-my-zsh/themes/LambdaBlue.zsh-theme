# LambdaBlue
# VCS
YS_VCS_PROMPT_PREFIX2="%{$fg[yellow]%}| "
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}! "
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}✓ "

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

PROMPT="
%{$fg[yellow]λ%} \
%{$terminfo[bold]$fg[cyan]%}%~/ %{$reset_color%}\
${git_info}"