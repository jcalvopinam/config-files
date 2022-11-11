function theme_precmd {
  local TERMWIDTH=$(( COLUMNS - ${ZLE_RPROMPT_INDENT:-1} ))

  NEWLINE=$'\n\n'
  PR_FILLBAR=""
  PR_PWDLEN=""

# 8:time
  local promptsize=${#${(%):-- (%*) )---}}
  local rubypromptsize=${#${(%)$(ruby_prompt_info)}}
  local pwdsize=${#${(%):-%~}}

  # Truncate the path if it's too long.
  if (( promptsize + rubypromptsize + pwdsize > TERMWIDTH )); then
    (( PR_PWDLEN = TERMWIDTH - promptsize ))
  elif [[ "${langinfo[CODESET]}" = UTF-8 ]]; then
    PR_FILLBAR="\${(l:$(( TERMWIDTH - (promptsize + rubypromptsize + pwdsize) ))::${PR_HBAR}:)}"
  else
    PR_FILLBAR="${PR_SHIFT_IN}\${(l:$(( TERMWIDTH - (promptsize + rubypromptsize + pwdsize) ))::${altchar[q]:--}:)}${PR_SHIFT_OUT}"
  fi
}

function theme_preexec {
  setopt local_options extended_glob
  if [[ "$TERM" = "screen" ]]; then
    local CMD=${1[(wr)^(*=*|sudo|-*)]}
    echo -n "\ek$CMD\e\\"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
add-zsh-hook preexec theme_preexec


# Set the prompt

# Need this so the prompt will work.
setopt prompt_subst

# See if we can use colors.
autoload zsh/terminfo
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY; do
  typeset -g PR_$color="%{$terminfo[bold]$fg[${(L)color}]%}"
  typeset -g PR_LIGHT_$color="%{$fg[${(L)color}]%}"
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

# Modify Git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} %{%G✚%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} %{%G✹%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} %{%G✖%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} %{%G➜%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} %{%G═%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} %{%G✭%}"

# Use extended characters to look nicer if supported.
if [[ "${langinfo[CODESET]}" = UTF-8 ]]; then
  PR_SET_CHARSET=""
  PR_HBAR="─"
  PR_ULCORNER="┌"
  PR_LLCORNER="└"
  PR_LRCORNER="┘"
  PR_URCORNER="┐"
else
  typeset -g -A altchar
  set -A altchar ${(s..)terminfo[acsc]}
  # Some stuff to help us draw nice lines
  PR_SET_CHARSET="%{$terminfo[enacs]%}"
  PR_SHIFT_IN="%{$terminfo[smacs]%}"
  PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
  PR_HBAR="${PR_SHIFT_IN}${altchar[q]:--}${PR_SHIFT_OUT}"
  PR_ULCORNER="${PR_SHIFT_IN}${altchar[l]:--}${PR_SHIFT_OUT}"
  PR_LLCORNER="${PR_SHIFT_IN}${altchar[m]:--}${PR_SHIFT_OUT}"
  PR_LRCORNER="${PR_SHIFT_IN}${altchar[j]:--}${PR_SHIFT_OUT}"
  PR_URCORNER="${PR_SHIFT_IN}${altchar[k]:--}${PR_SHIFT_OUT}"
fi

# Finally, the prompt. 92:symbol, 97:git, time:89
PROMPT='${NEWLINE}\
${PR_CYAN}${PR_ULCORNER}${PR_GREY} \
${PR_GREEN}%${PR_PWDLEN}<...<%~%<<\
${PR_GREY} $(ruby_prompt_info)${PR_CYAN}${PR_HBAR}${(e)PR_FILLBAR}${PR_GREEN} (\
%*${PR_GREEN}) ${PR_CYAN}${PR_URCORNER}\

${PR_CYAN}${PR_LLCORNER}${PR_BLUE} \
❯${PR_NO_COLOUR} '

# display exitcode on the right when > 0
return_code="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
RPROMPT=' $return_code${PR_CYAN}${PR_BLUE}\
(${PR_YELLOW}$(git_prompt_info)$(git_prompt_status)${PR_BLUE}) ${PR_CYAN}${PR_LRCORNER}${PR_NO_COLOUR}'

PS2='${PR_CYAN}${PR_HBAR}\
${PR_BLUE}${PR_HBAR}(\
${PR_LIGHT_GREEN}%_${PR_BLUE})${PR_HBAR}\
${PR_CYAN}${PR_HBAR}${PR_NO_COLOUR} '
