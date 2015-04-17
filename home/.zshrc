#
# environment variables
#
export PROMPT='[%n@%m]%# '
export EDITOR='vim'
export MANPATH=/usr/local/man:/usr/share/man
export WORDCHARS='@*+?_-.[]~=&;!#$%^(){}<>'

#
# Less with syntax highlighting
#
export LESS='-R'

#
# JVMs
#
export SBT_OPTS="-XX:MaxPermSize=256m"

#
# Ruby
#
export RSPEC_COLOR=true

#
# Go
#
export GOPATH=${HOME}/lib/go

#
# others
#
export GREP_OPTIONS='--color=auto'
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig

#
# set paths
#
path=(
  ${HOME}/.rbenv/bin
  $HOME/.nodebrew/current/bin
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/bin
  /bin
  /usr/bin
  /usr/local/sbin
  /usr/sbin
  /sbin
  ${HOME}/bin
)

#
# aliases
#
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'

alias g='git'
alias be='bundle exec'
alias bo='bundle open'
alias bs='bundle show'

alias vi='vim'

alias ce='carton exec'

# gclient
alias gclient="${HOME}/svn/depot_tools/gclient"

alias mvn-search="${HOME}/git/maven-tools/bin/mvn-search"

function ds() {
  open dash://"$@"
}

function dic(){
  open dict://"$@"
}

#
# zsh parameters and configurations
#
setopt auto_pushd
setopt auto_cd
setopt pushd_to_home

autoload -U colors
colors

setopt ALWAYS_TO_END

if [ "${UID}" != 0 ]
then
  HISTFILE=$HOME/.zsh-history
  HISTSIZE=1000
  SAVEHIST=1000
  setopt share_history
fi

autoload -U compinit
compinit

zstyle ':completion:*:default' menu select=1
setopt PUSHD_IGNORE_DUPS

setopt no_beep
setopt no_flow_control

setopt print_eightbit
setopt magic_equal_subst

bindkey -e

autoload -Uz vcs_info
precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]=$vcs_info_msg_0_
}
RPROMPT=$'%2F%n@%m%f %3F%~%f%1v'

if [ -f ~/.zshrc-local ]
then
  source ~/.zshrc-local
fi
