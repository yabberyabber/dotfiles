set -o vi

export PATH=$HOME/bin:$PATH

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

set_prompt () 
{
    local EXIT_CODE="$?"

    BRANCH=$(parse_git_branch);
    if [[ -n $BRANCH ]]; then
        BRANCH_TEXT=$(echo -en "\033[01;93m${BRANCH}\033[00m\]");
    else
        BRANCH_TEXT="";
    fi;

    if [[ "$color_prompt" == yes ]]; then
        PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] ${BRANCH_TEXT} \n ${EXIT_CODE} > "
    else
        PS1="\u@\h:\w $(parse_git_branch)\n ${EXIT_CODE} > "
    fi
}

PROMPT_COMMAND=set_prompt
