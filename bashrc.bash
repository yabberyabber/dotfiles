alias unix1='ssh anelso32@unix1.csc.calpoly.edu'
alias unix2='ssh anelso32@unix2.csc.calpoly.edu'
alias unix3='ssh anelso32@unix3.csc.calpoly.edu'
alias unix4='ssh anelso32@unix4.csc.calpoly.edu'
alias unix11='ssh anelso32@unix11.csc.calpoly.edu'
alias unix12='ssh anelso32@unix12.csc.calpoly.edu'
alias unix13='ssh anelso32@unix13.csc.calpoly.edu'
alias unix14='ssh anelso32@unix14.csc.calpoly.edu'
alias vogon='ssh anelso32@vogon.csc.calpoly.edu'
alias foaad="unix13 -t 'ssh nelson466@frank.ored.calpoly.edu'"
alias dekhtyar="unix13 -t 'ssh anelso32@cslvm57.csc.calpoly.edu'"

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(parse_git_branch)\n> '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(parse_git_branch)\n> '
fi
