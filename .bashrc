# .bashrc
#TODO: Implement prompt for changes in git repo

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

##################################################################################
#NEW STUF #2
#LINK: http://dotshare.it/dots/66/

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\[\033[01;32m\]\u@\h \[\033[01;34m\]\w \$(parse_git_branch)\[\033[01;32m\]\[\033[01;34m\]\$\[\033[00m\] "

#END NEW STUFF #2
#####################################################################################


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

#START ORIGINAL GIT PROMPT - very large - 
# shows `username@hostname directory branch (if changes exist)`
#if [ -f ~/.git-prompt.sh ]
#then
#    source ~/.git-prompt.sh
#
#    export GIT_PS1_SHOWDIRTYSTATE=true
#    export GIT_PS1_SHOWUNTRACKEDFILES=true
#    export GIT_PS1_SHOWSTASHSTATE=true
#    export GIT_PS1_SHOWUPSTREAM="auto"
#
#    #export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#    #export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#fi
#END ORIGINAL GIT PROMPT

######################################################################
#NEW STUFF #1
#LINK: http://dotshare.it/dots/1143/

#Looks like:
#shpurk@phantom ╺─╸ [dotfiles] [try-bashrc]
#[18:03] >>

# Check for an interactive session
#[ -z "$PS1" ] && return
#
#_PROMPT() {
#    _EXIT_STATUS=$?
#    [ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR=" \[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;9m\]$_EXIT_STATUS\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]"
#
#	#git branch
#    _BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
#	
#    #also needed for branch
#    if [ ! $_BRANCH == "" ]
#	then
#		_BRANCH_STR="[\[$(tput sgr0)\]\[\033[38;5;11m\]$_BRANCH\[$(tput sgr0)\]\[\033[38;5;7m\]]"
#	else
#		_BRANCH_STR=""
#	fi
#
#    PS1="\[\033[38;5;14m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;7m\]╺─╸\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\]$_BRANCH_STR\[$(tput sgr0)\]\[\033[38;5;15m\] \n\[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\A\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]$_EXIT_STATUS_STR \[$(tput sgr0)\]\[\033[38;5;7m\]>>\[$(tput sgr0)\] "
#    unset _EXIT_STATUS_STR
#	unset _EXIT_STATUS
#	unset _BRANCH_STR
#	unset _BRANCH
#}
#
#PROMPT_COMMAND=_PROMPT

#END NEW STUFF #1
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

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
