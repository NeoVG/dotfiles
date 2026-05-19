# Personal dotfiles
#
# Copyright (C) 2016 NeoVg <neo@gothnet.eu>
# Distributed under the GNU General Public License, version 3.0.
# For full terms see the file LICENSE.md

# set dotfiles dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "${DIR}" | grep -q dotfiles$
if [ $? -ne 0 ]; then
		DIR="${DIR}/dotfiles"
fi

# silently update dotfiles (login shells only)
if [ "${IS_LOGINSHELL}" ]; then
	git -C ${DIR} pull -q >/dev/null 2>&1 & disown
fi

# execute rc files
if [ "${IS_LOGINSHELL}" ]; then
	source ${DIR}/rc.dotfilelinks
fi
source ${DIR}/rc.aliases
source ${DIR}/rc.prompt
source ${DIR}/rc.complete
source ${DIR}/rc.sysinfo

# set PATH for homebrew sbin
if [ -d /opt/homebrew/sbin ]; then
	export PATH="/opt/homebrew/sbin:$PATH"
elif [ -d /usr/local/sbin ]; then
	export PATH="/usr/local/sbin:$PATH"
fi

# set EDITOR to vim
if [ -e /usr/bin/vim ]; then
	export EDITOR=/usr/bin/vim
elif [ -e /usr/local/bin/vim ]; then
	export EDITOR=/usr/local/bin/vim
fi

# load local rc if present
if [ -e ${DIR}/rc.local ]; then
	source ${DIR}/rc.local
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/neo/.lmstudio/bin"
# End of LM Studio CLI section

