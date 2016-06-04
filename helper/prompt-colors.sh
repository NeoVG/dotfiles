# usage:
#
# start_segment
# start_segment new_foreground
# start_segment new_background


SEPARATOR=""


CURRENT_FG=""
CURRENT_BG=""

function set_fg {
    CURRENT_FG=$1
    printf "\e[38;2;${CURRENT_FG}m"
    #printf " set fg to ${CURRENT_FG} "
}

function reset_fg {
    CURRENT_FG=""
    printf "\e[m"
    if [ -n "${CURRENT_BG}" ]; then
        printf "\e[48;2;${CURRENT_BG}m"
    fi
}

function set_bg {
    CURRENT_BG=$1
    printf "\e[48;2;${CURRENT_BG}m"
}

function reset_bg {
    CURRENT_BG=""
    printf "\e[m"
    if [ -n "${CURRENT_FG}" ]; then
        printf "\e[38;2;${CURRENT_FG}m"
    fi
}

function reset_both {
    CURRENT_FG=""
    CURRENT_BG=""
    printf "\e[m"
}

function start_segment {
    local newbg=$1
    local newfg=$2

    local oldbg=${CURRENT_BG}
    local oldfg=${CURRENT_FG}

    if [ -z "${oldbg}" ]; then
        if [ -n "${newbg}" ]; then
            set_bg ${newbg}
        fi
        if [ -n "${newfg}" ]; then
            set_fg ${newfg}
        fi
        return
    fi

    printf " "

    set_fg ${CURRENT_BG}

    if [ -n "${newbg}" ]; then
        set_bg ${newbg}
    else
        reset_bg
    fi

    if [ -n "${oldbg}" ]; then
        printf "${SEPARATOR}"
    else
        printf " "
    fi

    if [ -n "${newfg}" ] && [ -n "${newbg}" ]; then
        set_fg ${newfg}
    elif [ -n "${oldfg}" ] && [ -n "${newbg}" ]; then
        set_fg ${oldfg}
    else
        reset_fg
    fi

    printf " "
}

function end_segment {
    start_segment
}
