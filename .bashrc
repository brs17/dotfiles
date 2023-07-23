# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# append to the history file, don't overwrite it
shopt -s histappend

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

if [ -f /etc/bash_completion.d/git ]
then
    source /etc/bash_completion.d/git
fi

if [ -f ~/.git-prompt.sh ]
then
    source ~/.git-prompt.sh

    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    export GIT_PS1_SHOWSTASHSTATE=true
    export GIT_PS1_SHOWUPSTREAM="auto"

    export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
    export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -acltF'
alias la='ls -A'
#alias l='ls -CF'

#used on openshift team at RH
#function rebaseupstream () {
#  branch=master
#  if ! [[ -z "$1" ]]; then
#    branch=$1
#
#    if [[ "$branch" == "all" ]]; then
#      rebaseupstream prod
#      rebaseupstream stg
#      rebaseupstream int
#      return
#    fi
#  fi
#
#  startbranch=$(git describe --contains --all HEAD)
#  git checkout $branch
#  git fetch upstream
#  git fetch upstream --tags
#  git rebase upstream/$branch
#  git push origin $branch
#  git push origin --tags
#  git checkout ${startbranch}
#}

#DEBIAN variables
export DEBFULLNAME="Benjamin"
export DEBEMAIL="benjamin@system76.com"

#flatpak aliasing
alias inkscape="flatpak run org.inkscape.Inkscape"
alias slack="flatpak run com.slack.Slack"
alias libreoffice="flatpak run org.libreoffice.LibreOffice"
