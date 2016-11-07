set -U fish_user_paths ~/.rbenv/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin ~/bin

set -x EDITOR vim
set -x LESS "-i -M -R -S -W"

alias be "bundle exec"

alias rm "rm -i"
alias mv "mv -i"
alias cp "cp -i"

rbenv init - | source

function fish_user_key_bindings
  bind \c] peco_select_ghq_repository
end

eval (direnv hook fish)
