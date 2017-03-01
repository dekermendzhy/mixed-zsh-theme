# VCS
YS_VCS_PROMPT_PREFIX1="%{$fg[white]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%} "
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}✗"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}✔︎"

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[blue]%}➜"

autoload colors && colors

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

PROMPT='%{$fg_bold[$NCOLOR]%}%n@%m%{$reset_color%} %{$fg[white]%}in \
%{$fg_bold[yellow]%}%B%c/%b%{$reset_color%} $(git_prompt_info) $exit_code
%{$fg[magenta]%}$%{$reset_color%} '

export CLICOLOR=1
export LSCOLORS='Exfxcxdxbxegedabagacad' # only with Dark Background

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}
