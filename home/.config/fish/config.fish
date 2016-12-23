set -x GOPATH ~/src/golang
set -U fish_user_paths {$GOPATH}/bin ~/.rbenv/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin ~/bin

set -x EDITOR nvim
set -x LESS "-i -M -R -S -W"

set -x XDG_CONFIG_HOME ~/.config

alias be "bundle exec"

alias rm "rm -i"
alias mv "mv -i"
alias cp "cp -i"

rbenv init - | source

function fish_user_key_bindings
  bind \c] peco_select_ghq_repository
end
