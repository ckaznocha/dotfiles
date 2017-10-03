#!/usr/bin/env zsh

source "${0:h}/zsh-histdb/sqlite-history.zsh"
source "${0:h}/zsh-histdb/history-timer.zsh"

autoload -Uz add-zsh-hook
add-zsh-hook preexec _start_timer
add-zsh-hook precmd  _stop_timer

_zsh_autosuggest_strategy_histdb_top() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv
order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
    suggestion=`_histdb_query "$query"`
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top
