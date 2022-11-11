# Theme: juanca87.zsh-theme
# Author: Juan Calvopina
# Inspired on af-magic theme
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html

#colours
typeset +H my_yellow="$FG[215]"
typeset +H my_orange="$FG[166]"
typeset +H my_gold="$FG[172]"
typeset +H my_gray="$FG[237]"
typeset +H my_red="$FG[160]"
typeset +H my_pink="$FG[161]"

# separator dashes size
function add_dashes {
    [[ -n "${VIRTUAL_ENV-}" \
        && -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" && "$PS1" = \(* ]] \
        && echo $(( COLUMNS - ${#VIRTUAL_ENV} - 3 )) \
        || echo $COLUMNS
}

PROMPT=$FG[237]${(l.$(add_dashes)..-.)}$(hg_prompt_info) 
PROMPT+=$'\n'%{$reset_color%}"%(?:%{$fg_bold[green]%}λ :%{$fg_bold[red]%}λ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}» git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange *%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
