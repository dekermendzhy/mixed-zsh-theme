autoload -U colors && colors

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# User info
if [[ "$USER" == "root" ]]; then
PROMPT="%{$FG[087]%}${current_dir}%{$reset_color%}
%{$FG[228]%}> %{$reset_color%}"
else
PROMPT="%{$FG[087]%}${current_dir}%{$reset_color%}
%{$FG[040]%}> %{$reset_color%}"
fi

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[009]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[226]%} ⚡"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[118]%} ✔"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[47]%} ➜"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[159]%}+ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[013]%}! "
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[196]%}✖ "

RPROMPT='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

LSCOLORS='exfxcxdxbxGxDxabagacad'