set -x GOPATH ~/src/golang
set -x RUST_SRC_PATH ~/src/rust/src
set -x EDITOR nvim
set -x LESS "-i -M -R -S -W"
set -x XDG_CONFIG_HOME ~/.config
set -x RSTUDIO_WHICH_R /usr/local/bin/R
set -x FZF_DEFAULT_OPTS --reverse

set -x PATH {$GOPATH}/bin ~/.rbenv/bin {$PYENV_ROOT}/bin ~/.cargo/bin ~/.local/bin /Library/TeX/texbin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin ~/bin

#
# fundle
#
fundle plugin cesare/rust-upto-top --path fish
fundle plugin fisherman/z
fundle plugin hagiyat/anyfff
fundle plugin oh-my-fish/theme-cmorrell.com
fundle init


function peco_select_project
  lpj --project-root={$HOME}/labs | fzf --reverse | read line

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
  grep --color=no --only-matching '^\[profile .*\]' ~/.aws/config | sed -E 's/^\[profile (.*)\]/\1/' | peco | read line

  if [ $line ]
    export AWS_PROFILE=$line
  end
end

alias up go_upto_top

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
