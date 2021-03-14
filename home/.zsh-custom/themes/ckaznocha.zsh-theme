local return_status_color="%(?.%{$fg[cyan]%}.%{$fg_bold[red]%})"
local user_info="%{$fg[cyan]%}%B%n%b%{$fg[cyan]%}@%m%{$reset_color%}"
local time="%{$return_status_color%}%D{%a %b %f %K:%M:%S}%{$reset_color%}"
local current_dir="%{$fg[blue]%}%30<...<%~%<<%{$reset_color%}"
local prompt_indicator="%{$return_status_color%}%(!.#.❯)%{$reset_color%}"

PROMPT='${user_info}:${current_dir}${prompt_indicator} '
RPROMPT='%{$fg[blue]%}$(branch_prompt_info)%{$reset_color%} ${time}'


FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --ansi
 --color=fg:#f8f8f2,hl:#8aff80
 --color=fg+:#ffffff,bg+:#504c67,hl+:#a2ff99
 --color=info:#504c67,prompt:#80ffea,pointer:#ff80bf
 --color=marker:#ffff80,spinner:#9580ff,header:#9580ff
 --color=gutter:#ff80bf
 --info=default
 --prompt=❯
 --pointer=➜'
