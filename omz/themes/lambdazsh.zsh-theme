NEWLINE=$'\n'

# The prompt
PROMPT='
%{$fg[green]%}\
λ \
$(_user_host)\
%{$fg[cyan]%}\
%{$fg[cyan]%}\
${PWD} | \
$(git_prompt_info)\
%{$reset_color%}\
$(git_prompt_status)\
${_return_status}\
${NEWLINE}\
➜ '


# Prompt with SHA
# PROMPT='$(_user_host)%{$fg[cyan]%}%c $(git_prompt_info)%{$reset_color%}$(git_prompt_short_sha)%{$fg[magenta]%}$(git_prompt_status)${_return_status}➜ '

local _return_status="%{$fg[red]%}%(?..⍉ )%{$reset_color%}"

function _user_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{%F{yellow}%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}◒%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}⇥ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%} ✓ "
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[white]%}⟼ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⤳ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}≈ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[blue]%}▲ "
