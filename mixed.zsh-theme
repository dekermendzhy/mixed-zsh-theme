# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}git: %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%} + "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%} ! "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➜ "

autoload colors && colors

function get_pwd() {
  echo "${PWD/#$HOME/~}"
}

if [ $UID -eq 0 ]; then
NCOLOR="green"
else
NCOLOR="red"
fi

PROMPT='%{$fg_bold[white]%}$(get_pwd)%{$reset_color%}
%{$fg_bold[$NCOLOR]%}>%{$reset_color%} '

RPROMPT='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

export CLICOLOR=1
export LSCOLORS='Exfxcxdxbxegedabagacad' # only with Dark Background

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}
