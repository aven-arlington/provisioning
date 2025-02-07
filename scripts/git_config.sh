#!/bin/bash

read -p "Enter user.name: " NAME
read -p "Correct? (Y/N): " confirm && [[ "$confirm" == [yY] || "$confirm" == [yY][eE][sS] ]] || exit 1

read -p "Enter user.email: " EMAIL
read -p "Correct? (Y/N): " confirm_email && [[ "$confirm_email" == [yY] || "$confirm_email" == [yY][eE][sS] ]] || exit 1

git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global merge.conflictStyle zdiff3
git config --global init.defaultBranch main
