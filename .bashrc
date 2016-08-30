# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#export PYTHONPATH=/home/shpurk/Documents/openshift/openshift-tools/openshift_tools:$(ls /usr/lib/python2*/site-packages/ -d)

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

function rebaseupstream () {
  branch=master
  if ! [[ -z "$1" ]]; then
    branch=$1

    if [[ "$branch" == "all" ]]; then
      rebaseupstream prod
      rebaseupstream stg
      rebaseupstream int
      return
    fi
  fi

  startbranch=$(git describe --contains --all HEAD)
  git checkout $branch
  git fetch upstream
  git fetch upstream --tags
  git rebase upstream/$branch
  git push origin $branch
  git push origin --tags
  git checkout ${startbranch}
}
