function select_ghq_repository
  set -l query (commandline)

  if test -n $query
    set options --query="$query"
  end

  ghq list -p | fzf $options | read line

  if [ $line ]
    cd $line
    commandline -f repaint
  end
end
