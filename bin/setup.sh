#!/bin/bash

set -eu

topdir=$(cd $(dirname $0); cd ..; pwd)
homedir=${topdir}/home

for dir in $(ls ${homedir})
do
  home_path="${HOME}/.${dir}"
  repo_path="${homedir}/${dir}"

  if [[ ! -e  ${home_path} ]]
  then
    echo "Linking ${home_path} -> ${repo_path}"
    ln -s ${repo_path} ${home_path}
  else
    echo "${home_path} exists"
  fi
done
