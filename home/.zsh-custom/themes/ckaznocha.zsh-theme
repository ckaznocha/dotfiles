local return_status_color="%(?.%{$fg[cyan]%}.%{$fg_bold[red]%})"
local user_info="%{$fg[cyan]%}%B%n%b%{$fg[cyan]%}@%m%{$reset_color%}"
local time="%{$return_status_color%}%D{%a %b %f %K:%M:%S}%{$reset_color%}"
local current_dir="%{$fg[blue]%}%30<...<%~%<<%{$reset_color%}"
local prompt_indicator="%{$return_status_color%}%(!.#.❯)%{$reset_color%}"

PROMPT='${user_info}:${current_dir}${prompt_indicator} '
RPROMPT='%{$fg[blue]%}$(branch_prompt_info)%{$reset_color%} ${time}'


FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --ansi
 --color=fg:7,hl:2
 --color=fg+:15,bg+:8,hl+:10
 --color=info:8,prompt:6,pointer:5
 --color=marker:3,spinner:5,header:5
 --color=gutter:5
 --info=default
 --prompt=❯
 --pointer=➜'
