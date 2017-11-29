set -x GOPATH ~/src/golang
set -x PYENV_ROOT ~/.pyenv
set -x RUST_SRC_PATH ~/src/rust/src
set -x EDITOR nvim
set -x LESS "-i -M -R -S -W"
set -x XDG_CONFIG_HOME ~/.config

set -x PATH {$GOPATH}/bin ~/.rbenv/bin {$PYENV_ROOT}/bin ~/.cargo/bin /Library/TeX/texbin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin ~/bin

function peco_select_project
  lpj --project-root={$HOME}/labs | peco | read line

  if [ $line ]
    cd $line
    commandline -f repaint
  end
end

function up
  set dir (upto_top)
  if [ $dir ]
    cd $dir
  end
end

function upto
  list_tops | peco | read line

  if [ $line ]
    cd $line
    commandline -f repaint
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

rbenv init - | source

if test -d ~/.pyenv
  pyenv init - | source
end

function fish_user_key_bindings
  bind \c] peco_select_ghq_repository
  bind \co peco_select_project
end

if test -f $XDG_CONFIG_HOME/fish/local.fish
  source $XDG_CONFIG_HOME/fish/local.fish
end

# use direnv
eval (direnv hook fish)
