export ZSH="$HOME/.oh-my-zsh"

# HiDPI scaling for some applications
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# Does nothing with starship installed
# ZSH_THEME="minimal"

# Plugins
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Change prompt to starship and enable micro's truecolor
eval "$(starship init zsh)"

# Start xorg on login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi

# Regular aliases
alias ls="exa --oneline --sort=size --long"
alias lsa="exa --oneline --sort=size --long --all"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias grep="rg"

# Games
alias terraria="n m ~/.local/bin/gog/Terraria/start.sh"
alias tmodloader="n m ~/.local/bin/gog/Terraria/game/tModLoader/tModLoader"

# pacman aliases
alias su="sudo xbps-install -Su"
alias s="sudo xbps-install"
alias r="sudo xbps-remove"
alias rq="sudo xbps-remove -oO"

# File server
alias fs="ssh devraza@192.168.1.209"

setxkbmap gb
