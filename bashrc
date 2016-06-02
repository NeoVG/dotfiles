source ~/dotfiles/rc.dotfilelinks
source ~/dotfiles/rc.aliases
source ~/dotfiles/rc.prompt
source ~/dotfiles/rc.complete

source ~/dotfiles/rc.sysinfo

# set path for homebrew
if hash brew 2>/dev/null; then
	export PATH="/usr/local/sbin:$PATH"
fi

