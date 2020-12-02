# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

alias d=docker
alias dk=docker-compose
alias dps='docker ps --format "table {{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{ .Ports }}\\t{{.RunningFor}}\\t{{.Command}}\\t{{ .ID }}" | cut -c-$(tput cols)'
alias dls='docker ps -a --format "table {{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{ .Ports }}\\t{{.RunningFor}}\\t{{.Command}}\\t{{ .ID }}" | cut -c-$(tput cols)'
alias dim='docker images --format "table {{.Repository}}\\t{{.Tag}}\\t{{.ID}}\\t{{.Size}}\\t{{.CreatedSince}}"'
alias dip='docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'
alias dgc='docker rmi $(docker images -qf "dangling=true")'
alias dvc='docker volume ls -qf dangling=true | xargs docker volume rm'
alias dtop='docker stats $(docker ps --format="{{.Names}}")'
alias dnet='docker network ls && echo && docker inspect --format "{{\$e := . }}{{with .NetworkSettings}} {{\$e.Name}} {{range \$index, \$net := .Networks}}  - {{\$index}}	{{.IPAddress}} {{end}}{{end}}" $(docker ps -q)'
alias dtag='docker inspect --format "{{.Name}} {{range \$index, \$label := .Config.Labels}}  - {{\$index}}={{\$label}} {{end}}" $(docker ps -q)'
