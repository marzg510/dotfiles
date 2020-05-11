#!/bin/bash

#TARGET_DIRS=(~/workspace/ ~/memo/ ~/dotfiles/)
#TARGET_DIRS=(~/)
#EXCLUDES=(tf-gogh)

#for d in $(find ${TARGET_DIRS[@]} -name .git -type d); do
#for d in $(find ~/*/ -name .git -type d); do
for d in $(find ./*/ -name .git -type d); do
  [[ $d =~ tf-gogh ]] && continue
  pushd . >/dev/null
#  echo $d
  cd $d/..
  if [ $(git status | grep "tree clean$" | wc -l) -ne 1 ]; then
    echo "*****************"
    pwd
    git status
  fi
#  [ $(git status | wc -l) -ne 3 ] && pwd
  popd >/dev/null
done

