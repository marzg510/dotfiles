#!/bin/bash

#TARGET_DIRS=(~/workspace/ ~/memo/ ~/dotfiles/)
TARGET_DIRS=(~/)

#for d in $(find ${TARGET_DIRS[@]} -name .git -type d); do
for d in $(find ~/*/ -name .git -type d); do
  cd $d/..
  [ $(git status | wc -l) -ne 3 ] && pwd
done

