# Personal dotfiles
#
# Copyright (C) 2016 NeoVg <neo@gothnet.eu>
# Distributed under the GNU General Public License, version 3.0.
# For full terms see the file LICENSE.md

IS_LOGINSHELL=1

# set dotfiles dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "${DIR}" | grep -q dotfiles$
if [ $? -ne 0 ]; then
                DIR="${DIR}/dotfiles"
fi

if [ -f ${DIR}/../.bashrc ]; then
        source ${DIR}/../.bashrc
fi

if [ -f ${DIR}/../.bash_profile_local ]; then
        echo "load local bash profile at ${DIR}/../.bash_profile_local"
        source ${DIR}/../.bash_profile_local
fi
