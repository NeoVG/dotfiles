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

# silently update dotfiles
git -C ${DIR} pull -q & disown

# execute rc files
source ${DIR}/rc.dotfilelinks
source ${DIR}/rc.aliases
source ${DIR}/rc.prompt
source ${DIR}/rc.complete
source ${DIR}/rc.sysinfo

# set PATH for homebrew
if hash brew 2>/dev/null; then
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

