set -x GOPATH ~/src/golang
set -x RUST_SRC_PATH ~/src/rust/src
set -x EDITOR nvim
set -x LESS "-i -M -R -S -W"
set -x XDG_CONFIG_HOME ~/.config
set -x RSTUDIO_WHICH_R /usr/local/bin/R
set -x FZF_DEFAULT_OPTS --reverse

set -gx ANYFFF__FINDER_APP fzf

set -x PATH {$GOPATH}/bin ~/.rbenv/bin {$PYENV_ROOT}/bin ~/.cargo/bin ~/.local/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin ~/bin

#
# fundle
#
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end
fundle plugin fisherman/z
fundle plugin hagiyat/anyfff
fundle plugin oh-my-fish/theme-cmorrell.com
fundle init


function peco_select_project
  find ~/labs -type d -maxdepth 2 | fzf --reverse | read line

  if [ $line ]
    cd $line
    commandline -f repaint
  end
end

function upto
  list_tops | peco | read line

  if [ $line ]
    cd $line
    commandline -f repaint
  end
end

function apf
  grep --color=no --only-matching '^\[.*\]' ~/.aws/config | sed -E 's/^\[\s*(.*)\s*\]/\1/' | fzf | read line

  if [ $line ]
    export AWS_PROFILE=$line
  end
end

function up
  set dir (git rev-parse --show-toplevel)

  if [ $dir ]
    cd $dir
  end
end

alias be "bundle exec"
alias nv "nvim"

alias rm "rm -i"
alias mv "mv -i"
alias cp "cp -i"

function dclean
  set ids (docker ps -f status=exited --format "{{.ID}}")
  if [ "$ids" ]
    docker rm $ids
  end
end

function tnotify
  if set -q TMUX
    reattach-to-user-namespace terminal-notifier $argv
  else
    terminal-notifier $argv
  end
end

function delete_branches
  for branch in (git branch --format='%(refname:short)' | fzf -m)
    git branch -d $branch
  end
end

rbenv init - | source

function fish_user_key_bindings
  bind \c] select_ghq_repository
  bind \co peco_select_project
end

if test -f $XDG_CONFIG_HOME/fish/local.fish
  source $XDG_CONFIG_HOME/fish/local.fish
end

# use direnv
eval (direnv hook fish)

# nodenv
status --is-interactive; and source (nodenv init -|psub)
