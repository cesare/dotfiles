set -x GOPATH ~/src/golang
set -x PYENV_ROOT ~/.pyenv

set -U fish_user_paths {$GOPATH}/bin ~/.rbenv/bin {$PYENV_ROOT}/bin ~/.cargo/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin ~/bin

set -x EDITOR nvim
set -x LESS "-i -M -R -S -W"

set -x XDG_CONFIG_HOME ~/.config

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
end
