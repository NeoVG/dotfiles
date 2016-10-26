# Personal dotfiles
#
# Copyright (C) 2016 NeoVg <neo@gothnet.eu>
# Distributed under the GNU General Public License, version 3.0.
# For full terms see the file LICENSE.md

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/dotfiles"

source ${DIR}/rc.dotfilelinks
source ${DIR}/rc.aliases
source ${DIR}/rc.prompt
source ${DIR}/rc.complete

source ${DIR}/rc.sysinfo

# set path for homebrew
if hash brew 2>/dev/null; then
	export PATH="/usr/local/sbin:$PATH"
fi

# set EDITOR to vim
if [ -e /usr/bin/vim ]; then
	export EDITOR=/usr/bin/vim
elif [ -e /usr/local/bin/vim ]; then
	export EDITOR=/usr/local/bin/vim
fi

