set -x GOPATH ~/src/golang
set -x PYENV_ROOT ~/.pyenv
set -x RUST_SRC_PATH ~/src/rust/src
set -x EDITOR nvim
set -x LESS "-i -M -R -S -W"
set -x XDG_CONFIG_HOME ~/.config

set -x PATH {$GOPATH}/bin ~/.rbenv/bin {$PYENV_ROOT}/bin ~/.cargo/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin ~/bin

set -x LIST_PROJECTS_DIR ~/labs
function peco_select_project
  list-projects | peco | read line

  if [ $line ]
    cd $line
    commandline -f repaint
  end
end

alias be "bundle exec"

alias rm "rm -i"
alias mv "mv -i"
alias cp "cp -i"

rbenv init - | source

if test -d ~/.pyenv
  pyenv init - | source
end

function fish_user_key_bindings
  bind \c] peco_select_ghq_repository
  bind \co peco_select_project
end

